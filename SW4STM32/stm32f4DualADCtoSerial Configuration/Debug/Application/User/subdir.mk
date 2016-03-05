################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.c \
C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_f32.c \
C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_f32.c \
C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Src/main.c \
C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery/stm32f4_discovery.c \
C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c \
C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Src/stm32f4xx_hal_msp.c \
C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c \
C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c \
C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Src/stm32f4xx_it.c 

OBJS += \
./Application/User/arm_common_tables.o \
./Application/User/arm_cos_f32.o \
./Application/User/arm_sin_f32.o \
./Application/User/main.o \
./Application/User/stm32f4_discovery.o \
./Application/User/stm32f4xx_hal_i2c.o \
./Application/User/stm32f4xx_hal_msp.o \
./Application/User/stm32f4xx_hal_spi.o \
./Application/User/stm32f4xx_hal_tim_ex.o \
./Application/User/stm32f4xx_it.o 

C_DEPS += \
./Application/User/arm_common_tables.d \
./Application/User/arm_cos_f32.d \
./Application/User/arm_sin_f32.d \
./Application/User/main.d \
./Application/User/stm32f4_discovery.d \
./Application/User/stm32f4xx_hal_i2c.d \
./Application/User/stm32f4xx_hal_msp.d \
./Application/User/stm32f4xx_hal_spi.d \
./Application/User/stm32f4xx_hal_tim_ex.d \
./Application/User/stm32f4xx_it.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/arm_common_tables.o: C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/CMSIS/DSP_Lib/Source/CommonTables/arm_common_tables.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__FPU_PRESENT -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -DARM_MATH_CM4 -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/arm_common_tables.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/arm_cos_f32.o: C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_cos_f32.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__FPU_PRESENT -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -DARM_MATH_CM4 -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/arm_cos_f32.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/arm_sin_f32.o: C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/CMSIS/DSP_Lib/Source/FastMathFunctions/arm_sin_f32.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__FPU_PRESENT -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -DARM_MATH_CM4 -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/arm_sin_f32.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/main.o: C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Src/main.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__FPU_PRESENT -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -DARM_MATH_CM4 -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/main.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4_discovery.o: C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery/stm32f4_discovery.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__FPU_PRESENT -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -DARM_MATH_CM4 -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4_discovery.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_hal_i2c.o: C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_i2c.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__FPU_PRESENT -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -DARM_MATH_CM4 -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4xx_hal_i2c.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_hal_msp.o: C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Src/stm32f4xx_hal_msp.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__FPU_PRESENT -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -DARM_MATH_CM4 -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4xx_hal_msp.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_hal_spi.o: C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_spi.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__FPU_PRESENT -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -DARM_MATH_CM4 -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4xx_hal_spi.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_hal_tim_ex.o: C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_tim_ex.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__FPU_PRESENT -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -DARM_MATH_CM4 -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4xx_hal_tim_ex.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Application/User/stm32f4xx_it.o: C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Src/stm32f4xx_it.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo %cd%
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -D__weak="__attribute__((weak))" -D__FPU_PRESENT -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32F407xx -DARM_MATH_CM4 -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Inc" -I"C:/Users/scott/STM32Cube/Repository/STM32Cube_FW_F4_V1.10.0/Drivers/BSP/STM32F4-Discovery" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/STM32F4xx_HAL_Driver/Inc/Legacy" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Include" -I"C:/Users/scott/repos/code/openstm/stm32f4DualADCtoSerial/Drivers/CMSIS/Device/ST/STM32F4xx/Include"  -Os -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"Application/User/stm32f4xx_it.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


