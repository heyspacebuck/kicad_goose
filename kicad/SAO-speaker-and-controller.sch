EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Horrible Goose Cap-Touch Dingus"
Date "2021-05-09"
Rev "honk"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Sensor_Touch:AT42QT1011-TSHR U1
U 1 1 609816E1
P 5000 2100
F 0 "U1" H 5000 2581 50  0000 C CNN
F 1 "AT42QT1011-TSHR" H 5000 2490 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 5050 1850 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/40001947A.pdf" H 5270 2650 50  0001 C CNN
	1    5000 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 6098325B
P 5575 2100
F 0 "C2" H 5667 2146 50  0000 L CNN
F 1 "0.01 μF" H 5667 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5575 2100 50  0001 C CNN
F 3 "~" H 5575 2100 50  0001 C CNN
	1    5575 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 60983BFF
P 4050 2000
F 0 "C1" H 4225 2050 50  0000 R CNN
F 1 "0.1 μF" H 4375 1950 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4050 2000 50  0001 C CNN
F 3 "~" H 4050 2000 50  0001 C CNN
	1    4050 2000
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 60987348
P 6325 2225
F 0 "C3" H 6417 2271 50  0000 L CNN
F 1 "10 pF" H 6417 2180 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6325 2225 50  0001 C CNN
F 3 "~" H 6325 2225 50  0001 C CNN
	1    6325 2225
	1    0    0    -1  
$EndComp
Text GLabel 3750 2450 0    50   Input ~ 0
0V
Wire Wire Line
	5000 1750 5000 1800
Connection ~ 4050 1750
Wire Wire Line
	4050 1750 5000 1750
Wire Wire Line
	3750 2450 4050 2450
Wire Wire Line
	4050 2450 4400 2450
Wire Wire Line
	5000 2450 5000 2400
Connection ~ 4050 2450
Wire Wire Line
	5000 2450 6325 2450
Wire Wire Line
	6325 2450 6325 2325
Connection ~ 5000 2450
Wire Wire Line
	6325 2125 6325 2000
Wire Wire Line
	6325 2000 6175 2000
Wire Wire Line
	5875 2000 5575 2000
Wire Wire Line
	5575 2000 5400 2000
Connection ~ 5575 2000
Wire Wire Line
	5400 2200 5575 2200
Wire Wire Line
	4600 2000 4400 2000
Connection ~ 4400 2450
Wire Wire Line
	4400 2450 5000 2450
Text GLabel 4600 2200 3    50   Input ~ 0
honk
Wire Wire Line
	4050 1900 4050 1750
Wire Wire Line
	4050 2100 4050 2450
Text Notes 3675 2800 0    50   ~ 0
(Please note that SYNC is by default tied to GND)
$Comp
L goose:R_Goose R1
U 1 1 60989A76
P 6875 1750
F 0 "R1" H 6025 1650 50  0000 C CNN
F 1 "1 kΩ" H 6025 1575 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6085 1470 150 0001 C CNN
F 3 "" H 6085 1470 150 0001 C CNN
	1    6875 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J1
U 1 1 612344DA
P 2375 3625
F 0 "J1" V 2379 3437 50  0000 R CNN
F 1 "SAO Connector" V 2470 3437 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 2375 3625 50  0001 C CNN
F 3 "~" H 2375 3625 50  0001 C CNN
	1    2375 3625
	0    -1   1    0   
$EndComp
Wire Wire Line
	2275 4025 2275 3925
Wire Wire Line
	2175 4025 2275 4025
Text GLabel 2175 4025 0    50   Input ~ 0
0V
Text GLabel 2175 3325 0    50   Input ~ 0
Vin
Wire Wire Line
	2175 3325 2275 3325
Wire Wire Line
	2275 3325 2275 3425
NoConn ~ 2375 3425
NoConn ~ 2375 3925
Text GLabel 2575 3325 2    50   Input ~ 0
honk
Wire Wire Line
	2575 4025 2475 4025
Wire Wire Line
	2475 4025 2475 3925
Wire Wire Line
	2575 3325 2475 3325
Wire Wire Line
	2475 3325 2475 3425
