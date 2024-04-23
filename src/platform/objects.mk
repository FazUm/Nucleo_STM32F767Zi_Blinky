PLATFOMR_CMSIS_DIR		:= $(PLATFORM_DIR)/cmsis
PLATFORM_CORE_DIR 		:= $(PLATFORM_DIR)/core

include $(PLATFOMR_CMSIS_DIR)/objects.mk 
include $(PLATFORM_CORE_DIR)/objects.mk 

platform-objs-y		:= $(platform-cmsis-objs-y)
platform-objs-y		+= $(platform-core-objs-y)
platform-objs-y		+= platform.o

platform-objs-y	:= $(addprefix $(PLATFORM_DIR)/, $(platform-objs-y))
