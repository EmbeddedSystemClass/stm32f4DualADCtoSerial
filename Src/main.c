/**
  ******************************************************************************
  * File Name          : main.c
  * Description        : Main program body
  ******************************************************************************
  *
  * COPYRIGHT(c) 2016 STMicroelectronics
  *
  * Redistribution and use in source and binary forms, with or without modification,
  * are permitted provided that the following conditions are met:
  *   1. Redistributions of source code must retain the above copyright notice,
  *      this list of conditions and the following disclaimer.
  *   2. Redistributions in binary form must reproduce the above copyright notice,
  *      this list of conditions and the following disclaimer in the documentation
  *      and/or other materials provided with the distribution.
  *   3. Neither the name of STMicroelectronics nor the names of its contributors
  *      may be used to endorse or promote products derived from this software
  *      without specific prior written permission.
  *
  * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
  * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
  * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
  * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
  * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
  * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
  * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
  *
  ******************************************************************************
  */
/* Includes ------------------------------------------------------------------*/
#include "stm32f4xx_hal.h"

/* USER CODE BEGIN Includes */
#include "stm32f4_discovery.h"
#include "main.h"
#include "arm_math.h"
#include "arm_common_tables.h"
/* USER CODE END Includes */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc1;
ADC_HandleTypeDef hadc2;
DMA_HandleTypeDef hdma_adc1;

DAC_HandleTypeDef hdac;
DMA_HandleTypeDef hdma_dac2;

I2C_HandleTypeDef hi2c1;

SPI_HandleTypeDef hspi2;
DMA_HandleTypeDef hdma_spi2_rx;
DMA_HandleTypeDef hdma_spi2_tx;

TIM_HandleTypeDef htim6;

/* USER CODE BEGIN PV */
/* Private variables ---------------------------------------------------------*/
VoltageStruct voltageStruct;

/* Buffer used for transmission */
uint8_t aTxBuffer[] = "message*";

/* Buffer used for reception */
uint8_t aRxBuffer[BUFFERSIZE];

/* Variable used to get converted value */
__IO uint32_t aADCDualConvertedValue[VOLTAGE_BUFFER_LENGTH] = { 0 };
__IO uint16_t uhADCxConvertedValue[VOLTAGE_BUFFER_LENGTH] = { 0 };
__IO uint16_t uhDACxConvertedValue = 0;
uint32_t sampleCounter = 0;
uint32_t sampleMultiplier = 0;
uint32_t bufferFirst[ETHERNET_BUFFER_LENGTH] = { 0 };
uint32_t bufferLast[ETHERNET_BUFFER_LENGTH] = { 0 };

#define sinBufferSize 1024
__IO uint16_t sinBuffer[sinBufferSize] = { 0 };

__IO ITStatus UartReady = RESET;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_ADC1_Init(void);
static void MX_ADC2_Init(void);
static void MX_DAC_Init(void);
static void MX_I2C1_Init(void);
static void MX_SPI2_Init(void);
static void MX_TIM6_Init(void);

/* USER CODE BEGIN PFP */
/* Private function prototypes -----------------------------------------------*/

/* Private function prototypes -----------------------------------------------*/
static void DAC_Ch2_SinConfig(void);
void processAdcPacket(uint32_t startIndex, uint32_t endIndex);

static void Error_Handler(void);
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* AdcHandle);

static void Error_Handler(void);

void broadcastVoltage(void);
/* USER CODE END PFP */

