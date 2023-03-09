default:
	avr-g++ -L C:\Users\User\Desktop\arduino_build -I C:\Users\User\Desktop\arduino_build -Wall -DF_CPU=16000000UL -Os -mmcu=atmega328p -o blink_led.exe blink_led.c
	avr-objcopy -O ihex -R .eeprom blink_led.exe blink_led.hex
clean:
	del blink_led.exe
	del blink_led.hex
upload:
	avrdude -c arduino -p m328p -b 115200 -P COM5 -U flash:w:blink_led.hex
all: 	default upload
