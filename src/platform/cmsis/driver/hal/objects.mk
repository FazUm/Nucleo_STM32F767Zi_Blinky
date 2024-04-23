PLATFORM_DRIVER_HAL_CONFIG_DIR 		:= $(PLATFORM_CMSIS_DRIVER_HAL_DIR)/config
PLATFORM_DRIVER_HAL_LEGACY_DIR 		:= $(PLATFORM_CMSIS_DRIVER_HAL_DIR)/inc/legacy

include $(PLATFORM_DRIVER_HAL_CONFIG_DIR)/objects.mk

platform-driver-hal-y	:= stm32f7xx_hal.o
platform-driver-hal-y	+= stm32f7xx_hal_gpio.o
platform-driver-hal-y	+= stm32f7xx_hal_cortex.o
platform-driver-hal-y	+= stm32f7xx_hal_pwr.o
platform-driver-hal-y	+= stm32f7xx_hal_pwr_ex.o
platform-driver-hal-y	+= stm32f7xx_hal_rcc.o
platform-driver-hal-y	+= stm32f7xx_hal_rcc_ex.o
platform-driver-hal-y	+= stm32f7xx_hal_dma.o
platform-driver-hal-y	+= stm32f7xx_hal_uart.o
platform-driver-hal-y	+= $(platform-driver-hal-config-y)

platform-driver-hal-y := $(addprefix hal/, $(platform-driver-hal-y))

CODE_DIRS += $(PLATFORM_CMSIS_DRIVER_HAL_DIR)
