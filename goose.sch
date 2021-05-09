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
L Device:C_Small C2
U 1 1 6098325B
P 5575 2100
F 0 "C2" H 5667 2146 50  0000 L CNN
F 1 "0.01 μF" H 5667 2055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5575 2100 50  0001 C CNN
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
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4050 2000 50  0001 C CNN
F 3 "~" H 4050 2000 50  0001 C CNN
	1    4050 2000
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 60984DE5
P 6025 2000
F 0 "R1" V 5818 2000 50  0000 C CNN
F 1 "1 kΩ" V 5909 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 5955 2000 50  0001 C CNN
F 3 "~" H 6025 2000 50  0001 C CNN
	1    6025 2000
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 60987348
P 6325 2225
F 0 "C3" H 6417 2271 50  0000 L CNN
F 1 "5-20 pF" H 6417 2180 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6325 2225 50  0001 C CNN
F 3 "~" H 6325 2225 50  0001 C CNN
	1    6325 2225
	1    0    0    -1  
$EndComp
Text GLabel 6500 2000 2    50   Input ~ 0
horrible_goose
Text GLabel 3750 1750 0    50   Input ~ 0
Vin
Text GLabel 3750 2450 0    50   Input ~ 0
0V
Wire Wire Line
	3750 1750 4050 1750
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
	6325 2000 6500 2000
Connection ~ 6325 2000
Wire Wire Line
	5875 2000 5575 2000
Wire Wire Line
	5575 2000 5400 2000
Connection ~ 5575 2000
Wire Wire Line
	5400 2200 5575 2200
Wire Wire Line
	4600 2000 4400 2000
Wire Wire Line
	4400 2000 4400 2125
Connection ~ 4400 2450
Wire Wire Line
	4400 2450 5000 2450
Text GLabel 4600 2200 3    50   Input ~ 0
honk
$Comp
L goose:Goose GOOSE1
U 1 1 60983F4E
P 6575 1550
F 0 "GOOSE1" H 6907 1595 50  0000 L CNN
F 1 "Goose" H 6907 1504 50  0000 L CNN
F 2 "goose:honk_captouch_scaled" H 5785 1270 150 0001 C CNN
F 3 "" H 5785 1270 150 0001 C CNN
	1    6575 1550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 6098622A
P 4425 3175
F 0 "J1" H 4505 3167 50  0000 L CNN
F 1 "Conn_01x04" H 4505 3076 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 4425 3175 50  0001 C CNN
F 3 "~" H 4425 3175 50  0001 C CNN
	1    4425 3175
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP1
U 1 1 60987404
P 4400 2225
F 0 "JP1" V 4425 2400 50  0000 R CNN
F 1 "NC" V 4350 2400 50  0000 R CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_RoundedPad1.0x1.5mm" H 4400 2225 50  0001 C CNN
F 3 "~" H 4400 2225 50  0001 C CNN
	1    4400 2225
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4400 2325 4400 2450
Wire Wire Line
	4050 1900 4050 1750
Wire Wire Line
	4050 2100 4050 2450
Text GLabel 4400 1900 2    50   Input ~ 0
sync
Wire Wire Line
	4400 1900 4400 2000
Connection ~ 4400 2000
Text GLabel 4225 3075 0    50   Input ~ 0
Vin
Text GLabel 4225 3175 0    50   Input ~ 0
honk
Text GLabel 4225 3275 0    50   Input ~ 0
sync
Text GLabel 4225 3375 0    50   Input ~ 0
0V
Text Notes 3625 2825 0    50   ~ 0
(Please note that SYNC is by default tied to GND)
$Comp
L Sensor_Touch:AT42QT1011-M U1
U 1 1 6098677B
P 5000 2100
F 0 "U1" H 5000 2581 50  0000 C CNN
F 1 "AT42QT1011-M" H 5000 2490 50  0000 C CNN
F 2 "Package_DFN_QFN:DFN-8-1EP_2x2mm_P0.5mm_EP0.9x1.5mm" H 5050 1850 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/40001947A.pdf" H 5270 2650 50  0001 C CNN
	1    5000 2100
	1    0    0    -1  
$EndComp
$EndSCHEMATC
