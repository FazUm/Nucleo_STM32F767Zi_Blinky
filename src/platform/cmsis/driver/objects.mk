PLATFORM_CMSIS_DRIVER_HAL_DIR 		:= $(PLATFORM_CMSIS_DRIVER_DIR)/hal

include $(PLATFORM_CMSIS_DRIVER_HAL_DIR)/objects.mk

platform-cmsis-driver-objs-y	:= $(platform-driver-hal-y)

platform-cmsis-driver-objs-y	:= $(addprefix driver/, $(platform-driver-hal-y))

CODE_DIRS += $(PLATFORM_CMSIS_DRIVER_DIR)
