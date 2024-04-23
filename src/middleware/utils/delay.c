#include "inc/delay.h"

void delay_ms(int period) {
    HAL_Delay(period);
}
