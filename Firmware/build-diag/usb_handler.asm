;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.6.0 #16555 (Mac OS X ppc)
;--------------------------------------------------------
	.module usb_handler
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _USB_EP0_OUT
	.globl _USB_EP0_IN
	.globl _USB_EP0_SETUP
	.globl _USB_EP0_copyDescr
	.globl _CMD_EP2_OUT
	.globl _HID_EP1_IN
	.globl _HID_reset
	.globl _HID_setup
	.globl _UIF_BUS_RST
	.globl _UIF_DETECT
	.globl _UIF_TRANSFER
	.globl _UIF_SUSPEND
	.globl _UIF_HST_SOF
	.globl _UIF_FIFO_OV
	.globl _U_SIE_FREE
	.globl _U_TOG_OK
	.globl _U_IS_NAK
	.globl _ADC_CHAN0
	.globl _ADC_CHAN1
	.globl _CMP_CHAN
	.globl _ADC_START
	.globl _ADC_IF
	.globl _CMP_IF
	.globl _CMPO
	.globl _U1RI
	.globl _U1TI
	.globl _U1RB8
	.globl _U1TB8
	.globl _U1REN
	.globl _U1SMOD
	.globl _U1SM0
	.globl _S0_R_FIFO
	.globl _S0_T_FIFO
	.globl _S0_FREE
	.globl _S0_IF_BYTE
	.globl _S0_IF_FIRST
	.globl _S0_IF_OV
	.globl _S0_FST_ACT
	.globl _CP_RL2
	.globl _C_T2
	.globl _TR2
	.globl _EXEN2
	.globl _TCLK
	.globl _RCLK
	.globl _EXF2
	.globl _CAP1F
	.globl _TF2
	.globl _RI
	.globl _TI
	.globl _RB8
	.globl _TB8
	.globl _REN
	.globl _SM2
	.globl _SM1
	.globl _SM0
	.globl _IT0
	.globl _IE0
	.globl _IT1
	.globl _IE1
	.globl _TR0
	.globl _TF0
	.globl _TR1
	.globl _TF1
	.globl _RXD
	.globl _PWM1_
	.globl _TXD
	.globl _PWM2_
	.globl _AIN3
	.globl _VBUS1
	.globl _INT0
	.globl _TXD1_
	.globl _INT1
	.globl _T0
	.globl _RXD1_
	.globl _PWM2
	.globl _T1
	.globl _UDP
	.globl _UDM
	.globl _TIN0
	.globl _CAP1
	.globl _T2
	.globl _AIN0
	.globl _VBUS2
	.globl _TIN1
	.globl _CAP2
	.globl _T2EX
	.globl _RXD_
	.globl _TXD_
	.globl _AIN1
	.globl _UCC1
	.globl _TIN2
	.globl _SCS
	.globl _CAP1_
	.globl _T2_
	.globl _AIN2
	.globl _UCC2
	.globl _TIN3
	.globl _PWM1
	.globl _MOSI
	.globl _TIN4
	.globl _RXD1
	.globl _MISO
	.globl _TIN5
	.globl _TXD1
	.globl _SCK
	.globl _IE_SPI0
	.globl _IE_TKEY
	.globl _IE_USB
	.globl _IE_ADC
	.globl _IE_UART1
	.globl _IE_PWMX
	.globl _IE_GPIO
	.globl _IE_WDOG
	.globl _PX0
	.globl _PT0
	.globl _PX1
	.globl _PT1
	.globl _PS
	.globl _PT2
	.globl _PL_FLAG
	.globl _PH_FLAG
	.globl _EX0
	.globl _ET0
	.globl _EX1
	.globl _ET1
	.globl _ES
	.globl _ET2
	.globl _E_DIS
	.globl _EA
	.globl _P
	.globl _F1
	.globl _OV
	.globl _RS0
	.globl _RS1
	.globl _F0
	.globl _AC
	.globl _CY
	.globl _UEP1_DMA_H
	.globl _UEP1_DMA_L
	.globl _UEP1_DMA
	.globl _UEP0_DMA_H
	.globl _UEP0_DMA_L
	.globl _UEP0_DMA
	.globl _UEP2_3_MOD
	.globl _UEP4_1_MOD
	.globl _UEP3_DMA_H
	.globl _UEP3_DMA_L
	.globl _UEP3_DMA
	.globl _UEP2_DMA_H
	.globl _UEP2_DMA_L
	.globl _UEP2_DMA
	.globl _USB_DEV_AD
	.globl _USB_CTRL
	.globl _USB_INT_EN
	.globl _UEP4_T_LEN
	.globl _UEP4_CTRL
	.globl _UEP0_T_LEN
	.globl _UEP0_CTRL
	.globl _USB_RX_LEN
	.globl _USB_MIS_ST
	.globl _USB_INT_ST
	.globl _USB_INT_FG
	.globl _UEP3_T_LEN
	.globl _UEP3_CTRL
	.globl _UEP2_T_LEN
	.globl _UEP2_CTRL
	.globl _UEP1_T_LEN
	.globl _UEP1_CTRL
	.globl _UDEV_CTRL
	.globl _USB_C_CTRL
	.globl _TKEY_DATH
	.globl _TKEY_DATL
	.globl _TKEY_DAT
	.globl _TKEY_CTRL
	.globl _ADC_DATA
	.globl _ADC_CFG
	.globl _ADC_CTRL
	.globl _SBAUD1
	.globl _SBUF1
	.globl _SCON1
	.globl _SPI0_SETUP
	.globl _SPI0_CK_SE
	.globl _SPI0_CTRL
	.globl _SPI0_DATA
	.globl _SPI0_STAT
	.globl _PWM_CK_SE
	.globl _PWM_CTRL
	.globl _PWM_DATA1
	.globl _PWM_DATA2
	.globl _T2CAP1H
	.globl _T2CAP1L
	.globl _T2CAP1
	.globl _TH2
	.globl _TL2
	.globl _T2COUNT
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _RCAP2
	.globl _T2MOD
	.globl _T2CON
	.globl _SBUF
	.globl _SCON
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _XBUS_AUX
	.globl _PIN_FUNC
	.globl _P3_DIR_PU
	.globl _P3_MOD_OC
	.globl _P3
	.globl _P2
	.globl _P1_DIR_PU
	.globl _P1_MOD_OC
	.globl _P1
	.globl _ROM_CTRL
	.globl _ROM_DATA_H
	.globl _ROM_DATA_L
	.globl _ROM_DATA
	.globl _ROM_ADDR_H
	.globl _ROM_ADDR_L
	.globl _ROM_ADDR
	.globl _GPIO_IE
	.globl _IP_EX
	.globl _IE_EX
	.globl _IP
	.globl _IE
	.globl _WDOG_COUNT
	.globl _RESET_KEEP
	.globl _WAKE_CTRL
	.globl _CLOCK_CFG
	.globl _PCON
	.globl _GLOBAL_CFG
	.globl _SAFE_MOD
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _EP2_buffer
	.globl _EP1_buffer
	.globl _EP0_buffer
	.globl _pDescr
	.globl _UsbConfig
	.globl _SetupReq
	.globl _SetupLen
	.globl _USB_interrupt
	.globl _USB_init
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_SAFE_MOD	=	0x00a1
_GLOBAL_CFG	=	0x00b1
_PCON	=	0x0087
_CLOCK_CFG	=	0x00b9
_WAKE_CTRL	=	0x00a9
_RESET_KEEP	=	0x00fe
_WDOG_COUNT	=	0x00ff
_IE	=	0x00a8
_IP	=	0x00b8
_IE_EX	=	0x00e8
_IP_EX	=	0x00e9
_GPIO_IE	=	0x00c7
_ROM_ADDR	=	0x8584
_ROM_ADDR_L	=	0x0084
_ROM_ADDR_H	=	0x0085
_ROM_DATA	=	0x8f8e
_ROM_DATA_L	=	0x008e
_ROM_DATA_H	=	0x008f
_ROM_CTRL	=	0x0086
_P1	=	0x0090
_P1_MOD_OC	=	0x0092
_P1_DIR_PU	=	0x0093
_P2	=	0x00a0
_P3	=	0x00b0
_P3_MOD_OC	=	0x0096
_P3_DIR_PU	=	0x0097
_PIN_FUNC	=	0x00c6
_XBUS_AUX	=	0x00a2
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_SCON	=	0x0098
_SBUF	=	0x0099
_T2CON	=	0x00c8
_T2MOD	=	0x00c9
_RCAP2	=	0xcbca
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_T2COUNT	=	0xcdcc
_TL2	=	0x00cc
_TH2	=	0x00cd
_T2CAP1	=	0xcfce
_T2CAP1L	=	0x00ce
_T2CAP1H	=	0x00cf
_PWM_DATA2	=	0x009b
_PWM_DATA1	=	0x009c
_PWM_CTRL	=	0x009d
_PWM_CK_SE	=	0x009e
_SPI0_STAT	=	0x00f8
_SPI0_DATA	=	0x00f9
_SPI0_CTRL	=	0x00fa
_SPI0_CK_SE	=	0x00fb
_SPI0_SETUP	=	0x00fc
_SCON1	=	0x00c0
_SBUF1	=	0x00c1
_SBAUD1	=	0x00c2
_ADC_CTRL	=	0x0080
_ADC_CFG	=	0x009a
_ADC_DATA	=	0x009f
_TKEY_CTRL	=	0x00c3
_TKEY_DAT	=	0xc5c4
_TKEY_DATL	=	0x00c4
_TKEY_DATH	=	0x00c5
_USB_C_CTRL	=	0x0091
_UDEV_CTRL	=	0x00d1
_UEP1_CTRL	=	0x00d2
_UEP1_T_LEN	=	0x00d3
_UEP2_CTRL	=	0x00d4
_UEP2_T_LEN	=	0x00d5
_UEP3_CTRL	=	0x00d6
_UEP3_T_LEN	=	0x00d7
_USB_INT_FG	=	0x00d8
_USB_INT_ST	=	0x00d9
_USB_MIS_ST	=	0x00da
_USB_RX_LEN	=	0x00db
_UEP0_CTRL	=	0x00dc
_UEP0_T_LEN	=	0x00dd
_UEP4_CTRL	=	0x00de
_UEP4_T_LEN	=	0x00df
_USB_INT_EN	=	0x00e1
_USB_CTRL	=	0x00e2
_USB_DEV_AD	=	0x00e3
_UEP2_DMA	=	0xe5e4
_UEP2_DMA_L	=	0x00e4
_UEP2_DMA_H	=	0x00e5
_UEP3_DMA	=	0xe7e6
_UEP3_DMA_L	=	0x00e6
_UEP3_DMA_H	=	0x00e7
_UEP4_1_MOD	=	0x00ea
_UEP2_3_MOD	=	0x00eb
_UEP0_DMA	=	0xedec
_UEP0_DMA_L	=	0x00ec
_UEP0_DMA_H	=	0x00ed
_UEP1_DMA	=	0xefee
_UEP1_DMA_L	=	0x00ee
_UEP1_DMA_H	=	0x00ef
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_CY	=	0x00d7
_AC	=	0x00d6
_F0	=	0x00d5
_RS1	=	0x00d4
_RS0	=	0x00d3
_OV	=	0x00d2
_F1	=	0x00d1
_P	=	0x00d0
_EA	=	0x00af
_E_DIS	=	0x00ae
_ET2	=	0x00ad
_ES	=	0x00ac
_ET1	=	0x00ab
_EX1	=	0x00aa
_ET0	=	0x00a9
_EX0	=	0x00a8
_PH_FLAG	=	0x00bf
_PL_FLAG	=	0x00be
_PT2	=	0x00bd
_PS	=	0x00bc
_PT1	=	0x00bb
_PX1	=	0x00ba
_PT0	=	0x00b9
_PX0	=	0x00b8
_IE_WDOG	=	0x00ef
_IE_GPIO	=	0x00ee
_IE_PWMX	=	0x00ed
_IE_UART1	=	0x00ec
_IE_ADC	=	0x00eb
_IE_USB	=	0x00ea
_IE_TKEY	=	0x00e9
_IE_SPI0	=	0x00e8
_SCK	=	0x0097
_TXD1	=	0x0097
_TIN5	=	0x0097
_MISO	=	0x0096
_RXD1	=	0x0096
_TIN4	=	0x0096
_MOSI	=	0x0095
_PWM1	=	0x0095
_TIN3	=	0x0095
_UCC2	=	0x0095
_AIN2	=	0x0095
_T2_	=	0x0094
_CAP1_	=	0x0094
_SCS	=	0x0094
_TIN2	=	0x0094
_UCC1	=	0x0094
_AIN1	=	0x0094
_TXD_	=	0x0093
_RXD_	=	0x0092
_T2EX	=	0x0091
_CAP2	=	0x0091
_TIN1	=	0x0091
_VBUS2	=	0x0091
_AIN0	=	0x0091
_T2	=	0x0090
_CAP1	=	0x0090
_TIN0	=	0x0090
_UDM	=	0x00b7
_UDP	=	0x00b6
_T1	=	0x00b5
_PWM2	=	0x00b4
_RXD1_	=	0x00b4
_T0	=	0x00b4
_INT1	=	0x00b3
_TXD1_	=	0x00b2
_INT0	=	0x00b2
_VBUS1	=	0x00b2
_AIN3	=	0x00b2
_PWM2_	=	0x00b1
_TXD	=	0x00b1
_PWM1_	=	0x00b0
_RXD	=	0x00b0
_TF1	=	0x008f
_TR1	=	0x008e
_TF0	=	0x008d
_TR0	=	0x008c
_IE1	=	0x008b
_IT1	=	0x008a
_IE0	=	0x0089
_IT0	=	0x0088
_SM0	=	0x009f
_SM1	=	0x009e
_SM2	=	0x009d
_REN	=	0x009c
_TB8	=	0x009b
_RB8	=	0x009a
_TI	=	0x0099
_RI	=	0x0098
_TF2	=	0x00cf
_CAP1F	=	0x00cf
_EXF2	=	0x00ce
_RCLK	=	0x00cd
_TCLK	=	0x00cc
_EXEN2	=	0x00cb
_TR2	=	0x00ca
_C_T2	=	0x00c9
_CP_RL2	=	0x00c8
_S0_FST_ACT	=	0x00ff
_S0_IF_OV	=	0x00fe
_S0_IF_FIRST	=	0x00fd
_S0_IF_BYTE	=	0x00fc
_S0_FREE	=	0x00fb
_S0_T_FIFO	=	0x00fa
_S0_R_FIFO	=	0x00f8
_U1SM0	=	0x00c7
_U1SMOD	=	0x00c5
_U1REN	=	0x00c4
_U1TB8	=	0x00c3
_U1RB8	=	0x00c2
_U1TI	=	0x00c1
_U1RI	=	0x00c0
_CMPO	=	0x0087
_CMP_IF	=	0x0086
_ADC_IF	=	0x0085
_ADC_START	=	0x0084
_CMP_CHAN	=	0x0083
_ADC_CHAN1	=	0x0081
_ADC_CHAN0	=	0x0080
_U_IS_NAK	=	0x00df
_U_TOG_OK	=	0x00de
_U_SIE_FREE	=	0x00dd
_UIF_FIFO_OV	=	0x00dc
_UIF_HST_SOF	=	0x00db
_UIF_SUSPEND	=	0x00da
_UIF_TRANSFER	=	0x00d9
_UIF_DETECT	=	0x00d8
_UIF_BUS_RST	=	0x00d8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_SetupLen::
	.ds 2
