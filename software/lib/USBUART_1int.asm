;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME: USBUART_1Int.asm
;;  Version: 1.0, Updated on 2007/03/12 at 16:28:10
;;  Generated by PSoC Designer ver 4.4  b1884 : 14 Jan, 2007
;;
;;  DESCRIPTION: USBFS User Module software implementation file
;;               for the CY8C24090 and CY7C64215 PSoC family of devices
;;
;;  NOTE: User Module APIs conform to the fastcall16 convention for marshalling
;;        arguments and observe the associated "Registers are volatile" policy.
;;        This means it is the caller's responsibility to preserve any values
;;        in the X and A registers that are still needed after the API functions
;;        returns. For Large Memory Model devices it is also the caller's 
;;        responsibility to preserve any value in the CUR_PP, IDX_PP, MVR_PP and 
;;        MVW_PP registers. Even though some of these registers may not be modified
;;        now, there is no guarantee that will remain the case in future releases.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2006. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "m8c.inc"
include "memory.inc"
include "USBUART_1.inc"

;-----------------------------------------------
; include instance specific register definitions
;-----------------------------------------------

;-----------------------------------------------
;  Global Symbols
;-----------------------------------------------
;-------------------------------------------------------------------
;  Declare the functions global for both assembler and C compiler.
;
;  Note that there are two names for each API. First name is
;  assembler reference. Name with underscore is name reference for
;  C compiler.  Calling function in C source code does not require
;  the underscore.
;-------------------------------------------------------------------

export    USBUART_1_EP1_ISR
export   _USBUART_1_EP1_ISR
export    USBUART_1_EP2_ISR
export   _USBUART_1_EP2_ISR
export    USBUART_1_EP3_ISR
export   _USBUART_1_EP3_ISR
export    USBUART_1_EP4_ISR
export   _USBUART_1_EP4_ISR
export    USBUART_1_RESET_ISR
export   _USBUART_1_RESET_ISR
export    USBUART_1_SOF_ISR
export   _USBUART_1_SOF_ISR
export    USBUART_1_WAKEUP_ISR
export   _USBUART_1_WAKEUP_ISR


AREA InterruptRAM (RAM, REL, CON)
;@PSoC_UserCode_INIT@ (Do not change this line.)
;---------------------------------------------------
; Insert your custom declarations below this banner
;---------------------------------------------------

;------------------------
; Includes
;------------------------

	
;------------------------
;  Constant Definitions
;------------------------


;------------------------
; Variable Allocation
;------------------------


;---------------------------------------------------
; Insert your custom declarations above this banner
;---------------------------------------------------
;@PSoC_UserCode_END@ (Do not change this line.)

AREA text (ROM, REL)


 USBUART_1_EP1_ISR:
_USBUART_1_EP1_ISR:

   mov  [USBUART_1_EndpointAPIStatus + 1], EVENT_PENDING    
   ;@PSoC_UserCode_BODY_1@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.

   ;---------------------------------------------------
   ; Insert your custom code above this banner
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   reti

 USBUART_1_EP2_ISR:
_USBUART_1_EP2_ISR:

   mov  [USBUART_1_EndpointAPIStatus + 2], EVENT_PENDING    
   ;@PSoC_UserCode_BODY_2@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.

   ;---------------------------------------------------
   ; Insert your custom code above this banner
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   reti

 USBUART_1_EP3_ISR:
_USBUART_1_EP3_ISR:

   mov  [USBUART_1_EndpointAPIStatus + 3], EVENT_PENDING    
   ;@PSoC_UserCode_BODY_3@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.

   ;---------------------------------------------------
   ; Insert your custom code above this banner
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   reti

 USBUART_1_EP4_ISR:
_USBUART_1_EP4_ISR:

   mov  [USBUART_1_EndpointAPIStatus + 4], EVENT_PENDING    
   ;@PSoC_UserCode_BODY_4@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.

   ;---------------------------------------------------
   ; Insert your custom code above this banner
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   reti

 USBUART_1_RESET_ISR:
_USBUART_1_RESET_ISR:
   push    X
   mov     [USBUART_1_Configuration], 0
   mov     [USBUART_1_DeviceStatus], 0
   mov     [USBUART_1_InterfaceSetting], 0
   mov     [USBUART_1_EndpointStatus], 0
   mov     [USBUART_1_TransferType], 0
   mov     [USBUART_1_fDataPending], 0
   mov     reg[USBUART_1_EP0MODE], USB_MODE_STALL_IN_OUT ; ACK Setup/Stall IN/OUT
   mov     reg[USBUART_1_EP1MODE], 0
   mov     reg[USBUART_1_EP2MODE], 0
   mov     reg[USBUART_1_EP3MODE], 0
   mov     reg[USBUART_1_EP4MODE], 0
   mov     X, USB_MAX_EP_NUMBER        ; Set up loop to clear all of the endpoint data items
.loop:
   mov     [X + USBUART_1_EPDataToggle], 0  ; Or in the toggle
   dec     X                           ; Are we done?
   jnz     .loop                       ; Jump to do another endpoint    

   mov     reg[USBUART_1_ADDR], USB_ADDR_ENABLE ; Enable Address 0

   ;@PSoC_UserCode_BODY_5@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.

   ;---------------------------------------------------
   ; Insert your custom code above this banner
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)
   pop X
   reti

 USBUART_1_SOF_ISR:
_USBUART_1_SOF_ISR:

   ;@PSoC_UserCode_BODY_6@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.

   ;---------------------------------------------------
   ; Insert your custom code above this banner
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   reti

 USBUART_1_WAKEUP_ISR:
_USBUART_1_WAKEUP_ISR:

   ;@PSoC_UserCode_BODY_7@ (Do not change this line.)
   ;---------------------------------------------------
   ; Insert your custom code below this banner
   ;---------------------------------------------------
   ;   NOTE: interrupt service routines must preserve
   ;   the values of the A and X CPU registers.

   ;---------------------------------------------------
   ; Insert your custom code above this banner
   ;---------------------------------------------------
   ;@PSoC_UserCode_END@ (Do not change this line.)

   reti

; End of File USBUART_1.asm