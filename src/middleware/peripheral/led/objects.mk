middlware-peripheral-led-objs-y := led.o

middlware-peripheral-led-objs-y	:= $(addprefix led/, $(middlware-peripheral-led-objs-y))

CODE_DIRS += $(MIDDLEWARE_PERIPHERAL_LED_DIR)