/* USER CODE BEGIN 0 */
uint32_t lastTime = 0;
void broadcastVoltage() {

	int lastTimeIndex = voltageStruct.bufferLength - (SINGLE_PACKET_LENGTH - 1);
	if (voltageStruct.bufferFirstHalf[lastTimeIndex] > lastTime) {

		/*##-2- Start the Full Duplex Communication process ########################*/
		if (HAL_SPI_Transmit_DMA(&hspi2,
				(uint8_t*) voltageStruct.bufferFirstHalf,
				(size_t) (sizeof(uint32_t) * voltageStruct.bufferLength))
				!= HAL_OK) {
			/* Transfer error in transmission process */
			Error_Handler();
		}

		/*##-3- Wait for the end of the transfer ###################################*/
		while (HAL_SPI_GetState(&hspi2) != HAL_SPI_STATE_READY) {
		}

		lastTime = voltageStruct.bufferFirstHalf[lastTimeIndex];

	}
	if (voltageStruct.bufferLastHalf[lastTimeIndex] > lastTime) {

		if (HAL_SPI_Transmit_DMA(&hspi2,
				(uint8_t*) voltageStruct.bufferLastHalf,
				(size_t) (sizeof(uint32_t) * voltageStruct.bufferLength))
				!= HAL_OK) {
			/* Transfer error in transmission process */
			Error_Handler();
		}

		/*##-3- Wait for the end of the transfer ###################################*/
		while (HAL_SPI_GetState(&hspi2) != HAL_SPI_STATE_READY) {
		}

		lastTime = voltageStruct.bufferLastHalf[lastTimeIndex];

	}

}

/* USER CODE END 0 */

int main(void)
{

  /* USER CODE BEGIN 1 */
	voltageStruct.packetHeader = 0x0000AA55;
	voltageStruct.bufferFirstHalf = bufferFirst;
	voltageStruct.bufferLastHalf = bufferLast;
	voltageStruct.bufferLength = ETHERNET_BUFFER_LENGTH;
  /* USER CODE END 1 */

  /* MCU Configuration----------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* Configure the system clock */
  SystemClock_Config();

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_ADC1_Init();
  MX_ADC2_Init();
  MX_DAC_Init();
  MX_I2C1_Init();
  MX_SPI2_Init();
  MX_TIM6_Init();

  /* USER CODE BEGIN 2 */
	/* Configure LED3, LED4, LED5 and LED6 */
	BSP_LED_Init(LED3);
	BSP_LED_Init(LED4);
	BSP_LED_Init(LED5);
	BSP_LED_Init(LED6);

	/*##-2- Enable TIM peripheral counter ######################################*/
	HAL_TIM_Base_Start(&htim6);

	/*## Enable peripherals ####################################################*/

	/* Enable ADC slave */
	if (HAL_ADC_Start(&hadc2) != HAL_OK) {
		/* Start Error */
		Error_Handler();
	}

	/*## Start ADC conversions #################################################*/

	/* Start ADCx and ADCy multimode conversion with interruption */
	if (HAL_ADCEx_MultiModeStart_DMA(&hadc1,
			(uint32_t *) &aADCDualConvertedValue, VOLTAGE_BUFFER_LENGTH)
			!= HAL_OK) {
		/* Start Error */
		Error_Handler();
	}

	DAC_Ch2_SinConfig();

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
	while (1) {
  /* USER CODE END WHILE */

  /* USER CODE BEGIN 3 */
		broadcastVoltage();

	}
  /* USER CODE END 3 */

}

/** System Clock Configuration
*/
void SystemClock_Config(void)
{

  RCC_OscInitTypeDef RCC_OscInitStruct;
  RCC_ClkInitTypeDef RCC_ClkInitStruct;

  __PWR_CLK_ENABLE();

  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 8;
  RCC_OscInitStruct.PLL.PLLN = 336;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 4;
  HAL_RCC_OscConfig(&RCC_OscInitStruct);

  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_SYSCLK|RCC_CLOCKTYPE_PCLK1
                              |RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;
  HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_5);

  HAL_SYSTICK_Config(HAL_RCC_GetHCLKFreq()/1000);

  HAL_SYSTICK_CLKSourceConfig(SYSTICK_CLKSOURCE_HCLK);

  /* SysTick_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(SysTick_IRQn, 0, 0);
}

/* ADC1 init function */
void MX_ADC1_Init(void)
{

  ADC_MultiModeTypeDef multimode;
  ADC_ChannelConfTypeDef sConfig;

    /**Configure the global features of the ADC (Clock, Resolution, Data Alignment and number of conversion) 
    */
  hadc1.Instance = ADC1;
  hadc1.Init.ClockPrescaler = ADC_CLOCKPRESCALER_PCLK_DIV4;
  hadc1.Init.Resolution = ADC_RESOLUTION12b;
  hadc1.Init.ScanConvMode = DISABLE;
  hadc1.Init.ContinuousConvMode = ENABLE;
  hadc1.Init.DiscontinuousConvMode = DISABLE;
  hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_NONE;
  hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc1.Init.NbrOfConversion = 1;
  hadc1.Init.DMAContinuousRequests = ENABLE;
  hadc1.Init.EOCSelection = EOC_SINGLE_CONV;
  HAL_ADC_Init(&hadc1);

    /**Configure the ADC multi-mode 
    */
  multimode.Mode = ADC_DUALMODE_REGSIMULT;
  multimode.DMAAccessMode = ADC_DMAACCESSMODE_2;
  multimode.TwoSamplingDelay = ADC_TWOSAMPLINGDELAY_5CYCLES;
  HAL_ADCEx_MultiModeConfigChannel(&hadc1, &multimode);

    /**Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
    */
  sConfig.Channel = ADC_CHANNEL_1;
  sConfig.Rank = 1;
  sConfig.SamplingTime = ADC_SAMPLETIME_3CYCLES;
  HAL_ADC_ConfigChannel(&hadc1, &sConfig);

}

