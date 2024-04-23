# STM32F767ZI Blinky

Custom made project to make the user leds blink in the STM3267ZI Nucleo board.
The project uses the C language and for buildsystem Makefiles with the ARM Toolchain.

### Project setup
First step is to install pyocd. After install the stm32f767zi pack by executing `pyocd pack --install stm32f767zi`.
After, make sure you either have docker installed or the arm toolchain configured locally.
If you opt to use your local toolchain, make sure to edit the [user makefile](configuration/user.mk) and add the correct `USER_TOOLCHAIN_DIR`.

### Build and Deploy

If you opt to use docker you can use the [build script](script/build.sh). For that first do `chmod +x script/build.sh`.
Afther you can run the targets available in the [Makefile](Makefile).
For example, to build the project do:

```bash
./script/build.sh
```

To clean the project execute

```bash
/script/build.sh clean
```

### Flashing

Once all depedencies are installed, make sure you have the device connected to your development pc and run `make flash`.
