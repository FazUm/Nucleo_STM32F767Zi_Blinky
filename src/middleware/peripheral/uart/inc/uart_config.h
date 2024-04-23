#ifndef __MIDDLEWARE_PERIPHEARL_UART_CONFIG_H__
#define __MIDDLEWARE_PERIPHEARL_UART_CONFIG_H__

#include "stm32f7xx.h"
#include "stm32f767xx.h"
#include "stm32f7xx_hal.h"
#include "stm32f7xx_hal_uart.h"
#include "stm32f7xx_hal_gpio.h"

static UART_HandleTypeDef uart3 = {

    .Instance = USART3,
    .Init = {
        .BaudRate = 115200,
        .WordLength = UART_WORDLENGTH_8B,
        .StopBits = UART_STOPBITS_1,
        .Parity = UART_PARITY_NONE,
        .Mode = UART_MODE_TX_RX,
        .HwFlowCtl = UART_HWCONTROL_NONE,
        .OverSampling = UART_OVERSAMPLING_16,
        .OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE,
    },
    .AdvancedInit = {
        .AdvFeatureInit = UART_ADVFEATURE_NO_INIT,
    }
};

#endif