/* ADC2 init function */
void MX_ADC2_Init(void)
{

  ADC_MultiModeTypeDef multimode;
  ADC_ChannelConfTypeDef sConfig;

    /**Configure the global features of the ADC (Clock, Resolution, Data Alignment and number of conversion) 
    */
  hadc2.Instance = ADC2;
  hadc2.Init.ClockPrescaler = ADC_CLOCKPRESCALER_PCLK_DIV4;
  hadc2.Init.Resolution = ADC_RESOLUTION12b;
  hadc2.Init.ScanConvMode = DISABLE;
  hadc2.Init.ContinuousConvMode = ENABLE;
  hadc2.Init.DiscontinuousConvMode = DISABLE;
  hadc2.Init.DataAlign = ADC_DATAALIGN_RIGHT;
  hadc2.Init.NbrOfConversion = 1;
  hadc2.Init.DMAContinuousRequests = ENABLE;
  hadc2.Init.EOCSelection = EOC_SINGLE_CONV;
  HAL_ADC_Init(&hadc2);

    /**Configure the ADC multi-mode 
    */
  multimode.Mode = ADC_DUALMODE_REGSIMULT;
  multimode.DMAAccessMode = ADC_DMAACCESSMODE_2;
  multimode.TwoSamplingDelay = ADC_TWOSAMPLINGDELAY_5CYCLES;
  HAL_ADCEx_MultiModeConfigChannel(&hadc2, &multimode);

    /**Configure for the selected ADC regular channel its corresponding rank in the sequencer and its sample time. 
    */
  sConfig.Channel = ADC_CHANNEL_2;
  sConfig.Rank = 1;
  sConfig.SamplingTime = ADC_SAMPLETIME_3CYCLES;
  HAL_ADC_ConfigChannel(&hadc2, &sConfig);

}

/* DAC init function */
void MX_DAC_Init(void)
{

  DAC_ChannelConfTypeDef sConfig;

    /**DAC Initialization 
    */
  hdac.Instance = DAC;
  HAL_DAC_Init(&hdac);

    /**DAC channel OUT2 config 
    */
  sConfig.DAC_Trigger = DAC_TRIGGER_T6_TRGO;
  sConfig.DAC_OutputBuffer = DAC_OUTPUTBUFFER_ENABLE;
  HAL_DAC_ConfigChannel(&hdac, &sConfig, DAC_CHANNEL_2);

}

/* I2C1 init function */
void MX_I2C1_Init(void)
{

  hi2c1.Instance = I2C1;
  hi2c1.Init.ClockSpeed = 100000;
  hi2c1.Init.DutyCycle = I2C_DUTYCYCLE_2;
  hi2c1.Init.OwnAddress1 = 0;
  hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLED;
  hi2c1.Init.OwnAddress2 = 0;
  hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLED;
  hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLED;
  HAL_I2C_Init(&hi2c1);

}

