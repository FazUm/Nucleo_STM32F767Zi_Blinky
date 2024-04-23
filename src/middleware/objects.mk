MIDDLEWARE_PERIPHERAL_DIR	:= $(MIDDLEWARE_DIR)/peripheral
MIDDLEWARE_UTILS_DIR	:= $(MIDDLEWARE_DIR)/utils

include $(MIDDLEWARE_PERIPHERAL_DIR)/objects.mk
include $(MIDDLEWARE_UTILS_DIR)/objects.mk

middlware-objs-y	:=
middlware-objs-y	+= $(middlware-peripheral-objs-y)
middlware-objs-y	+= $(middleware-utils-objs-y)

middlware-objs-y	:= $(addprefix $(MIDDLEWARE_DIR)/, $(middlware-objs-y))
