#ifndef __MIDDLEWARE_PERIPHERAL_LED_H__
#define __MIDDLEWARE_PERIPHERAL_LED_H__

typedef enum {
    GREEN,
    BLUE, 
    RED
} LED;

void LED_Init(LED led);
void LED_Toggle(LED led);

#endif
