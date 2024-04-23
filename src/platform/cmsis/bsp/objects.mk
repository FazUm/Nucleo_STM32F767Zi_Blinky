platform-cmsis-bsp-objs-y := stm32f7xx_nucleo_144.o

platform-cmsis-bsp-objs-y := $(addprefix bsp/, $(platform-cmsis-bsp-objs-y))

CODE_DIRS += $(PLATFORM_CMSIS_BSP_DIR)
