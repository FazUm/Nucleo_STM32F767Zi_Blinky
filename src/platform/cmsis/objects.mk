PLATFORM_CMSIS_BSP_DIR		:= $(PLATFOMR_CMSIS_DIR)/bsp
PLATFORM_CMSIS_DRIVER_DIR		:= $(PLATFOMR_CMSIS_DIR)/driver

include $(PLATFORM_CMSIS_BSP_DIR)/objects.mk 
include $(PLATFORM_CMSIS_DRIVER_DIR)/objects.mk

platform-cmsis-objs-y		:= $(platform-cmsis-bsp-objs-y)
platform-cmsis-objs-y		+= $(platform-cmsis-driver-objs-y)

platform-cmsis-objs-y 		:= $(addprefix cmsis/, $(platform-cmsis-objs-y))

CODE_DIRS += $(PLATFOMR_CMSIS_DIR)