_SetupReq::
	.ds 1
_UsbConfig::
	.ds 1
_pDescr::
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_EP0_buffer	=	0x0000
_EP1_buffer	=	0x0040
_EP2_buffer	=	0x0052
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_EP0_copyDescr'
;------------------------------------------------------------
;len           Allocated to registers 
;------------------------------------------------------------
;	src/usb_handler.c:18: void USB_EP0_copyDescr(uint8_t len) {
;	-----------------------------------------
;	 function USB_EP0_copyDescr
;	-----------------------------------------
_USB_EP0_copyDescr:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	src/usb_handler.c:35: __endasm;
	push ar7 ; r7 -> stack
	mov r7, dpl ; r7 <- len
	inc _XBUS_AUX ; select dptr1
	mov dptr, #_EP0_buffer ; dptr1 <- EP0_buffer
	dec _XBUS_AUX ; select dptr0
	mov dpl, _pDescr ; dptr0 <- *pDescr
	mov dph, (_pDescr + 1)
01$:
	clr a ; acc <- #0
	movc a, @a+dptr ; acc <- *pDescr[dptr0]
	inc dptr ; inc dptr0
	.DB 0xA5 ; acc -> EP0_buffer[dptr1] & inc dptr1
	djnz r7, 01$ ; repeat len times
	pop ar7 ; r7 <- stack
;	src/usb_handler.c:36: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_EP0_SETUP'
;------------------------------------------------------------
;len           Allocated to registers r7 
;------------------------------------------------------------
;	src/usb_handler.c:42: void USB_EP0_SETUP(void) {
;	-----------------------------------------
;	 function USB_EP0_SETUP
;	-----------------------------------------
_USB_EP0_SETUP:
;	src/usb_handler.c:43: uint8_t len = USB_RX_LEN;
	mov	r7,_USB_RX_LEN
;	src/usb_handler.c:44: if(len == (sizeof(USB_SETUP_REQ))) {
	cjne	r7,#0x08,00419$
	sjmp	00420$
00419$:
	ljmp	00175$
00420$:
;	src/usb_handler.c:45: SetupLen = ((uint16_t)USB_setupBuf->wLengthH<<8) | (USB_setupBuf->wLengthL);
	mov	dptr,#(_EP0_buffer + 0x0007)
	movx	a,@dptr
	mov	r6,a
	mov	r7,#0x00
	mov	dptr,#(_EP0_buffer + 0x0006)
	movx	a,@dptr
	mov	r5,a
	mov	r4,#0x00
	orl	a,r7
	mov	_SetupLen,a
	mov	a,r4
	orl	a,r6
	mov	(_SetupLen + 1),a
;	src/usb_handler.c:46: len = 0;                                      // default is success and upload 0 length
;	src/usb_handler.c:47: SetupReq = USB_setupBuf->bRequest;
	mov	dptr,#(_EP0_buffer + 0x0001)
	movx	a,@dptr
	mov	_SetupReq,a
;	src/usb_handler.c:49: if( (USB_setupBuf->bRequestType & USB_REQ_TYP_MASK) != USB_REQ_TYP_STANDARD ) {
	mov	dptr,#_EP0_buffer
	movx	a,@dptr
	mov	r6,a
	anl	a,#0x60
	jz	00172$
;	src/usb_handler.c:53: len = 0xFF;                                 // command not supported
	mov	r7,#0xff
	ljmp	00176$
00172$:
;	src/usb_handler.c:58: switch(SetupReq) {                          // request ccfType
	mov	a,_SetupReq
	add	a,#0xff - 0x0b
	jnc	00422$
	ljmp	00169$
00422$:
;	free result
	mov	a,_SetupReq
	add	a,#(00423$-3-.)
	movc	a,@a+pc
	mov	dpl,a
	mov	a,_SetupReq
	add	a,#(00424$-3-.)
	movc	a,@a+pc
	mov	dph,a
	clr	a
	jmp	@a+dptr
00423$:
	.db	00165$
	.db	00129$
	.db	00169$
	.db	00146$
	.db	00169$
	.db	00122$
	.db	00101$
	.db	00169$
	.db	00123$
	.db	00126$
	.db	00176$
	.db	00176$
00424$:
	.db	00165$>>8
	.db	00129$>>8
	.db	00169$>>8
	.db	00146$>>8
	.db	00169$>>8
	.db	00122$>>8
	.db	00101$>>8
	.db	00169$>>8
	.db	00123$>>8
	.db	00126$>>8
	.db	00176$>>8
	.db	00176$>>8
;	src/usb_handler.c:59: case USB_GET_DESCRIPTOR:
00101$:
;	src/usb_handler.c:60: switch(USB_setupBuf->wValueH) {
	mov	dptr,#(_EP0_buffer + 0x0003)
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0x01,00425$
	sjmp	00102$
00425$:
	cjne	r6,#0x02,00426$
	sjmp	00103$
00426$:
	cjne	r6,#0x03,00427$
	sjmp	00104$
00427$:
	cjne	r6,#0x22,00428$
	sjmp	00112$
00428$:
	ljmp	00116$
;	src/usb_handler.c:62: case USB_DESCR_TYP_DEVICE:            // Device Descriptor
00102$:
;	src/usb_handler.c:63: pDescr = (uint8_t*)&DevDescr;       // put descriptor into out buffer
	mov	_pDescr,#_DevDescr
	mov	(_pDescr + 1),#(_DevDescr >> 8)
;	src/usb_handler.c:64: len = sizeof(DevDescr);             // descriptor length
	mov	r7,#0x12
;	src/usb_handler.c:65: break;
;	src/usb_handler.c:67: case USB_DESCR_TYP_CONFIG:            // Configuration Descriptor
	sjmp	00117$
00103$:
;	src/usb_handler.c:68: pDescr = (uint8_t*)&CfgDescr;       // put descriptor into out buffer
	mov	_pDescr,#_CfgDescr
	mov	(_pDescr + 1),#(_CfgDescr >> 8)
;	src/usb_handler.c:69: len = sizeof(CfgDescr);             // descriptor length
	mov	r7,#0x32
;	src/usb_handler.c:70: break;
;	src/usb_handler.c:72: case USB_DESCR_TYP_STRING:
	sjmp	00117$
00104$:
;	src/usb_handler.c:73: switch(USB_setupBuf->wValueL) {      // String Descriptor Index
	mov	dptr,#(_EP0_buffer + 0x0002)
	movx	a,@dptr
	mov  r6,a
	add	a,#0xff - 0x04
	jc	00110$
;	free result
	mov	a,r6
	add	a,r6
;	src/usb_handler.c:74: case 0:   pDescr = USB_STR_DESCR_i0; break;
	mov	dptr,#00430$
	jmp	@a+dptr
00430$:
	sjmp	00105$
	sjmp	00106$
	sjmp	00107$
	sjmp	00108$
	sjmp	00109$
00105$:
	mov	_pDescr,#_LangDescr
	mov	(_pDescr + 1),#(_LangDescr >> 8)
;	src/usb_handler.c:75: case 1:   pDescr = USB_STR_DESCR_i1; break;
	sjmp	00111$
00106$:
	mov	_pDescr,#_ManufDescr
	mov	(_pDescr + 1),#(_ManufDescr >> 8)
;	src/usb_handler.c:76: case 2:   pDescr = USB_STR_DESCR_i2; break;
	sjmp	00111$
00107$:
	mov	_pDescr,#_ProdDescr
	mov	(_pDescr + 1),#(_ProdDescr >> 8)
;	src/usb_handler.c:77: case 3:   pDescr = USB_STR_DESCR_i3; break;
	sjmp	00111$
00108$:
	mov	_pDescr,#_SerDescr
	mov	(_pDescr + 1),#(_SerDescr >> 8)
;	src/usb_handler.c:79: case 4:   pDescr = USB_STR_DESCR_i4; break;
	sjmp	00111$
00109$:
	mov	_pDescr,#_InterfDescr
	mov	(_pDescr + 1),#(_InterfDescr >> 8)
;	src/usb_handler.c:96: default:  pDescr = USB_STR_DESCR_ix; break;
	sjmp	00111$
00110$:
	mov	_pDescr,#_SerDescr
	mov	(_pDescr + 1),#(_SerDescr >> 8)
;	src/usb_handler.c:97: }
00111$:
;	src/usb_handler.c:98: len = pDescr[0];                    // descriptor length
	mov	dpl,_pDescr
	mov	dph,(_pDescr + 1)
	clr	a
	movc	a,@a+dptr
	mov	r7,a
;	src/usb_handler.c:99: break;
;	src/usb_handler.c:102: case USB_DESCR_TYP_REPORT:
	sjmp	00117$
00112$:
;	src/usb_handler.c:103: if(USB_setupBuf->wValueL == 0) {
	mov	dptr,#(_EP0_buffer + 0x0002)
	movx	a,@dptr
	jnz	00114$
;	src/usb_handler.c:104: pDescr = USB_REPORT_DESCR;
	mov	_pDescr,#_ReportDescr
	mov	(_pDescr + 1),#(_ReportDescr >> 8)
;	src/usb_handler.c:105: len = USB_REPORT_DESCR_LEN;
	mov	dptr,#_ReportDescrLen
	clr	a
	movc	a,@a+dptr
	mov	r7,a
	sjmp	00117$
00114$:
;	src/usb_handler.c:107: else len = 0xff;
	mov	r7,#0xff
;	src/usb_handler.c:108: break;
;	src/usb_handler.c:111: default:
	sjmp	00117$
00116$:
;	src/usb_handler.c:112: len = 0xff;                         // unsupported descriptors or error
	mov	r7,#0xff
;	src/usb_handler.c:114: }
00117$:
;	src/usb_handler.c:116: if(len != 0xff) {
	cjne	r7,#0xff,00432$
	ljmp	00176$
00432$:
;	src/usb_handler.c:117: if(SetupLen > len) SetupLen = len;    // limit length
	mov	ar5,r7
	mov	r6,#0x00
	clr	c
	mov	a,r5
	subb	a,_SetupLen
	mov	a,r6
	subb	a,(_SetupLen + 1)
	jnc	00119$
;	free result
	mov	_SetupLen,r5
	mov	(_SetupLen + 1),r6
00119$:
;	src/usb_handler.c:118: len = SetupLen >= EP0_SIZE ? EP0_SIZE : SetupLen;
	mov	r5,_SetupLen
	mov	r6,(_SetupLen + 1)
	clr	c
	mov	a,r5
	subb	a,#0x40
	mov	a,r6
	subb	a,#0x00
	jc	00185$
	mov	r5,#0x40
	sjmp	00186$
00185$:
	mov	r5,_SetupLen
00186$:
	mov	ar7,r5
;	src/usb_handler.c:119: USB_EP0_copyDescr(len);               // copy descriptor to Ep0
	mov	dpl, r7
	lcall	_USB_EP0_copyDescr
;	src/usb_handler.c:120: SetupLen -= len;
	mov	ar5,r7
	mov	r6,#0x00
	mov	r3,_SetupLen
	mov	r4,(_SetupLen + 1)
	mov	a,r3
	clr	c
	subb	a,r5
	mov	r3,a
	mov	a,r4
	subb	a,r6
	mov	r4,a
	mov	_SetupLen,r3
	mov	(_SetupLen + 1),r4
;	src/usb_handler.c:121: pDescr += len;
	mov	a,r7
	add	a, _pDescr
	mov	_pDescr,a
	clr	a
	addc	a, (_pDescr + 1)
	mov	(_pDescr + 1),a
;	src/usb_handler.c:123: break;
	ljmp	00176$
;	src/usb_handler.c:125: case USB_SET_ADDRESS:
00122$:
;	src/usb_handler.c:126: SetupLen = USB_setupBuf->wValueL;        // save the assigned address
	mov	dptr,#(_EP0_buffer + 0x0002)
	movx	a,@dptr
	mov	_SetupLen, a
	mov	(_SetupLen + 1),#0x00
;	src/usb_handler.c:127: break;
	ljmp	00176$
;	src/usb_handler.c:129: case USB_GET_CONFIGURATION:
00123$:
;	src/usb_handler.c:130: EP0_buffer[0] = UsbConfig;
	mov	dptr,#_EP0_buffer
	mov	a,_UsbConfig
	movx	@dptr,a
;	src/usb_handler.c:131: if (SetupLen >= 1) len = 1;
	mov	r5,_SetupLen
	mov	r6,(_SetupLen + 1)
	clr	c
	mov	a,r5
	subb	a,#0x01
	mov	a,r6
	subb	a,#0x00
	jnc	00435$
	ljmp	00176$
00435$:
	mov	r7,#0x01
;	src/usb_handler.c:132: break;
	ljmp	00176$
;	src/usb_handler.c:134: case USB_SET_CONFIGURATION:
00126$:
;	src/usb_handler.c:135: UsbConfig = USB_setupBuf->wValueL;
	mov	dptr,#(_EP0_buffer + 0x0002)
	movx	a,@dptr
	mov	_UsbConfig,a
;	src/usb_handler.c:136: break;
	ljmp	00176$
;	src/usb_handler.c:144: case USB_CLEAR_FEATURE:
00129$:
;	src/usb_handler.c:145: if( (USB_setupBuf->bRequestType & 0x1F) == USB_REQ_RECIP_DEVICE ) {
	mov	dptr,#_EP0_buffer
	movx	a,@dptr
	anl	a,#0x1f
	jnz	00144$
;	src/usb_handler.c:146: if( ( ( (uint16_t)USB_setupBuf->wValueH << 8 ) | USB_setupBuf->wValueL ) == 0x01 ) {
	mov	dptr,#(_EP0_buffer + 0x0003)
	movx	a,@dptr
	mov	r5,a
	mov	r6,#0x00
	mov	dptr,#(_EP0_buffer + 0x0002)
	movx	a,@dptr
	mov	r3,#0x00
	orl	ar6,a
	mov	a,r3
	orl	ar5,a
	cjne	r6,#0x01,00134$
	cjne	r5,#0x00,00134$
;	src/usb_handler.c:147: if( ((uint8_t*)&CfgDescr)[7] & 0x20) {
	mov	dptr,#(_CfgDescr + 0x0007)
	clr	a
	movc	a,@a+dptr
	jnb	acc.5,00440$
	ljmp	00176$
00440$:
;	src/usb_handler.c:150: else len = 0xFF;               // failed
	mov	r7,#0xff
	ljmp	00176$
00134$:
;	src/usb_handler.c:152: else len = 0xFF;                 // failed
	mov	r7,#0xff
	ljmp	00176$
00144$:
;	src/usb_handler.c:154: else if( (USB_setupBuf->bRequestType & USB_REQ_RECIP_MASK) == USB_REQ_RECIP_ENDP ) {
	mov	dptr,#_EP0_buffer
	movx	a,@dptr
	mov	r6,a
	anl	ar6,#0x1f
	cjne	r6,#0x02,00141$
;	src/usb_handler.c:155: switch(USB_setupBuf->wIndexL) {
	mov	dptr,#(_EP0_buffer + 0x0004)
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0x02,00443$
	sjmp	00136$
00443$:
;	src/usb_handler.c:182: case 0x02:
	cjne	r6,#0x81,00138$
	sjmp	00137$
00136$:
;	src/usb_handler.c:183: UEP2_CTRL = UEP2_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
	anl	_UEP2_CTRL,#0x73
;	src/usb_handler.c:184: break;
	ljmp	00176$
;	src/usb_handler.c:187: case 0x81:
00137$:
;	src/usb_handler.c:188: UEP1_CTRL = UEP1_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
	mov	a,#0xbc
	anl	a,_UEP1_CTRL
	orl	a,#0x02
	mov	_UEP1_CTRL,a
;	src/usb_handler.c:189: break;
	ljmp	00176$
;	src/usb_handler.c:196: default:
00138$:
;	src/usb_handler.c:197: len = 0xFF;                 // unsupported endpoint
	mov	r7,#0xff
;	src/usb_handler.c:199: }
	ljmp	00176$
00141$:
;	src/usb_handler.c:201: else len = 0xFF;                  // unsupported for non-endpoint
	mov	r7,#0xff
;	src/usb_handler.c:202: break;
	ljmp	00176$
;	src/usb_handler.c:204: case USB_SET_FEATURE:
00146$:
;	src/usb_handler.c:205: if( (USB_setupBuf->bRequestType & 0x1F) == USB_REQ_RECIP_DEVICE ) {
	mov	dptr,#_EP0_buffer
	movx	a,@dptr
	anl	a,#0x1f
	jnz	00163$
;	src/usb_handler.c:206: if( ( ( (uint16_t)USB_setupBuf->wValueH << 8 ) | USB_setupBuf->wValueL ) == 0x01 ) {
	mov	dptr,#(_EP0_buffer + 0x0003)
	movx	a,@dptr
	mov	r5,a
	mov	r6,#0x00
	mov	dptr,#(_EP0_buffer + 0x0002)
	movx	a,@dptr
	mov	r3,#0x00
	orl	ar6,a
	mov	a,r3
	orl	ar5,a
	cjne	r6,#0x01,00150$
	cjne	r5,#0x00,00150$
;	src/usb_handler.c:207: if( !(((uint8_t*)&CfgDescr)[7] & 0x20) ) len = 0xFF;  // failed
	mov	dptr,#(_CfgDescr + 0x0007)
	clr	a
	movc	a,@a+dptr
	jnb	acc.5,00449$
	ljmp	00176$
00449$:
	mov	r7,#0xff
	ljmp	00176$
00150$:
;	src/usb_handler.c:209: else len = 0xFF;                                        // failed
	mov	r7,#0xff
	ljmp	00176$
00163$:
;	src/usb_handler.c:211: else if( (USB_setupBuf->bRequestType & 0x1F) == USB_REQ_RECIP_ENDP ) {
	mov	dptr,#_EP0_buffer
	movx	a,@dptr
	mov	r6,a
	anl	ar6,#0x1f
	cjne	r6,#0x02,00160$
;	src/usb_handler.c:212: if( ( ( (uint16_t)USB_setupBuf->wValueH << 8 ) | USB_setupBuf->wValueL ) == 0x00 ) {
	mov	dptr,#(_EP0_buffer + 0x0003)
	movx	a,@dptr
	mov	r5,a
	mov	r6,#0x00
	mov	dptr,#(_EP0_buffer + 0x0002)
	movx	a,@dptr
	mov	r3,#0x00
	orl	ar6,a
	mov	a,r3
	orl	ar5,a
	mov	a,r6
	orl	a,r5
	jnz	00157$
;	src/usb_handler.c:213: switch( ( (uint16_t)USB_setupBuf->wIndexH << 8 ) | USB_setupBuf->wIndexL ) {
	mov	dptr,#(_EP0_buffer + 0x0005)
	movx	a,@dptr
	mov	r5,a
	mov	r6,#0x00
	mov	dptr,#(_EP0_buffer + 0x0004)
	movx	a,@dptr
	mov	r3,#0x00
	orl	ar6,a
	mov	a,r3
	orl	ar5,a
	cjne	r6,#0x02,00453$
	cjne	r5,#0x00,00453$
	sjmp	00152$
00453$:
;	src/usb_handler.c:240: case 0x02:
	cjne	r6,#0x81,00154$
	cjne	r5,#0x00,00154$
	sjmp	00153$
00152$:
;	src/usb_handler.c:241: UEP2_CTRL = UEP2_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;// Set EP2 OUT Stall 
	mov	a,#0x7f
	anl	a,_UEP2_CTRL
	orl	a,#0x0c
	mov	_UEP2_CTRL,a
;	src/usb_handler.c:242: break;
;	src/usb_handler.c:245: case 0x81:
	sjmp	00176$
00153$:
;	src/usb_handler.c:246: UEP1_CTRL = UEP1_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;// Set EP1 IN STALL 
	mov	a,#0xbf
	anl	a,_UEP1_CTRL
	orl	a,#0x03
	mov	_UEP1_CTRL,a
;	src/usb_handler.c:247: break;
;	src/usb_handler.c:254: default:
	sjmp	00176$
00154$:
;	src/usb_handler.c:255: len = 0xFF;               // failed
	mov	r7,#0xff
;	src/usb_handler.c:257: }
	sjmp	00176$
00157$:
;	src/usb_handler.c:259: else len = 0xFF;                // failed
	mov	r7,#0xff
	sjmp	00176$
00160$:
;	src/usb_handler.c:261: else len = 0xFF;                  // failed
	mov	r7,#0xff
;	src/usb_handler.c:262: break;
;	src/usb_handler.c:264: case USB_GET_STATUS:
	sjmp	00176$
00165$:
;	src/usb_handler.c:265: EP0_buffer[0] = 0x00;
	mov	dptr,#_EP0_buffer
	clr	a
	movx	@dptr,a
;	src/usb_handler.c:266: EP0_buffer[1] = 0x00;
	mov	dptr,#(_EP0_buffer + 0x0001)
	movx	@dptr,a
;	src/usb_handler.c:267: if(SetupLen >= 2) len = 2;
	mov	r5,_SetupLen
	mov	r6,(_SetupLen + 1)
	clr	c
	mov	a,r5
	subb	a,#0x02
	mov	a,r6
	subb	a,#0x00
	jc	00167$
	mov	r7,#0x02
	sjmp	00176$
00167$:
;	src/usb_handler.c:268: else len = SetupLen;
	mov	r7,_SetupLen
;	src/usb_handler.c:269: break;
;	src/usb_handler.c:271: default:
	sjmp	00176$
00169$:
;	src/usb_handler.c:272: len = 0xff;                       // failed
	mov	r7,#0xff
;	src/usb_handler.c:274: }
	sjmp	00176$
00175$:
;	src/usb_handler.c:277: else len = 0xff;                          // wrong packet length
	mov	r7,#0xff
00176$:
;	src/usb_handler.c:279: if(len == 0xff) {
	cjne	r7,#0xff,00181$
;	src/usb_handler.c:280: SetupReq = 0xFF;
	mov	_SetupReq,#0xff
;	src/usb_handler.c:281: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_STALL | UEP_T_RES_STALL;//STALL
	mov	_UEP0_CTRL,#0xcf
	ret
00181$:
;	src/usb_handler.c:283: else if(len <= EP0_SIZE) {      // Tx data to host or send 0-length packet
	mov	a,r7
	add	a,#0xff - 0x40
	jc	00178$
;	free result
;	src/usb_handler.c:284: UEP0_T_LEN = len;
	mov	_UEP0_T_LEN,r7
;	src/usb_handler.c:285: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;// Expect DATA1, Answer ACK
	mov	_UEP0_CTRL,#0xc0
	ret
00178$:
;	src/usb_handler.c:288: UEP0_T_LEN = 0;  // Tx data to host or send 0-length packet
	mov	_UEP0_T_LEN,#0x00
;	src/usb_handler.c:289: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;// Expect DATA1, Answer ACK
	mov	_UEP0_CTRL,#0xc0
;	src/usb_handler.c:291: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_EP0_IN'
;------------------------------------------------------------
;len           Allocated to registers r6 
;------------------------------------------------------------
;	src/usb_handler.c:293: void USB_EP0_IN(void) {
;	-----------------------------------------
;	 function USB_EP0_IN
;	-----------------------------------------
_USB_EP0_IN:
;	src/usb_handler.c:295: switch(SetupReq) {
	mov	a,#0x05
	cjne	a,_SetupReq,00130$
	sjmp	00102$
00130$:
	mov	a,#0x06
	cjne	a,_SetupReq,00103$
;	src/usb_handler.c:298: len = SetupLen >= EP0_SIZE ? EP0_SIZE : SetupLen;
	mov	r6,_SetupLen
	mov	r7,(_SetupLen + 1)
	clr	c
	mov	a,r6
	subb	a,#0x40
	mov	a,r7
	subb	a,#0x00
	jc	00107$
	mov	r6,#0x40
	sjmp	00108$
00107$:
	mov	r6,_SetupLen
00108$:
;	src/usb_handler.c:299: USB_EP0_copyDescr(len);                     // copy descriptor to Ep0                                
	mov	dpl, r6
	lcall	_USB_EP0_copyDescr
;	src/usb_handler.c:300: SetupLen  -= len;
	mov	ar5,r6
	mov	r7,#0x00
	mov	r3,_SetupLen
	mov	r4,(_SetupLen + 1)
	mov	a,r3
	clr	c
	subb	a,r5
	mov	r3,a
	mov	a,r4
	subb	a,r7
	mov	r4,a
	mov	_SetupLen,r3
	mov	(_SetupLen + 1),r4
;	src/usb_handler.c:301: pDescr    += len;
	mov	a,r6
	add	a, _pDescr
	mov	_pDescr,a
	clr	a
	addc	a, (_pDescr + 1)
	mov	(_pDescr + 1),a
;	src/usb_handler.c:302: UEP0_T_LEN = len;
	mov	_UEP0_T_LEN,r6
;	src/usb_handler.c:303: UEP0_CTRL ^= bUEP_T_TOG;                    // switch between DATA0 and DATA1
	xrl	_UEP0_CTRL,#0x40
;	src/usb_handler.c:304: break;
;	src/usb_handler.c:306: case USB_SET_ADDRESS:
	ret
00102$:
;	src/usb_handler.c:307: USB_DEV_AD = USB_DEV_AD & bUDA_GP_BIT | SetupLen;
	mov	a,_USB_DEV_AD
	anl	a,#0x80
	mov	r7,a
	mov	a,_SetupLen
	orl	a,r7
	mov	_USB_DEV_AD,a
;	src/usb_handler.c:308: UEP0_CTRL  = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
;	src/usb_handler.c:309: break;
;	src/usb_handler.c:311: default:
	ret
00103$:
;	src/usb_handler.c:312: UEP0_T_LEN = 0;                             // end of transaction
	mov	_UEP0_T_LEN,#0x00
;	src/usb_handler.c:313: UEP0_CTRL  = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
;	src/usb_handler.c:315: }
;	src/usb_handler.c:316: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_EP0_OUT'
;------------------------------------------------------------
;	src/usb_handler.c:318: void USB_EP0_OUT(void) {
;	-----------------------------------------
;	 function USB_EP0_OUT
;	-----------------------------------------
_USB_EP0_OUT:
;	src/usb_handler.c:319: UEP0_T_LEN = 0;
	mov	_UEP0_T_LEN,#0x00
;	src/usb_handler.c:320: UEP0_CTRL |= UEP_R_RES_ACK | UEP_T_RES_NAK;     // respond Nak
	orl	_UEP0_CTRL,#0x02
;	src/usb_handler.c:321: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_interrupt'
;------------------------------------------------------------
;callIndex     Allocated to registers r7 
;------------------------------------------------------------
;	src/usb_handler.c:329: void USB_interrupt(void) {   // inline not really working in multiple files in SDCC
;	-----------------------------------------
;	 function USB_interrupt
;	-----------------------------------------
_USB_interrupt:
;	src/usb_handler.c:330: if(UIF_TRANSFER) {
	jnb	_UIF_TRANSFER,00120$
;	src/usb_handler.c:332: uint8_t callIndex = USB_INT_ST & MASK_UIS_ENDP;
	mov	a,_USB_INT_ST
	anl	a,#0x0f
	mov	r7,a
;	src/usb_handler.c:333: switch (USB_INT_ST & MASK_UIS_TOKEN) {
	mov	a,_USB_INT_ST
	anl	a,#0x30
	mov	r6,a
	jz	00101$
	cjne	r6,#0x10,00222$
	sjmp	00118$
00222$:
	cjne	r6,#0x20,00223$
	sjmp	00109$
00223$:
;	src/usb_handler.c:334: case UIS_TOKEN_OUT:
	cjne	r6,#0x30,00118$
	sjmp	00114$
00101$:
;	src/usb_handler.c:335: switch (callIndex) {
	mov	a,r7
	jz	00102$
;	src/usb_handler.c:336: case 0: EP0_OUT_callback(); break;
	cjne	r7,#0x02,00118$
	sjmp	00103$
00102$:
	lcall	_USB_EP0_OUT
;	src/usb_handler.c:341: case 2: EP2_OUT_callback(); break;
	sjmp	00118$
00103$:
	lcall	_CMD_EP2_OUT
;	src/usb_handler.c:372: case UIS_TOKEN_IN:
	sjmp	00118$
00109$:
;	src/usb_handler.c:373: switch (callIndex) {
	mov	a,r7
	jz	00110$
;	src/usb_handler.c:374: case 0: EP0_IN_callback(); break;
	cjne	r7,#0x01,00118$
	sjmp	00111$
00110$:
	lcall	_USB_EP0_IN
;	src/usb_handler.c:376: case 1: EP1_IN_callback(); break;
	sjmp	00118$
00111$:
	lcall	_HID_EP1_IN
;	src/usb_handler.c:390: case UIS_TOKEN_SETUP:
	sjmp	00118$
00114$:
;	src/usb_handler.c:391: switch (callIndex) {
	mov	a,r7
	jnz	00118$
;	src/usb_handler.c:392: case 0: EP0_SETUP_callback(); break;
	lcall	_USB_EP0_SETUP
;	src/usb_handler.c:408: }
00118$:
;	src/usb_handler.c:409: UIF_TRANSFER = 0;                       // clear interrupt flag
;	assignBit
	clr	_UIF_TRANSFER
00120$:
;	src/usb_handler.c:413: if(UIF_BUS_RST) {
	jnb	_UIF_BUS_RST,00122$
;	src/usb_handler.c:414: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
	mov	_UEP0_CTRL,#0x02
;	src/usb_handler.c:417: USB_RESET_handler();                    // custom reset handler
	lcall	_HID_reset
;	src/usb_handler.c:420: USB_DEV_AD   = 0x00;
	mov	_USB_DEV_AD,#0x00
;	src/usb_handler.c:421: UIF_SUSPEND  = 0;
;	assignBit
	clr	_UIF_SUSPEND
;	src/usb_handler.c:422: UIF_TRANSFER = 0;
;	assignBit
	clr	_UIF_TRANSFER
;	src/usb_handler.c:423: UIF_BUS_RST  = 0;                       // clear interrupt flag
;	assignBit
	clr	_UIF_BUS_RST
00122$:
;	src/usb_handler.c:427: if (UIF_SUSPEND) {
;	src/usb_handler.c:428: UIF_SUSPEND = 0;
;	assignBit
	jbc	_UIF_SUSPEND,00231$
	ret
00231$:
;	src/usb_handler.c:429: if ( !(USB_MIS_ST & bUMS_SUSPEND) ) USB_INT_FG = 0xFF;  // clear interrupt flag
	mov	a,_USB_MIS_ST
	jb	acc.2,00127$
	mov	_USB_INT_FG,#0xff
00127$:
;	src/usb_handler.c:431: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_init'
;------------------------------------------------------------
;	src/usb_handler.c:438: void USB_init(void) {
;	-----------------------------------------
;	 function USB_init
;	-----------------------------------------
_USB_init:
;	src/usb_handler.c:441: | bUC_DMA_EN;                 // DMA enable
	mov	_USB_CTRL,#0x29
;	src/usb_handler.c:443: | bUD_PORT_EN;                // Enable port, full-speed
	mov	_UDEV_CTRL,#0x81
;	src/usb_handler.c:450: UEP0_DMA    = EP0_ADDR;                   // EP0 data transfer address
	clr	a
	mov	((_UEP0_DMA >> 0) & 0xFF),a
	mov	((_UEP0_DMA >> 8) & 0xFF),a
;	src/usb_handler.c:452: | UEP_T_RES_NAK;              // EP0 IN transaction returns NAK
	mov	_UEP0_CTRL,#0x02
;	src/usb_handler.c:455: USB_INIT_handler();                       // Custom EP init handler
	lcall	_HID_setup
;	src/usb_handler.c:460: | bUIE_BUS_RST;               // Enable device mode USB bus reset interrupt
	orl	_USB_INT_EN,#0x07
;	src/usb_handler.c:462: USB_INT_FG |= 0x1F;                       // Clear interrupt flag
	orl	_USB_INT_FG,#0x1f
;	src/usb_handler.c:463: IE_USB      = 1;                          // Enable USB interrupt
;	assignBit
	setb	_IE_USB
;	src/usb_handler.c:464: EA          = 1;                          // Enable global interrupts
;	assignBit
	setb	_EA
;	src/usb_handler.c:466: UEP0_T_LEN  = 0;                          // Must be zero at start
	mov	_UEP0_T_LEN,#0x00
;	src/usb_handler.c:467: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CABS    (ABS,CODE)
