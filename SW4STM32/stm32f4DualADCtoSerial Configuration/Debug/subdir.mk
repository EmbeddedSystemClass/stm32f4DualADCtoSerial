################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c 

OBJS += \
./stm32f4xx_hal_tim.o 

C_DEPS += \
./stm32f4xx_hal_tim.d 


# Each subdirectory must supply rules for building sources it contributes
stm32f4xx_hal_tim.o: C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__FPU_PRESENT -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -DARM_MATH_CM4 -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"stm32f4xx_hal_tim.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


