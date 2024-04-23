PLATFORM_CORE_DEVICE_DIR := $(PLATFORM_CORE_DIR)/$(USER_DEVICE)

include $(PLATFORM_CORE_DEVICE_DIR)/objects.mk

platform-core-objs-y := boot.o
platform-core-objs-y += init.o
platform-core-objs-y += stm32f7xx_it.o
platform-core-objs-y += $(platform-core-device-objs-y)

platform-core-objs-y	:= $(addprefix core/, $(platform-core-objs-y))

CODE_DIRS += $(PLATFORM_CORE_DIR)
