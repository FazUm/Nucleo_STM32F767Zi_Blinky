middlware-peripheral-uart-objs-y := uart.o
middlware-peripheral-uart-objs-y += syscalls.o

middlware-peripheral-uart-objs-y	:= $(addprefix uart/, $(middlware-peripheral-uart-objs-y))

CODE_DIRS += $(MIDDLEWARE_PERIPHERAL_UART_DIR)
