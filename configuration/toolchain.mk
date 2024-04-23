##############################################################################
# TOOLCHAIN SET
TOOLCHAIN_DIR 	:= $(USER_TOOLCHAIN_DIR)/bin/
TOOLCHAIN 		:= arm-none-eabi-
CROSS_COMPILE 	?= $(addprefix $(TOOLCHAIN_DIR),$(TOOLCHAIN))

CC 			:= $(CROSS_COMPILE)gcc
GDB			:= $(CROSS_COMPILE)gdb
CXX			:= $(CROSS_COMPILE)g++
LD			:= $(CROSS_COMPILE)ld
SIZE		:= $(CROSS_COMPILE)size
OBJDUMP		:= $(CROSS_COMPILE)objdump
OBJCOPY 	:= $(CROSS_COMPILE)objcopy
READELF		:= $(CROSS_COMPILE)readelf
AR			:= $(CROSS_COMPILE)ar
AS			:= $(CROSS_COMPILE)gcc
STRIP 		:= $(CROSS_COMPILE)strip

#COMPILER USED
COMPILER := $(CC)
