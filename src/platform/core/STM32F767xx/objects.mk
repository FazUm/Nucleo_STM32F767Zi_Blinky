platform-core-device-objs-y	:= except_handlers.o
platform-core-device-objs-y	+= vtor.o

platform-core-device-objs-y	:= $(addprefix STM32F767xx/,  $(platform-core-device-objs-y))

CODE_DIRS += $(PLATFORM_CORE_DEVICE_DIR)
