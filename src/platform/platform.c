#include "stm32f7xx_hal.h"
#include "stm32f7xx_hal_msp.h"
#include "stm32f7xx.h"
#include "inc/platform.h"

void PlatformInit(void)
{
    HAL_Init();
    SystemClockConfig();
}