Text Notes 825  4300 0    50   ~ 0
Connector follows the Shitty Add-On v1.69bis """standard"""\nhttps://hackaday.com/2019/03/20/introducing-the-shitty-add-on-v1-69bis-standard/
$Comp
L Device:Speaker LS1
U 1 1 61308B8C
P 9925 3325
F 0 "LS1" H 10095 3321 50  0000 L CNN
F 1 "SP-1609S 8Ω 0.5W speaker" H 10095 3230 50  0000 L CNN
F 2 "goose:Speaker_SP-1609S" H 9925 3125 50  0001 C CNN
F 3 "~" H 9915 3275 50  0001 C CNN
	1    9925 3325
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Counter_Clockwise J2
U 1 1 6130EF76
P 5200 3800
F 0 "J2" H 5250 4117 50  0000 C CNN
F 1 "SOICbite" H 5250 4026 50  0000 C CNN
F 2 "goose:SOIC_clipProgSmall" H 5200 3800 50  0001 C CNN
F 3 "~" H 5200 3800 50  0001 C CNN
	1    5200 3800
	1    0    0    -1  
$EndComp
Text Label 8850 2925 0    50   ~ 0
sdi
Text Label 8850 3025 0    50   ~ 0
sdo
Text Label 8850 3425 0    50   ~ 0
~cs
Text Label 4925 3800 2    50   ~ 0
sdi
Text Label 5500 3700 0    50   ~ 0
sdo
Text Label 5575 3900 0    50   ~ 0
~cs
Text GLabel 5575 4000 2    50   Input ~ 0
0V
Text GLabel 4925 3700 0    50   Input ~ 0
5V
Text GLabel 7225 3925 0    50   Input ~ 0
0V
Wire Wire Line
	8850 3425 8750 3425
Wire Wire Line
	4925 3700 5000 3700
Wire Wire Line
	4925 3800 5000 3800
Wire Wire Line
	4925 3900 5000 3900
Wire Wire Line
	4925 4000 5000 4000
Wire Wire Line
	5500 3900 5575 3900
Wire Wire Line
	5500 4000 5575 4000
Text Notes 7975 2400 0    50   ~ 0
Circuit and code draw heavily from here:\nhttp://www.technoblogy.com/show?QBB
Wire Wire Line
	8750 3325 9725 3325
Wire Wire Line
	9675 3025 9675 3225
Wire Wire Line
	9675 3225 9725 3225
Wire Wire Line
	8750 3025 9675 3025
Text GLabel 9375 3225 2    50   Input ~ 0
honk
Wire Wire Line
	7250 2525 7375 2525
Wire Wire Line
	7375 2525 7375 3100
Wire Wire Line
	7375 3925 7225 3925
Wire Wire Line
	7375 3925 8150 3925
Wire Wire Line
	8150 3925 8150 3825
Wire Wire Line
	8150 2625 8150 2525
Wire Wire Line
	8150 2525 7375 2525
Connection ~ 7375 2525
Connection ~ 7375 3925
Wire Wire Line
	7375 3300 7375 3925
$Comp
L Device:C_Small C4
U 1 1 6131E9A5
P 7375 3200
F 0 "C4" H 7550 3250 50  0000 R CNN
F 1 "0.1 μF" H 7700 3150 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7375 3200 50  0001 C CNN
F 3 "~" H 7375 3200 50  0001 C CNN
	1    7375 3200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4400 2000 4400 2450
$Comp
L MCU_Microchip_ATtiny:ATtiny85-20SU U2
U 1 1 6135DDB0
P 8150 3225
F 0 "U2" H 8475 3900 50  0000 R CNN
F 1 "ATtiny85-20SU" H 8825 3800 50  0000 R CNN
F 2 "Package_SO:SOIJ-8_5.3x5.3mm_P1.27mm" H 8150 3225 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 8150 3225 50  0001 C CNN
	1    8150 3225
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3125 8850 3125
Wire Wire Line
	8750 3225 9175 3225
Wire Wire Line
	9175 3425 9175 3225
Connection ~ 9175 3225
Wire Wire Line
	9175 3225 9375 3225
Wire Wire Line
	8150 3925 9175 3925
Wire Wire Line
	9175 3925 9175 3725
