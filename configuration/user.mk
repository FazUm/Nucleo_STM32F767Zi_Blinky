##############################################################################
############################# USER CONFIGURATIONS ############################
# PROJECT NAME
PROJECT_NAME ?= Blinky

# COMPILER ARGUMENTS
DEBUG ?= y
OPTIM ?= O0

# BUILD CONFIGURATION
USER_TOOLCHAIN_DIR ?= /Users/pedro/.local/bin/arm-gnu-toolchain-13.2.rel1-darwin-arm64-arm-none-eabi/arm-gnu-toolchain-13.2.Rel1-darwin-arm64-arm-none-eabi

FLASHTOOL	:= pyocd
