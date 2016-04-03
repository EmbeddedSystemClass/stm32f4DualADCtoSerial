/*
 * main.h
 *
 *  Created on: Mar 5, 2016
 *      Author: scott
 */

#ifndef APPLICATION_USER_MAIN_H_
#define APPLICATION_USER_MAIN_H_

/**
 * @brief Voltage and time buffer
 */
typedef struct {

	uint32_t packetHeader;

	uint32_t * bufferFirstHalf;
	uint32_t * bufferLastHalf;
	uint32_t bufferLength;

} VoltageStruct;

/* Exported constants --------------------------------------------------------*/
#define VOLTAGE_BUFFER_LENGTH 128
#define SINGLE_PACKET_LENGTH 4
#define PACKETS_PER_FRAME 250
#define ETHERNET_BUFFER_LENGTH SINGLE_PACKET_LENGTH * PACKETS_PER_FRAME
/* Exported macro ------------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
#define COUNTOF(__BUFFER__)   (sizeof(__BUFFER__) / sizeof(*(__BUFFER__)))

/* Size of buffer */
#define BUFFERSIZE                       (COUNTOF(aTxBuffer) - 1)

/* Exported functions ------------------------------------------------------- */

//void http_server_socket_init(void);
extern VoltageStruct voltageStruct;
void voltage_server_socket();
uint32_t * getVoltagePacket();
void broadcastVoltageAll();

#endif /* APPLICATION_USER_MAIN_H_ */