Connection ~ 8150 3925
Text Notes 9300 3875 0    50   ~ 0
Optional pull-down resistor\nTODO: add a jumper maybe
$Comp
L Device:R R2
U 1 1 6131CA07
P 9175 3575
F 0 "R2" H 9075 3550 50  0000 C CNN
F 1 "1 kΩ" H 9025 3625 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 9105 3575 50  0001 C CNN
F 3 "~" H 9175 3575 50  0001 C CNN
	1    9175 3575
	-1   0    0    1   
$EndComp
$Comp
L Regulator_Switching:TPS613222ADBV U3
U 1 1 616809AD
P 2600 1850
F 0 "U3" H 2600 2217 50  0000 C CNN
F 1 "TPS613222ADBV" H 2600 2126 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 2600 1050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps61322.pdf" H 2600 1700 50  0001 C CNN
	1    2600 1850
	1    0    0    -1  
$EndComp
Text Notes 4600 4300 0    50   ~ 0
SOICbite footprint as described here:\nhttps://hackaday.io/project/165917-soicbite-programmingdebug-connector-footprint
$Comp
L Device:L L1
U 1 1 6168C112
P 1950 1750
F 0 "L1" V 2140 1750 50  0000 C CNN
F 1 "2.2 μH" V 2049 1750 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" H 1950 1750 50  0001 C CNN
F 3 "~" H 1950 1750 50  0001 C CNN
	1    1950 1750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2200 1750 2100 1750
Wire Wire Line
	1800 1750 1700 1750
$Comp
L Device:C_Small C5
U 1 1 6168F75A
P 1700 1975
F 0 "C5" H 1875 2025 50  0000 R CNN
F 1 "4.7 μF" H 2025 1925 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1700 1975 50  0001 C CNN
F 3 "~" H 1700 1975 50  0001 C CNN
	1    1700 1975
	-1   0    0    -1  
$EndComp
Text GLabel 1600 2175 0    50   Input ~ 0
0V
Wire Wire Line
	1600 2175 1700 2175
Wire Wire Line
	1700 2075 1700 2175
Connection ~ 1700 2175
Wire Wire Line
	1700 1875 1700 1750
Connection ~ 1700 1750
Wire Wire Line
	1700 1750 1600 1750
Wire Wire Line
	2600 2175 2600 2150
Wire Wire Line
	1700 2175 2600 2175
$Comp
L Device:C_Small C6
U 1 1 61697DC4
P 3225 1975
F 0 "C6" H 3400 2025 50  0000 R CNN
F 1 "22 μF" H 3550 1925 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3225 1975 50  0001 C CNN
F 3 "~" H 3225 1975 50  0001 C CNN
	1    3225 1975
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2600 2175 3225 2175
Wire Wire Line
	3225 2175 3225 2075
Wire Wire Line
	3225 1750 3000 1750
Wire Wire Line
	3225 1875 3225 1750
Connection ~ 2600 2175
Wire Wire Line
	3225 1750 3600 1750
Connection ~ 3225 1750
Text GLabel 3700 1200 2    50   Input ~ 0
5V
Wire Wire Line
	3600 1200 3700 1200
Connection ~ 3600 1750
Wire Wire Line
	3600 1750 4050 1750
Text GLabel 1600 1750 0    50   Input ~ 0
Vin
Text GLabel 7250 2525 0    50   Input ~ 0
5V
Wire Wire Line
	3600 1200 3600 1750
$Comp
L Device:D D1
U 1 1 616A21DB
P 2575 1200
F 0 "D1" H 2575 983 50  0000 C CNN
F 1 "D" H 2575 1074 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323" H 2575 1200 50  0001 C CNN
F 3 "~" H 2575 1200 50  0001 C CNN
	1    2575 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 1200 2725 1200
Wire Wire Line
	1700 1200 1700 1750
Wire Wire Line
	2425 1200 1700 1200
Connection ~ 3600 1200
Wire Wire Line
	8850 2925 8750 2925
Text GLabel 2575 4025 2    50   Input ~ 0
clk
Text GLabel 4925 4000 0    50   Input ~ 0
clk
Text GLabel 8850 3125 2    50   Input ~ 0
clk
$EndSCHEMATC
