/*
   Horrible Goose SAO with built-in speaker
   ATtiny85 as controller
   Partly based on "Audio Sample Player v2" by David Johnson-Davies, used under CC-BY-4.0 license: http://www.technoblogy.com/show?QBB
   Partly based on "speaker_pcm" by Michael Smith <michael@hurts.ca>, unclear license: https://playground.arduino.cc/Code/PCMAudio/
*/

#include <avr/sleep.h>
#include <util/delay.h>

// Audio samples encoded as unsigned 8-bit blocks, 16kHz sampling rate
#include "gooseaudio.h"

#define SPEAKER_PIN_1 1            // PB1, pin 6 (if SOIC-8)
#define SPEAKER_PIN_2 4            // PB4, pin 3 (if SOIC-8)
#define INPUT_PIN     3            // PB3, pin 2 (if SOIC-8)

volatile int index = 0;            // Index of current byte of audio data
volatile byte amplitude = 0x80;    // The value of the current byte of audio data.
volatile bool honking = false;     // Monitors if a honk is currently being played, to prevent another one from starting.
volatile bool debouncing = false;  // Monitors if a pin change interrupt was very recently triggered, to prevent triggering signals a few clock cycles apart.
volatile int debounceFrames = 0;   // Counts how many Timer0 interrupts have occurred since the debounce window began.

// Disable Timer/Counter 0 and Timer/Counter 1 to save power
void disableTimers() {
  TCCR0B &= ~(7 << CS00);          // Disable the 16kHz timer (Datasheet p.79)
  TCCR1 &= ~(1 << PWM1A);          // Disable Timer/Counter 1 PWM (Datasheet p.89)
}

// Enable Timer/Counter 0 and Timer/Counter 1
void enableTimers() {
  TCCR0B |= 2 << CS00;             // Enable Timer/Counter 0 with 1/8 prescaler (Datasheet p.79)
  TCCR1 |= 1 << PWM1A;             // Enable Timer/Counter 1 PWM (Datasheet p.89)
}

// Enter low power sleep mode
void sleepyGoose() {
  sei();
  MCUCR |= 1 << SE;                // Enter sleep mode (Datasheet p.37)
  sleep_cpu();
}

// Exit low power sleep mode
void awakeGoose() {
  MCUCR &= ~(1 << SE);             // Wake up from sleep mode (Datasheet p.37)
  cli();
}


void setup() {
  // Enable pin change interrupt (Datasheet p.51-52)
  GIMSK |= 1 << PCIE;              // Pin Change Interrupt enabled
  PCMSK = 1 << PCINT3;             // Pin Change Interrupt occurs only when PB3 (pin 2) changes value

  // Enable Timer/Counter 0, set up to interrupt at 16000 kHz (Datasheet p.77-81)
  TCCR0A = 3 << WGM00;             // Fast PWM mode
  TCCR0B = 1 << WGM02;             // Fast PWM mode
  TCCR0B |= 2 << CS00;             // 1/8 prescaler (1 MHz effective clock speed)
  TIMSK |= 1 << OCIE0A;            // Enable Timer0 Compare Match A Interrupts
  OCR0A = 62;                      // Interrupt every 62 cycles (1/62 MHz == approx. 16 kHz)

  // Enable Timer/Counter 1, generate PWM pulses for the speaker (Datasheet p.89-90)
  TCCR1 = 1 << PWM1A;              // OCR1A PWM enabled
  TCCR1 |= 2 << COM1A0;            // OC1A goes LOW on counter match
  TCCR1 |= 1 << CS10;              // 1/1 prescaler
  GTCCR = 1 << PWM1B;              // OCR1B PWM enabled
  GTCCR |= 2 << COM1B0;            // OC1B goes LOW on counter match
  OCR1A = 128;                     // Set both speaker pins to 50% duty cycle at start
  OCR1B = 128;                     // Set both speaker pins to 50% duty cycle at start

  MCUCR |= 2 << SM0;               // Enable sleep mode to save power (Datasheet p.37)

  DDRB = (1 << DD1) | (1 << DD4);  // Set both speaker pins as outputs
}

void loop() {
  // lol
}

// On a pin change interrupt:
//   Ignore if pin goes LOW, or if we're in the debouncing window, or if a honk is already playing.
//   If none of those conditions AND pin goes HIGH, exit sleep mode, turn on timers, and enter the debouncing window.
ISR(PCINT0_vect) {
  if (!honking && !debouncing && (PINB & (1<<PINB3))) {
    awakeGoose();
    enableTimers();
    debouncing = true;
  }
}

// On a timer 0 interrupt (16000 kHz):
//   If a honk is playing, write the next audio sample to speaker pins.
//   If honk ends, disable timers and go to sleep.
//   If currently in debouncing window, increment the debounce counter.
//   If at the end of the debouncing window, read input pin again.
//   If input pin is still HIGH, begin playing a honk.
ISR(TIMER0_COMPA_vect) {
  if (honking) {
    if (index < 0) {
      // Fade in before playing the actual sound effect, to reduce clicking
      amplitude = 128 + index;
      OCR1A = amplitude;
      OCR1B = amplitude;
    } else if (index < DATA_LENGTH) {
      amplitude = pgm_read_byte(&audio[index]);
      OCR1A = amplitude;
      OCR1B = amplitude ^ 255;
    } else if (index < (DATA_LENGTH + 128)) {
      // Fade out after the sound is done playing
      amplitude = 128 - (index - DATA_LENGTH);
      OCR1A = amplitude;
      OCR1B = amplitude;
    } else {
      honking = false;
      disableTimers();
      sleepyGoose();
    }
    ++index;
  }

  if (debouncing) {
    debounceFrames++;
    if (debounceFrames > 100) {
      debouncing = false;
      debounceFrames = 0;
      if (PINB & (1 << PINB3)) {
        honking = true;
        index = -127;
      }
    }
  }
}
