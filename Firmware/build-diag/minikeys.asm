;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.6.0 #16555 (Mac OS X ppc)
;--------------------------------------------------------
	.module minikeys
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _setPixel_PARM_4
	.globl _setPixel_PARM_3
	.globl _setPixel_PARM_2
	.globl _diagNames
	.globl _diagPins
	.globl _encoderTable
	.globl _palette
	.globl _keyPixel
	.globl _main
	.globl _diagLoop
	.globl _diagType
	.globl _diagRead
	.globl _pollButtons
	.globl _readButton
	.globl _pollEncoder
	.globl _readEncoder
	.globl _handleCommand
	.globl _controlIndex
	.globl _enterBootloader
	.globl _setLayer
	.globl _renderLights
	.globl _flashPress
	.globl _lightColor
	.globl _setPixelHue
	.globl _setPixelScaled
	.globl _setPixel
	.globl _releaseAll
	.globl _controlUp
	.globl _controlDown
	.globl _sendMouse
	.globl _sendMedia
	.globl _sendKeys
	.globl _saveSettings
	.globl _loadSettings
	.globl _setDefaults
	.globl _USB_ISR
	.globl _USB_interrupt
	.globl _CMD_take
	.globl _HID_sendReport
	.globl _HID_init
	.globl _EEPROM_update
	.globl _EEPROM_read
	.globl _NEO_writeColor
	.globl _NEO_sendByte
	.globl _DLY_ms
	.globl _DLY_us
	.globl _PP37
	.globl _PP36
	.globl _PP35
	.globl _PP34
	.globl _PP33
	.globl _PP32
	.globl _PP31
	.globl _PP30
	.globl _PP17
	.globl _PP16
	.globl _PP15
	.globl _PP14
	.globl _PP13
	.globl _PP12
	.globl _PP11
	.globl _PP10
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
	.globl _diagLast
	.globl _buttonCount
	.globl _buttonStable
	.globl _cmd
	.globl _tmpColor
	.globl _pressColor
	.globl _pressLevel
	.globl _pixels
	.globl _heldButtons
	.globl _heldKeys
	.globl _heldMods
	.globl _mouseReport
	.globl _conReport
	.globl _kbdReport
	.globl _overrideColors
	.globl _layerColors
	.globl _light
	.globl _bindings
	.globl _encoderSteps
	.globl _encoderState
	.globl _errorFlashFrames
	.globl _layerFlashFrames
	.globl _pressCount
	.globl _frame
	.globl _heldMediaCtrl
	.globl _overrideMask
	.globl _editLayer
	.globl _activeLayer
	.globl _setPixelHue_PARM_2
	.globl _setPixelScaled_PARM_3
	.globl _setPixelScaled_PARM_2
	.globl _sendMouse_PARM_3
	.globl _sendMouse_PARM_2
	.globl _sendKeys_PARM_2
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
_PP10	=	0x0090
_PP11	=	0x0091
_PP12	=	0x0092
_PP13	=	0x0093
_PP14	=	0x0094
_PP15	=	0x0095
_PP16	=	0x0096
_PP17	=	0x0097
_PP30	=	0x00b0
_PP31	=	0x00b1
_PP32	=	0x00b2
_PP33	=	0x00b3
_PP34	=	0x00b4
_PP35	=	0x00b5
_PP36	=	0x00b6
_PP37	=	0x00b7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_loadSettings_i_10000_511:
	.ds 1
_loadSettings_len_10000_511:
	.ds 1
_sendKeys_PARM_2:
	.ds 1
_sendMouse_PARM_2:
	.ds 1
_sendMouse_PARM_3:
	.ds 1
_controlDown_ctrl_10000_545:
	.ds 1
_controlDown_i_10000_546:
	.ds 1
_controlDown_last_10000_546:
	.ds 1
_setPixelScaled_PARM_2:
	.ds 2
_setPixelScaled_PARM_3:
	.ds 1
_setPixelHue_PARM_2:
	.ds 1
_renderLights_i_10000_578:
	.ds 1
_renderLights_phase_10000_578:
	.ds 1
_handleCommand_i_10000_623:
	.ds 1
_handleCommand_sloc0_1_0:
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_setPixel_PARM_2:
	.ds 1
_setPixel_PARM_3:
	.ds 1
_setPixel_PARM_4:
	.ds 1
	.area	OSEG    (OVR,DATA)
_flashPress_i_10000_575:
	.ds 1
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
_activeLayer::
	.ds 1
_editLayer::
	.ds 1
_overrideMask::
	.ds 1
_heldMediaCtrl::
	.ds 1
_frame::
	.ds 2
_pressCount::
	.ds 1
_layerFlashFrames::
	.ds 1
_errorFlashFrames::
	.ds 1
_encoderState::
	.ds 1
_encoderSteps::
	.ds 1
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
_readButton_sloc0_1_0:
	.ds 1
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_bindings::
	.ds 198
_light::
	.ds 8
_layerColors::
	.ds 9
_overrideColors::
	.ds 9
_kbdReport::
	.ds 9
_conReport::
	.ds 3
_mouseReport::
	.ds 5
_heldMods::
	.ds 6
_heldKeys::
	.ds 6
_heldButtons::
	.ds 6
_pixels::
	.ds 9
_pressLevel::
	.ds 3
_pressColor::
	.ds 9
_tmpColor::
	.ds 3
_cmd::
	.ds 12
_buttonStable::
	.ds 4
_buttonCount::
	.ds 4
_diagLast::
	.ds 13
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
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	reti
	.ds	7
	ljmp	_USB_ISR
; restartable atomic support routines
	.ds	2
sdcc_atomic_exchange_rollback_start::
	nop
	nop
sdcc_atomic_exchange_pdata_impl:
	movx	a, @r0
	mov	r3, a
	mov	a, r2
	movx	@r0, a
	sjmp	sdcc_atomic_exchange_exit
	nop
	nop
sdcc_atomic_exchange_xdata_impl:
	movx	a, @dptr
	mov	r3, a
	mov	a, r2
	movx	@dptr, a
	sjmp	sdcc_atomic_exchange_exit
sdcc_atomic_compare_exchange_idata_impl:
	mov	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	mov	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_pdata_impl:
	movx	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_xdata_impl:
	movx	a, @dptr
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@dptr, a
	ret
sdcc_atomic_exchange_rollback_end::

sdcc_atomic_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_exchange_pdata_impl
sdcc_atomic_exchange_idata_impl:
	mov	a, r2
	xch	a, @r0
	mov	dpl, a
	ret
sdcc_atomic_exchange_exit:
	mov	dpl, r3
	ret
sdcc_atomic_compare_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
	sjmp	sdcc_atomic_compare_exchange_idata_impl
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genRAMCLEAR
;	minikeys.c:52: __idata uint8_t activeLayer = 0;
	mov	r0,#_activeLayer
	mov	@r0,#0x00
;	minikeys.c:53: __idata uint8_t editLayer = 0;
	mov	r0,#_editLayer
	mov	@r0,#0x00
;	minikeys.c:78: __idata uint8_t overrideMask = 0;            // bit i: pixel i shows overrideColors[i]
	mov	r0,#_overrideMask
	mov	@r0,#0x00
;	minikeys.c:169: __idata uint8_t heldMediaCtrl = 0xFF;
	mov	r0,#_heldMediaCtrl
	mov	@r0,#0xff
;	minikeys.c:257: __idata uint16_t frame = 0;                 // 20 ms frames
	mov	r0,#_frame
	clr	a
	mov	@r0,a
	inc	r0
	mov	@r0,a
;	minikeys.c:261: __idata uint8_t pressCount = 0;
	mov	r0,#_pressCount
	mov	@r0,#0x00
;	minikeys.c:262: __idata uint8_t layerFlashFrames = 0;
	mov	r0,#_layerFlashFrames
	mov	@r0,#0x00
;	minikeys.c:263: __idata uint8_t errorFlashFrames = 0;
	mov	r0,#_errorFlashFrames
	mov	@r0,#0x00
;	minikeys.c:501: __idata int8_t  encoderSteps = 0;
	mov	r0,#_encoderSteps
	mov	@r0,#0x00
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	lcall	_main
__sdcc_program_exit:
	sjmp	.
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'USB_ISR'
;------------------------------------------------------------
;	minikeys.c:24: void USB_ISR(void) __interrupt(INT_NO_USB) {
;	-----------------------------------------
;	 function USB_ISR
;	-----------------------------------------
_USB_ISR:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+7)
	push	(0+6)
	push	(0+5)
	push	(0+4)
	push	(0+3)
	push	(0+2)
	push	(0+1)
	push	(0+0)
	push	psw
	mov	psw,#0x00
;	minikeys.c:25: USB_interrupt();
	lcall	_USB_interrupt
;	minikeys.c:26: }
	pop	psw
	pop	(0+0)
	pop	(0+1)
	pop	(0+2)
	pop	(0+3)
	pop	(0+4)
	pop	(0+5)
	pop	(0+6)
	pop	(0+7)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	ljmp	sdcc_atomic_maybe_rollback