/* SPI2 init function */
void MX_SPI2_Init(void)
{

  hspi2.Instance = SPI2;
  hspi2.Init.Mode = SPI_MODE_MASTER;
  hspi2.Init.Direction = SPI_DIRECTION_2LINES;
  hspi2.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi2.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi2.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi2.Init.NSS = SPI_NSS_HARD_OUTPUT;
  hspi2.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_2;
  hspi2.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi2.Init.TIMode = SPI_TIMODE_DISABLED;
  hspi2.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLED;
  hspi2.Init.CRCPolynomial = 10;
  HAL_SPI_Init(&hspi2);

}

/* TIM6 init function */
void MX_TIM6_Init(void)
{

  TIM_MasterConfigTypeDef sMasterConfig;

  htim6.Instance = TIM6;
  htim6.Init.Prescaler = 0;
  htim6.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim6.Init.Period = 0xFFF;
  HAL_TIM_Base_Init(&htim6);

  sMasterConfig.MasterOutputTrigger = TIM_TRGO_UPDATE;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  HAL_TIMEx_MasterConfigSynchronization(&htim6, &sMasterConfig);

}

/** 
  * Enable DMA controller clock
  */
void MX_DMA_Init(void) 
{
  /* DMA controller clock enable */
  __DMA1_CLK_ENABLE();
  __DMA2_CLK_ENABLE();

  /* DMA interrupt init */
  HAL_NVIC_SetPriority(DMA1_Stream3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream3_IRQn);
  HAL_NVIC_SetPriority(DMA1_Stream4_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream4_IRQn);
  HAL_NVIC_SetPriority(DMA1_Stream6_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Stream6_IRQn);
  HAL_NVIC_SetPriority(DMA2_Stream0_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA2_Stream0_IRQn);

}

/** Configure pins as 
        * Analog 
        * Input 
        * Output
        * EVENT_OUT
        * EXTI
*/
void MX_GPIO_Init(void)
{

  GPIO_InitTypeDef GPIO_InitStruct;

  /* GPIO Ports Clock Enable */
  __GPIOH_CLK_ENABLE();
  __GPIOA_CLK_ENABLE();
  __GPIOB_CLK_ENABLE();
  __GPIOD_CLK_ENABLE();

  /*Configure GPIO pins : PD12 PD13 PD14 PD15 */
  GPIO_InitStruct.Pin = GPIO_PIN_12|GPIO_PIN_13|GPIO_PIN_14|GPIO_PIN_15;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_LOW;
  HAL_GPIO_Init(GPIOD, &GPIO_InitStruct);

}

/* USER CODE BEGIN 4 */

/**
 * @brief  This function is executed in case of error occurrence.
 * @param  None
 * @retval None
 */
static void Error_Handler(void) {
	/* Turn LED5 on */
	BSP_LED_On(LED5);
	while (1) {
	}
}

int i, firstHalfBufferIsActive = 1;
uint32_t tick = 0;
/**
 * @brief  Conversion complete callback in non blocking mode
 * @param  AdcHandle : AdcHandle handle
 * @note   This example shows a simple way to report end of conversion, and
 *         you can add your own implementation.
 * @retval None
 */
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* AdcHandle) {
	int startIndex = VOLTAGE_BUFFER_LENGTH / 2;
	int endIndex = VOLTAGE_BUFFER_LENGTH;
	processAdcPacket(startIndex, endIndex);
}

void HAL_ADC_ConvHalfCpltCallback(ADC_HandleTypeDef* AdcHandle) {
	int startIndex = 0;
	int endIndex = VOLTAGE_BUFFER_LENGTH / 2;
	processAdcPacket(startIndex, endIndex);
}

