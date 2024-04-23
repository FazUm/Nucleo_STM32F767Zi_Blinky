#include "uart.h"
#include "uart_config.h"

#define STLK_RX_Pin GPIO_PIN_8
#define STLK_TX_Pin GPIO_PIN_9


static GPIO_InitTypeDef uart3_gpio = 
{
    .Pin = STLK_RX_Pin|STLK_TX_Pin,
    .Mode = GPIO_MODE_AF_PP,
    .Pull = GPIO_NOPULL,
    .Speed = GPIO_SPEED_FREQ_VERY_HIGH,
    .Alternate = GPIO_AF7_USART3,
};

void UART_Init()
{
    HAL_UART_Init(&uart3);
}

void HAL_UART_MspInit(UART_HandleTypeDef* uartHandle)
{

  if(uartHandle->Instance==USART3)
  {
    __HAL_RCC_USART3_CLK_ENABLE();
  
    __HAL_RCC_GPIOD_CLK_ENABLE();

    HAL_GPIO_Init(GPIOD, &uart3_gpio);
  }
}

void UART_send(char *data){
  int i = 0;
  while(data[i] != '\0') {
    HAL_UART_Transmit(&uart3, (uint8_t*)&data[i], 1, 0xFFFF);
    i++;
  }
}