;------------------------------------------------------------
;Allocation info for local variables in function 'setDefaults'
;------------------------------------------------------------
;i             Allocated to registers r7 
;s             Allocated to registers r5 r4 
;------------------------------------------------------------
;	minikeys.c:96: void setDefaults(void) {
;	-----------------------------------------
;	 function setDefaults
;	-----------------------------------------
_setDefaults:
;	minikeys.c:98: for(i=0; i<LAYERS * CONTROLS; i++) bindings[i][0] = 0;
	mov	r7,#0x00
00103$:
	mov	a,r7
	mov	b,#0x0b
	mul	ab
	add	a, #_bindings
	mov	dpl,a
	mov	a,#(_bindings >> 8)
	addc	a, b
	mov	dph,a
	clr	a
	movx	@dptr,a
	inc	r7
	cjne	r7,#0x12,00143$
00143$:
	jc	00103$
;	minikeys.c:99: for(i=0; i<LAYERS; i++) {
	mov	r7,#0x00
00105$:
;	minikeys.c:101: __xdata uint8_t* s = bindings[i * CONTROLS];
	mov	ar6,r7
	mov	a,r6
	mov	b,#0x06
	mul	ab
	mov	r6,a
	mov	b,#0x0b
	mul	ab
	add	a,#_bindings
	mov	r5,a
	clr	a
	addc	a, #(_bindings >> 8)
	mov	r4,a
;	minikeys.c:102: s[0] = TYPE_KEYS << 5 | 2; s[1] = 0; s[2] = 0x1E;       // 1
	mov	dpl,r5
	mov	dph,r4
	mov	a,#0x22
	movx	@dptr,a
	mov	dpl,r5
	mov	dph,r4
	inc	dptr
	clr	a
	movx	@dptr,a
	mov	dpl,r5
	mov	dph,r4
	inc	dptr
	inc	dptr
	mov	a,#0x1e
	movx	@dptr,a
;	minikeys.c:103: s = bindings[i * CONTROLS + 1];
	mov	ar5,r6
	mov	a,r5
	inc	a
	mov	b,#0x0b
	mul	ab
	add	a,#_bindings
	mov	r5,a
	clr	a
	addc	a, #(_bindings >> 8)
	mov	r4,a
;	minikeys.c:104: s[0] = TYPE_KEYS << 5 | 2; s[1] = 0; s[2] = 0x1F;       // 2
	mov	dpl,r5
	mov	dph,r4
	mov	a,#0x22
	movx	@dptr,a
	mov	dpl,r5
	mov	dph,r4
	inc	dptr
	clr	a
	movx	@dptr,a
	mov	dpl,r5
	mov	dph,r4
	inc	dptr
	inc	dptr
	mov	a,#0x1f
	movx	@dptr,a
;	minikeys.c:105: s = bindings[i * CONTROLS + 2];
	mov	ar5,r6
	mov	a,#0x02
	add	a, r5
	mov	b,#0x0b
	mul	ab
	add	a,#_bindings
	mov	r5,a
	clr	a
	addc	a, #(_bindings >> 8)
	mov	r4,a
;	minikeys.c:106: s[0] = TYPE_KEYS << 5 | 2; s[1] = 0; s[2] = 0x20;       // 3
	mov	dpl,r5
	mov	dph,r4
	mov	a,#0x22
	movx	@dptr,a
	mov	dpl,r5
	mov	dph,r4
	inc	dptr
	clr	a
	movx	@dptr,a
	mov	dpl,r5
	mov	dph,r4
	inc	dptr
	inc	dptr
	mov	a,#0x20
	movx	@dptr,a
;	minikeys.c:107: s = bindings[i * CONTROLS + CTRL_KNOB_LEFT];
	mov	ar5,r6
	mov	a,#0x03
	add	a, r5
	mov	b,#0x0b
	mul	ab
	add	a,#_bindings
	mov	r5,a
	clr	a
	addc	a, #(_bindings >> 8)
	mov	r4,a
;	minikeys.c:108: s[0] = TYPE_MEDIA << 5 | 2; s[1] = 0xEA; s[2] = 0;      // volume down
	mov	dpl,r5
	mov	dph,r4
	mov	a,#0x42
	movx	@dptr,a
	mov	dpl,r5
	mov	dph,r4
	inc	dptr
	mov	a,#0xea
	movx	@dptr,a
	mov	dpl,r5
	mov	dph,r4
	inc	dptr
	inc	dptr
	clr	a
	movx	@dptr,a
;	minikeys.c:109: s = bindings[i * CONTROLS + CTRL_KNOB_PRESS];
	mov	ar5,r6
	mov	a,#0x04
	add	a, r5
	mov	b,#0x0b
	mul	ab
	add	a,#_bindings
	mov	r5,a
	clr	a
	addc	a, #(_bindings >> 8)
	mov	r4,a
;	minikeys.c:110: s[0] = TYPE_MEDIA << 5 | 2; s[1] = 0xE2; s[2] = 0;      // mute
	mov	dpl,r5
	mov	dph,r4
	mov	a,#0x42
	movx	@dptr,a
	mov	dpl,r5
	mov	dph,r4
	inc	dptr
	mov	a,#0xe2
	movx	@dptr,a
	mov	dpl,r5
	mov	dph,r4
	inc	dptr
	inc	dptr
	clr	a
	movx	@dptr,a
;	minikeys.c:111: s = bindings[i * CONTROLS + CTRL_KNOB_RIGHT];
	mov	a,#0x05
	add	a, r6
	mov	b,#0x0b
	mul	ab
	add	a,#_bindings
	mov	r6,a
	clr	a
	addc	a, #(_bindings >> 8)
	mov	r5,a
;	minikeys.c:112: s[0] = TYPE_MEDIA << 5 | 2; s[1] = 0xE9; s[2] = 0;      // volume up
	mov	dpl,r6
	mov	dph,r5
	mov	a,#0x42
	movx	@dptr,a
	mov	dpl,r6
	mov	dph,r5
	inc	dptr
	mov	a,#0xe9
	movx	@dptr,a
	mov	dpl,r6
	mov	dph,r5
	inc	dptr
	inc	dptr
	clr	a
	movx	@dptr,a
;	minikeys.c:99: for(i=0; i<LAYERS; i++) {
	inc	r7
	cjne	r7,#0x03,00145$
00145$:
	jnc	00146$
	ljmp	00105$
00146$:
;	minikeys.c:114: light.effect = FX_WAVE; light.r = 255; light.g = 255; light.b = 255;
	mov	dptr,#_light
	mov	a,#0x02
	movx	@dptr,a
	mov	dptr,#(_light + 0x0001)
	mov	a,#0xff
	movx	@dptr,a
	mov	dptr,#(_light + 0x0002)
	movx	@dptr,a
	mov	dptr,#(_light + 0x0003)
	movx	@dptr,a
;	minikeys.c:115: light.speed = 5; light.brightness = 160; light.flags = FLAG_MULTICOLOR | FLAG_LAYERFLASH;
	mov	dptr,#(_light + 0x0004)
	mov	a,#0x05
	movx	@dptr,a
	mov	dptr,#(_light + 0x0005)
	mov	a,#0xa0
	movx	@dptr,a
	mov	dptr,#(_light + 0x0006)
	mov	a,#0x03
	movx	@dptr,a
;	minikeys.c:116: light.reserved = 0;
	mov	dptr,#(_light + 0x0007)
	clr	a
	movx	@dptr,a
;	minikeys.c:117: layerColors[0][0] = 0;   layerColors[0][1] = 120; layerColors[0][2] = 255;  // blue
	mov	dptr,#_layerColors
	movx	@dptr,a
	mov	dptr,#(_layerColors + 0x0001)
	mov	a,#0x78
	movx	@dptr,a
	mov	dptr,#(_layerColors + 0x0002)
	mov	a,#0xff
	movx	@dptr,a
;	minikeys.c:118: layerColors[1][0] = 0;   layerColors[1][1] = 255; layerColors[1][2] = 80;   // green
	mov	dptr,#(_layerColors + 0x0003)
	clr	a
	movx	@dptr,a
	mov	dptr,#(_layerColors + 0x0004)
	dec	a
	movx	@dptr,a
	mov	dptr,#(_layerColors + 0x0005)
	mov	a,#0x50
	movx	@dptr,a
;	minikeys.c:119: layerColors[2][0] = 255; layerColors[2][1] = 60;  layerColors[2][2] = 0;    // orange
	mov	dptr,#(_layerColors + 0x0006)
	mov	a,#0xff
	movx	@dptr,a
	mov	dptr,#(_layerColors + 0x0007)
	mov	a,#0x3c
	movx	@dptr,a
	mov	dptr,#(_layerColors + 0x0008)
	clr	a
	movx	@dptr,a
;	minikeys.c:120: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'loadSettings'
;------------------------------------------------------------
;i             Allocated with name '_loadSettings_i_10000_511'
;j             Allocated to registers r4 
;addr          Allocated to registers r7 
;header        Allocated to registers r5 
;len           Allocated with name '_loadSettings_len_10000_511'
;------------------------------------------------------------
;	minikeys.c:122: void loadSettings(void) {
;	-----------------------------------------
;	 function loadSettings
;	-----------------------------------------
_loadSettings:
;	minikeys.c:124: setDefaults();
	lcall	_setDefaults
;	minikeys.c:125: if(EEPROM_read(0) != FLASH_MAGIC || EEPROM_read(1) != FLASH_VERSION) return;
	mov	dpl, #0x00
	lcall	_EEPROM_read
	mov	r7, dpl
	cjne	r7,#0x4d,00101$
	mov	dpl, #0x01
	lcall	_EEPROM_read
	mov	r7, dpl
	cjne	r7,#0x01,00228$
	sjmp	00144$
00228$:
00101$:
	ret
;	minikeys.c:126: for(i=0; i<8; i++) ((__xdata uint8_t*)&light)[i] = EEPROM_read(FLASH_LIGHT + i);
00144$:
	mov	r7,#0x00
00118$:
	mov	a,r7
	add	a, #_light
	mov	r5,a
	clr	a
	addc	a, #(_light >> 8)
	mov	r6,a
	mov	ar4,r7
	mov	a,#0x02
	add	a, r4
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_EEPROM_read
	mov	r4, dpl
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	mov	a,r4
	movx	@dptr,a
	inc	r7
	cjne	r7,#0x08,00229$
00229$:
	jc	00118$
;	minikeys.c:127: for(i=0; i<LAYERS; i++)
	mov	r7,#0x00
;	minikeys.c:128: for(j=0; j<3; j++) layerColors[i][j] = EEPROM_read(FLASH_LAYERS + i * 3 + j);
00146$:
	mov	a,r7
	mov	b,#0x03
	mul	ab
	add	a, #_layerColors
	mov	r5,a
	mov	a,#(_layerColors >> 8)
	addc	a, b
	mov	r6,a
	mov	r4,#0x00
00120$:
	mov	a,r4
	add	a, r5
	mov	r2,a
	clr	a
	addc	a, r6
	mov	r3,a
	mov	ar1,r7
	mov	a,r1
	mov	b,#0x03
	mul	ab
	add	a, #0x0a
	mov	r1,a
	mov	ar0,r4
	mov	a,r0
	add	a, r1
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	lcall	_EEPROM_read
	mov	r1, dpl
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r2
	mov	dph,r3
	mov	a,r1
	movx	@dptr,a
	inc	r4
	cjne	r4,#0x03,00231$
00231$:
	jc	00120$
;	minikeys.c:127: for(i=0; i<LAYERS; i++)
	inc	r7
	cjne	r7,#0x03,00233$
00233$:
	jc	00146$
;	minikeys.c:129: if(light.effect >= FX_COUNT) light.effect = FX_WAVE;
	mov	dptr,#_light
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0x07,00235$
00235$:
	jc	00108$
	mov	dptr,#_light
	mov	a,#0x02
	movx	@dptr,a
00108$:
;	minikeys.c:130: if(!light.speed || light.speed > 10) light.speed = 5;
	mov	dptr,#(_light + 0x0004)
	movx	a,@dptr
	mov	r7,a
	jz	00109$
	mov	a,r7
	add	a,#0xff - 0x0a
	jnc	00110$
;	free result
00109$:
	mov	dptr,#(_light + 0x0004)
	mov	a,#0x05
	movx	@dptr,a
00110$:
;	minikeys.c:131: addr = FLASH_BINDINGS;
	mov	r7,#0x13
;	minikeys.c:132: for(i=0; i<LAYERS * CONTROLS; i++) {
	mov	_loadSettings_i_10000_511,#0x00
00127$:
;	minikeys.c:133: header = EEPROM_read(addr++);
	mov	dpl,r7
	inc	r7
	push	ar7
	lcall	_EEPROM_read
	mov	r5, dpl
	pop	ar7
;	minikeys.c:134: len = header & 0x1F;
	mov	a,#0x1f
	anl	a,r5
;	minikeys.c:135: if(len >= SLOT_LEN || addr + len > FLASH_SIZE) { bindings[i][0] = 0; continue; }
	mov	_loadSettings_len_10000_511,a
	clr	c
	subb	a,#0x0b
	jnc	00112$
	mov	ar2,r7
	mov	r3,#0x00
	mov	r0,_loadSettings_len_10000_511
	mov	r1,#0x00
	mov	a,r0
	add	a, r2
	mov	r2,a
	mov	a,r1
	addc	a, r3
	mov	r3,a
	clr	c
	mov	a,#0x80
	subb	a,r2
	mov	a,#(0x00 ^ 0x80)
	mov	b,r3
	xrl	b,#0x80
	subb	a,b
	jnc	00113$
;	free result
00112$:
	mov	a,_loadSettings_i_10000_511
	mov	b,#0x0b
	mul	ab
	add	a, #_bindings
	mov	dpl,a
	mov	a,#(_bindings >> 8)
	addc	a, b
	mov	dph,a
	clr	a
	movx	@dptr,a
	sjmp	00116$
00113$:
;	minikeys.c:136: bindings[i][0] = header;
	mov	a,_loadSettings_i_10000_511
	mov	b,#0x0b
	mul	ab
	add	a, #_bindings
	mov	r2,a
	mov	a,#(_bindings >> 8)
	addc	a, b
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	mov	a,r5
	movx	@dptr,a
;	minikeys.c:137: for(j=0; j<len; j++) bindings[i][1 + j] = EEPROM_read(addr++);
	mov	ar5,r7
	mov	r1,#0x00
00125$:
	clr	c
	mov	a,r1
	subb	a,_loadSettings_len_10000_511
	jnc	00158$
	mov	ar0,r1
	mov	a,r0
	inc	a
	add	a, r2
	mov	r0,a
	clr	a
	addc	a,r3
	mov	r4,a
	mov	dpl,r5
	inc	r5
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	push	ar1
	push	ar0
	lcall	_EEPROM_read
	mov	r6, dpl
	pop	ar0
	pop	ar1
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	mov	dpl,r0
	mov	dph,r4
	mov	a,r6
	movx	@dptr,a
	inc	r1
	sjmp	00125$
00158$:
	mov	ar7,r5
00116$:
;	minikeys.c:132: for(i=0; i<LAYERS * CONTROLS; i++) {
	inc	_loadSettings_i_10000_511
	mov	a,#0x100 - 0x12
	add	a,_loadSettings_i_10000_511
	jc	00242$
	ljmp	00127$
00242$:
;	minikeys.c:139: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'saveSettings'
;------------------------------------------------------------
;i             Allocated to registers r6 
;j             Allocated to registers r4 
;addr          Allocated to registers r7 
;len           Allocated to registers r3 
;total         Allocated to registers r7 
;------------------------------------------------------------
;	minikeys.c:142: uint8_t saveSettings(void) {
;	-----------------------------------------
;	 function saveSettings
;	-----------------------------------------
_saveSettings:
;	minikeys.c:143: uint8_t i, j, addr, len, total = FLASH_BINDINGS;
	mov	r7,#0x13
;	minikeys.c:144: for(i=0; i<LAYERS * CONTROLS; i++) total += 1 + (bindings[i][0] & 0x1F);
	mov	r6,#0x00
00109$:
	mov	a,r6
	mov	b,#0x0b
	mul	ab
	add	a, #_bindings
	mov	dpl,a
	mov	a,#(_bindings >> 8)
	addc	a, b
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	mov	a,#0x1f
	anl	a,r5
	inc	a
	mov	ar4,r7
	add	a, r4
	mov	r7,a
	inc	r6
	cjne	r6,#0x12,00220$
00220$:
	jc	00109$
;	minikeys.c:145: if(total > FLASH_SIZE) return 0;
	mov	a,r7
	add	a,#0xff - 0x80
	jnc	00103$
;	free result
	mov	dpl, #0x00
	ret
00103$:
;	minikeys.c:146: EEPROM_update(0, FLASH_MAGIC);
	mov	_EEPROM_update_PARM_2,#0x4d
	mov	dpl, #0x00
	lcall	_EEPROM_update
;	minikeys.c:147: EEPROM_update(1, FLASH_VERSION);
	mov	_EEPROM_update_PARM_2,#0x01
	mov	dpl, #0x01
	lcall	_EEPROM_update
;	minikeys.c:148: for(i=0; i<8; i++) EEPROM_update(FLASH_LIGHT + i, ((__xdata uint8_t*)&light)[i]);
	mov	r7,#0x00
00111$:
	mov	ar6,r7
	inc	r6
	inc	r6
	mov	a,r7
	add	a, #_light
	mov	dpl,a
	clr	a
	addc	a, #(_light >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	_EEPROM_update_PARM_2,a
	mov	dpl, r6
	push	ar7
	lcall	_EEPROM_update
	pop	ar7
	inc	r7
	cjne	r7,#0x08,00223$
00223$:
	jc	00111$
;	minikeys.c:149: for(i=0; i<LAYERS; i++)
	mov	r7,#0x00
;	minikeys.c:150: for(j=0; j<3; j++) EEPROM_update(FLASH_LAYERS + i * 3 + j, layerColors[i][j]);
00141$:
	mov	a,r7
	mov	b,#0x03
	mul	ab
	add	a, #_layerColors
	mov	r5,a
	mov	a,#(_layerColors >> 8)
	addc	a, b
	mov	r6,a
	mov	r4,#0x00
00113$:
	mov	ar3,r7
	mov	a,r3
	mov	b,#0x03
	mul	ab
	add	a, #0x0a
	mov	r3,a
	mov	ar2,r4
	mov	a,r2
	add	a, r3
	mov	r3,a
	mov	a,r4
	add	a, r5
	mov	dpl,a
	clr	a
	addc	a, r6
	mov	dph,a
	movx	a,@dptr
	mov	_EEPROM_update_PARM_2,a
	mov	dpl, r3
	push	ar7
	push	ar6
	push	ar5
	push	ar4
	lcall	_EEPROM_update
	pop	ar4
	pop	ar5
	pop	ar6
	pop	ar7
	inc	r4
	cjne	r4,#0x03,00225$
00225$:
	jc	00113$
;	minikeys.c:149: for(i=0; i<LAYERS; i++)
	inc	r7
	cjne	r7,#0x03,00227$
00227$:
	jc	00141$
;	minikeys.c:151: addr = FLASH_BINDINGS;
	mov	r7,#0x13
;	minikeys.c:152: for(i=0; i<LAYERS * CONTROLS; i++) {
	mov	r6,#0x00
00119$:
;	minikeys.c:153: len = bindings[i][0] & 0x1F;
	mov	a,r6
	mov	b,#0x0b
	mul	ab
	mov	r4,a
	mov	r5,b
	add	a, #_bindings
	mov	dpl,a
	mov	a,r5
	addc	a, #(_bindings >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r3,a
	anl	ar3,#0x1f
;	minikeys.c:154: for(j=0; j<=len; j++) EEPROM_update(addr++, bindings[i][j]);
	mov	a,r4
	add	a, #_bindings
	mov	r4,a
	mov	a,r5
	addc	a, #(_bindings >> 8)
	mov	r5,a
	mov	ar2,r7
	mov	r1,#0x00
00117$:
	mov	ar0,r2
	inc	r2
	mov	a,r1
	add	a, r4
	mov	dpl,a
	clr	a
	addc	a, r5
	mov	dph,a
	movx	a,@dptr
	mov	_EEPROM_update_PARM_2,a
	mov	dpl, r0
	push	ar6
	push	ar5
	push	ar4
	push	ar3
	push	ar2
	push	ar1
	lcall	_EEPROM_update
	pop	ar1
	pop	ar2
	pop	ar3
	pop	ar4
	pop	ar5
	pop	ar6
	inc	r1
	clr	c
	mov	a,r3
	subb	a,r1
	jnc	00117$
;	free result
;	minikeys.c:152: for(i=0; i<LAYERS * CONTROLS; i++) {
	mov	ar7,r2
	inc	r6
	cjne	r6,#0x12,00230$
00230$:
	jc	00119$
;	minikeys.c:156: return 1;
	mov	dpl, #0x01
;	minikeys.c:157: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sendKeys'
;------------------------------------------------------------
;extraKey      Allocated with name '_sendKeys_PARM_2'
;extraMods     Allocated to registers r7 
;i             Allocated to registers r7 
;n             Allocated to registers r6 
;------------------------------------------------------------
;	minikeys.c:172: void sendKeys(uint8_t extraMods, uint8_t extraKey) {
;	-----------------------------------------
;	 function sendKeys
;	-----------------------------------------
_sendKeys:
	mov	r7, dpl
;	minikeys.c:173: uint8_t i, n = 3;
	mov	r6,#0x03
;	minikeys.c:174: kbdReport[0] = 1;
	mov	dptr,#_kbdReport
	mov	a,#0x01
	movx	@dptr,a
;	minikeys.c:175: kbdReport[1] = extraMods;
	mov	dptr,#(_kbdReport + 0x0001)
	mov	a,r7
	movx	@dptr,a
;	minikeys.c:176: kbdReport[2] = 0;
	mov	dptr,#(_kbdReport + 0x0002)
	clr	a
	movx	@dptr,a
;	minikeys.c:177: for(i=3; i<9; i++) kbdReport[i] = 0;
	mov	r7,#0x03
00108$:
	mov	a,r7
	add	a, #_kbdReport
	mov	dpl,a
	clr	a
	addc	a, #(_kbdReport >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
	inc	r7
	cjne	r7,#0x09,00165$
00165$:
	jc	00108$
;	minikeys.c:178: if(extraKey) kbdReport[n++] = extraKey;
	mov	a,_sendKeys_PARM_2
	jz	00126$
	mov	r6,#0x04
	mov	dptr,#(_kbdReport + 0x0003)
	mov	a,_sendKeys_PARM_2
	movx	@dptr,a
;	minikeys.c:179: for(i=0; i<CONTROLS; i++) {
00126$:
	mov	ar7,r6
	mov	r6,#0x00
00110$:
;	minikeys.c:180: kbdReport[1] |= heldMods[i];
	mov	dptr,#(_kbdReport + 0x0001)
	movx	a,@dptr
	mov	r5,a
	mov	a,r6
	add	a, #_heldMods
	mov	dpl,a
	clr	a
	addc	a, #(_heldMods >> 8)
	mov	dph,a
	movx	a,@dptr
	orl	ar5,a
	mov	dptr,#(_kbdReport + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	minikeys.c:181: if(heldKeys[i] && n < 9) kbdReport[n++] = heldKeys[i];
	mov	a,r6
	add	a, #_heldKeys
	mov	dpl,a
	clr	a
	addc	a, #(_heldKeys >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
	jz	00111$
	cjne	r7,#0x09,00169$
00169$:
	jnc	00111$
	mov	a,r7
	add	a, #_kbdReport
	mov	dpl,a
	clr	a
	addc	a, #(_kbdReport >> 8)
	mov	dph,a
	inc	r7
	mov	a,r5
	movx	@dptr,a
00111$:
;	minikeys.c:179: for(i=0; i<CONTROLS; i++) {
	inc	r6
	cjne	r6,#0x06,00171$
00171$:
	jc	00110$
;	minikeys.c:183: HID_sendReport(kbdReport, sizeof(kbdReport));
	mov	_HID_sendReport_PARM_2,#0x09
	mov	dptr,#_kbdReport
;	minikeys.c:184: }
	ljmp	_HID_sendReport
;------------------------------------------------------------
;Allocation info for local variables in function 'sendMedia'
;------------------------------------------------------------
;usage         Allocated to registers r6 r7 
;------------------------------------------------------------
;	minikeys.c:186: void sendMedia(uint16_t usage) {
;	-----------------------------------------
;	 function sendMedia
;	-----------------------------------------
_sendMedia:
	mov	r6, dpl
	mov	r7, dph
;	minikeys.c:187: conReport[0] = 2;
	mov	dptr,#_conReport
	mov	a,#0x02
	movx	@dptr,a
;	minikeys.c:188: conReport[1] = usage & 0xFF;
	mov	ar5,r6
	mov	dptr,#(_conReport + 0x0001)
	mov	a,r5
	movx	@dptr,a
;	minikeys.c:189: conReport[2] = usage >> 8;
	mov	ar6,r7
	mov	dptr,#(_conReport + 0x0002)
	mov	a,r6
	movx	@dptr,a
;	minikeys.c:190: HID_sendReport(conReport, sizeof(conReport));
	mov	_HID_sendReport_PARM_2,#0x03
	mov	dptr,#_conReport
;	minikeys.c:191: }
	ljmp	_HID_sendReport
;------------------------------------------------------------
;Allocation info for local variables in function 'sendMouse'
;------------------------------------------------------------
;y             Allocated with name '_sendMouse_PARM_2'
;wheel         Allocated with name '_sendMouse_PARM_3'
;x             Allocated to registers r7 
;i             Allocated to registers r6 
;------------------------------------------------------------
;	minikeys.c:193: void sendMouse(int8_t x, int8_t y, int8_t wheel) {
;	-----------------------------------------
;	 function sendMouse
;	-----------------------------------------
_sendMouse:
	mov	r7, dpl
;	minikeys.c:195: mouseReport[0] = 3;
	mov	dptr,#_mouseReport
	mov	a,#0x03
	movx	@dptr,a
;	minikeys.c:196: mouseReport[1] = 0;
	mov	dptr,#(_mouseReport + 0x0001)
	clr	a
	movx	@dptr,a
;	minikeys.c:197: for(i=0; i<CONTROLS; i++) mouseReport[1] |= heldButtons[i];
	mov	r6,a
00102$:
	mov	dptr,#(_mouseReport + 0x0001)
	movx	a,@dptr
	mov	r5,a
	mov	a,r6
	add	a, #_heldButtons
	mov	dpl,a
	clr	a
	addc	a, #(_heldButtons >> 8)
	mov	dph,a
	movx	a,@dptr
	orl	ar5,a
	mov	dptr,#(_mouseReport + 0x0001)
	mov	a,r5
	movx	@dptr,a
	inc	r6
	cjne	r6,#0x06,00121$
00121$:
	jc	00102$
;	minikeys.c:198: mouseReport[2] = x;
	mov	dptr,#(_mouseReport + 0x0002)
	mov	a,r7
	movx	@dptr,a
;	minikeys.c:199: mouseReport[3] = y;
	mov	dptr,#(_mouseReport + 0x0003)
	mov	a,_sendMouse_PARM_2
	movx	@dptr,a
;	minikeys.c:200: mouseReport[4] = wheel;
	mov	dptr,#(_mouseReport + 0x0004)
	mov	a,_sendMouse_PARM_3
	movx	@dptr,a
;	minikeys.c:201: HID_sendReport(mouseReport, sizeof(mouseReport));
	mov	_HID_sendReport_PARM_2,#0x05
	mov	dptr,#_mouseReport
;	minikeys.c:202: }
	ljmp	_HID_sendReport
;------------------------------------------------------------
;Allocation info for local variables in function 'controlDown'
;------------------------------------------------------------
;ctrl          Allocated with name '_controlDown_ctrl_10000_545'
;s             Allocated to registers r5 r6 
;type          Allocated to registers r3 
;len           Allocated to registers r4 
;i             Allocated with name '_controlDown_i_10000_546'
;last          Allocated with name '_controlDown_last_10000_546'
;------------------------------------------------------------
;	minikeys.c:204: void controlDown(uint8_t ctrl) {
;	-----------------------------------------
;	 function controlDown
;	-----------------------------------------
_controlDown:
	mov	_controlDown_ctrl_10000_545,dpl
;	minikeys.c:205: __xdata uint8_t* s = bindings[activeLayer * CONTROLS + ctrl];
	mov	r0,#_activeLayer
	mov	a,@r0
	mov	b,#0x06
	mul	ab
	mov	r6,a
	mov	r5,b
	mov	r3,_controlDown_ctrl_10000_545
	mov	r4,#0x00
	mov	a,r3
	add	a, r6
	mov	__mulint_PARM_2,a
	mov	a,r4
	addc	a, r5
	mov	(__mulint_PARM_2 + 1),a
	mov	dptr,#0x000b
	lcall	__mulint
	mov	r5, dpl
	mov	r6, dph
	mov	a,r5
	add	a, #_bindings
	mov	r5,a
	mov	a,r6
	addc	a, #(_bindings >> 8)
	mov	r6,a
;	minikeys.c:206: uint8_t type = s[0] >> 5, len = s[0] & 0x1F, i, last;
	mov	dpl,r5
	mov	dph,r6
	movx	a,@dptr
	mov	r4,a
	swap	a
	rr	a
	anl	a,#0x07
	mov	r3,a
	anl	ar4,#0x1f
;	minikeys.c:207: switch(type) {
	cjne	r3,#0x01,00173$
	sjmp	00101$
00173$:
	cjne	r3,#0x02,00174$
	ljmp	00105$
00174$:
	cjne	r3,#0x03,00175$
	ljmp	00106$
00175$:
	ret
;	minikeys.c:208: case TYPE_KEYS:
00101$:
;	minikeys.c:209: if(len < 2) return;
	cjne	r4,#0x02,00176$
00176$:
	jnc	00103$
	ret
00103$:
;	minikeys.c:210: last = len - 2;
	mov	a,r4
	add	a,#0xfe
	mov	_controlDown_last_10000_546,a
;	minikeys.c:212: for(i=0; i<last; i+=2) {
	mov	_controlDown_i_10000_546,#0x00
00113$:
	clr	c
	mov	a,_controlDown_i_10000_546
	subb	a,_controlDown_last_10000_546
	jnc	00104$
;	minikeys.c:213: sendKeys(s[1 + i], s[2 + i]);
	mov	r2,_controlDown_i_10000_546
	mov	r4,#0x00
	mov	a,#0x01
	add	a, r2
	mov	r3,a
	clr	a
	addc	a, r4
	mov	r7,a
	mov	a,r3
	add	a, r5
	mov	dpl,a
	mov	a,r7
	addc	a, r6
	mov	dph,a
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x02
	add	a, r2
	mov	r2,a
	clr	a
	addc	a, r4
	mov	r4,a
	mov	a,r2
	add	a, r5
	mov	dpl,a
	mov	a,r4
	addc	a, r6
	mov	dph,a
	movx	a,@dptr
	mov	_sendKeys_PARM_2,a
	mov	dpl, r7
	push	ar6
	push	ar5
	lcall	_sendKeys
;	minikeys.c:214: sendKeys(0, 0);
	mov	_sendKeys_PARM_2,#0x00
	mov	dpl, #0x00
	lcall	_sendKeys
	pop	ar5
	pop	ar6
;	minikeys.c:212: for(i=0; i<last; i+=2) {
	mov	r3,_controlDown_i_10000_546
	mov	a,#0x02
	add	a, r3
	mov	_controlDown_i_10000_546,a
	sjmp	00113$
00104$:
;	minikeys.c:216: heldMods[ctrl] = s[1 + last];
	mov	a,_controlDown_ctrl_10000_545
	add	a, #_heldMods
	mov	r4,a
	clr	a
	addc	a, #(_heldMods >> 8)
	mov	r7,a
	mov	a,_controlDown_last_10000_546
	mov	r3,a
	inc	a
	add	a, r5
	mov	dpl,a
	clr	a
	addc	a,r6
	mov	dph,a
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r7
	movx	@dptr,a
;	minikeys.c:217: heldKeys[ctrl] = s[2 + last];
	mov	a,_controlDown_ctrl_10000_545
	add	a, #_heldKeys
	mov	r4,a
	clr	a
	addc	a, #(_heldKeys >> 8)
	mov	r7,a
	mov	a,#0x02
	add	a, r3
	add	a, r5
	mov	dpl,a
	clr	a
	addc	a,r6
	mov	dph,a
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r7
	movx	@dptr,a
;	minikeys.c:218: sendKeys(0, 0);
	mov	_sendKeys_PARM_2,#0x00
	mov	dpl, #0x00
;	minikeys.c:219: break;
	ljmp	_sendKeys
;	minikeys.c:220: case TYPE_MEDIA:
00105$:
;	minikeys.c:221: heldMediaCtrl = ctrl;
	mov	r0,#_heldMediaCtrl
	mov	@r0,_controlDown_ctrl_10000_545
;	minikeys.c:222: sendMedia(s[1] | (uint16_t)s[2] << 8);
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	clr	a
	mov	r2,a
	orl	a,r7
	mov	dpl,a
	mov	a,r3
	orl	a,r2
	mov	dph,a
;	minikeys.c:223: break;
	ljmp	_sendMedia
;	minikeys.c:224: case TYPE_MOUSE:
00106$:
;	minikeys.c:225: heldButtons[ctrl] = s[1];
	mov	a,_controlDown_ctrl_10000_545
	add	a, #_heldButtons
	mov	r4,a
	clr	a
	addc	a, #(_heldButtons >> 8)
	mov	r7,a
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r7
	movx	@dptr,a
;	minikeys.c:226: sendMouse(s[2], s[3], s[4]);
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	_sendMouse_PARM_2,a
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	inc	dptr
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	_sendMouse_PARM_3,a
	mov	dpl, r7
	push	ar6
	push	ar5
	lcall	_sendMouse
	pop	ar5
	pop	ar6
;	minikeys.c:227: if(s[2] || s[3] || s[4]) sendMouse(0, 0, 0);
	mov	a,#0x02
	add	a, r5
	mov	r4,a
	clr	a
	addc	a, r6
	mov	r7,a
	mov	dpl,r4
	mov	dph,r7
	movx	a,@dptr
	jnz	00107$
	mov	a,#0x03
	add	a, r5
	mov	r4,a
	clr	a
	addc	a, r6
	mov	r7,a
	mov	dpl,r4
	mov	dph,r7
	movx	a,@dptr
	jnz	00107$
	mov	a,#0x04
	add	a, r5
	mov	r5,a
	clr	a
	addc	a, r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	movx	a,@dptr
	jz	00115$
00107$:
	mov	_sendMouse_PARM_2,#0x00
	mov	_sendMouse_PARM_3,#0x00
	mov	dpl, #0x00
;	minikeys.c:229: }
;	minikeys.c:230: }
	ljmp	_sendMouse
00115$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'controlUp'
;------------------------------------------------------------
;ctrl          Allocated to registers r7 
;------------------------------------------------------------
;	minikeys.c:232: void controlUp(uint8_t ctrl) {
;	-----------------------------------------
;	 function controlUp
;	-----------------------------------------
_controlUp:
;	minikeys.c:233: if(heldMods[ctrl] || heldKeys[ctrl]) {
	mov	a,dpl
	mov	r7,a
	add	a, #_heldMods
	mov	r5,a
	clr	a
	addc	a, #(_heldMods >> 8)
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	movx	a,@dptr
	jnz	00101$
	mov	a,r7
	add	a, #_heldKeys
	mov	r3,a
	clr	a
	addc	a, #(_heldKeys >> 8)
	mov	r4,a
	mov	dpl,r3
	mov	dph,r4
	movx	a,@dptr
	jz	00102$
00101$:
;	minikeys.c:234: heldMods[ctrl] = 0;
	mov	dpl,r5
	mov	dph,r6
	clr	a
	movx	@dptr,a
;	minikeys.c:235: heldKeys[ctrl] = 0;
	mov	a,r7
	add	a, #_heldKeys
	mov	dpl,a
	clr	a
	addc	a, #(_heldKeys >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
;	minikeys.c:236: sendKeys(0, 0);
	mov	_sendKeys_PARM_2,a
	mov	dpl, #0x00
	push	ar7
	lcall	_sendKeys
	pop	ar7
00102$:
;	minikeys.c:238: if(heldMediaCtrl == ctrl) {
	mov	r0,#_heldMediaCtrl
	mov	a,@r0
	cjne	a,ar7,00105$
;	minikeys.c:239: heldMediaCtrl = 0xFF;
	mov	r0,#_heldMediaCtrl
	mov	@r0,#0xff
;	minikeys.c:240: sendMedia(0);
	mov	dptr,#0x0000
	push	ar7
	lcall	_sendMedia
	pop	ar7
00105$:
;	minikeys.c:242: if(heldButtons[ctrl]) {
	mov	a,r7
	add	a, #_heldButtons
	mov	r6,a
	clr	a
	addc	a, #(_heldButtons >> 8)
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	movx	a,@dptr
	jz	00108$
;	minikeys.c:243: heldButtons[ctrl] = 0;
	mov	dpl,r6
	mov	dph,r7
	clr	a
	movx	@dptr,a
;	minikeys.c:244: sendMouse(0, 0, 0);
	mov	_sendMouse_PARM_2,a
	mov	_sendMouse_PARM_3,a
	mov	dpl, #0x00
;	minikeys.c:246: }
	ljmp	_sendMouse
00108$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'releaseAll'
;------------------------------------------------------------
;i             Allocated to registers r7 
;------------------------------------------------------------
;	minikeys.c:248: void releaseAll(void) {
;	-----------------------------------------
;	 function releaseAll
;	-----------------------------------------
_releaseAll:
;	minikeys.c:250: for(i=0; i<CONTROLS; i++) controlUp(i);
	mov	r7,#0x00
00102$:
	mov	dpl, r7
	push	ar7
	lcall	_controlUp
	pop	ar7
	inc	r7
	cjne	r7,#0x06,00114$
00114$:
	jc	00102$
;	minikeys.c:251: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setPixel'
;------------------------------------------------------------
;r             Allocated with name '_setPixel_PARM_2'
;g             Allocated with name '_setPixel_PARM_3'
;b             Allocated with name '_setPixel_PARM_4'
;i             Allocated to registers r7 
;------------------------------------------------------------
;	minikeys.c:269: void setPixel(uint8_t i, uint8_t r, uint8_t g, uint8_t b) {
;	-----------------------------------------
;	 function setPixel
;	-----------------------------------------
_setPixel:
;	minikeys.c:270: pixels[i][0] = r; pixels[i][1] = g; pixels[i][2] = b;
	mov	a,dpl
	mov	b,#0x03
	mul	ab
	add	a, #_pixels
	mov	r6,a
	mov	a,#(_pixels >> 8)
	addc	a, b
	mov	r7,a
	mov	dpl,r6
	mov	dph,r7
	mov	a,_setPixel_PARM_2
	movx	@dptr,a
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	mov	a,_setPixel_PARM_3
	movx	@dptr,a
	mov	dpl,r6
	mov	dph,r7
	inc	dptr
	inc	dptr
	mov	a,_setPixel_PARM_4
	movx	@dptr,a
;	minikeys.c:271: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setPixelScaled'
;------------------------------------------------------------
;color         Allocated with name '_setPixelScaled_PARM_2'
;level         Allocated with name '_setPixelScaled_PARM_3'
;i             Allocated to registers r7 
;------------------------------------------------------------
;	minikeys.c:273: void setPixelScaled(uint8_t i, __xdata uint8_t* color, uint8_t level) {
;	-----------------------------------------
;	 function setPixelScaled
;	-----------------------------------------
_setPixelScaled:
	mov	r7, dpl
;	minikeys.c:274: setPixel(i, ((uint16_t)color[0] * level) >> 8, ((uint16_t)color[1] * level) >> 8,
	mov	r5,_setPixelScaled_PARM_2
	mov	r6,(_setPixelScaled_PARM_2 + 1)
	mov	dpl,r5
	mov	dph,r6
	movx	a,@dptr
	mov	r4,a
	mov	r3,_setPixelScaled_PARM_3
	mov	ar2,r3
	mov	b,r4
	mov	a,r2
	mul	ab
	mov	r4,b
	mov	_setPixel_PARM_2,r4
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	ar2,r3
	mov	b,r4
	mov	a,r2
	mul	ab
	mov	r4,b
	mov	_setPixel_PARM_3,r4
;	minikeys.c:275: ((uint16_t)color[2] * level) >> 8);
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	b, a
	mov	a,r3
	mul	ab
	mov	r5,b
	mov	_setPixel_PARM_4,r5
	mov	dpl, r7
;	minikeys.c:276: }
	ljmp	_setPixel
;------------------------------------------------------------
;Allocation info for local variables in function 'setPixelHue'
;------------------------------------------------------------
;hue           Allocated with name '_setPixelHue_PARM_2'
;i             Allocated to registers r7 
;region        Allocated to registers r6 
;rise          Allocated to registers r5 
;fall          Allocated to registers r4 
;------------------------------------------------------------
;	minikeys.c:278: void setPixelHue(uint8_t i, uint8_t hue) {
;	-----------------------------------------
;	 function setPixelHue
;	-----------------------------------------
_setPixelHue:
	mov	r7, dpl
;	minikeys.c:279: uint8_t region = hue / 43, rise = (hue - region * 43) * 6, fall = 255 - rise;
	mov	r6,_setPixelHue_PARM_2
	mov	b,#0x2b
	mov	a,r6
	div	ab
	mov	r6,a
	mov	b,#0x2b
	mul	ab
	mov	r5,a
	mov	a,_setPixelHue_PARM_2
	clr	c
	subb	a,r5
	mov	b,#0x06
	mul	ab
	mov	r5,a
	mov	r4,a
	mov	a,#0xff
	clr	c
	subb	a,r4
	mov	r4,a
;	minikeys.c:280: switch(region) {
	mov	a,r6
	add	a,#0xff - 0x04
	jc	00106$
;	free result
	mov	a,r6
	add	a,r6
;	minikeys.c:281: case 0:  setPixel(i, 255, rise, 0); break;
	mov	dptr,#00118$
	jmp	@a+dptr
00118$:
	sjmp	00101$
	sjmp	00102$
	sjmp	00103$
	sjmp	00104$
	sjmp	00105$
00101$:
	mov	_setPixel_PARM_2,#0xff
	mov	_setPixel_PARM_3,r5
	mov	_setPixel_PARM_4,#0x00
	mov	dpl, r7
;	minikeys.c:282: case 1:  setPixel(i, fall, 255, 0); break;
	ljmp	_setPixel
00102$:
	mov	_setPixel_PARM_2,r4
	mov	_setPixel_PARM_3,#0xff
	mov	_setPixel_PARM_4,#0x00
	mov	dpl, r7
;	minikeys.c:283: case 2:  setPixel(i, 0, 255, rise); break;
	ljmp	_setPixel
00103$:
	mov	_setPixel_PARM_2,#0x00
	mov	_setPixel_PARM_3,#0xff
	mov	_setPixel_PARM_4,r5
	mov	dpl, r7
;	minikeys.c:284: case 3:  setPixel(i, 0, fall, 255); break;
	ljmp	_setPixel
00104$:
	mov	_setPixel_PARM_2,#0x00
	mov	_setPixel_PARM_3,r4
	mov	_setPixel_PARM_4,#0xff
	mov	dpl, r7
;	minikeys.c:285: case 4:  setPixel(i, rise, 0, 255); break;
	ljmp	_setPixel
00105$:
	mov	_setPixel_PARM_2,r5
	mov	_setPixel_PARM_3,#0x00
	mov	_setPixel_PARM_4,#0xff
	mov	dpl, r7
;	minikeys.c:286: default: setPixel(i, 255, 0, fall); break;
	ljmp	_setPixel
00106$:
	mov	_setPixel_PARM_2,#0xff
	mov	_setPixel_PARM_3,#0x00
	mov	_setPixel_PARM_4,r4
	mov	dpl, r7
;	minikeys.c:287: }
;	minikeys.c:288: }
	ljmp	_setPixel
;------------------------------------------------------------
;Allocation info for local variables in function 'lightColor'
;------------------------------------------------------------
;	minikeys.c:292: __xdata uint8_t* lightColor(void) {
;	-----------------------------------------
;	 function lightColor
;	-----------------------------------------
_lightColor:
;	minikeys.c:293: tmpColor[0] = light.r; tmpColor[1] = light.g; tmpColor[2] = light.b;
	mov	dptr,#(_light + 0x0001)
	movx	a,@dptr
	mov	dptr,#_tmpColor
	movx	@dptr,a
	mov	dptr,#(_light + 0x0002)
	movx	a,@dptr
	mov	dptr,#(_tmpColor + 0x0001)
	movx	@dptr,a
	mov	dptr,#(_light + 0x0003)
	movx	a,@dptr
	mov	dptr,#(_tmpColor + 0x0002)
	movx	@dptr,a
;	minikeys.c:294: return tmpColor;
	mov	dptr,#_tmpColor
;	minikeys.c:295: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'flashPress'
;------------------------------------------------------------
;key           Allocated to registers r7 
;i             Allocated with name '_flashPress_i_10000_575'
;pixel         Allocated to registers r7 
;------------------------------------------------------------
;	minikeys.c:297: void flashPress(uint8_t key) {
;	-----------------------------------------
;	 function flashPress
;	-----------------------------------------
_flashPress:
;	minikeys.c:298: uint8_t i, pixel = keyPixel[key];
	mov	a,dpl
;	minikeys.c:299: pressLevel[pixel] = 255;
	mov	dptr,#_keyPixel
	movc	a,@a+dptr
	mov	r7,a
	add	a, #_pressLevel
	mov	dpl,a
	clr	a
	addc	a, #(_pressLevel >> 8)
	mov	dph,a
	mov	a,#0xff
	movx	@dptr,a
;	minikeys.c:300: for(i=0; i<3; i++)
	mov	a,r7
	mov	b,#0x03
	mul	ab
	add	a, #_pressColor
	mov	r6,a
	mov	a,#(_pressColor >> 8)
	addc	a, b
	mov	r7,a
	mov	_flashPress_i_10000_575,#0x00
00102$:
;	minikeys.c:301: pressColor[pixel][i] = (light.flags & FLAG_MULTICOLOR) ? palette[pressCount & 3][i]
	mov	a,_flashPress_i_10000_575
	add	a, r6
	mov	r3,a
	clr	a
	addc	a, r7
	mov	r4,a
	mov	dptr,#(_light + 0x0006)
	movx	a,@dptr
	jnb	acc.0,00106$
	mov	r0,#_pressCount
	mov	ar2,@r0
	mov	a,#0x03
	anl	a,r2
	mov	b,#0x03
	mul	ab
	add	a,#_palette
	mov	r2,a
	clr	a
	addc	a, #(_palette >> 8)
	mov	r5,a
	mov	a,_flashPress_i_10000_575
	add	a, r2
	mov	dpl,a
	clr	a
	addc	a, r5
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	r5,a
	sjmp	00107$
00106$:
;	minikeys.c:302: : ((__xdata uint8_t*)&light.r)[i];
	mov	a,_flashPress_i_10000_575
	add	a, #(_light + 0x0001)
	mov	dpl,a
	clr	a
	addc	a, #((_light + 0x0001) >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r5,a
00107$:
	mov	dpl,r3
	mov	dph,r4
	mov	a,r5
	movx	@dptr,a
;	minikeys.c:300: for(i=0; i<3; i++)
	inc	_flashPress_i_10000_575
	mov	a,#0x100 - 0x03
	add	a,_flashPress_i_10000_575
	jnc	00102$
;	minikeys.c:303: pressCount++;
	mov	r0,#_pressCount
	inc	@r0
;	minikeys.c:304: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'renderLights'
;------------------------------------------------------------
;i             Allocated with name '_renderLights_i_10000_578'
;level         Allocated to registers r6 
;step          Allocated to registers r7 
;phase         Allocated with name '_renderLights_phase_10000_578'
;cycle         Allocated to registers r4 
;color         Allocated to registers r6 r7 
;------------------------------------------------------------
;	minikeys.c:306: void renderLights(void) {
;	-----------------------------------------
;	 function renderLights
;	-----------------------------------------
_renderLights:
;	minikeys.c:308: __xdata uint8_t* color = lightColor();
	lcall	_lightColor
	mov	r6, dpl
	mov	r7, dph
;	minikeys.c:310: for(i=0; i<NEO_COUNT; i++) setPixel(i, 0, 0, 0);
	mov	r5,#0x00
00136$:
	mov	_setPixel_PARM_2,#0x00
	mov	_setPixel_PARM_3,#0x00
	mov	_setPixel_PARM_4,#0x00
	mov	dpl, r5
	push	ar7
	push	ar6
	push	ar5
	lcall	_setPixel
	pop	ar5
	pop	ar6
	pop	ar7
	inc	r5
	cjne	r5,#0x03,00444$
00444$:
	jc	00136$
;	minikeys.c:312: switch(light.effect) {
	mov	dptr,#_light
	movx	a,@dptr
	mov  r5,a
	add	a,#0xff - 0x06
	jnc	00446$
	ljmp	00219$
00446$:
;	free result
	mov	a,r5
	add	a,r5
	add	a,r5
	mov	dptr,#00447$
	jmp	@a+dptr
00447$:
	ljmp	00219$
	ljmp	00219$
	ljmp	00108$
	ljmp	00204$
	ljmp	00104$
	ljmp	00209$
	ljmp	00114$
;	minikeys.c:314: for(i=0; i<NEO_COUNT; i++) setPixelScaled(i, color, 255);
00204$:
	mov	r5,#0x00
00138$:
	mov	_setPixelScaled_PARM_2,r6
	mov	(_setPixelScaled_PARM_2 + 1),r7
	mov	_setPixelScaled_PARM_3,#0xff
	mov	dpl, r5
	push	ar7
	push	ar6
	push	ar5
	lcall	_setPixelScaled
	pop	ar5
	pop	ar6
	pop	ar7
	inc	r5
	cjne	r5,#0x03,00448$
00448$:
	jc	00138$
;	minikeys.c:315: break;
	ljmp	00219$
;	minikeys.c:317: case FX_BREATHE:
00104$:
;	minikeys.c:318: phase = frame * light.speed;
	mov	dptr,#(_light + 0x0004)
	movx	a,@dptr
	mov	r5,a
	mov	r0,#_frame
	mov	ar4,@r0
	mov	b,r4
	mov	a,r5
	mul	ab
	mov	r5,a
;	minikeys.c:319: level = phase < 128 ? phase * 2 : (255 - phase) * 2;
	cjne	r5,#0x80,00450$
00450$:
	jnc	00162$
	mov	ar3,r5
	mov	r4,#0x00
	mov	a,r3
	add	a,r3
	mov	r3,a
	mov	a,r4
	rlc	a
	sjmp	00163$
00162$:
	mov	a,#0xff
	clr	c
	subb	a,r5
	mov	r5,a
	rlc	a
	subb	a,acc
	mov	r2,a
	mov	a,r5
	add	a,r5
	mov	r3,a
	mov	a,r2
	rlc	a
00163$:
;	minikeys.c:320: for(i=0; i<NEO_COUNT; i++) setPixelScaled(i, color, level);
	mov	r5,#0x00
00140$:
	mov	_setPixelScaled_PARM_2,r6
	mov	(_setPixelScaled_PARM_2 + 1),r7
	mov	_setPixelScaled_PARM_3,r3
	mov	dpl, r5
	push	ar7
	push	ar6
	push	ar5
	push	ar3
	lcall	_setPixelScaled
	pop	ar3
	pop	ar5
	pop	ar6
	pop	ar7
	inc	r5
	cjne	r5,#0x03,00452$
00452$:
	jc	00140$
;	minikeys.c:321: break;
	ljmp	00219$
;	minikeys.c:324: for(i=0; i<NEO_COUNT; i++) setPixelHue(i, frame * light.speed + i * 40);
00209$:
	mov	r7,#0x00
00142$:
	mov	dptr,#(_light + 0x0004)
	movx	a,@dptr
	mov	r6,a
	mov	r0,#_frame
	mov	ar5,@r0
	mov	b,r5
	mov	a,r6
	mul	ab
	mov	r6,a
	mov	ar5,r7
	mov	a,r5
	mov	b,#0x28
	mul	ab
	add	a, r6
	mov	_setPixelHue_PARM_2,a
	mov	dpl, r7
	push	ar7
	lcall	_setPixelHue
	pop	ar7
	inc	r7
	cjne	r7,#0x03,00454$
00454$:
	jc	00142$
;	minikeys.c:325: break;
	ljmp	00219$
;	minikeys.c:327: case FX_WAVE:
00108$:
;	minikeys.c:328: step = 16 - light.speed;              // frames per key
	mov	dptr,#(_light + 0x0004)
	movx	a,@dptr
	mov	r7,a
	mov	a,#0x10
	clr	c
	subb	a,r7
;	minikeys.c:329: cycle = frame / step / 6;             // 3 keys lit, then 3 steps dark
	mov	__divuint_PARM_2, a
	mov	(__divuint_PARM_2 + 1),#0x00
	mov	r0,#_frame
	mov	dpl, @r0
	inc	r0
	mov	dph, @r0
	lcall	__divuint
	mov	r6,dpl
	mov	r7,dph
	mov	__divuint_PARM_2,#0x06
	mov	(__divuint_PARM_2 + 1),#0x00
	push	ar7
	push	ar6
	lcall	__divuint
	mov	r4, dpl
	pop	ar6
	pop	ar7
;	minikeys.c:330: phase = (frame / step) % 6;
	mov	__moduint_PARM_2,#0x06
	mov	(__moduint_PARM_2 + 1),#0x00
	mov	dpl, r6
	mov	dph, r7
	push	ar4
	lcall	__moduint
	mov	r6, dpl
	pop	ar4
	mov	_renderLights_phase_10000_578,r6
;	minikeys.c:331: if(phase < 3) {
	mov	a,#0x100 - 0x03
	add	a,_renderLights_phase_10000_578
	jnc	00456$
	ljmp	00219$
00456$:
;	minikeys.c:332: if(light.flags & FLAG_MULTICOLOR) {
	mov	dptr,#(_light + 0x0006)
	movx	a,@dptr
	jnb	acc.0,00111$
;	minikeys.c:333: for(i=0; i<3; i++) tmpColor[i] = palette[cycle % 3][i];
	mov	r7,#0x00
00144$:
	mov	a,r7
	add	a, #_tmpColor
	mov	r3,a
	clr	a
	addc	a, #(_tmpColor >> 8)
	mov	r5,a
	mov	ar2,r4
	mov	b,#0x03
	mov	a,r2
	div	ab
	mov	a,b
	mov	b,#0x03
	mul	ab
	add	a,#_palette
	mov	r2,a
	clr	a
	addc	a, #(_palette >> 8)
	mov	r6,a
	mov	a,r7
	add	a, r2
	mov	dpl,a
	clr	a
	addc	a, r6
	mov	dph,a
	clr	a
	movc	a,@a+dptr
	mov	dpl,r3
	mov	dph,r5
	movx	@dptr,a
	inc	r7
	cjne	r7,#0x03,00458$
00458$:
	jc	00144$
00111$:
;	minikeys.c:335: setPixelScaled(keyPixel[phase], tmpColor, 255);
	mov	a,_renderLights_phase_10000_578
	mov	dptr,#_keyPixel
	movc	a,@a+dptr
	mov	r7,a
	mov	_setPixelScaled_PARM_2,#_tmpColor
	mov	(_setPixelScaled_PARM_2 + 1),#(_tmpColor >> 8)
	mov	_setPixelScaled_PARM_3,#0xff
	mov	dpl, r7
	lcall	_setPixelScaled
;	minikeys.c:337: break;
;	minikeys.c:339: case FX_LAYER:
	sjmp	00219$
00114$:
;	minikeys.c:340: setPixelScaled(0, layerColors[activeLayer], 255);
	mov	r0,#_activeLayer
	mov	a,@r0
	mov	b,#0x03
	mul	ab
	add	a, #_layerColors
	mov	_setPixelScaled_PARM_2,a
	mov	a,#(_layerColors >> 8)
	addc	a, b
	mov	(_setPixelScaled_PARM_2 + 1),a
	mov	_setPixelScaled_PARM_3,#0xff
	mov	dpl, #0x00
	lcall	_setPixelScaled
;	minikeys.c:341: for(i=1; i<NEO_COUNT; i++) setPixelScaled(i, layerColors[activeLayer], 255);
	mov	r7,#0x01
00146$:
	mov	r0,#_activeLayer
	mov	a,@r0
	mov	b,#0x03
	mul	ab
	add	a, #_layerColors
	mov	_setPixelScaled_PARM_2,a
	mov	a,#(_layerColors >> 8)
	addc	a, b
	mov	(_setPixelScaled_PARM_2 + 1),a
	mov	_setPixelScaled_PARM_3,#0xff
	mov	dpl, r7
	push	ar7
	lcall	_setPixelScaled
	pop	ar7
	inc	r7
	cjne	r7,#0x03,00460$
00460$:
	jc	00146$
;	minikeys.c:346: for(i=0; i<NEO_COUNT; i++) {
00219$:
	mov	r7,#0x00
00148$:
;	minikeys.c:347: if(pressLevel[i] && light.effect != FX_OFF && light.effect != FX_WAVE)
	mov	a,r7
	add	a, #_pressLevel
	mov	dpl,a
	clr	a
	addc	a, #(_pressLevel >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r6,a
	jz	00118$
	mov	dptr,#_light
	movx	a,@dptr
	mov	r5,a
	jz	00118$
	cjne	r5,#0x02,00464$
	sjmp	00118$
00464$:
;	minikeys.c:348: setPixelScaled(i, pressColor[i], pressLevel[i]);
	mov	a,r7
	mov	b,#0x03
	mul	ab
	add	a, #_pressColor
	mov	_setPixelScaled_PARM_2,a
	mov	a,#(_pressColor >> 8)
	addc	a, b
	mov	(_setPixelScaled_PARM_2 + 1),a
	mov	_setPixelScaled_PARM_3,r6
	mov	dpl, r7
	push	ar7
	lcall	_setPixelScaled
	pop	ar7
00118$:
;	minikeys.c:349: level = 4 + light.speed * 3;
	mov	dptr,#(_light + 0x0004)
	movx	a,@dptr
	mov	b,#0x03
	mul	ab
	add	a, #0x04
	mov	r6,a
;	minikeys.c:350: pressLevel[i] = pressLevel[i] > level ? pressLevel[i] - level : 0;
	mov	a,r7
	add	a, #_pressLevel
	mov	r4,a
	clr	a
	addc	a, #(_pressLevel >> 8)
	mov	r5,a
	mov	dpl,r4
	mov	dph,r5
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,r6
	subb	a,r3
	jnc	00164$
;	free result
	mov	dpl,r4
	mov	dph,r5
	movx	a,@dptr
	clr	c
	subb	a,r6
	mov	r6,a
	sjmp	00165$
00164$:
	mov	r6,#0x00
00165$:
	mov	dpl,r4
	mov	dph,r5
	mov	a,r6
	movx	@dptr,a
;	minikeys.c:346: for(i=0; i<NEO_COUNT; i++) {
	inc	r7
	cjne	r7,#0x03,00466$
00466$:
	jc	00148$
;	minikeys.c:354: if(layerFlashFrames) {
	mov	r0,#_layerFlashFrames
	mov	a,@r0
	jz	00128$
;	minikeys.c:355: layerFlashFrames--;
	mov	r0,#_layerFlashFrames
	dec	@r0
;	minikeys.c:356: if(layerFlashFrames % 15 >= 6)
	mov	r0,#_layerFlashFrames
	mov	ar7,@r0
	mov	b,#0x0f
	mov	a,r7
	div	ab
	mov	r7,b
	cjne	r7,#0x06,00469$
00469$:
	jc	00225$
;	minikeys.c:357: for(i=0; i<NEO_COUNT; i++) setPixelScaled(i, layerColors[activeLayer], 255);
	mov	r7,#0x00
00150$:
	mov	r0,#_activeLayer
	mov	a,@r0
	mov	b,#0x03
	mul	ab
	add	a, #_layerColors
	mov	_setPixelScaled_PARM_2,a
	mov	a,#(_layerColors >> 8)
	addc	a, b
	mov	(_setPixelScaled_PARM_2 + 1),a
	mov	_setPixelScaled_PARM_3,#0xff
	mov	dpl, r7
	push	ar7
	lcall	_setPixelScaled
	pop	ar7
	inc	r7
	cjne	r7,#0x03,00471$
00471$:
	jc	00150$
;	minikeys.c:359: for(i=0; i<NEO_COUNT; i++) setPixel(i, 0, 0, 0);
	sjmp	00128$
00225$:
	mov	r7,#0x00
00152$:
	mov	_setPixel_PARM_2,#0x00
	mov	_setPixel_PARM_3,#0x00
	mov	_setPixel_PARM_4,#0x00
	mov	dpl, r7
	push	ar7
	lcall	_setPixel
	pop	ar7
	inc	r7
	cjne	r7,#0x03,00473$
00473$:
	jc	00152$
00128$:
;	minikeys.c:363: if(errorFlashFrames) {
	mov	r0,#_errorFlashFrames
	mov	a,@r0
	jz	00230$
;	minikeys.c:364: errorFlashFrames--;
	mov	r0,#_errorFlashFrames
	dec	@r0
;	minikeys.c:365: for(i=0; i<NEO_COUNT; i++)
	mov	r7,#0x00
00154$:
;	minikeys.c:366: setPixel(i, errorFlashFrames % 10 >= 5 ? 255 : 0, 0, 0);
	mov	r0,#_errorFlashFrames
	mov	ar6,@r0
	mov	b,#0x0a
	mov	a,r6
	div	ab
	mov	r6,b
	cjne	r6,#0x05,00476$
00476$:
	jc	00166$
	mov	r6,#0xff
	sjmp	00167$
00166$:
	mov	r6,#0x00
00167$:
	mov	_setPixel_PARM_2,r6
	mov	_setPixel_PARM_3,#0x00
	mov	_setPixel_PARM_4,#0x00
	mov	dpl, r7
	push	ar7
	lcall	_setPixel
	pop	ar7
;	minikeys.c:365: for(i=0; i<NEO_COUNT; i++)
	inc	r7
	cjne	r7,#0x03,00478$
00478$:
	jc	00154$
;	minikeys.c:369: for(i=0; i<NEO_COUNT; i++) {
00230$:
	mov	r7,#0x00
00156$:
;	minikeys.c:370: if(overrideMask & (1 << i)) setPixelScaled(i, overrideColors[i], 255);
	mov	b,r7
	inc	b
	mov	r5,#0x01
	mov	r6,#0x00
	sjmp	00481$
00480$:
	mov	a,r5
	add	a,r5
	mov	r5,a
	mov	a,r6
	rlc	a
	mov	r6,a
00481$:
	djnz	b,00480$
	mov	r0,#_overrideMask
	mov	ar3,@r0
	mov	r4,#0x00
	mov	a,r3
	anl	ar5,a
	mov	a,r4
	anl	ar6,a
	mov	a,r5
	orl	a,r6
	jz	00157$
	mov	a,r7
	mov	b,#0x03
	mul	ab
	add	a, #_overrideColors
	mov	_setPixelScaled_PARM_2,a
	mov	a,#(_overrideColors >> 8)
	addc	a, b
	mov	(_setPixelScaled_PARM_2 + 1),a
	mov	_setPixelScaled_PARM_3,#0xff
	mov	dpl, r7
	push	ar7
	lcall	_setPixelScaled
	pop	ar7
00157$:
;	minikeys.c:369: for(i=0; i<NEO_COUNT; i++) {
	inc	r7
	cjne	r7,#0x03,00483$
00483$:
	jc	00156$
;	minikeys.c:373: EA = 0;
;	assignBit
	clr	_EA
;	minikeys.c:374: for(i=0; i<NEO_COUNT; i++) {
	mov	_renderLights_i_10000_578,#0x00
00158$:
;	minikeys.c:375: NEO_writeColor(((uint16_t)pixels[i][0] * light.brightness) >> 8,
	mov	a,_renderLights_i_10000_578
	mov	b,#0x03
	mul	ab
	add	a, #_pixels
	mov	r5,a
	mov	a,#(_pixels >> 8)
	addc	a, b
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#(_light + 0x0005)
	movx	a,@dptr
	mov	r3,a
	mov	b,r4
	mul	ab
	mov	r4,b
	mov	ar2,r4
;	minikeys.c:376: ((uint16_t)pixels[i][1] * light.brightness) >> 8,
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	ar7,r3
	mov	b,r4
	mov	a,r7
	mul	ab
	mov	r4,b
	mov	_NEO_writeColor_PARM_2,r4
;	minikeys.c:377: ((uint16_t)pixels[i][2] * light.brightness) >> 8);
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	inc	dptr
	movx	a,@dptr
	mov	b, a
	mov	a,r3
	mul	ab
	mov	r6,b
	mov	_NEO_writeColor_PARM_3,r6
	mov	dpl, r2
	lcall	_NEO_writeColor
;	minikeys.c:374: for(i=0; i<NEO_COUNT; i++) {
	inc	_renderLights_i_10000_578
	mov	a,#0x100 - 0x03
	add	a,_renderLights_i_10000_578
	jnc	00158$
;	minikeys.c:379: EA = 1;
;	assignBit
	setb	_EA
;	minikeys.c:380: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'setLayer'
;------------------------------------------------------------
;layer         Allocated to registers r7 
;------------------------------------------------------------
;	minikeys.c:382: void setLayer(uint8_t layer) {
;	-----------------------------------------
;	 function setLayer
;	-----------------------------------------
_setLayer:
	mov	r7, dpl
;	minikeys.c:383: if(layer >= LAYERS) return;
	cjne	r7,#0x03,00130$
00130$:
	jc	00102$
	ret
00102$:
;	minikeys.c:384: editLayer = layer;
	mov	r0,#_editLayer
	mov	@r0,ar7
;	minikeys.c:385: if(layer == activeLayer) return;
	mov	r0,#_activeLayer
	mov	a,@r0
	cjne	a,ar7,00104$
	ret
00104$:
;	minikeys.c:386: releaseAll();
	push	ar7
	lcall	_releaseAll
	pop	ar7
;	minikeys.c:387: activeLayer = layer;
	mov	r0,#_activeLayer
	mov	@r0,ar7
;	minikeys.c:388: if(light.flags & FLAG_LAYERFLASH) layerFlashFrames = (layer + 1) * 15;
	mov	dptr,#(_light + 0x0006)
	movx	a,@dptr
	jnb	acc.1,00107$
	inc	r7
	mov	r0,#_layerFlashFrames
	mov	a,r7
	mov	b,#0x0f
	mul	ab
	mov	@r0,a
00107$:
;	minikeys.c:389: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'enterBootloader'
;------------------------------------------------------------
;i             Allocated to registers r7 
;------------------------------------------------------------
;	minikeys.c:391: void enterBootloader(void) {
;	-----------------------------------------
;	 function enterBootloader
;	-----------------------------------------
_enterBootloader:
;	minikeys.c:393: EA = 0;
;	assignBit
	clr	_EA
;	minikeys.c:394: for(i=0; i<NEO_COUNT * 3; i++) NEO_sendByte(100);   // all white
	mov	r7,#0x00
00103$:
	mov	dpl, #0x64
	push	ar7
	lcall	_NEO_sendByte
	pop	ar7
	inc	r7
	cjne	r7,#0x09,00122$
00122$:
	jc	00103$
;	src/system.h:161: USB_CTRL = 0;
	mov	_USB_CTRL,#0x00
;	src/system.h:162: EA       = 0;
;	assignBit
	clr	_EA
;	src/system.h:163: TMOD     = 0;
	mov	_TMOD,#0x00
;	src/system.h:166: __endasm;
	lcall #0x3800
;	minikeys.c:395: BOOT_now();
;	minikeys.c:396: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'controlIndex'
;------------------------------------------------------------
;key           Allocated to registers r7 
;------------------------------------------------------------
;	minikeys.c:404: uint8_t controlIndex(uint8_t key) {
;	-----------------------------------------
;	 function controlIndex
;	-----------------------------------------
_controlIndex:
	mov	r7, dpl
;	minikeys.c:405: if(key >= 1 && key <= 3) return key - 1;
	cjne	r7,#0x01,00137$
00137$:
	jc	00102$
	mov	a,r7
	add	a,#0xff - 0x03
	jc	00102$
;	free result
	mov	ar6,r7
	mov	a,r6
	dec	a
	mov	dpl,a
	ret
00102$:
;	minikeys.c:406: if(key >= 13 && key <= 15) return key - 10;     // 13, 14, 15 -> 3, 4, 5
	cjne	r7,#0x0d,00140$
00140$:
	jc	00105$
	mov	a,r7
	add	a,#0xff - 0x0f
	jc	00105$
;	free result
	mov	a,r7
	add	a,#0xf6
	mov	dpl,a
	ret
00105$:
;	minikeys.c:407: return 0xFF;
	mov	dpl, #0xff
;	minikeys.c:408: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'handleCommand'
;------------------------------------------------------------
;ctrl          Allocated to registers r7 
;layer         Allocated to registers r5 
;type          Allocated to registers r6 
;i             Allocated with name '_handleCommand_i_10000_623'
;s             Allocated to registers r5 r7 
;sloc0         Allocated with name '_handleCommand_sloc0_1_0'
;------------------------------------------------------------
;	minikeys.c:410: void handleCommand(void) {
;	-----------------------------------------
;	 function handleCommand
;	-----------------------------------------
_handleCommand:
;	minikeys.c:414: switch(cmd[0]) {
	mov	dptr,#_cmd
	movx	a,@dptr
	mov	r7,a
	cjne	r7,#0xa1,00417$
	sjmp	00101$
00417$:
	cjne	r7,#0xaa,00418$
	sjmp	00104$
00418$:
	cjne	r7,#0xb0,00419$
	sjmp	00107$
00419$:
	cjne	r7,#0xb1,00420$
	sjmp	00108$
00420$:
	cjne	r7,#0xb2,00421$
	ljmp	00114$
00421$:
	cjne	r7,#0xb3,00422$
	ljmp	00121$
00422$:
	cjne	r7,#0xbb,00423$
	ljmp	00125$
00423$:
	ljmp	00129$
;	minikeys.c:415: case 0xA1:                                    // A1 L: select (and activate) layer
00101$:
;	minikeys.c:416: if(cmd[1] >= 1) setLayer(cmd[1] - 1);
	mov	dptr,#(_cmd + 0x0001)
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0x01,00424$
00424$:
	jc	00103$
	mov	a,r6
	dec	a
	mov	dpl,a
;	minikeys.c:417: return;
	ljmp	_setLayer
00103$:
	ret
;	minikeys.c:419: case 0xAA:                                    // AA AA / AA A1: save
00104$:
;	minikeys.c:420: if(!saveSettings()) errorFlashFrames = 50;
	lcall	_saveSettings
	mov	a, dpl
	jnz	00106$
	mov	r0,#_errorFlashFrames
	mov	@r0,#0x32
00106$:
;	minikeys.c:421: return;
	ret
;	minikeys.c:423: case 0xB0:                                    // B0 (L<<4|8) mode: stock light modes
00107$:
;	minikeys.c:424: light.effect = cmd[2] == 0 ? FX_OFF : cmd[2] == 1 ? FX_PRESS : FX_WAVE;
	mov	dptr,#(_cmd + 0x0002)
	movx	a,@dptr
	mov	r6,a
	jnz	00154$
	mov	r5,a
	sjmp	00155$
00154$:
	cjne	r6,#0x01,00156$
	mov	r6,#0x01
	sjmp	00157$
00156$:
	mov	r6,#0x02
00157$:
	mov	ar5,r6
00155$:
	mov	dptr,#_light
	mov	a,r5
	movx	@dptr,a
;	minikeys.c:425: light.flags |= FLAG_MULTICOLOR;
	mov	dptr,#(_light + 0x0006)
	movx	a,@dptr
	orl	a,#0x01
	movx	@dptr,a
;	minikeys.c:426: return;
	ret
;	minikeys.c:428: case 0xB1:                                    // B1 effect r g b speed brightness flags
00108$:
;	minikeys.c:429: if(cmd[1] < FX_COUNT) light.effect = cmd[1];
	mov	dptr,#(_cmd + 0x0001)
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0x07,00430$
00430$:
	jnc	00110$
	mov	dptr,#_light
	mov	a,r6
	movx	@dptr,a
00110$:
;	minikeys.c:430: light.r = cmd[2]; light.g = cmd[3]; light.b = cmd[4];
	mov	dptr,#(_cmd + 0x0002)
	movx	a,@dptr
	mov	dptr,#(_light + 0x0001)
	movx	@dptr,a
	mov	dptr,#(_cmd + 0x0003)
	movx	a,@dptr
	mov	dptr,#(_light + 0x0002)
	movx	@dptr,a
	mov	dptr,#(_cmd + 0x0004)
	movx	a,@dptr
	mov	dptr,#(_light + 0x0003)
	movx	@dptr,a
;	minikeys.c:431: if(cmd[5] >= 1 && cmd[5] <= 10) light.speed = cmd[5];
	mov	dptr,#(_cmd + 0x0005)
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0x01,00432$
00432$:
	jc	00112$
	mov	a,r6
	add	a,#0xff - 0x0a
	jc	00112$
;	free result
	mov	dptr,#(_light + 0x0004)
	mov	a,r6
	movx	@dptr,a
00112$:
;	minikeys.c:432: light.brightness = cmd[6];
	mov	dptr,#(_cmd + 0x0006)
	movx	a,@dptr
	mov	dptr,#(_light + 0x0005)
	movx	@dptr,a
;	minikeys.c:433: light.flags = cmd[7];
	mov	dptr,#(_cmd + 0x0007)
	movx	a,@dptr
	mov	dptr,#(_light + 0x0006)
	movx	@dptr,a
;	minikeys.c:434: return;
	ret
;	minikeys.c:436: case 0xB2:                                    // B2 key r g b: live color (key 0 = all)
00114$:
;	minikeys.c:437: if(cmd[1] == 0xFF) { overrideMask = 0; return; }
	mov	dptr,#(_cmd + 0x0001)
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0xff,00206$
	mov	r0,#_overrideMask
	mov	@r0,#0x00
	ret
;	minikeys.c:438: for(i=0; i<NEO_COUNT; i++) {
00206$:
	mov	_handleCommand_i_10000_623,#0x00
00146$:
;	minikeys.c:439: if(cmd[1] == 0 || cmd[1] == i + 1) {
	mov	dptr,#(_cmd + 0x0001)
	movx	a,@dptr
	mov	r5,a
	jz	00117$
	mov	r4,_handleCommand_i_10000_623
	inc	r4
	mov	a,r5
	cjne	a,ar4,00147$
00117$:
;	minikeys.c:440: ctrl = keyPixel[i];
	mov	a,_handleCommand_i_10000_623
	mov	dptr,#_keyPixel
	movc	a,@a+dptr
;	minikeys.c:441: overrideColors[ctrl][0] = cmd[2];
	mov	r5,a
	mov	b,#0x03
	mul	ab
	add	a, #_overrideColors
	mov	r3,a
	mov	a,#(_overrideColors >> 8)
	addc	a, b
	mov	r4,a
	mov	_handleCommand_sloc0_1_0,r3
	mov	(_handleCommand_sloc0_1_0 + 1),r4
	mov	dptr,#(_cmd + 0x0002)
	movx	a,@dptr
	mov	dpl,_handleCommand_sloc0_1_0
	mov	dph,(_handleCommand_sloc0_1_0 + 1)
	movx	@dptr,a
;	minikeys.c:442: overrideColors[ctrl][1] = cmd[3];
	mov	a,#0x01
	add	a, r3
	mov	_handleCommand_sloc0_1_0,a
	clr	a
	addc	a, r4
	mov	(_handleCommand_sloc0_1_0 + 1),a
	mov	dptr,#(_cmd + 0x0003)
	movx	a,@dptr
	mov	dpl,_handleCommand_sloc0_1_0
	mov	dph,(_handleCommand_sloc0_1_0 + 1)
	movx	@dptr,a
;	minikeys.c:443: overrideColors[ctrl][2] = cmd[4];
	mov	a,#0x02
	add	a, r3
	mov	r3,a
	clr	a
	addc	a, r4
	mov	r4,a
	mov	dptr,#(_cmd + 0x0004)
	movx	a,@dptr
	mov	dpl,r3
	mov	dph,r4
	movx	@dptr,a
;	minikeys.c:444: overrideMask |= 1 << ctrl;
	mov	b,r5
	inc	b
	mov	a,#0x01
	sjmp	00441$
00440$:
	add	a,acc
00441$:
	djnz	b,00440$
	mov	r0,#_overrideMask
	orl	a,@r0
	mov	@r0,a
00147$:
;	minikeys.c:438: for(i=0; i<NEO_COUNT; i++) {
	inc	_handleCommand_i_10000_623
	mov	a,#0x100 - 0x03
	add	a,_handleCommand_i_10000_623
	jnc	00146$
;	minikeys.c:447: return;
	ret
;	minikeys.c:449: case 0xB3:                                    // B3 L r g b: layer color
00121$:
;	minikeys.c:450: if(cmd[1] >= 1 && cmd[1] <= LAYERS) {
	mov	dptr,#(_cmd + 0x0001)
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0x01,00443$
00443$:
	jnc	00444$
	ret
00444$:
	mov	a,r6
	add	a,#0xff - 0x03
	jnc	00445$
	ret
00445$:
;	free result
;	minikeys.c:451: layerColors[cmd[1] - 1][0] = cmd[2];
	dec	r6
	clr	F0
	mov	b,#0x03
	mov	a,r6
	jnb	acc.7,00446$
	cpl	F0
	cpl	a
	inc	a
00446$:
	mul	ab
	jnb	F0,00447$
	cpl	a
	add	a,#0x01
	xch	a,b
	cpl	a
	addc	a,#0x00
	xch	a,b
00447$:
	add	a, #_layerColors
	mov	r5,a
	mov	a,#(_layerColors >> 8)
	addc	a, b
	mov	r6,a
	mov	dptr,#(_cmd + 0x0002)
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	movx	@dptr,a
;	minikeys.c:452: layerColors[cmd[1] - 1][1] = cmd[3];
	mov	dptr,#(_cmd + 0x0001)
	movx	a,@dptr
	mov	r6,a
	dec	r6
	clr	F0
	mov	b,#0x03
	mov	a,r6
	jnb	acc.7,00448$
	cpl	F0
	cpl	a
	inc	a
00448$:
	mul	ab
	jnb	F0,00449$
	cpl	a
	add	a,#0x01
	xch	a,b
	cpl	a
	addc	a,#0x00
	xch	a,b
00449$:
	add	a, #_layerColors
	mov	r5,a
	mov	a,#(_layerColors >> 8)
	addc	a, b
	mov	r6,a
	inc	r5
	cjne	r5,#0x00,00450$
	inc	r6
00450$:
	mov	dptr,#(_cmd + 0x0003)
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	movx	@dptr,a
;	minikeys.c:453: layerColors[cmd[1] - 1][2] = cmd[4];
	mov	dptr,#(_cmd + 0x0001)
	movx	a,@dptr
	mov	r6,a
	dec	r6
	clr	F0
	mov	b,#0x03
	mov	a,r6
	jnb	acc.7,00451$
	cpl	F0
	cpl	a
	inc	a
00451$:
	mul	ab
	jnb	F0,00452$
	cpl	a
	add	a,#0x01
	xch	a,b
	cpl	a
	addc	a,#0x00
	xch	a,b
00452$:
	add	a, #_layerColors
	mov	r5,a
	mov	a,#(_layerColors >> 8)
	addc	a, b
	mov	r6,a
	mov	a,#0x02
	add	a, r5
	mov	r5,a
	clr	a
	addc	a, r6
	mov	r6,a
	mov	dptr,#(_cmd + 0x0004)
	movx	a,@dptr
	mov	dpl,r5
	mov	dph,r6
	movx	@dptr,a
;	minikeys.c:455: return;
	ret
;	minikeys.c:457: case 0xBB:                                    // BB 4D 4B: bootloader
00125$:
;	minikeys.c:458: if(cmd[1] == 0x4D && cmd[2] == 0x4B) enterBootloader();
	mov	dptr,#(_cmd + 0x0001)
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0x4d,00127$
	mov	dptr,#(_cmd + 0x0002)
	movx	a,@dptr
	mov	r6,a
	cjne	r6,#0x4b,00127$
;	minikeys.c:459: return;
	ljmp	_enterBootloader
00127$:
	ret
;	minikeys.c:460: }
00129$:
;	minikeys.c:463: ctrl = controlIndex(cmd[0]);
	mov	dpl, r7
	lcall	_controlIndex
	mov	r7, dpl
;	minikeys.c:464: layer = (cmd[1] >> 4) - 1;
	mov	dptr,#(_cmd + 0x0001)
	movx	a,@dptr
	mov	r6,a
	swap	a
	anl	a,#0x0f
	mov	r5,a
	dec	r5
;	minikeys.c:465: type = cmd[1] & 0x0F;
	anl	ar6,#0x0f
;	minikeys.c:466: if(ctrl == 0xFF || layer >= LAYERS) return;
	cjne	r7,#0xff,00457$
	ret
00457$:
	cjne	r5,#0x03,00458$
00458$:
	jc	00131$
	ret
00131$:
;	minikeys.c:467: setLayer(layer);
	mov	dpl, r5
	push	ar7
	push	ar6
	push	ar5
	lcall	_setLayer
	pop	ar5
	pop	ar6
	pop	ar7
;	minikeys.c:468: s = bindings[layer * CONTROLS + ctrl];
	mov	a,r5
	mov	b,#0x06
	mul	ab
	mov	r5,a
	clr	a
	mov	r4,a
	mov	r3,a
	mov	a,r7
	add	a, r5
	mov	__mulint_PARM_2,a
	mov	a,r3
	addc	a, r4
	mov	(__mulint_PARM_2 + 1),a
	mov	dptr,#0x000b
	push	ar6
	lcall	__mulint
	mov	r5, dpl
	mov	r7, dph
	pop	ar6
	mov	a,r5
	add	a, #_bindings
	mov	r5,a
	mov	a,r7
	addc	a, #(_bindings >> 8)
	mov	r7,a
;	minikeys.c:469: switch(type) {
	cjne	r6,#0x01,00460$
	sjmp	00133$
00460$:
	cjne	r6,#0x02,00461$
	sjmp	00142$
00461$:
	cjne	r6,#0x03,00462$
	ljmp	00143$
00462$:
	ret
;	minikeys.c:470: case TYPE_KEYS:                               // count index modifiers key
00133$:
;	minikeys.c:471: if(cmd[2] > 5) return;
	mov	dptr,#(_cmd + 0x0002)
	movx	a,@dptr
	mov  r6,a
	add	a,#0xff - 0x05
	jnc	00135$
;	free result
	ret
00135$:
;	minikeys.c:472: if(cmd[3] == 0) {
	mov	dptr,#(_cmd + 0x0003)
	movx	a,@dptr
	mov	r4,a
	jnz	00140$
;	minikeys.c:473: s[0] = TYPE_KEYS << 5 | (cmd[2] * 2);
	mov	a,r6
	add	a,r6
	mov	r3,a
	orl	ar3,#0x20
	mov	dpl,r5
	mov	dph,r7
	mov	a,r3
	movx	@dptr,a
;	minikeys.c:474: for(i=1; i<SLOT_LEN; i++) s[i] = 0;
	mov	r3,#0x01
00148$:
	mov	a,r3
	add	a, r5
	mov	dpl,a
	clr	a
	addc	a, r7
	mov	dph,a
	clr	a
	movx	@dptr,a
	inc	r3
	cjne	r3,#0x0b,00465$
00465$:
	jc	00148$
	ret
00140$:
;	minikeys.c:476: else if(cmd[3] <= cmd[2]) {
	clr	c
	mov	a,r6
	subb	a,r4
	jnc	00467$
	ret
00467$:
;	free result
;	minikeys.c:477: s[cmd[3] * 2 - 1] = cmd[4];
	mov	r6,#0x00
	mov	a,r4
	add	a,r4
	mov	r4,a
	mov	a,r6
	rlc	a
	mov	r6,a
	dec	r4
	cjne	r4,#0xff,00468$
	dec	r6
00468$:
	mov	a,r4
	add	a, r5
	mov	r4,a
	mov	a,r6
	addc	a, r7
	mov	r6,a
	mov	dptr,#(_cmd + 0x0004)
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r6
	movx	@dptr,a
;	minikeys.c:478: s[cmd[3] * 2] = cmd[5];
	mov	dptr,#(_cmd + 0x0003)
	movx	a,@dptr
	mov	r4,#0x00
	add	a,acc
	mov	r6,a
	mov	a,r4
	rlc	a
	mov	r4,a
	mov	a,r6
	add	a, r5
	mov	r6,a
	mov	a,r4
	addc	a, r7
	mov	r4,a
	mov	dptr,#(_cmd + 0x0005)
	movx	a,@dptr
	mov	dpl,r6
	mov	dph,r4
	movx	@dptr,a
;	minikeys.c:480: break;
;	minikeys.c:481: case TYPE_MEDIA:                              // usage low, high
	ret
00142$:
;	minikeys.c:482: s[0] = TYPE_MEDIA << 5 | 2;
	mov	dpl,r5
	mov	dph,r7
	mov	a,#0x42
	movx	@dptr,a
;	minikeys.c:483: s[1] = cmd[2]; s[2] = cmd[3];
	mov	a,#0x01
	add	a, r5
	mov	r4,a
	clr	a
	addc	a, r7
	mov	r6,a
	mov	dptr,#(_cmd + 0x0002)
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r6
	movx	@dptr,a
	mov	a,#0x02
	add	a, r5
	mov	r4,a
	clr	a
	addc	a, r7
	mov	r6,a
	mov	dptr,#(_cmd + 0x0003)
	movx	a,@dptr
	mov	dpl,r4
	mov	dph,r6
	movx	@dptr,a
;	minikeys.c:484: break;
;	minikeys.c:485: case TYPE_MOUSE:                              // buttons x y wheel modifiers
	ret
00143$:
;	minikeys.c:486: s[0] = TYPE_MOUSE << 5 | 5;
	mov	dpl,r5
	mov	dph,r7
	mov	a,#0x65
	movx	@dptr,a
;	minikeys.c:487: for(i=0; i<5; i++) s[1 + i] = cmd[2 + i];
	mov	r6,#0x00
00150$:
	mov	ar4,r6
	mov	a,r4
	inc	a
	add	a, r5
	mov	r3,a
	clr	a
	addc	a,r7
	mov	r4,a
	mov	ar2,r6
	inc	r2
	inc	r2
	mov	a,r2
	add	a, #_cmd
	mov	dpl,a
	clr	a
	addc	a, #(_cmd >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	dpl,r3
	mov	dph,r4
	movx	@dptr,a
	inc	r6
	cjne	r6,#0x05,00469$
00469$:
	jc	00150$
;	minikeys.c:489: }
;	minikeys.c:490: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readEncoder'
;------------------------------------------------------------
;	minikeys.c:506: uint8_t readEncoder(void) {
;	-----------------------------------------
;	 function readEncoder
;	-----------------------------------------
_readEncoder:
;	minikeys.c:507: return (PIN_read(PIN_ENC_A) ? 2 : 0) | (PIN_read(PIN_ENC_B) ? 1 : 0);
	jnb	_PP30,00103$
	mov	r7,#0x02
	sjmp	00104$
00103$:
	mov	r7,#0x00
00104$:
	jnb	_PP31,00105$
	mov	r6,#0x01
	sjmp	00106$
00105$:
	mov	r6,#0x00
00106$:
	mov	a,r6
	orl	a,r7
	mov	dpl,a
;	minikeys.c:508: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'pollEncoder'
;------------------------------------------------------------
;state         Allocated to registers r7 
;------------------------------------------------------------
;	minikeys.c:510: void pollEncoder(void) {
;	-----------------------------------------
;	 function pollEncoder
;	-----------------------------------------
_pollEncoder:
;	minikeys.c:511: uint8_t state = readEncoder();
	lcall	_readEncoder
	mov	r7, dpl
;	minikeys.c:512: if(state == encoderState) return;
	mov	r0,#_encoderState
	mov	a,@r0
	cjne	a,ar7,00102$
	ret
00102$:
;	minikeys.c:513: encoderSteps += encoderTable[encoderState << 2 | state];
	mov	r0,#_encoderState
	mov	a,@r0
	add	a,@r0
	add	a,acc
	orl	a,r7
	mov	dptr,#_encoderTable
	movc	a,@a+dptr
	mov	r0,#_encoderSteps
	add	a, @r0
	mov	@r0,a
;	minikeys.c:514: encoderState = state;
	mov	r0,#_encoderState
	mov	@r0,ar7
;	minikeys.c:516: if(state == 3) {
	cjne	r7,#0x03,00110$
;	minikeys.c:517: if(encoderSteps <= -2) { controlDown(CTRL_KNOB_RIGHT); controlUp(CTRL_KNOB_RIGHT); flashPress(2); }
	mov	r0,#_encoderSteps
	clr	c
	mov	a,#(0xfe ^ 0x80)
	mov	b,@r0
	xrl	b,#0x80
	subb	a,b
	jc	00106$
;	free result
	mov	dpl, #0x05
	lcall	_controlDown
	mov	dpl, #0x05
	lcall	_controlUp
	mov	dpl, #0x02
	lcall	_flashPress
	sjmp	00107$
00106$:
;	minikeys.c:518: else if(encoderSteps >= 2) { controlDown(CTRL_KNOB_LEFT); controlUp(CTRL_KNOB_LEFT); flashPress(2); }
	mov	r0,#_encoderSteps
	clr	c
	mov	a,@r0
	xrl	a,#0x80
	subb	a,#0x82
	jc	00107$
	mov	dpl, #0x03
	lcall	_controlDown
	mov	dpl, #0x03
	lcall	_controlUp
	mov	dpl, #0x02
	lcall	_flashPress
00107$:
;	minikeys.c:519: encoderSteps = 0;
	mov	r0,#_encoderSteps
	mov	@r0,#0x00
00110$:
;	minikeys.c:521: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'readButton'
;------------------------------------------------------------
;i             Allocated to registers r7 
;------------------------------------------------------------
;	minikeys.c:523: uint8_t readButton(uint8_t i) {
;	-----------------------------------------
;	 function readButton
;	-----------------------------------------
_readButton:
;	minikeys.c:524: switch(i) {
	mov	a,dpl
	mov	r7,a
	jz	00101$
	cjne	r7,#0x01,00130$
	sjmp	00102$
00130$:
;	minikeys.c:525: case 0:  return !PIN_read(PIN_KEY1);
	cjne	r7,#0x02,00104$
	sjmp	00103$
00101$:
	mov	c,_PP11
	cpl	c
	mov  _readButton_sloc0_1_0,c
	clr	a
	rlc	a
	mov	dpl,a
;	minikeys.c:526: case 1:  return !PIN_read(PIN_KEY2);
	ret
00102$:
	mov	c,_PP17
	cpl	c
	mov  _readButton_sloc0_1_0,c
	clr	a
	rlc	a
	mov	dpl,a
;	minikeys.c:527: case 2:  return !PIN_read(PIN_KEY3);
	ret
00103$:
	mov	c,_PP16
	cpl	c
	mov  _readButton_sloc0_1_0,c
	clr	a
	rlc	a
	mov	dpl,a
;	minikeys.c:528: default: return !PIN_read(PIN_ENC_SW);
	ret
00104$:
	mov	c,_PP33
	cpl	c
	mov  _readButton_sloc0_1_0,c
	clr	a
	rlc	a
	mov	dpl,a
;	minikeys.c:529: }
;	minikeys.c:530: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'pollButtons'
;------------------------------------------------------------
;i             Allocated to registers r7 
;pressed       Allocated to registers r6 
;ctrl          Allocated to registers r4 
;------------------------------------------------------------
;	minikeys.c:532: void pollButtons(void) {
;	-----------------------------------------
;	 function pollButtons
;	-----------------------------------------
_pollButtons:
;	minikeys.c:534: for(i=0; i<4; i++) {
	mov	r7,#0x00
00110$:
;	minikeys.c:535: pressed = readButton(i);
	mov	dpl, r7
	push	ar7
	lcall	_readButton
	mov	r6, dpl
	pop	ar7
;	minikeys.c:536: if(pressed == buttonStable[i]) { buttonCount[i] = 0; continue; }
	mov	a,r7
	add	a, #_buttonStable
	mov	r4,a
	clr	a
	addc	a, #(_buttonStable >> 8)
	mov	r5,a
	mov	dpl,r4
	mov	dph,r5
	movx	a,@dptr
	mov	r3,a
	mov	a,r6
	cjne	a,ar3,00102$
	mov	a,r7
	add	a, #_buttonCount
	mov	dpl,a
	clr	a
	addc	a, #(_buttonCount >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
	sjmp	00108$
00102$:
;	minikeys.c:537: if(++buttonCount[i] < DEBOUNCE_MS) continue;
	mov	a,r7
	add	a, #_buttonCount
	mov	r2,a
	clr	a
	addc	a, #(_buttonCount >> 8)
	mov	r3,a
	mov	dpl,r2
	mov	dph,r3
	movx	a,@dptr
	mov	r1,a
	inc	r1
	mov	dpl,r2
	mov	dph,r3
	mov	a,r1
	movx	@dptr,a
	cjne	r1,#0x05,00162$
00162$:
	jc	00108$
;	minikeys.c:538: buttonStable[i] = pressed;
	mov	dpl,r4
	mov	dph,r5
	mov	a,r6
	movx	@dptr,a
;	minikeys.c:539: buttonCount[i] = 0;
	mov	dpl,r2
	mov	dph,r3
	clr	a
	movx	@dptr,a
;	minikeys.c:540: ctrl = i < 3 ? i : CTRL_KNOB_PRESS;
	cjne	r7,#0x03,00164$
00164$:
	clr	a
	rlc	a
	mov	r5,a
	jz	00113$
	mov	ar4,r7
	sjmp	00114$
00113$:
	mov	r4,#0x04
00114$:
;	minikeys.c:541: if(pressed) {
	mov	a,r6
	jz	00106$
;	minikeys.c:542: flashPress(i < 3 ? i : 2);
	mov	a,r5
	jz	00115$
	mov	ar6,r7
	sjmp	00116$
00115$:
	mov	r6,#0x02
00116$:
	mov	dpl,r6
	push	ar7
	push	ar4
	lcall	_flashPress
	pop	ar4
;	minikeys.c:543: controlDown(ctrl);
	mov	dpl, r4
	lcall	_controlDown
	pop	ar7
	sjmp	00108$
00106$:
;	minikeys.c:545: else controlUp(ctrl);
	mov	dpl, r4
	push	ar7
	lcall	_controlUp
	pop	ar7
00108$:
;	minikeys.c:534: for(i=0; i<4; i++) {
	inc	r7
	cjne	r7,#0x04,00168$
00168$:
	jnc	00169$
	ljmp	00110$
00169$:
;	minikeys.c:547: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'diagRead'
;------------------------------------------------------------
;pin           Allocated to registers r7 
;------------------------------------------------------------
;	minikeys.c:559: uint8_t diagRead(uint8_t pin) {
;	-----------------------------------------
;	 function diagRead
;	-----------------------------------------
_diagRead:
;	minikeys.c:560: switch(pin) {
	mov	a,dpl
	mov	r7,a
	add	a,#0xff - 0x0b
	jc	00113$
;	free result
	mov	a,r7
	add	a,#(00125$-3-.)
	movc	a,@a+pc
	mov	dpl,a
	mov	a,r7
	add	a,#(00126$-3-.)
	movc	a,@a+pc
	mov	dph,a
	clr	a
	jmp	@a+dptr
00125$:
	.db	00101$
	.db	00102$
	.db	00103$
	.db	00104$
	.db	00105$
	.db	00106$
	.db	00107$
	.db	00108$
	.db	00109$
	.db	00110$
	.db	00111$
	.db	00112$
00126$:
	.db	00101$>>8
	.db	00102$>>8
	.db	00103$>>8
	.db	00104$>>8
	.db	00105$>>8
	.db	00106$>>8
	.db	00107$>>8
	.db	00108$>>8
	.db	00109$>>8
	.db	00110$>>8
	.db	00111$>>8
	.db	00112$>>8
;	minikeys.c:561: case P10: return PIN_read(P10); case P11: return PIN_read(P11);
00101$:
	mov	c,_PP10
	clr	a
	rlc	a
	mov	dpl,a
	ret
00102$:
	mov	c,_PP11
	clr	a
	rlc	a
	mov	dpl,a
	ret
;	minikeys.c:562: case P12: return PIN_read(P12); case P13: return PIN_read(P13);
00103$:
	mov	c,_PP12
	clr	a
	rlc	a
	mov	dpl,a
	ret
00104$:
	mov	c,_PP13
	clr	a
	rlc	a
	mov	dpl,a
;	minikeys.c:563: case P14: return PIN_read(P14); case P15: return PIN_read(P15);
	ret
00105$:
	mov	c,_PP14
	clr	a
	rlc	a
	mov	dpl,a
	ret
00106$:
	mov	c,_PP15
	clr	a
	rlc	a
	mov	dpl,a
;	minikeys.c:564: case P16: return PIN_read(P16); case P17: return PIN_read(P17);
	ret
00107$:
	mov	c,_PP16
	clr	a
	rlc	a
	mov	dpl,a
	ret
00108$:
	mov	c,_PP17
	clr	a
	rlc	a
	mov	dpl,a
;	minikeys.c:565: case P30: return PIN_read(P30); case P31: return PIN_read(P31);
	ret
00109$:
	mov	c,_PP30
	clr	a
	rlc	a
	mov	dpl,a
	ret
00110$:
	mov	c,_PP31
	clr	a
	rlc	a
	mov	dpl,a
;	minikeys.c:566: case P32: return PIN_read(P32); case P33: return PIN_read(P33);
	ret
00111$:
	mov	c,_PP32
	clr	a
	rlc	a
	mov	dpl,a
	ret
00112$:
	mov	c,_PP33
	clr	a
	rlc	a
	mov	dpl,a
;	minikeys.c:567: default:  return PIN_read(P35);
	ret
00113$:
	mov	c,_PP35
	clr	a
	rlc	a
	mov	dpl,a
;	minikeys.c:568: }
;	minikeys.c:569: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'diagType'
;------------------------------------------------------------
;usage         Allocated to registers 
;------------------------------------------------------------
;	minikeys.c:571: void diagType(uint8_t usage) {
;	-----------------------------------------
;	 function diagType
;	-----------------------------------------
_diagType:
	mov	_sendKeys_PARM_2,dpl
;	minikeys.c:572: sendKeys(0, usage);
	mov	dpl, #0x00
	lcall	_sendKeys
;	minikeys.c:573: sendKeys(0, 0);
	mov	_sendKeys_PARM_2,#0x00
	mov	dpl, #0x00
;	minikeys.c:574: }
	ljmp	_sendKeys
;------------------------------------------------------------
;Allocation info for local variables in function 'diagLoop'
;------------------------------------------------------------
;i             Allocated to registers r7 
;now           Allocated to registers r6 
;------------------------------------------------------------
;	minikeys.c:576: void diagLoop(void) {
;	-----------------------------------------
;	 function diagLoop
;	-----------------------------------------
_diagLoop:
;	minikeys.c:578: P1_MOD_OC = 0xFF; P1_DIR_PU = 0xFF;             // all of port 1: input with pull-up
	mov	_P1_MOD_OC,#0xff
	mov	_P1_DIR_PU,#0xff
;	minikeys.c:579: P3_MOD_OC |= 0x2F; P3_DIR_PU |= 0x2F;           // P3.0-3.3, P3.5 (not USB, not LEDs)
	orl	_P3_MOD_OC,#0x2f
	orl	_P3_DIR_PU,#0x2f
;	minikeys.c:580: DLY_ms(20);
	mov	dptr,#0x0014
	lcall	_DLY_ms
;	minikeys.c:581: for(i=0; i<sizeof(diagPins); i++) diagLast[i] = diagRead(diagPins[i]);
	mov	r7,#0x00
00113$:
	mov	a,r7
	add	a, #_diagLast
	mov	r5,a
	clr	a
	addc	a, #(_diagLast >> 8)
	mov	r6,a
	mov	a,r7
	mov	dptr,#_diagPins
	movc	a,@a+dptr
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_diagRead
	mov	r4, dpl
	pop	ar5
	pop	ar6
	pop	ar7
	mov	dpl,r5
	mov	dph,r6
	mov	a,r4
	movx	@dptr,a
	inc	r7
	cjne	r7,#0x0d,00179$
00179$:
	jc	00113$
;	minikeys.c:583: for(i=0; i<sizeof(diagPins); i++) {
00133$:
	mov	r7,#0x00
00115$:
;	minikeys.c:584: now = diagRead(diagPins[i]);
	mov	a,r7
	mov	dptr,#_diagPins
	movc	a,@a+dptr
	mov	dpl,a
	push	ar7
	lcall	_diagRead
	mov	r6, dpl
	pop	ar7
;	minikeys.c:585: if(now != diagLast[i]) {
	mov	a,r7
	add	a, #_diagLast
	mov	r4,a
	clr	a
	addc	a, #(_diagLast >> 8)
	mov	r5,a
	mov	dpl,r4
	mov	dph,r5
	movx	a,@dptr
	mov	r3,a
	mov	a,r6
	cjne	a,ar3,00181$
	sjmp	00116$
00181$:
;	minikeys.c:586: diagLast[i] = now;
	mov	dpl,r4
	mov	dph,r5
	mov	a,r6
	movx	@dptr,a
;	minikeys.c:587: if(!now) {                                // pulled low: type "p" port pin space
	mov	a,r6
	jnz	00116$
;	minikeys.c:588: diagType(0x13);
	mov	dpl, #0x13
	push	ar7
	lcall	_diagType
	pop	ar7
;	minikeys.c:589: diagType(0x1D + diagNames[i][0]);       // '1' = 0x1E
	mov	a,r7
	mov	b,#0x02
	mul	ab
	add	a, #_diagNames
	mov	r5,a
	mov	a,#(_diagNames >> 8)
	addc	a, b
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	clr	a
	movc	a,@a+dptr
	add	a,#0x1d
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_diagType
	pop	ar5
	pop	ar6
	pop	ar7
;	minikeys.c:590: diagType(diagNames[i][1] ? 0x1D + diagNames[i][1] : 0x27);
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	clr	a
	movc	a,@a+dptr
	mov	r6,a
	jz	00119$
	mov	a,#0x1d
	add	a, r6
	mov	r5,a
	rlc	a
	subb	a,acc
	sjmp	00120$
00119$:
	mov	r5,#0x27
00120$:
	mov	dpl,r5
	push	ar7
	lcall	_diagType
;	minikeys.c:591: diagType(0x2C);
	mov	dpl, #0x2c
	lcall	_diagType
	pop	ar7
00116$:
;	minikeys.c:583: for(i=0; i<sizeof(diagPins); i++) {
	inc	r7
	cjne	r7,#0x0d,00184$
00184$:
	jnc	00185$
	ljmp	00115$
00185$:
;	minikeys.c:595: while(CMD_take(cmd)) handleCommand();         // keeps BB 4D 4B working
00107$:
	mov	dptr,#_cmd
	lcall	_CMD_take
	mov	a, dpl
	jz	00109$
	lcall	_handleCommand
	sjmp	00107$
00109$:
;	minikeys.c:596: DLY_ms(5);
	mov	dptr,#0x0005
	lcall	_DLY_ms
;	minikeys.c:598: }
	ljmp	00133$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;i             Allocated to registers r6 
;ms            Allocated to registers r7 
;------------------------------------------------------------
;	minikeys.c:605: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	minikeys.c:606: uint8_t i, ms = 0;
	mov	r7,#0x00
;	minikeys.c:608: NEO_init();
;	assignBit
	clr	_PP34
	anl	_P3_MOD_OC,#0xef
	orl	_P3_DIR_PU,#0x10
;	src/system.h:71: SAFE_MOD = 0x55;
	mov	_SAFE_MOD,#0x55
;	src/system.h:72: SAFE_MOD = 0xAA;                              // enter safe mode
	mov	_SAFE_MOD,#0xaa
;	src/system.h:80: __asm__("anl _CLOCK_CFG, #0b11111000");
	anl	_CLOCK_CFG, #0b11111000
;	src/system.h:81: __asm__("orl _CLOCK_CFG, #0b00000101");     // 16MHz	
	orl	_CLOCK_CFG, #0b00000101
;	src/system.h:100: SAFE_MOD = 0x00;                              // terminate safe mode
	mov	_SAFE_MOD,#0x00
;	minikeys.c:610: DLY_ms(10);
	mov	dptr,#0x000a
	push	ar7
	lcall	_DLY_ms
;	minikeys.c:612: PIN_input_PU(PIN_KEY1);
	orl	_P1_MOD_OC,#0x02
	orl	_P1_DIR_PU,#0x02
;	minikeys.c:613: PIN_input_PU(PIN_KEY2);
	orl	_P1_MOD_OC,#0x80
	orl	_P1_DIR_PU,#0x80
;	minikeys.c:614: PIN_input_PU(PIN_KEY3);
	orl	_P1_MOD_OC,#0x40
	orl	_P1_DIR_PU,#0x40
;	minikeys.c:615: PIN_input_PU(PIN_ENC_A);
	orl	_P3_MOD_OC,#0x01
	orl	_P3_DIR_PU,#0x01
;	minikeys.c:616: PIN_input_PU(PIN_ENC_B);
	orl	_P3_MOD_OC,#0x02
	orl	_P3_DIR_PU,#0x02
;	minikeys.c:617: PIN_input_PU(PIN_ENC_SW);
	orl	_P3_MOD_OC,#0x08
	orl	_P3_DIR_PU,#0x08
;	minikeys.c:618: DLY_ms(5);
	mov	dptr,#0x0005
	lcall	_DLY_ms
	pop	ar7
;	minikeys.c:620: if(!PIN_read(PIN_KEY1)) enterBootloader();
	jb	_PP11,00140$
	push	ar7
	lcall	_enterBootloader
	pop	ar7
;	minikeys.c:622: for(i=0; i<CONTROLS; i++) { heldMods[i] = 0; heldKeys[i] = 0; heldButtons[i] = 0; }
00140$:
	mov	r6,#0x00
00116$:
	mov	a,r6
	add	a, #_heldMods
	mov	dpl,a
	clr	a
	addc	a, #(_heldMods >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
	mov	a,r6
	add	a, #_heldKeys
	mov	dpl,a
	clr	a
	addc	a, #(_heldKeys >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
	mov	a,r6
	add	a, #_heldButtons
	mov	dpl,a
	clr	a
	addc	a, #(_heldButtons >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
	inc	r6
	cjne	r6,#0x06,00222$
00222$:
	jc	00116$
;	minikeys.c:623: for(i=0; i<NEO_COUNT; i++) pressLevel[i] = 0;
	mov	r6,#0x00
00118$:
	mov	a,r6
	add	a, #_pressLevel
	mov	dpl,a
	clr	a
	addc	a, #(_pressLevel >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
	inc	r6
	cjne	r6,#0x03,00224$
00224$:
	jc	00118$
;	minikeys.c:624: for(i=0; i<4; i++) { buttonStable[i] = 0; buttonCount[i] = 0; }
	mov	r6,#0x00
00120$:
	mov	a,r6
	add	a, #_buttonStable
	mov	dpl,a
	clr	a
	addc	a, #(_buttonStable >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
	mov	a,r6
	add	a, #_buttonCount
	mov	dpl,a
	clr	a
	addc	a, #(_buttonCount >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
	inc	r6
	cjne	r6,#0x04,00226$
00226$:
	jc	00120$
;	minikeys.c:625: encoderState = readEncoder();
	push	ar7
	lcall	_readEncoder
	mov	a, dpl
	mov	r0,#_encoderState
	mov	@r0,a
;	minikeys.c:626: loadSettings();
	lcall	_loadSettings
;	minikeys.c:628: HID_init();
	lcall	_HID_init
;	minikeys.c:631: DLY_ms(1500);                             // let the host finish enumerating
	mov	dptr,#0x05dc
	lcall	_DLY_ms
;	minikeys.c:632: diagLoop();
	lcall	_diagLoop
	pop	ar7
;	minikeys.c:636: for(i=0; i<4; i++) {                    // 1 ms, sampling the knob every 250 us
00146$:
	mov	r6,#0x00
00122$:
;	minikeys.c:637: pollEncoder();
	push	ar7
	push	ar6
	lcall	_pollEncoder
;	minikeys.c:638: DLY_us(250);
	mov	dptr,#0x00fa
	lcall	_DLY_us
	pop	ar6
	pop	ar7
;	minikeys.c:636: for(i=0; i<4; i++) {                    // 1 ms, sampling the knob every 250 us
	inc	r6
	cjne	r6,#0x04,00228$
00228$:
	jc	00122$
;	minikeys.c:640: pollButtons();
	push	ar7
	lcall	_pollButtons
	pop	ar7
;	minikeys.c:641: while(CMD_take(cmd)) handleCommand();
00107$:
	mov	dptr,#_cmd
	push	ar7
	lcall	_CMD_take
	mov	a, dpl
	pop	ar7
	jz	00109$
	push	ar7
	lcall	_handleCommand
	pop	ar7
	sjmp	00107$
00109$:
;	minikeys.c:642: if(++ms >= 20) {
	inc	r7
	cjne	r7,#0x14,00231$
00231$:
	jc	00146$
;	minikeys.c:643: ms = 0;
	mov	r7,#0x00
;	minikeys.c:644: frame++;
	mov	r0,#_frame
	inc	@r0
	cjne	@r0,#0x00,00233$
	inc	r0
	inc	@r0
00233$:
;	minikeys.c:645: renderLights();
	push	ar7
	lcall	_renderLights
	pop	ar7
;	minikeys.c:648: }
	sjmp	00146$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
_keyPixel:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.area CSEG    (CODE)
	.area CONST   (CODE)
_palette:
	.db #0xff	; 255
	.db #0x14	; 20
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x50	; 80	'P'
	.db #0xff	; 255
	.db #0x1e	; 30
	.db #0xff	; 255
	.db #0x50	; 80	'P'
	.db #0x96	; 150
	.db #0x3c	; 60
	.db #0xff	; 255
	.area CSEG    (CODE)
	.area CONST   (CODE)
_encoderTable:
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0x01	;  1
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0xff	; -1
	.db #0xff	; -1
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0x00	;  0
	.db #0x01	;  1
	.db #0xff	; -1
	.db #0x00	;  0
	.area CSEG    (CODE)
	.area CONST   (CODE)
_diagPins:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0d	; 13
	.area CSEG    (CODE)
	.area CONST   (CODE)
_diagNames:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x05	; 5
	.area CSEG    (CODE)
	.area CABS    (ABS,CODE)
