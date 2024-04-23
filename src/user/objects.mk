user-objs-y	:= main.o

user-objs-y	:= $(addprefix $(USER_DIR)/, $(user-objs-y))
