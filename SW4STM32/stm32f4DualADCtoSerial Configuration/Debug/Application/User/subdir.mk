################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Src/main.c \
C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery/stm32f4_discovery.c \
C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c \
C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Src/stm32f4xx_hal_msp.c \
C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c \
C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Src/stm32f4xx_it.c 

OBJS += \
./Application/User/main.o \
./Application/User/stm32f4_discovery.o \
./Application/User/stm32f4xx_hal_i2c.o \
./Application/User/stm32f4xx_hal_msp.o \
./Application/User/stm32f4xx_hal_spi.o \
./Application/User/stm32f4xx_it.o 

C_DEPS += \
./Application/User/main.d \
./Application/User/stm32f4_discovery.d \
./Application/User/stm32f4xx_hal_i2c.d \
./Application/User/stm32f4xx_hal_msp.d \
./Application/User/stm32f4xx_hal_spi.d \
./Application/User/stm32f4xx_it.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/main.o: C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Src/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/main.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4_discovery.o: C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery/stm32f4_discovery.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4_discovery.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_hal_i2c.o: C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4xx_hal_i2c.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_hal_msp.o: C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Src/stm32f4xx_hal_msp.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4xx_hal_msp.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_hal_spi.o: C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4xx_hal_spi.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_it.o: C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Src/stm32f4xx_it.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4xx_it.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


