MIDDLEWARE_PERIPHERAL_UART_DIR := $(MIDDLEWARE_PERIPHERAL_DIR)/uart
MIDDLEWARE_PERIPHERAL_LED_DIR := $(MIDDLEWARE_PERIPHERAL_DIR)/led

include $(MIDDLEWARE_PERIPHERAL_UART_DIR)/objects.mk
include $(MIDDLEWARE_PERIPHERAL_LED_DIR)/objects.mk

middlware-peripheral-objs-y	:=
middlware-peripheral-objs-y	+= $(middlware-peripheral-uart-objs-y)
middlware-peripheral-objs-y	+= $(middlware-peripheral-led-objs-y)

middlware-peripheral-objs-y	:= $(addprefix peripheral/, $(middlware-peripheral-objs-y))

CODE_DIRS += $(MIDDLEWARE_PERIPHERAL_DIR)
