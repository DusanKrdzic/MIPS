
PROGRAM = program

CC = arm-none-eabi-gcc.exe -c
AS = arm-none-eabi-gcc.exe -c -x assembler
LD = arm-none-eabi-ld.exe
HX = arm-none-eabi-objcopy.exe -O ihex

MCU = -mcpu=cortex-m3 -mthumb

FLAGS_AS =
FLAGS_AS +=$(MCU)

FLAGS_CC =
FLAGS_CC += $(MCU)

LINKER_SCRIPT = linker_script.ld

all : $(PROGRAM).hex $(PROGRAM).elf
	


$(PROGRAM).hex : $(PROGRAM).elf
	$(HX) $(<) $(@)

$(PROGRAM).elf : startup_code.o main.o systick.o
	$(LD) -T $(LINKER_SCRIPT) -o $(@) $(^)


startup_code.o :  startup_code.s
	$(AS)  $(FLAGS_AS) -o $(@) $(<)

main.o : main.c systick.h
	$(CC) $(FLAGS_CC) -o $(@) $(<)
	
systick.o : systick.c systick.h
	$(CC) $(FLAGS_CC) -o $(@) $(<)