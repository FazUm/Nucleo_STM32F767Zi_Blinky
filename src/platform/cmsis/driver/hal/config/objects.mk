platform-driver-hal-config-y := stm32f7xx_hal_msp.o

platform-driver-hal-config-y := $(addprefix config/, $(platform-driver-hal-config-y))

CODE_DIRS += $(PLATFORM_DRIVER_HAL_CONFIG_DIR)
