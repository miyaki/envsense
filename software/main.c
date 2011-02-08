//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

BYTE Len;
BYTE pData[32];
INT tempData;
INT co2Data;
BYTE iFlag;

#pragma interrupt_handler INT_Timer8_1

extern void printf(const unsigned char *string, ...);
extern void shtmain(void);

void print_chr(unsigned char c)
{
    while(!USBUART_1_bTxIsReady());
    USBUART_1_Write(&c, 1);
}

void INT_Timer8_1(void)
{
    iFlag = 1;
}

void init()
{
    M8C_EnableGInt;
    USBUART_1_Start(USBUART_1_5V_OPERATION);
    while(!USBUART_1_Init());

    ADCINC_1_Start(ADCINC_1_LOWPOWER);
    ADCINC_1_GetSamples(0);

    PGA_1_Start(PGA_1_LOWPOWER);

    Timer8_1_EnableInt();
    Timer8_1_Start();

    AMUX0_Start();

    tempData = 0;
    co2Data = 0;

    PRT1DR=0x08; // status LED on
}


void main()
{
    init();

    while(1) {
        Len = USBUART_1_bGetRxCount();

        //if(Len) {
        if(iFlag == 1) {
            USBUART_1_ReadAll(pData);

            printf("T: %d, CO2: %d\r\n", tempData, co2Data);
            //printf("CO2: %d\r\n", co2Data);
            iFlag = 0;
            //printf("This %s a %cest\n","is",'T');	// %s, %c‚àŽg‚¦‚Ü‚·
            //printf("%02xH:%03dD:%05bB",0xd,0xd,0xd);	// Œ…Žw’è‚à—LŒø
            shtmain();
        }

        AMUX0_InputSelect(AMUX0_PORT0_5);
        while(ADCINC_1_fIsDataAvailable() == 0);
        ADCINC_1_iClearFlagGetData();
        tempData = ADCINC_1_iGetData();
        tempData *= 1.22; // 1.22 = 5000/4096

        AMUX0_InputSelect(AMUX0_PORT0_7);
        while(ADCINC_1_fIsDataAvailable() == 0);
        ADCINC_1_iClearFlagGetData();
        co2Data = ADCINC_1_iGetData();
        co2Data *= 1.22; // 1.22 = 5000/4096
    }
}
