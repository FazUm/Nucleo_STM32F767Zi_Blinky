USER_DEVICE	:= STM32F767xx

##############################################################################
# MCU FLAGS
MCUFLAGS 	:= -mcpu=cortex-m7 
MCUFLAGS 	+= -mlittle-endian
MCUFLAGS	+= -mfloat-abi=hard
MCUFLAGS	+= -mfpu=fpv5-sp-d16
MCUFLAGS	+= -mthumb 

##############################################################################
# DEVICE COMPILER DEFINES
DEVICE_DEFS := -DSTM32 
DEVICE_DEFS	+= -DSTM32F7 
DEVICE_DEFS	+= -D$(USER_DEVICE)
DEVICE_DEFS	+= -DUSE_HAL_DRIVER
DEVICE_DEFS	+= -DUSE_FULL_LL_DRIVERS

##############################################################################
# CC FLAG
COMPILER_FLAGS		:= -c -$(OPTIM)
COMPILER_FLAGS		+= -Wall -Wextra --pedantic --specs=nano.specs
COMPILER_FLAGS		+= -std=c11
COMPILER_FLAGS		+= -fdata-sections -ffunction-sections -u printf_float

COMPILER_FLAGS 		+= $(MCUFLAGS)
COMPILER_FLAGS		+= $(DEVICE_DEFS)

ifeq ($(DEBUG), y)
COMPILER_FLAGS	+= -g -gdwarf-2
endif

##############################################################################
# LINKER FLAGS 
LDFLAGS 	:= -T$(LDSCRIPT)
LDFLAGS 	+= -static $(MCUFLAGS)
LDFLAGS 	+= -specs=nosys.specs
