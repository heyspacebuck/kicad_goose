/*
 * Vector audio playback
 * Taken from speaker_pcm sketch by Michael Smith <michael@hurts.ca>
 * available here: https://playground.arduino.cc/Code/PCMAudio/
 */

#include "gooseaudio.h"

#include <stdint.h>
#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/pgmspace.h>

int SAMPLE_RATE = 16000;
int SPEAKER_PIN = 11;
int TOUCH_PIN = 8;

volatile uint16_t sample;
byte lastSample;

bool honking = false;

void stopPlayback()
{
  // Disable playback per-sample interrupt.
  TIMSK1 &= ~_BV(OCIE1A);

  // Disable the per-sample timer completely.
  TCCR1B &= ~_BV(CS10);

  // Disable the PWM timer.
  TCCR2B &= ~_BV(CS10);

  digitalWrite(SPEAKER_PIN, LOW);
  honking = false;
}

// This is called at 16000 Hz to load the next sample.
ISR(TIMER1_COMPA_vect) {
  if (sample >= DATA_LENGTH) {
    if (sample == DATA_LENGTH + lastSample) {
      stopPlayback();
    }
    else {
      if(SPEAKER_PIN==11){
        // Ramp down to zero to reduce the click at the end of playback.
        OCR2A = DATA_LENGTH + lastSample - sample;
      } else {
        OCR2B = DATA_LENGTH + lastSample - sample;                
      }
    }
  }
  else {
    if(SPEAKER_PIN==11){
      OCR2A = pgm_read_byte(&audio[sample]);
    } else {
      OCR2B = pgm_read_byte(&audio[sample]);            
    }
  }

  ++sample;
}


void honk()
{
  pinMode(SPEAKER_PIN, OUTPUT);

  // Set up Timer 2 to do pulse width modulation on the speaker pin.

  // Use internal clock (datasheet p.160)
  ASSR &= ~(_BV(EXCLK) | _BV(AS2));

  // Set fast PWM mode  (p.157)
  TCCR2A |= _BV(WGM21) | _BV(WGM20);
  TCCR2B &= ~_BV(WGM22);

  if(SPEAKER_PIN==11){
    // Do non-inverting PWM on pin OC2A (p.155)
    // On the Arduino this is pin 11.
    TCCR2A = (TCCR2A | _BV(COM2A1)) & ~_BV(COM2A0);
    TCCR2A &= ~(_BV(COM2B1) | _BV(COM2B0));
    // No prescaler (p.158)
    TCCR2B = (TCCR2B & ~(_BV(CS12) | _BV(CS11))) | _BV(CS10);

    // Set initial pulse width to the first sample.
    OCR2A = pgm_read_byte(&audio[0]);
  } else {
    // Do non-inverting PWM on pin OC2B (p.155)
    // On the Arduino this is pin 3.
    TCCR2A = (TCCR2A | _BV(COM2B1)) & ~_BV(COM2B0);
    TCCR2A &= ~(_BV(COM2A1) | _BV(COM2A0));
    // No prescaler (p.158)
    TCCR2B = (TCCR2B & ~(_BV(CS12) | _BV(CS11))) | _BV(CS10);

    // Set initial pulse width to the first sample.
    OCR2B = pgm_read_byte(&audio[0]);
  }

  // Set up Timer 1 to send a sample every interrupt.
  cli();

  // Set CTC mode (Clear Timer on Compare Match) (p.133)
  // Have to set OCR1A *after*, otherwise it gets reset to 0!
  TCCR1B = (TCCR1B & ~_BV(WGM13)) | _BV(WGM12);
  TCCR1A = TCCR1A & ~(_BV(WGM11) | _BV(WGM10));

  // No prescaler (p.134)
  TCCR1B = (TCCR1B & ~(_BV(CS12) | _BV(CS11))) | _BV(CS10);

  // Set the compare register (OCR1A).
  // OCR1A is a 16-bit register, so we have to do this with
  // interrupts disabled to be safe.
  OCR1A = F_CPU / SAMPLE_RATE;    // 16e6 / 8000 = 2000

  // Enable interrupt when TCNT1 == OCR1A (p.136)
  TIMSK1 |= _BV(OCIE1A);

  lastSample = pgm_read_byte(&audio[DATA_LENGTH-1]);
  sample = 0;
  sei();
}

void setup() {
  //Serial.begin(115200);
  //honk();
}

void loop() {
  if (!honking && digitalRead(TOUCH_PIN)) {
    honking = true;
    honk();
  }
}
