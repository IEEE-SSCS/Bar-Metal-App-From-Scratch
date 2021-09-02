############################################### Make Tutorial ##################################################
#                    @CopyRight Elabbas Salah hatata
# 1- @ >> make a command does not appear in terminal if i write it before command 
# 2- Some Simplifcation DRY ($<: dependencies for frist depend // $@: target )
# 3- 2> rid stderr to log file // &> riderected both stderr and stdout  
# 4- Generic Rules %.c or %.o this means any file in the directory or any tree dir below the current directory
# 5- wildcard for search  
#
# 
################################################################################################################

## Define build variables 

CC = @arm-none-eabi-
CFLAGS = -mcpu=arm926ej-s -g
INCS = -I . 
LIBS = 
MCAL = Mcal/
APP = App/
SRC = $(wildcard $(App)*.c $(MCAL)*.c)  
OBJ = $(SRC:.c=.o)
###OBJS = $(patsubst %.c, %.o,$SCR)
As = $(wildcard *.s)
AsOBJ = $(As:.s=.o)
project=learn-in-depth
Map=-Map=Map_file.map
LinkerScript=LinkerScript.ld

## Write Make Script

all : $(project).bin
	@echo "======     Aurther : Elabbas Salah Hatata     ======"
	@echo "====== Using Cross ToolChain : Arm-None-Eabi  ======"
	@echo "======               Build Is Done            ======"
	
%.o : %.s
			$(CC)as.exe  $(CFLAGS) $< -o $@  2> log

%.o : %.c
			$(CC)gCC.exe $(INCS) $(CFLAGS) -c $< -o $@

$(project).elf : $(OBJ) $(AsOBJ)
			$(CC)ld.exe  -T $(LinkerScript)  $(LIBS) $(OBJ) $(AsOBJ) -o $@ $(Map) 

$(project).bin : $(project).elf
			$(CC)objcopy.exe -O binary $<  $@ 
			 
clean-all :
			@echo "====== Everything Clean ======"
			@rm -r *.o *.bin *.elf *.map $(MCAL)*.o $(App)*.o
		    
clean : 
			@rm -r *.bin *.elf
			