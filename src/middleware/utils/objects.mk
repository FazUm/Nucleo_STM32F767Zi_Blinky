middleware-utils-objs-y	:= 
middleware-utils-objs-y	+= delay.o

middleware-utils-objs-y	:= $(addprefix utils/, $(middleware-utils-objs-y))

CODE_DIRS += $(MIDDLEWARE_UTILS_DIR)
