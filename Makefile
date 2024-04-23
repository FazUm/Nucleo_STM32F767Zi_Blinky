##############################################################################
# GLOBAL PROJECT DIRS
BASE_DIR 	:= $(abspath .)
SCRIPT_DIR 	:= $(BASE_DIR)/script
LINKER_SCRIPT_DIR := $(SCRIPT_DIR)/linker
CONFIGURATION_DIR := $(BASE_DIR)/configuration

##############################################################################
# BUILD CONFIGURATIONS
LDSCRIPT = $(LINKER_SCRIPT_DIR)/linkerfile.ld

include $(CONFIGURATION_DIR)/user.mk
include $(CONFIGURATION_DIR)/flags.mk
include $(CONFIGURATION_DIR)/toolchain.mk

##############################################################################
# CODE DIRS
SRC_DIR			:= $(BASE_DIR)/src
USER_DIR 		:= $(SRC_DIR)/user
MIDDLEWARE_DIR 	:= $(SRC_DIR)/middleware
PLATFORM_DIR	:= $(SRC_DIR)/platform

CODE_DIRS :=
CODE_DIRS := $(PLATFORM_DIR) $(MIDDLEWARE_DIR) $(USER_DIR)

# SOURCE FILES
-include $(addsuffix /objects.mk, $(CODE_DIRS))

##############################################################################
#INCLUDE HEADER FILE
INC_DIRS := $(addsuffix /inc, $(CODE_DIRS))

INCLUDES := $(addprefix -I, $(INC_DIRS))

##############################################################################
# OUTPUT DIRS
OUT_DIR := $(BASE_DIR)
OBJ_DIR := $(OUT_DIR)/build
BIN_DIR := $(OUT_DIR)/bin
ARTFICATS_DIR 	:= $(OBJ_DIR) $(BIN_DIR)

##############################################################################
# OBJECT FILES AND DEPENDENCIES
objs-y 	:= 	
objs-y	+= $(platform-objs-y)
objs-y	+= $(middlware-objs-y)
objs-y	+= $(user-objs-y)

deps   += $(patsubst %.o,%.d,$(objs-y))
objs-y	:= $(patsubst $(SRC_DIR)%, $(OBJ_DIR)%, $(objs-y))

BUILD_DIRS 		:= $(patsubst $(SRC_DIR)%, $(OBJ_DIR)%, $(CODE_DIRS))
ARTFICATS_DIR  	+= $(BUILD_DIRS)

##############################################################################
# BINARIES
ELF := $(BIN_DIR)/$(PROJECT_NAME).elf
HEX := $(BIN_DIR)/$(PROJECT_NAME).hex

# PHONY TARGETS
.PHONY: all clean flash debug erase

all: $(HEX)

clean:
	@rm -rf $(OBJ_DIR)
	@rm -rf $(BIN_DIR) 
	@echo "Project cleaned!"

flash: $(HEX)
	@$(FLASHTOOL) flash $<

debug:
	@$(FLASHTOOL) gdbserver

erase:
	@$(FLASHTOOL) erase --mass

################################################################################
# Rule to create the Hexadecimal file
$(HEX): $(ELF)
	@echo Generating hex $(patsubst $(BIN_DIR)/%,%, $@)
	@$(OBJCOPY) -O ihex $< $@
	@$(OBJDUMP) -S --wide $< > $(basename $<).asm
	@$(READELF) -a --wide $< > $(basename $<).txt
	@$(OBJDUMP) --all-headers --demangle --disassemble --file-headers --wide \
				-D $< > $(basename $<).lst
	@$(SIZE) $@
	@$(OBJDUMP) -f $<

# Rule to create the ELF file
$(ELF): $(objs-y)
	@$(COMPILER) $(LDFLAGS) $(objs-y) -o  $@
	@echo "Linking $(patsubst $(BNDIR)/%,%, $@)"
ifneq ($(DEBUG), y)
	@echo "Stripping $@"
	@$(STRIP) -s $@
endif

# Rule to create the objects
$(objs-y):
	@echo Building $(notdir $@)
	@$(COMPILER) $(COMPILER_FLAGS) $(INCLUDES) -c $< -o $@

############################## Secondary expansion ##############################
.SECONDEXPANSION:

$(deps) : | $$(@D) # Expands and creates the depedencies files

# Rule to create directories
$(ARTFICATS_DIR):
	@echo "Creating directories	$(patsubst $(BASE_DIR)/%, %, $@)"
	@mkdir -p $@ $(BIN_DIR)

# Rule to create the depedencies
$(OBJ_DIR)/%.d : $(SRC_DIR)/%.[S,c]
	@echo "Creating dependency	$(patsubst $(BASE_DIR)/%, %, $@)"
	@$(COMPILER) -MM -MG -MT "$(patsubst %.d, %.o, $@) $@" $(COMPILER_FLAGS) $(INCLUDES) $< > $@
-include $(deps)
