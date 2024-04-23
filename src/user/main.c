#include <stdio.h>
#include "led.h"
#include "uart.h"
#include "delay.h"

static LED LEDS[] = {GREEN, BLUE, RED};

int main(void)
{
  UART_Init();

  size_t array_led_size = sizeof(LEDS);

  for(uint8_t i = 0; i < array_led_size; i++) {
    LED_Init(LEDS[i]);
  }
  int curr_pos = 0;
  UART_send("Hello World\n");

  while (1)
  {
    LED_Toggle(LEDS[curr_pos++]);
    curr_pos &= array_led_size;
    delay_ms(2000);
  }
}
