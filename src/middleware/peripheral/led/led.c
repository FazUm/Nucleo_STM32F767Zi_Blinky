#include "stm32f7xx_nucleo_144.h"
#include "inc/led.h"

static Led_TypeDef map_Led_to_BSP_led(LED led) {
    Led_TypeDef ret;
    switch (led)
    {
    case GREEN:
        ret = LED_GREEN;
        break;
    case RED:
        ret = LED_RED;
        break;
    case BLUE:
        ret = LED_BLUE;
        break;
    default:
        break;
    }
    return ret;
}


void LED_Init(LED led) {
    BSP_LED_Init(map_Led_to_BSP_led(led));
}

void LED_Toggle(LED led){
    BSP_LED_Toggle(map_Led_to_BSP_led(led));
}