void processAdcPacket(uint32_t startIndex, uint32_t endIndex) {
	uint32_t j, masterConvertedValue = 0, slaveConvertedValue = 0;

	for (j = startIndex; j < endIndex; j++) {
		masterConvertedValue += aADCDualConvertedValue[j] & 0xFFFF;
		slaveConvertedValue += aADCDualConvertedValue[j] >> 16;
	}

	if (firstHalfBufferIsActive) {
		voltageStruct.bufferFirstHalf[i] = voltageStruct.packetHeader;
		voltageStruct.bufferFirstHalf[i + 1] = tick;
		voltageStruct.bufferFirstHalf[i + 2] = masterConvertedValue
				/ (VOLTAGE_BUFFER_LENGTH / 2);
		voltageStruct.bufferFirstHalf[i + 3] = slaveConvertedValue
				/ (VOLTAGE_BUFFER_LENGTH / 2);
	} else {
		voltageStruct.bufferLastHalf[i] = voltageStruct.packetHeader;
		voltageStruct.bufferLastHalf[i + 1] = tick;
		voltageStruct.bufferLastHalf[i + 2] = masterConvertedValue
				/ (VOLTAGE_BUFFER_LENGTH / 2);
		voltageStruct.bufferLastHalf[i + 3] = slaveConvertedValue
				/ (VOLTAGE_BUFFER_LENGTH / 2);
	}
	tick += 1;

	if (i < ETHERNET_BUFFER_LENGTH - SINGLE_PACKET_LENGTH) {
		i += SINGLE_PACKET_LENGTH;
	} else {
		i = 0;
		firstHalfBufferIsActive = !firstHalfBufferIsActive;
	}

}

/**
 * @brief  Error DAC callback for Channel1.
 * @param  hdac: pointer to a DAC_HandleTypeDef structure that contains
 *         the configuration information for the specified DAC.
 * @retval None
 */
void HAL_DAC_ErrorCallbackCh2(DAC_HandleTypeDef *hdac) {
	Error_Handler();
}

/**
 * @brief  DMA underrun DAC callback for channel1.
 * @param  hdac: pointer to a DAC_HandleTypeDef structure that contains
 *         the configuration information for the specified DAC.
 * @retval None
 */
void HAL_DAC_DMAUnderrunCallbackCh2(DAC_HandleTypeDef *hdac) {
	Error_Handler();
}

#define PERIOD 2520
static void DAC_Ch2_SinConfig(void) {

	float32_t phase, sin, cos;

	uint16_t waveformValue;

	int i;
	for (i = 0; i < sinBufferSize; i++) {
		phase = ((float32_t) i) * 2. * 3.14 / ((float32_t) sinBufferSize);
		sin = arm_sin_f32(phase * 10.0);
		cos = arm_cos_f32(phase);

		waveformValue = 4095. * (2. + .3 * sin + cos) / 4.;
		sinBuffer[i] = waveformValue;
	}

	/*##-2- Enable DAC selected channel and associated DMA #############################*/
	if (HAL_DAC_Start_DMA(&hdac, DAC_CHANNEL_2, (uint32_t *) sinBuffer,
			(size_t) sinBufferSize, DAC_ALIGN_12B_R) != HAL_OK) {
		/* Start DMA Error */
		Error_Handler();
	}
}

/* @brief TxRx Transfer completed callback.
 * @param hspi: SPI handle.
 * @note This example shows a simple way to report end of DMA TxRx transfer, and
 * you can add your own implementation.
 * @retval None
 */
void HAL_SPI_TxRxCpltCallback(SPI_HandleTypeDef *hspi) {
	/* Turn LED4 on: Transfer in transmission process is correct */
//	BSP_LED_On(LED4);
	/* Turn LED6 on: Transfer in reception process is correct */
//	BSP_LED_On(LED6);
}

/**
 * @brief  SPI error callbacks.
 * @param  hspi: SPI handle
 * @note   This example shows a simple way to report transfer error, and you can
 *         add your own implementation.
 * @retval None
 */
void HAL_SPI_ErrorCallback(SPI_HandleTypeDef *hspi) {
	/* Turn LED5 on: Transfer error in reception/transmission process */
	BSP_LED_On(LED5);
}

/* USER CODE END 4 */

#ifdef USE_FULL_ASSERT

/**
   * @brief Reports the name of the source file and the source line number
   * where the assert_param error has occurred.
   * @param file: pointer to the source file name
   * @param line: assert_param error line source number
   * @retval None
   */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
	/* User can add his own implementation to report the file name and line number,
	 ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */

}

#endif

/**
  * @}
  */ 

/**
  * @}
*/ 

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
