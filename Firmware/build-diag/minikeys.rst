                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.6.0 #16555 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module minikeys
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _setPixel_PARM_4
                                     12 	.globl _setPixel_PARM_3
                                     13 	.globl _setPixel_PARM_2
                                     14 	.globl _diagNames
                                     15 	.globl _diagPins
                                     16 	.globl _encoderTable
                                     17 	.globl _palette
                                     18 	.globl _keyPixel
                                     19 	.globl _main
                                     20 	.globl _diagLoop
                                     21 	.globl _diagType
                                     22 	.globl _diagRead
                                     23 	.globl _pollButtons
                                     24 	.globl _readButton
                                     25 	.globl _pollEncoder
                                     26 	.globl _readEncoder
                                     27 	.globl _handleCommand
                                     28 	.globl _controlIndex
                                     29 	.globl _enterBootloader
                                     30 	.globl _setLayer
                                     31 	.globl _renderLights
                                     32 	.globl _flashPress
                                     33 	.globl _lightColor
                                     34 	.globl _setPixelHue
                                     35 	.globl _setPixelScaled
                                     36 	.globl _setPixel
                                     37 	.globl _releaseAll
                                     38 	.globl _controlUp
                                     39 	.globl _controlDown
                                     40 	.globl _sendMouse
                                     41 	.globl _sendMedia
                                     42 	.globl _sendKeys
                                     43 	.globl _saveSettings
                                     44 	.globl _loadSettings
                                     45 	.globl _setDefaults
                                     46 	.globl _USB_ISR
                                     47 	.globl _USB_interrupt
                                     48 	.globl _CMD_take
                                     49 	.globl _HID_sendReport
                                     50 	.globl _HID_init
                                     51 	.globl _EEPROM_update
                                     52 	.globl _EEPROM_read
                                     53 	.globl _NEO_writeColor
                                     54 	.globl _NEO_sendByte
                                     55 	.globl _DLY_ms
                                     56 	.globl _DLY_us
                                     57 	.globl _PP37
                                     58 	.globl _PP36
                                     59 	.globl _PP35
                                     60 	.globl _PP34
                                     61 	.globl _PP33
                                     62 	.globl _PP32
                                     63 	.globl _PP31
                                     64 	.globl _PP30
                                     65 	.globl _PP17
                                     66 	.globl _PP16
                                     67 	.globl _PP15
                                     68 	.globl _PP14
                                     69 	.globl _PP13
                                     70 	.globl _PP12
                                     71 	.globl _PP11
                                     72 	.globl _PP10
                                     73 	.globl _UIF_BUS_RST
                                     74 	.globl _UIF_DETECT
                                     75 	.globl _UIF_TRANSFER
                                     76 	.globl _UIF_SUSPEND
                                     77 	.globl _UIF_HST_SOF
                                     78 	.globl _UIF_FIFO_OV
                                     79 	.globl _U_SIE_FREE
                                     80 	.globl _U_TOG_OK
                                     81 	.globl _U_IS_NAK
                                     82 	.globl _ADC_CHAN0
                                     83 	.globl _ADC_CHAN1
                                     84 	.globl _CMP_CHAN
                                     85 	.globl _ADC_START
                                     86 	.globl _ADC_IF
                                     87 	.globl _CMP_IF
                                     88 	.globl _CMPO
                                     89 	.globl _U1RI
                                     90 	.globl _U1TI
                                     91 	.globl _U1RB8
                                     92 	.globl _U1TB8
                                     93 	.globl _U1REN
                                     94 	.globl _U1SMOD
                                     95 	.globl _U1SM0
                                     96 	.globl _S0_R_FIFO
                                     97 	.globl _S0_T_FIFO
                                     98 	.globl _S0_FREE
                                     99 	.globl _S0_IF_BYTE
                                    100 	.globl _S0_IF_FIRST
                                    101 	.globl _S0_IF_OV
                                    102 	.globl _S0_FST_ACT
                                    103 	.globl _CP_RL2
                                    104 	.globl _C_T2
                                    105 	.globl _TR2
                                    106 	.globl _EXEN2
                                    107 	.globl _TCLK
                                    108 	.globl _RCLK
                                    109 	.globl _EXF2
                                    110 	.globl _CAP1F
                                    111 	.globl _TF2
                                    112 	.globl _RI
                                    113 	.globl _TI
                                    114 	.globl _RB8
                                    115 	.globl _TB8
                                    116 	.globl _REN
                                    117 	.globl _SM2
                                    118 	.globl _SM1
                                    119 	.globl _SM0
                                    120 	.globl _IT0
                                    121 	.globl _IE0
                                    122 	.globl _IT1
                                    123 	.globl _IE1
                                    124 	.globl _TR0
                                    125 	.globl _TF0
                                    126 	.globl _TR1
                                    127 	.globl _TF1
                                    128 	.globl _RXD
                                    129 	.globl _PWM1_
                                    130 	.globl _TXD
                                    131 	.globl _PWM2_
                                    132 	.globl _AIN3
                                    133 	.globl _VBUS1
                                    134 	.globl _INT0
                                    135 	.globl _TXD1_
                                    136 	.globl _INT1
                                    137 	.globl _T0
                                    138 	.globl _RXD1_
                                    139 	.globl _PWM2
                                    140 	.globl _T1
                                    141 	.globl _UDP
                                    142 	.globl _UDM
                                    143 	.globl _TIN0
                                    144 	.globl _CAP1
                                    145 	.globl _T2
                                    146 	.globl _AIN0
                                    147 	.globl _VBUS2
                                    148 	.globl _TIN1
                                    149 	.globl _CAP2
                                    150 	.globl _T2EX
                                    151 	.globl _RXD_
                                    152 	.globl _TXD_
                                    153 	.globl _AIN1
                                    154 	.globl _UCC1
                                    155 	.globl _TIN2
                                    156 	.globl _SCS
                                    157 	.globl _CAP1_
                                    158 	.globl _T2_
                                    159 	.globl _AIN2
                                    160 	.globl _UCC2
                                    161 	.globl _TIN3
                                    162 	.globl _PWM1
                                    163 	.globl _MOSI
                                    164 	.globl _TIN4
                                    165 	.globl _RXD1
                                    166 	.globl _MISO
                                    167 	.globl _TIN5
                                    168 	.globl _TXD1
                                    169 	.globl _SCK
                                    170 	.globl _IE_SPI0
                                    171 	.globl _IE_TKEY
                                    172 	.globl _IE_USB
                                    173 	.globl _IE_ADC
                                    174 	.globl _IE_UART1
                                    175 	.globl _IE_PWMX
                                    176 	.globl _IE_GPIO
                                    177 	.globl _IE_WDOG
                                    178 	.globl _PX0
                                    179 	.globl _PT0
                                    180 	.globl _PX1
                                    181 	.globl _PT1
                                    182 	.globl _PS
                                    183 	.globl _PT2
                                    184 	.globl _PL_FLAG
                                    185 	.globl _PH_FLAG
                                    186 	.globl _EX0
                                    187 	.globl _ET0
                                    188 	.globl _EX1
                                    189 	.globl _ET1
                                    190 	.globl _ES
                                    191 	.globl _ET2
                                    192 	.globl _E_DIS
                                    193 	.globl _EA
                                    194 	.globl _P
                                    195 	.globl _F1
                                    196 	.globl _OV
                                    197 	.globl _RS0
                                    198 	.globl _RS1
                                    199 	.globl _F0
                                    200 	.globl _AC
                                    201 	.globl _CY
                                    202 	.globl _UEP1_DMA_H
                                    203 	.globl _UEP1_DMA_L
                                    204 	.globl _UEP1_DMA
                                    205 	.globl _UEP0_DMA_H
                                    206 	.globl _UEP0_DMA_L
                                    207 	.globl _UEP0_DMA
                                    208 	.globl _UEP2_3_MOD
                                    209 	.globl _UEP4_1_MOD
                                    210 	.globl _UEP3_DMA_H
                                    211 	.globl _UEP3_DMA_L
                                    212 	.globl _UEP3_DMA
                                    213 	.globl _UEP2_DMA_H
                                    214 	.globl _UEP2_DMA_L
                                    215 	.globl _UEP2_DMA
                                    216 	.globl _USB_DEV_AD
                                    217 	.globl _USB_CTRL
                                    218 	.globl _USB_INT_EN
                                    219 	.globl _UEP4_T_LEN
                                    220 	.globl _UEP4_CTRL
                                    221 	.globl _UEP0_T_LEN
                                    222 	.globl _UEP0_CTRL
                                    223 	.globl _USB_RX_LEN
                                    224 	.globl _USB_MIS_ST
                                    225 	.globl _USB_INT_ST
                                    226 	.globl _USB_INT_FG
                                    227 	.globl _UEP3_T_LEN
                                    228 	.globl _UEP3_CTRL
                                    229 	.globl _UEP2_T_LEN
                                    230 	.globl _UEP2_CTRL
                                    231 	.globl _UEP1_T_LEN
                                    232 	.globl _UEP1_CTRL
                                    233 	.globl _UDEV_CTRL
                                    234 	.globl _USB_C_CTRL
                                    235 	.globl _TKEY_DATH
                                    236 	.globl _TKEY_DATL
                                    237 	.globl _TKEY_DAT
                                    238 	.globl _TKEY_CTRL
                                    239 	.globl _ADC_DATA
                                    240 	.globl _ADC_CFG
                                    241 	.globl _ADC_CTRL
                                    242 	.globl _SBAUD1
                                    243 	.globl _SBUF1
                                    244 	.globl _SCON1
                                    245 	.globl _SPI0_SETUP
                                    246 	.globl _SPI0_CK_SE
                                    247 	.globl _SPI0_CTRL
                                    248 	.globl _SPI0_DATA
                                    249 	.globl _SPI0_STAT
                                    250 	.globl _PWM_CK_SE
                                    251 	.globl _PWM_CTRL
                                    252 	.globl _PWM_DATA1
                                    253 	.globl _PWM_DATA2
                                    254 	.globl _T2CAP1H
                                    255 	.globl _T2CAP1L
                                    256 	.globl _T2CAP1
                                    257 	.globl _TH2
                                    258 	.globl _TL2
                                    259 	.globl _T2COUNT
                                    260 	.globl _RCAP2H
                                    261 	.globl _RCAP2L
                                    262 	.globl _RCAP2
                                    263 	.globl _T2MOD
                                    264 	.globl _T2CON
                                    265 	.globl _SBUF
                                    266 	.globl _SCON
                                    267 	.globl _TH1
                                    268 	.globl _TH0
                                    269 	.globl _TL1
                                    270 	.globl _TL0
                                    271 	.globl _TMOD
                                    272 	.globl _TCON
                                    273 	.globl _XBUS_AUX
                                    274 	.globl _PIN_FUNC
                                    275 	.globl _P3_DIR_PU
                                    276 	.globl _P3_MOD_OC
                                    277 	.globl _P3
                                    278 	.globl _P2
                                    279 	.globl _P1_DIR_PU
                                    280 	.globl _P1_MOD_OC
                                    281 	.globl _P1
                                    282 	.globl _ROM_CTRL
                                    283 	.globl _ROM_DATA_H
                                    284 	.globl _ROM_DATA_L
                                    285 	.globl _ROM_DATA
                                    286 	.globl _ROM_ADDR_H
                                    287 	.globl _ROM_ADDR_L
                                    288 	.globl _ROM_ADDR
                                    289 	.globl _GPIO_IE
                                    290 	.globl _IP_EX
                                    291 	.globl _IE_EX
                                    292 	.globl _IP
                                    293 	.globl _IE
                                    294 	.globl _WDOG_COUNT
                                    295 	.globl _RESET_KEEP
                                    296 	.globl _WAKE_CTRL
                                    297 	.globl _CLOCK_CFG
                                    298 	.globl _PCON
                                    299 	.globl _GLOBAL_CFG
                                    300 	.globl _SAFE_MOD
                                    301 	.globl _DPH
                                    302 	.globl _DPL
                                    303 	.globl _SP
                                    304 	.globl _B
                                    305 	.globl _ACC
                                    306 	.globl _PSW
                                    307 	.globl _diagLast
                                    308 	.globl _buttonCount
                                    309 	.globl _buttonStable
                                    310 	.globl _cmd
                                    311 	.globl _tmpColor
                                    312 	.globl _pressColor
                                    313 	.globl _pressLevel
                                    314 	.globl _pixels
                                    315 	.globl _heldButtons
                                    316 	.globl _heldKeys
                                    317 	.globl _heldMods
                                    318 	.globl _mouseReport
                                    319 	.globl _conReport
                                    320 	.globl _kbdReport
                                    321 	.globl _overrideColors
                                    322 	.globl _layerColors
                                    323 	.globl _light
                                    324 	.globl _bindings
                                    325 	.globl _encoderSteps
                                    326 	.globl _encoderState
                                    327 	.globl _errorFlashFrames
                                    328 	.globl _layerFlashFrames
                                    329 	.globl _pressCount
                                    330 	.globl _frame
                                    331 	.globl _heldMediaCtrl
                                    332 	.globl _overrideMask
                                    333 	.globl _editLayer
                                    334 	.globl _activeLayer
                                    335 	.globl _setPixelHue_PARM_2
                                    336 	.globl _setPixelScaled_PARM_3
                                    337 	.globl _setPixelScaled_PARM_2
                                    338 	.globl _sendMouse_PARM_3
                                    339 	.globl _sendMouse_PARM_2
                                    340 	.globl _sendKeys_PARM_2
                                    341 ;--------------------------------------------------------
                                    342 ; special function registers
                                    343 ;--------------------------------------------------------
                                    344 	.area RSEG    (ABS,DATA)
      000000                        345 	.org 0x0000
                           0000D0   346 _PSW	=	0x00d0
                           0000E0   347 _ACC	=	0x00e0
                           0000F0   348 _B	=	0x00f0
                           000081   349 _SP	=	0x0081
                           000082   350 _DPL	=	0x0082
                           000083   351 _DPH	=	0x0083
                           0000A1   352 _SAFE_MOD	=	0x00a1
                           0000B1   353 _GLOBAL_CFG	=	0x00b1
                           000087   354 _PCON	=	0x0087
                           0000B9   355 _CLOCK_CFG	=	0x00b9
                           0000A9   356 _WAKE_CTRL	=	0x00a9
                           0000FE   357 _RESET_KEEP	=	0x00fe
                           0000FF   358 _WDOG_COUNT	=	0x00ff
                           0000A8   359 _IE	=	0x00a8
                           0000B8   360 _IP	=	0x00b8
                           0000E8   361 _IE_EX	=	0x00e8
                           0000E9   362 _IP_EX	=	0x00e9
                           0000C7   363 _GPIO_IE	=	0x00c7
                           008584   364 _ROM_ADDR	=	0x8584
                           000084   365 _ROM_ADDR_L	=	0x0084
                           000085   366 _ROM_ADDR_H	=	0x0085
                           008F8E   367 _ROM_DATA	=	0x8f8e
                           00008E   368 _ROM_DATA_L	=	0x008e
                           00008F   369 _ROM_DATA_H	=	0x008f
                           000086   370 _ROM_CTRL	=	0x0086
                           000090   371 _P1	=	0x0090
                           000092   372 _P1_MOD_OC	=	0x0092
                           000093   373 _P1_DIR_PU	=	0x0093
                           0000A0   374 _P2	=	0x00a0
                           0000B0   375 _P3	=	0x00b0
                           000096   376 _P3_MOD_OC	=	0x0096
                           000097   377 _P3_DIR_PU	=	0x0097
                           0000C6   378 _PIN_FUNC	=	0x00c6
                           0000A2   379 _XBUS_AUX	=	0x00a2
                           000088   380 _TCON	=	0x0088
                           000089   381 _TMOD	=	0x0089
                           00008A   382 _TL0	=	0x008a
                           00008B   383 _TL1	=	0x008b
                           00008C   384 _TH0	=	0x008c
                           00008D   385 _TH1	=	0x008d
                           000098   386 _SCON	=	0x0098
                           000099   387 _SBUF	=	0x0099
                           0000C8   388 _T2CON	=	0x00c8
                           0000C9   389 _T2MOD	=	0x00c9
                           00CBCA   390 _RCAP2	=	0xcbca
                           0000CA   391 _RCAP2L	=	0x00ca
                           0000CB   392 _RCAP2H	=	0x00cb
                           00CDCC   393 _T2COUNT	=	0xcdcc
                           0000CC   394 _TL2	=	0x00cc
                           0000CD   395 _TH2	=	0x00cd
                           00CFCE   396 _T2CAP1	=	0xcfce
                           0000CE   397 _T2CAP1L	=	0x00ce
                           0000CF   398 _T2CAP1H	=	0x00cf
                           00009B   399 _PWM_DATA2	=	0x009b
                           00009C   400 _PWM_DATA1	=	0x009c
                           00009D   401 _PWM_CTRL	=	0x009d
                           00009E   402 _PWM_CK_SE	=	0x009e
                           0000F8   403 _SPI0_STAT	=	0x00f8
                           0000F9   404 _SPI0_DATA	=	0x00f9
                           0000FA   405 _SPI0_CTRL	=	0x00fa
                           0000FB   406 _SPI0_CK_SE	=	0x00fb
                           0000FC   407 _SPI0_SETUP	=	0x00fc
                           0000C0   408 _SCON1	=	0x00c0
                           0000C1   409 _SBUF1	=	0x00c1
                           0000C2   410 _SBAUD1	=	0x00c2
                           000080   411 _ADC_CTRL	=	0x0080
                           00009A   412 _ADC_CFG	=	0x009a
                           00009F   413 _ADC_DATA	=	0x009f
                           0000C3   414 _TKEY_CTRL	=	0x00c3
                           00C5C4   415 _TKEY_DAT	=	0xc5c4
                           0000C4   416 _TKEY_DATL	=	0x00c4
                           0000C5   417 _TKEY_DATH	=	0x00c5
                           000091   418 _USB_C_CTRL	=	0x0091
                           0000D1   419 _UDEV_CTRL	=	0x00d1
                           0000D2   420 _UEP1_CTRL	=	0x00d2
                           0000D3   421 _UEP1_T_LEN	=	0x00d3
                           0000D4   422 _UEP2_CTRL	=	0x00d4
                           0000D5   423 _UEP2_T_LEN	=	0x00d5
                           0000D6   424 _UEP3_CTRL	=	0x00d6
                           0000D7   425 _UEP3_T_LEN	=	0x00d7
                           0000D8   426 _USB_INT_FG	=	0x00d8
                           0000D9   427 _USB_INT_ST	=	0x00d9
                           0000DA   428 _USB_MIS_ST	=	0x00da
                           0000DB   429 _USB_RX_LEN	=	0x00db
                           0000DC   430 _UEP0_CTRL	=	0x00dc
                           0000DD   431 _UEP0_T_LEN	=	0x00dd
                           0000DE   432 _UEP4_CTRL	=	0x00de
                           0000DF   433 _UEP4_T_LEN	=	0x00df
                           0000E1   434 _USB_INT_EN	=	0x00e1
                           0000E2   435 _USB_CTRL	=	0x00e2
                           0000E3   436 _USB_DEV_AD	=	0x00e3
                           00E5E4   437 _UEP2_DMA	=	0xe5e4
                           0000E4   438 _UEP2_DMA_L	=	0x00e4
                           0000E5   439 _UEP2_DMA_H	=	0x00e5
                           00E7E6   440 _UEP3_DMA	=	0xe7e6
                           0000E6   441 _UEP3_DMA_L	=	0x00e6
                           0000E7   442 _UEP3_DMA_H	=	0x00e7
                           0000EA   443 _UEP4_1_MOD	=	0x00ea
                           0000EB   444 _UEP2_3_MOD	=	0x00eb
                           00EDEC   445 _UEP0_DMA	=	0xedec
                           0000EC   446 _UEP0_DMA_L	=	0x00ec
                           0000ED   447 _UEP0_DMA_H	=	0x00ed
                           00EFEE   448 _UEP1_DMA	=	0xefee
                           0000EE   449 _UEP1_DMA_L	=	0x00ee
                           0000EF   450 _UEP1_DMA_H	=	0x00ef
                                    451 ;--------------------------------------------------------
                                    452 ; special function bits
                                    453 ;--------------------------------------------------------
                                    454 	.area RSEG    (ABS,DATA)
      000000                        455 	.org 0x0000
                           0000D7   456 _CY	=	0x00d7
                           0000D6   457 _AC	=	0x00d6
                           0000D5   458 _F0	=	0x00d5
                           0000D4   459 _RS1	=	0x00d4
                           0000D3   460 _RS0	=	0x00d3
                           0000D2   461 _OV	=	0x00d2
                           0000D1   462 _F1	=	0x00d1
                           0000D0   463 _P	=	0x00d0
                           0000AF   464 _EA	=	0x00af
                           0000AE   465 _E_DIS	=	0x00ae
                           0000AD   466 _ET2	=	0x00ad
                           0000AC   467 _ES	=	0x00ac
                           0000AB   468 _ET1	=	0x00ab
                           0000AA   469 _EX1	=	0x00aa
                           0000A9   470 _ET0	=	0x00a9
                           0000A8   471 _EX0	=	0x00a8
                           0000BF   472 _PH_FLAG	=	0x00bf
                           0000BE   473 _PL_FLAG	=	0x00be
                           0000BD   474 _PT2	=	0x00bd
                           0000BC   475 _PS	=	0x00bc
                           0000BB   476 _PT1	=	0x00bb
                           0000BA   477 _PX1	=	0x00ba
                           0000B9   478 _PT0	=	0x00b9
                           0000B8   479 _PX0	=	0x00b8
                           0000EF   480 _IE_WDOG	=	0x00ef
                           0000EE   481 _IE_GPIO	=	0x00ee
                           0000ED   482 _IE_PWMX	=	0x00ed
                           0000EC   483 _IE_UART1	=	0x00ec
                           0000EB   484 _IE_ADC	=	0x00eb
                           0000EA   485 _IE_USB	=	0x00ea
                           0000E9   486 _IE_TKEY	=	0x00e9
                           0000E8   487 _IE_SPI0	=	0x00e8
                           000097   488 _SCK	=	0x0097
                           000097   489 _TXD1	=	0x0097
                           000097   490 _TIN5	=	0x0097
                           000096   491 _MISO	=	0x0096
                           000096   492 _RXD1	=	0x0096
                           000096   493 _TIN4	=	0x0096
                           000095   494 _MOSI	=	0x0095
                           000095   495 _PWM1	=	0x0095
                           000095   496 _TIN3	=	0x0095
                           000095   497 _UCC2	=	0x0095
                           000095   498 _AIN2	=	0x0095
                           000094   499 _T2_	=	0x0094
                           000094   500 _CAP1_	=	0x0094
                           000094   501 _SCS	=	0x0094
                           000094   502 _TIN2	=	0x0094
                           000094   503 _UCC1	=	0x0094
                           000094   504 _AIN1	=	0x0094
                           000093   505 _TXD_	=	0x0093
                           000092   506 _RXD_	=	0x0092
                           000091   507 _T2EX	=	0x0091
                           000091   508 _CAP2	=	0x0091
                           000091   509 _TIN1	=	0x0091
                           000091   510 _VBUS2	=	0x0091
                           000091   511 _AIN0	=	0x0091
                           000090   512 _T2	=	0x0090
                           000090   513 _CAP1	=	0x0090
                           000090   514 _TIN0	=	0x0090
                           0000B7   515 _UDM	=	0x00b7
                           0000B6   516 _UDP	=	0x00b6
                           0000B5   517 _T1	=	0x00b5
                           0000B4   518 _PWM2	=	0x00b4
                           0000B4   519 _RXD1_	=	0x00b4
                           0000B4   520 _T0	=	0x00b4
                           0000B3   521 _INT1	=	0x00b3
                           0000B2   522 _TXD1_	=	0x00b2
                           0000B2   523 _INT0	=	0x00b2
                           0000B2   524 _VBUS1	=	0x00b2
                           0000B2   525 _AIN3	=	0x00b2
                           0000B1   526 _PWM2_	=	0x00b1
                           0000B1   527 _TXD	=	0x00b1
                           0000B0   528 _PWM1_	=	0x00b0
                           0000B0   529 _RXD	=	0x00b0
                           00008F   530 _TF1	=	0x008f
                           00008E   531 _TR1	=	0x008e
                           00008D   532 _TF0	=	0x008d
                           00008C   533 _TR0	=	0x008c
                           00008B   534 _IE1	=	0x008b
                           00008A   535 _IT1	=	0x008a
                           000089   536 _IE0	=	0x0089
                           000088   537 _IT0	=	0x0088
                           00009F   538 _SM0	=	0x009f
                           00009E   539 _SM1	=	0x009e
                           00009D   540 _SM2	=	0x009d
                           00009C   541 _REN	=	0x009c
                           00009B   542 _TB8	=	0x009b
                           00009A   543 _RB8	=	0x009a
                           000099   544 _TI	=	0x0099
                           000098   545 _RI	=	0x0098
                           0000CF   546 _TF2	=	0x00cf
                           0000CF   547 _CAP1F	=	0x00cf
                           0000CE   548 _EXF2	=	0x00ce
                           0000CD   549 _RCLK	=	0x00cd
                           0000CC   550 _TCLK	=	0x00cc
                           0000CB   551 _EXEN2	=	0x00cb
                           0000CA   552 _TR2	=	0x00ca
                           0000C9   553 _C_T2	=	0x00c9
                           0000C8   554 _CP_RL2	=	0x00c8
                           0000FF   555 _S0_FST_ACT	=	0x00ff
                           0000FE   556 _S0_IF_OV	=	0x00fe
                           0000FD   557 _S0_IF_FIRST	=	0x00fd
                           0000FC   558 _S0_IF_BYTE	=	0x00fc
                           0000FB   559 _S0_FREE	=	0x00fb
                           0000FA   560 _S0_T_FIFO	=	0x00fa
                           0000F8   561 _S0_R_FIFO	=	0x00f8
                           0000C7   562 _U1SM0	=	0x00c7
                           0000C5   563 _U1SMOD	=	0x00c5
                           0000C4   564 _U1REN	=	0x00c4
                           0000C3   565 _U1TB8	=	0x00c3
                           0000C2   566 _U1RB8	=	0x00c2
                           0000C1   567 _U1TI	=	0x00c1
                           0000C0   568 _U1RI	=	0x00c0
                           000087   569 _CMPO	=	0x0087
                           000086   570 _CMP_IF	=	0x0086
                           000085   571 _ADC_IF	=	0x0085
                           000084   572 _ADC_START	=	0x0084
                           000083   573 _CMP_CHAN	=	0x0083
                           000081   574 _ADC_CHAN1	=	0x0081
                           000080   575 _ADC_CHAN0	=	0x0080
                           0000DF   576 _U_IS_NAK	=	0x00df
                           0000DE   577 _U_TOG_OK	=	0x00de
                           0000DD   578 _U_SIE_FREE	=	0x00dd
                           0000DC   579 _UIF_FIFO_OV	=	0x00dc
                           0000DB   580 _UIF_HST_SOF	=	0x00db
                           0000DA   581 _UIF_SUSPEND	=	0x00da
                           0000D9   582 _UIF_TRANSFER	=	0x00d9
                           0000D8   583 _UIF_DETECT	=	0x00d8
                           0000D8   584 _UIF_BUS_RST	=	0x00d8
                           000090   585 _PP10	=	0x0090
                           000091   586 _PP11	=	0x0091
                           000092   587 _PP12	=	0x0092
                           000093   588 _PP13	=	0x0093
                           000094   589 _PP14	=	0x0094
                           000095   590 _PP15	=	0x0095
                           000096   591 _PP16	=	0x0096
                           000097   592 _PP17	=	0x0097
                           0000B0   593 _PP30	=	0x00b0
                           0000B1   594 _PP31	=	0x00b1
                           0000B2   595 _PP32	=	0x00b2
                           0000B3   596 _PP33	=	0x00b3
                           0000B4   597 _PP34	=	0x00b4
                           0000B5   598 _PP35	=	0x00b5
                           0000B6   599 _PP36	=	0x00b6
                           0000B7   600 _PP37	=	0x00b7
                                    601 ;--------------------------------------------------------
                                    602 ; overlayable register banks
                                    603 ;--------------------------------------------------------
                                    604 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        605 	.ds 8
                                    606 ;--------------------------------------------------------
                                    607 ; overlayable bit register bank
                                    608 ;--------------------------------------------------------
                                    609 	.area BIT_BANK	(REL,OVR,DATA)
      000021                        610 bits:
      000021                        611 	.ds 1
                           008000   612 	b0 = bits[0]
                           008100   613 	b1 = bits[1]
                           008200   614 	b2 = bits[2]
                           008300   615 	b3 = bits[3]
                           008400   616 	b4 = bits[4]
                           008500   617 	b5 = bits[5]
                           008600   618 	b6 = bits[6]
                           008700   619 	b7 = bits[7]
                                    620 ;--------------------------------------------------------
                                    621 ; internal ram data
                                    622 ;--------------------------------------------------------
                                    623 	.area DSEG    (DATA)
      000008                        624 _loadSettings_i_10000_511:
      000008                        625 	.ds 1
      000009                        626 _loadSettings_len_10000_511:
      000009                        627 	.ds 1
      00000A                        628 _sendKeys_PARM_2:
      00000A                        629 	.ds 1
      00000B                        630 _sendMouse_PARM_2:
      00000B                        631 	.ds 1
      00000C                        632 _sendMouse_PARM_3:
      00000C                        633 	.ds 1
      00000D                        634 _controlDown_ctrl_10000_545:
      00000D                        635 	.ds 1
      00000E                        636 _controlDown_i_10000_546:
      00000E                        637 	.ds 1
      00000F                        638 _controlDown_last_10000_546:
      00000F                        639 	.ds 1
      000010                        640 _setPixelScaled_PARM_2:
      000010                        641 	.ds 2
      000012                        642 _setPixelScaled_PARM_3:
      000012                        643 	.ds 1
      000013                        644 _setPixelHue_PARM_2:
      000013                        645 	.ds 1
      000014                        646 _renderLights_i_10000_578:
      000014                        647 	.ds 1
      000015                        648 _renderLights_phase_10000_578:
      000015                        649 	.ds 1
      000016                        650 _handleCommand_i_10000_623:
      000016                        651 	.ds 1
      000017                        652 _handleCommand_sloc0_1_0:
      000017                        653 	.ds 2
                                    654 ;--------------------------------------------------------
                                    655 ; overlayable items in internal ram
                                    656 ;--------------------------------------------------------
                                    657 	.area	OSEG    (OVR,DATA)
                                    658 	.area	OSEG    (OVR,DATA)
      00001D                        659 _setPixel_PARM_2:
      00001D                        660 	.ds 1
      00001E                        661 _setPixel_PARM_3:
      00001E                        662 	.ds 1
      00001F                        663 _setPixel_PARM_4:
      00001F                        664 	.ds 1
                                    665 	.area	OSEG    (OVR,DATA)
      00001D                        666 _flashPress_i_10000_575:
      00001D                        667 	.ds 1
                                    668 	.area	OSEG    (OVR,DATA)
                                    669 	.area	OSEG    (OVR,DATA)
                                    670 	.area	OSEG    (OVR,DATA)
                                    671 ;--------------------------------------------------------
                                    672 ; Stack segment in internal ram
                                    673 ;--------------------------------------------------------
                                    674 	.area SSEG
      000035                        675 __start__stack:
      000035                        676 	.ds	1
                                    677 
                                    678 ;--------------------------------------------------------
                                    679 ; indirectly addressable internal ram data
                                    680 ;--------------------------------------------------------
                                    681 	.area ISEG    (DATA)
      000028                        682 _activeLayer::
      000028                        683 	.ds 1
      000029                        684 _editLayer::
      000029                        685 	.ds 1
      00002A                        686 _overrideMask::
      00002A                        687 	.ds 1
      00002B                        688 _heldMediaCtrl::
      00002B                        689 	.ds 1
      00002C                        690 _frame::
      00002C                        691 	.ds 2
      00002E                        692 _pressCount::
      00002E                        693 	.ds 1
      00002F                        694 _layerFlashFrames::
      00002F                        695 	.ds 1
      000030                        696 _errorFlashFrames::
      000030                        697 	.ds 1
      000031                        698 _encoderState::
      000031                        699 	.ds 1
      000032                        700 _encoderSteps::
      000032                        701 	.ds 1
                                    702 ;--------------------------------------------------------
                                    703 ; absolute internal ram data
                                    704 ;--------------------------------------------------------
                                    705 	.area IABS    (ABS,DATA)
                                    706 	.area IABS    (ABS,DATA)
                                    707 ;--------------------------------------------------------
                                    708 ; bit data
                                    709 ;--------------------------------------------------------
                                    710 	.area BSEG    (BIT)
      000000                        711 _readButton_sloc0_1_0:
      000000                        712 	.ds 1
                                    713 ;--------------------------------------------------------
                                    714 ; paged external ram data
                                    715 ;--------------------------------------------------------
                                    716 	.area PSEG    (PAG,XDATA)
                                    717 ;--------------------------------------------------------
                                    718 ; uninitialized external ram data
                                    719 ;--------------------------------------------------------
                                    720 	.area XSEG    (XDATA)
      000100                        721 _bindings::
      000100                        722 	.ds 198
      0001C6                        723 _light::
      0001C6                        724 	.ds 8
      0001CE                        725 _layerColors::
      0001CE                        726 	.ds 9
      0001D7                        727 _overrideColors::
      0001D7                        728 	.ds 9
      0001E0                        729 _kbdReport::
      0001E0                        730 	.ds 9
      0001E9                        731 _conReport::
      0001E9                        732 	.ds 3
      0001EC                        733 _mouseReport::
      0001EC                        734 	.ds 5
      0001F1                        735 _heldMods::
      0001F1                        736 	.ds 6
      0001F7                        737 _heldKeys::
      0001F7                        738 	.ds 6
      0001FD                        739 _heldButtons::
      0001FD                        740 	.ds 6
      000203                        741 _pixels::
      000203                        742 	.ds 9
      00020C                        743 _pressLevel::
      00020C                        744 	.ds 3
      00020F                        745 _pressColor::
      00020F                        746 	.ds 9
      000218                        747 _tmpColor::
      000218                        748 	.ds 3
      00021B                        749 _cmd::
      00021B                        750 	.ds 12
      000227                        751 _buttonStable::
      000227                        752 	.ds 4
      00022B                        753 _buttonCount::
      00022B                        754 	.ds 4
      00022F                        755 _diagLast::
      00022F                        756 	.ds 13
                                    757 ;--------------------------------------------------------
                                    758 ; absolute external ram data
                                    759 ;--------------------------------------------------------
                                    760 	.area XABS    (ABS,XDATA)
                                    761 ;--------------------------------------------------------
                                    762 ; initialized external ram data
                                    763 ;--------------------------------------------------------
                                    764 	.area HOME    (CODE)
                                    765 	.area GSINIT0 (CODE)
                                    766 	.area GSINIT1 (CODE)
                                    767 	.area GSINIT2 (CODE)
                                    768 	.area GSINIT3 (CODE)
                                    769 	.area GSINIT4 (CODE)
                                    770 	.area GSINIT5 (CODE)
                                    771 	.area GSINIT  (CODE)
                                    772 	.area GSFINAL (CODE)
                                    773 	.area CSEG    (CODE)
                                    774 ;--------------------------------------------------------
                                    775 ; interrupt vector
                                    776 ;--------------------------------------------------------
                                    777 	.area HOME    (CODE)
      000000                        778 __interrupt_vect:
      000000 02 00 B8         [24]  779 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  780 	reti
      000004                        781 	.ds	7
      00000B 32               [24]  782 	reti
      00000C                        783 	.ds	7
      000013 32               [24]  784 	reti
      000014                        785 	.ds	7
      00001B 32               [24]  786 	reti
      00001C                        787 	.ds	7
      000023 32               [24]  788 	reti
      000024                        789 	.ds	7
      00002B 32               [24]  790 	reti
      00002C                        791 	.ds	7
      000033 32               [24]  792 	reti
      000034                        793 	.ds	7
      00003B 32               [24]  794 	reti
      00003C                        795 	.ds	7
      000043 02 00 FE         [24]  796 	ljmp	_USB_ISR
                                    797 ; restartable atomic support routines
      000046                        798 	.ds	2
      000048                        799 sdcc_atomic_exchange_rollback_start::
      000048 00               [12]  800 	nop
      000049 00               [12]  801 	nop
      00004A                        802 sdcc_atomic_exchange_pdata_impl:
      00004A E2               [24]  803 	movx	a, @r0
      00004B FB               [12]  804 	mov	r3, a
      00004C EA               [12]  805 	mov	a, r2
      00004D F2               [24]  806 	movx	@r0, a
      00004E 80 2C            [24]  807 	sjmp	sdcc_atomic_exchange_exit
      000050 00               [12]  808 	nop
      000051 00               [12]  809 	nop
      000052                        810 sdcc_atomic_exchange_xdata_impl:
      000052 E0               [24]  811 	movx	a, @dptr
      000053 FB               [12]  812 	mov	r3, a
      000054 EA               [12]  813 	mov	a, r2
      000055 F0               [24]  814 	movx	@dptr, a
      000056 80 24            [24]  815 	sjmp	sdcc_atomic_exchange_exit
      000058                        816 sdcc_atomic_compare_exchange_idata_impl:
      000058 E6               [12]  817 	mov	a, @r0
      000059 B5 02 02         [24]  818 	cjne	a, ar2, .+#5
      00005C EB               [12]  819 	mov	a, r3
      00005D F6               [12]  820 	mov	@r0, a
      00005E 22               [24]  821 	ret
      00005F 00               [12]  822 	nop
      000060                        823 sdcc_atomic_compare_exchange_pdata_impl:
      000060 E2               [24]  824 	movx	a, @r0
      000061 B5 02 02         [24]  825 	cjne	a, ar2, .+#5
      000064 EB               [12]  826 	mov	a, r3
      000065 F2               [24]  827 	movx	@r0, a
      000066 22               [24]  828 	ret
      000067 00               [12]  829 	nop
      000068                        830 sdcc_atomic_compare_exchange_xdata_impl:
      000068 E0               [24]  831 	movx	a, @dptr
      000069 B5 02 02         [24]  832 	cjne	a, ar2, .+#5
      00006C EB               [12]  833 	mov	a, r3
      00006D F0               [24]  834 	movx	@dptr, a
      00006E 22               [24]  835 	ret
      00006F                        836 sdcc_atomic_exchange_rollback_end::
                                    837 
      00006F                        838 sdcc_atomic_exchange_gptr_impl::
      00006F 30 F6 E0         [24]  839 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      000072 A8 82            [24]  840 	mov	r0, dpl
      000074 20 F5 D3         [24]  841 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      000077                        842 sdcc_atomic_exchange_idata_impl:
      000077 EA               [12]  843 	mov	a, r2
      000078 C6               [12]  844 	xch	a, @r0
      000079 F5 82            [12]  845 	mov	dpl, a
      00007B 22               [24]  846 	ret
      00007C                        847 sdcc_atomic_exchange_exit:
      00007C 8B 82            [24]  848 	mov	dpl, r3
      00007E 22               [24]  849 	ret
      00007F                        850 sdcc_atomic_compare_exchange_gptr_impl::
      00007F 30 F6 E6         [24]  851 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      000082 A8 82            [24]  852 	mov	r0, dpl
      000084 20 F5 D9         [24]  853 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      000087 80 CF            [24]  854 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    855 ;--------------------------------------------------------
                                    856 ; global & static initialisations
                                    857 ;--------------------------------------------------------
                                    858 	.area HOME    (CODE)
                                    859 	.area GSINIT  (CODE)
                                    860 	.area GSFINAL (CODE)
                                    861 	.area GSINIT  (CODE)
                                    862 	.globl __sdcc_gsinit_startup
                                    863 	.globl __sdcc_program_startup
                                    864 	.globl __start__stack
                                    865 	.globl __mcs51_genRAMCLEAR
                                    866 ;	minikeys.c:52: __idata uint8_t activeLayer = 0;
      0000CB 78 28            [12]  867 	mov	r0,#_activeLayer
      0000CD 76 00            [12]  868 	mov	@r0,#0x00
                                    869 ;	minikeys.c:53: __idata uint8_t editLayer = 0;
      0000CF 78 29            [12]  870 	mov	r0,#_editLayer
      0000D1 76 00            [12]  871 	mov	@r0,#0x00
                                    872 ;	minikeys.c:78: __idata uint8_t overrideMask = 0;            // bit i: pixel i shows overrideColors[i]
      0000D3 78 2A            [12]  873 	mov	r0,#_overrideMask
      0000D5 76 00            [12]  874 	mov	@r0,#0x00
                                    875 ;	minikeys.c:169: __idata uint8_t heldMediaCtrl = 0xFF;
      0000D7 78 2B            [12]  876 	mov	r0,#_heldMediaCtrl
      0000D9 76 FF            [12]  877 	mov	@r0,#0xff
                                    878 ;	minikeys.c:257: __idata uint16_t frame = 0;                 // 20 ms frames
      0000DB 78 2C            [12]  879 	mov	r0,#_frame
      0000DD E4               [12]  880 	clr	a
      0000DE F6               [12]  881 	mov	@r0,a
      0000DF 08               [12]  882 	inc	r0
      0000E0 F6               [12]  883 	mov	@r0,a
                                    884 ;	minikeys.c:261: __idata uint8_t pressCount = 0;
      0000E1 78 2E            [12]  885 	mov	r0,#_pressCount
      0000E3 76 00            [12]  886 	mov	@r0,#0x00
                                    887 ;	minikeys.c:262: __idata uint8_t layerFlashFrames = 0;
      0000E5 78 2F            [12]  888 	mov	r0,#_layerFlashFrames
      0000E7 76 00            [12]  889 	mov	@r0,#0x00
                                    890 ;	minikeys.c:263: __idata uint8_t errorFlashFrames = 0;
      0000E9 78 30            [12]  891 	mov	r0,#_errorFlashFrames
      0000EB 76 00            [12]  892 	mov	@r0,#0x00
                                    893 ;	minikeys.c:501: __idata int8_t  encoderSteps = 0;
      0000ED 78 32            [12]  894 	mov	r0,#_encoderSteps
      0000EF 76 00            [12]  895 	mov	@r0,#0x00
                                    896 	.area GSFINAL (CODE)
      0000FB 02 00 89         [24]  897 	ljmp	__sdcc_program_startup
                                    898 ;--------------------------------------------------------
                                    899 ; Home
                                    900 ;--------------------------------------------------------
                                    901 	.area HOME    (CODE)
                                    902 	.area HOME    (CODE)
      000089                        903 __sdcc_program_startup:
      000089 12 13 3A         [24]  904 	lcall	_main
      00008C                        905 __sdcc_program_exit:
      00008C 80 FE            [24]  906 	sjmp	.
                                    907 ;	return from main will return to caller
                                    908 ;--------------------------------------------------------
                                    909 ; code
                                    910 ;--------------------------------------------------------
                                    911 	.area CSEG    (CODE)
                                    912 ;------------------------------------------------------------
                                    913 ;Allocation info for local variables in function 'USB_ISR'
                                    914 ;------------------------------------------------------------
                                    915 ;	minikeys.c:24: void USB_ISR(void) __interrupt(INT_NO_USB) {
                                    916 ;	-----------------------------------------
                                    917 ;	 function USB_ISR
                                    918 ;	-----------------------------------------
      0000FE                        919 _USB_ISR:
                           000007   920 	ar7 = 0x07
                           000006   921 	ar6 = 0x06
                           000005   922 	ar5 = 0x05
                           000004   923 	ar4 = 0x04
                           000003   924 	ar3 = 0x03
                           000002   925 	ar2 = 0x02
                           000001   926 	ar1 = 0x01
                           000000   927 	ar0 = 0x00
      0000FE C0 21            [24]  928 	push	bits
      000100 C0 E0            [24]  929 	push	acc
      000102 C0 F0            [24]  930 	push	b
      000104 C0 82            [24]  931 	push	dpl
      000106 C0 83            [24]  932 	push	dph
      000108 C0 07            [24]  933 	push	(0+7)
      00010A C0 06            [24]  934 	push	(0+6)
      00010C C0 05            [24]  935 	push	(0+5)
      00010E C0 04            [24]  936 	push	(0+4)
      000110 C0 03            [24]  937 	push	(0+3)
      000112 C0 02            [24]  938 	push	(0+2)
      000114 C0 01            [24]  939 	push	(0+1)
      000116 C0 00            [24]  940 	push	(0+0)
      000118 C0 D0            [24]  941 	push	psw
      00011A 75 D0 00         [24]  942 	mov	psw,#0x00
                                    943 ;	minikeys.c:25: USB_interrupt();
      00011D 12 19 F7         [24]  944 	lcall	_USB_interrupt
                                    945 ;	minikeys.c:26: }
      000120 D0 D0            [24]  946 	pop	psw
      000122 D0 00            [24]  947 	pop	(0+0)
      000124 D0 01            [24]  948 	pop	(0+1)
      000126 D0 02            [24]  949 	pop	(0+2)
      000128 D0 03            [24]  950 	pop	(0+3)
      00012A D0 04            [24]  951 	pop	(0+4)
      00012C D0 05            [24]  952 	pop	(0+5)
      00012E D0 06            [24]  953 	pop	(0+6)
      000130 D0 07            [24]  954 	pop	(0+7)
      000132 D0 83            [24]  955 	pop	dph
      000134 D0 82            [24]  956 	pop	dpl
      000136 D0 F0            [24]  957 	pop	b
      000138 D0 E0            [24]  958 	pop	acc
      00013A D0 21            [24]  959 	pop	bits
      00013C 02 00 8E         [24]  960 	ljmp	sdcc_atomic_maybe_rollback
                                    961 ;------------------------------------------------------------
                                    962 ;Allocation info for local variables in function 'setDefaults'
                                    963 ;------------------------------------------------------------
                                    964 ;i             Allocated to registers r7 
                                    965 ;s             Allocated to registers r5 r4 
                                    966 ;------------------------------------------------------------
                                    967 ;	minikeys.c:96: void setDefaults(void) {
                                    968 ;	-----------------------------------------
                                    969 ;	 function setDefaults
                                    970 ;	-----------------------------------------
      00013F                        971 _setDefaults:
                                    972 ;	minikeys.c:98: for(i=0; i<LAYERS * CONTROLS; i++) bindings[i][0] = 0;
      00013F 7F 00            [12]  973 	mov	r7,#0x00
      000141                        974 00103$:
      000141 EF               [12]  975 	mov	a,r7
      000142 75 F0 0B         [24]  976 	mov	b,#0x0b
      000145 A4               [48]  977 	mul	ab
      000146 24 00            [12]  978 	add	a, #_bindings
      000148 F5 82            [12]  979 	mov	dpl,a
      00014A 74 01            [12]  980 	mov	a,#(_bindings >> 8)
      00014C 35 F0            [12]  981 	addc	a, b
      00014E F5 83            [12]  982 	mov	dph,a
      000150 E4               [12]  983 	clr	a
      000151 F0               [24]  984 	movx	@dptr,a
      000152 0F               [12]  985 	inc	r7
      000153 BF 12 00         [24]  986 	cjne	r7,#0x12,00143$
      000156                        987 00143$:
      000156 40 E9            [24]  988 	jc	00103$
                                    989 ;	minikeys.c:99: for(i=0; i<LAYERS; i++) {
      000158 7F 00            [12]  990 	mov	r7,#0x00
      00015A                        991 00105$:
                                    992 ;	minikeys.c:101: __xdata uint8_t* s = bindings[i * CONTROLS];
      00015A 8F 06            [24]  993 	mov	ar6,r7
      00015C EE               [12]  994 	mov	a,r6
      00015D 75 F0 06         [24]  995 	mov	b,#0x06
      000160 A4               [48]  996 	mul	ab
      000161 FE               [12]  997 	mov	r6,a
      000162 75 F0 0B         [24]  998 	mov	b,#0x0b
      000165 A4               [48]  999 	mul	ab
      000166 24 00            [12] 1000 	add	a,#_bindings
      000168 FD               [12] 1001 	mov	r5,a
      000169 E4               [12] 1002 	clr	a
      00016A 34 01            [12] 1003 	addc	a, #(_bindings >> 8)
      00016C FC               [12] 1004 	mov	r4,a
                                   1005 ;	minikeys.c:102: s[0] = TYPE_KEYS << 5 | 2; s[1] = 0; s[2] = 0x1E;       // 1
      00016D 8D 82            [24] 1006 	mov	dpl,r5
      00016F 8C 83            [24] 1007 	mov	dph,r4
      000171 74 22            [12] 1008 	mov	a,#0x22
      000173 F0               [24] 1009 	movx	@dptr,a
      000174 8D 82            [24] 1010 	mov	dpl,r5
      000176 8C 83            [24] 1011 	mov	dph,r4
      000178 A3               [24] 1012 	inc	dptr
      000179 E4               [12] 1013 	clr	a
      00017A F0               [24] 1014 	movx	@dptr,a
      00017B 8D 82            [24] 1015 	mov	dpl,r5
      00017D 8C 83            [24] 1016 	mov	dph,r4
      00017F A3               [24] 1017 	inc	dptr
      000180 A3               [24] 1018 	inc	dptr
      000181 74 1E            [12] 1019 	mov	a,#0x1e
      000183 F0               [24] 1020 	movx	@dptr,a
                                   1021 ;	minikeys.c:103: s = bindings[i * CONTROLS + 1];
      000184 8E 05            [24] 1022 	mov	ar5,r6
      000186 ED               [12] 1023 	mov	a,r5
      000187 04               [12] 1024 	inc	a
      000188 75 F0 0B         [24] 1025 	mov	b,#0x0b
      00018B A4               [48] 1026 	mul	ab
      00018C 24 00            [12] 1027 	add	a,#_bindings
      00018E FD               [12] 1028 	mov	r5,a
      00018F E4               [12] 1029 	clr	a
      000190 34 01            [12] 1030 	addc	a, #(_bindings >> 8)
      000192 FC               [12] 1031 	mov	r4,a
                                   1032 ;	minikeys.c:104: s[0] = TYPE_KEYS << 5 | 2; s[1] = 0; s[2] = 0x1F;       // 2
      000193 8D 82            [24] 1033 	mov	dpl,r5
      000195 8C 83            [24] 1034 	mov	dph,r4
      000197 74 22            [12] 1035 	mov	a,#0x22
      000199 F0               [24] 1036 	movx	@dptr,a
      00019A 8D 82            [24] 1037 	mov	dpl,r5
      00019C 8C 83            [24] 1038 	mov	dph,r4
      00019E A3               [24] 1039 	inc	dptr
      00019F E4               [12] 1040 	clr	a
      0001A0 F0               [24] 1041 	movx	@dptr,a
      0001A1 8D 82            [24] 1042 	mov	dpl,r5
      0001A3 8C 83            [24] 1043 	mov	dph,r4
      0001A5 A3               [24] 1044 	inc	dptr
      0001A6 A3               [24] 1045 	inc	dptr
      0001A7 74 1F            [12] 1046 	mov	a,#0x1f
      0001A9 F0               [24] 1047 	movx	@dptr,a
                                   1048 ;	minikeys.c:105: s = bindings[i * CONTROLS + 2];
      0001AA 8E 05            [24] 1049 	mov	ar5,r6
      0001AC 74 02            [12] 1050 	mov	a,#0x02
      0001AE 2D               [12] 1051 	add	a, r5
      0001AF 75 F0 0B         [24] 1052 	mov	b,#0x0b
      0001B2 A4               [48] 1053 	mul	ab
      0001B3 24 00            [12] 1054 	add	a,#_bindings
      0001B5 FD               [12] 1055 	mov	r5,a
      0001B6 E4               [12] 1056 	clr	a
      0001B7 34 01            [12] 1057 	addc	a, #(_bindings >> 8)
      0001B9 FC               [12] 1058 	mov	r4,a
                                   1059 ;	minikeys.c:106: s[0] = TYPE_KEYS << 5 | 2; s[1] = 0; s[2] = 0x20;       // 3
      0001BA 8D 82            [24] 1060 	mov	dpl,r5
      0001BC 8C 83            [24] 1061 	mov	dph,r4
      0001BE 74 22            [12] 1062 	mov	a,#0x22
      0001C0 F0               [24] 1063 	movx	@dptr,a
      0001C1 8D 82            [24] 1064 	mov	dpl,r5
      0001C3 8C 83            [24] 1065 	mov	dph,r4
      0001C5 A3               [24] 1066 	inc	dptr
      0001C6 E4               [12] 1067 	clr	a
      0001C7 F0               [24] 1068 	movx	@dptr,a
      0001C8 8D 82            [24] 1069 	mov	dpl,r5
      0001CA 8C 83            [24] 1070 	mov	dph,r4
      0001CC A3               [24] 1071 	inc	dptr
      0001CD A3               [24] 1072 	inc	dptr
      0001CE 74 20            [12] 1073 	mov	a,#0x20
      0001D0 F0               [24] 1074 	movx	@dptr,a
                                   1075 ;	minikeys.c:107: s = bindings[i * CONTROLS + CTRL_KNOB_LEFT];
      0001D1 8E 05            [24] 1076 	mov	ar5,r6
      0001D3 74 03            [12] 1077 	mov	a,#0x03
      0001D5 2D               [12] 1078 	add	a, r5
      0001D6 75 F0 0B         [24] 1079 	mov	b,#0x0b
      0001D9 A4               [48] 1080 	mul	ab
      0001DA 24 00            [12] 1081 	add	a,#_bindings
      0001DC FD               [12] 1082 	mov	r5,a
      0001DD E4               [12] 1083 	clr	a
      0001DE 34 01            [12] 1084 	addc	a, #(_bindings >> 8)
      0001E0 FC               [12] 1085 	mov	r4,a
                                   1086 ;	minikeys.c:108: s[0] = TYPE_MEDIA << 5 | 2; s[1] = 0xEA; s[2] = 0;      // volume down
      0001E1 8D 82            [24] 1087 	mov	dpl,r5
      0001E3 8C 83            [24] 1088 	mov	dph,r4
      0001E5 74 42            [12] 1089 	mov	a,#0x42
      0001E7 F0               [24] 1090 	movx	@dptr,a
      0001E8 8D 82            [24] 1091 	mov	dpl,r5
      0001EA 8C 83            [24] 1092 	mov	dph,r4
      0001EC A3               [24] 1093 	inc	dptr
      0001ED 74 EA            [12] 1094 	mov	a,#0xea
      0001EF F0               [24] 1095 	movx	@dptr,a
      0001F0 8D 82            [24] 1096 	mov	dpl,r5
      0001F2 8C 83            [24] 1097 	mov	dph,r4
      0001F4 A3               [24] 1098 	inc	dptr
      0001F5 A3               [24] 1099 	inc	dptr
      0001F6 E4               [12] 1100 	clr	a
      0001F7 F0               [24] 1101 	movx	@dptr,a
                                   1102 ;	minikeys.c:109: s = bindings[i * CONTROLS + CTRL_KNOB_PRESS];
      0001F8 8E 05            [24] 1103 	mov	ar5,r6
      0001FA 74 04            [12] 1104 	mov	a,#0x04
      0001FC 2D               [12] 1105 	add	a, r5
      0001FD 75 F0 0B         [24] 1106 	mov	b,#0x0b
      000200 A4               [48] 1107 	mul	ab
      000201 24 00            [12] 1108 	add	a,#_bindings
      000203 FD               [12] 1109 	mov	r5,a
      000204 E4               [12] 1110 	clr	a
      000205 34 01            [12] 1111 	addc	a, #(_bindings >> 8)
      000207 FC               [12] 1112 	mov	r4,a
                                   1113 ;	minikeys.c:110: s[0] = TYPE_MEDIA << 5 | 2; s[1] = 0xE2; s[2] = 0;      // mute
      000208 8D 82            [24] 1114 	mov	dpl,r5
      00020A 8C 83            [24] 1115 	mov	dph,r4
      00020C 74 42            [12] 1116 	mov	a,#0x42
      00020E F0               [24] 1117 	movx	@dptr,a
      00020F 8D 82            [24] 1118 	mov	dpl,r5
      000211 8C 83            [24] 1119 	mov	dph,r4
      000213 A3               [24] 1120 	inc	dptr
      000214 74 E2            [12] 1121 	mov	a,#0xe2
      000216 F0               [24] 1122 	movx	@dptr,a
      000217 8D 82            [24] 1123 	mov	dpl,r5
      000219 8C 83            [24] 1124 	mov	dph,r4
      00021B A3               [24] 1125 	inc	dptr
      00021C A3               [24] 1126 	inc	dptr
      00021D E4               [12] 1127 	clr	a
      00021E F0               [24] 1128 	movx	@dptr,a
                                   1129 ;	minikeys.c:111: s = bindings[i * CONTROLS + CTRL_KNOB_RIGHT];
      00021F 74 05            [12] 1130 	mov	a,#0x05
      000221 2E               [12] 1131 	add	a, r6
      000222 75 F0 0B         [24] 1132 	mov	b,#0x0b
      000225 A4               [48] 1133 	mul	ab
      000226 24 00            [12] 1134 	add	a,#_bindings
      000228 FE               [12] 1135 	mov	r6,a
      000229 E4               [12] 1136 	clr	a
      00022A 34 01            [12] 1137 	addc	a, #(_bindings >> 8)
      00022C FD               [12] 1138 	mov	r5,a
                                   1139 ;	minikeys.c:112: s[0] = TYPE_MEDIA << 5 | 2; s[1] = 0xE9; s[2] = 0;      // volume up
      00022D 8E 82            [24] 1140 	mov	dpl,r6
      00022F 8D 83            [24] 1141 	mov	dph,r5
      000231 74 42            [12] 1142 	mov	a,#0x42
      000233 F0               [24] 1143 	movx	@dptr,a
      000234 8E 82            [24] 1144 	mov	dpl,r6
      000236 8D 83            [24] 1145 	mov	dph,r5
      000238 A3               [24] 1146 	inc	dptr
      000239 74 E9            [12] 1147 	mov	a,#0xe9
      00023B F0               [24] 1148 	movx	@dptr,a
      00023C 8E 82            [24] 1149 	mov	dpl,r6
      00023E 8D 83            [24] 1150 	mov	dph,r5
      000240 A3               [24] 1151 	inc	dptr
      000241 A3               [24] 1152 	inc	dptr
      000242 E4               [12] 1153 	clr	a
      000243 F0               [24] 1154 	movx	@dptr,a
                                   1155 ;	minikeys.c:99: for(i=0; i<LAYERS; i++) {
      000244 0F               [12] 1156 	inc	r7
      000245 BF 03 00         [24] 1157 	cjne	r7,#0x03,00145$
      000248                       1158 00145$:
      000248 50 03            [24] 1159 	jnc	00146$
      00024A 02 01 5A         [24] 1160 	ljmp	00105$
      00024D                       1161 00146$:
                                   1162 ;	minikeys.c:114: light.effect = FX_WAVE; light.r = 255; light.g = 255; light.b = 255;
      00024D 90 01 C6         [24] 1163 	mov	dptr,#_light
      000250 74 02            [12] 1164 	mov	a,#0x02
      000252 F0               [24] 1165 	movx	@dptr,a
      000253 90 01 C7         [24] 1166 	mov	dptr,#(_light + 0x0001)
      000256 74 FF            [12] 1167 	mov	a,#0xff
      000258 F0               [24] 1168 	movx	@dptr,a
      000259 90 01 C8         [24] 1169 	mov	dptr,#(_light + 0x0002)
      00025C F0               [24] 1170 	movx	@dptr,a
      00025D 90 01 C9         [24] 1171 	mov	dptr,#(_light + 0x0003)
      000260 F0               [24] 1172 	movx	@dptr,a
                                   1173 ;	minikeys.c:115: light.speed = 5; light.brightness = 160; light.flags = FLAG_MULTICOLOR | FLAG_LAYERFLASH;
      000261 90 01 CA         [24] 1174 	mov	dptr,#(_light + 0x0004)
      000264 74 05            [12] 1175 	mov	a,#0x05
      000266 F0               [24] 1176 	movx	@dptr,a
      000267 90 01 CB         [24] 1177 	mov	dptr,#(_light + 0x0005)
      00026A 74 A0            [12] 1178 	mov	a,#0xa0
      00026C F0               [24] 1179 	movx	@dptr,a
      00026D 90 01 CC         [24] 1180 	mov	dptr,#(_light + 0x0006)
      000270 74 03            [12] 1181 	mov	a,#0x03
      000272 F0               [24] 1182 	movx	@dptr,a
                                   1183 ;	minikeys.c:116: light.reserved = 0;
      000273 90 01 CD         [24] 1184 	mov	dptr,#(_light + 0x0007)
      000276 E4               [12] 1185 	clr	a
      000277 F0               [24] 1186 	movx	@dptr,a
                                   1187 ;	minikeys.c:117: layerColors[0][0] = 0;   layerColors[0][1] = 120; layerColors[0][2] = 255;  // blue
      000278 90 01 CE         [24] 1188 	mov	dptr,#_layerColors
      00027B F0               [24] 1189 	movx	@dptr,a
      00027C 90 01 CF         [24] 1190 	mov	dptr,#(_layerColors + 0x0001)
      00027F 74 78            [12] 1191 	mov	a,#0x78
      000281 F0               [24] 1192 	movx	@dptr,a
      000282 90 01 D0         [24] 1193 	mov	dptr,#(_layerColors + 0x0002)
      000285 74 FF            [12] 1194 	mov	a,#0xff
      000287 F0               [24] 1195 	movx	@dptr,a
                                   1196 ;	minikeys.c:118: layerColors[1][0] = 0;   layerColors[1][1] = 255; layerColors[1][2] = 80;   // green
      000288 90 01 D1         [24] 1197 	mov	dptr,#(_layerColors + 0x0003)
      00028B E4               [12] 1198 	clr	a
      00028C F0               [24] 1199 	movx	@dptr,a
      00028D 90 01 D2         [24] 1200 	mov	dptr,#(_layerColors + 0x0004)
      000290 14               [12] 1201 	dec	a
      000291 F0               [24] 1202 	movx	@dptr,a
      000292 90 01 D3         [24] 1203 	mov	dptr,#(_layerColors + 0x0005)
      000295 74 50            [12] 1204 	mov	a,#0x50
      000297 F0               [24] 1205 	movx	@dptr,a
                                   1206 ;	minikeys.c:119: layerColors[2][0] = 255; layerColors[2][1] = 60;  layerColors[2][2] = 0;    // orange
      000298 90 01 D4         [24] 1207 	mov	dptr,#(_layerColors + 0x0006)
      00029B 74 FF            [12] 1208 	mov	a,#0xff
      00029D F0               [24] 1209 	movx	@dptr,a
      00029E 90 01 D5         [24] 1210 	mov	dptr,#(_layerColors + 0x0007)
      0002A1 74 3C            [12] 1211 	mov	a,#0x3c
      0002A3 F0               [24] 1212 	movx	@dptr,a
      0002A4 90 01 D6         [24] 1213 	mov	dptr,#(_layerColors + 0x0008)
      0002A7 E4               [12] 1214 	clr	a
      0002A8 F0               [24] 1215 	movx	@dptr,a
                                   1216 ;	minikeys.c:120: }
      0002A9 22               [24] 1217 	ret
                                   1218 ;------------------------------------------------------------
                                   1219 ;Allocation info for local variables in function 'loadSettings'
                                   1220 ;------------------------------------------------------------
                                   1221 ;i             Allocated with name '_loadSettings_i_10000_511'
                                   1222 ;j             Allocated to registers r4 
                                   1223 ;addr          Allocated to registers r7 
                                   1224 ;header        Allocated to registers r5 
                                   1225 ;len           Allocated with name '_loadSettings_len_10000_511'
                                   1226 ;------------------------------------------------------------
                                   1227 ;	minikeys.c:122: void loadSettings(void) {
                                   1228 ;	-----------------------------------------
                                   1229 ;	 function loadSettings
                                   1230 ;	-----------------------------------------
      0002AA                       1231 _loadSettings:
                                   1232 ;	minikeys.c:124: setDefaults();
      0002AA 12 01 3F         [24] 1233 	lcall	_setDefaults
                                   1234 ;	minikeys.c:125: if(EEPROM_read(0) != FLASH_MAGIC || EEPROM_read(1) != FLASH_VERSION) return;
      0002AD 75 82 00         [24] 1235 	mov	dpl, #0x00
      0002B0 12 14 D5         [24] 1236 	lcall	_EEPROM_read
      0002B3 AF 82            [24] 1237 	mov	r7, dpl
      0002B5 BF 4D 0D         [24] 1238 	cjne	r7,#0x4d,00101$
      0002B8 75 82 01         [24] 1239 	mov	dpl, #0x01
      0002BB 12 14 D5         [24] 1240 	lcall	_EEPROM_read
      0002BE AF 82            [24] 1241 	mov	r7, dpl
      0002C0 BF 01 02         [24] 1242 	cjne	r7,#0x01,00228$
      0002C3 80 01            [24] 1243 	sjmp	00144$
      0002C5                       1244 00228$:
      0002C5                       1245 00101$:
      0002C5 22               [24] 1246 	ret
                                   1247 ;	minikeys.c:126: for(i=0; i<8; i++) ((__xdata uint8_t*)&light)[i] = EEPROM_read(FLASH_LIGHT + i);
      0002C6                       1248 00144$:
      0002C6 7F 00            [12] 1249 	mov	r7,#0x00
      0002C8                       1250 00118$:
      0002C8 EF               [12] 1251 	mov	a,r7
      0002C9 24 C6            [12] 1252 	add	a, #_light
      0002CB FD               [12] 1253 	mov	r5,a
      0002CC E4               [12] 1254 	clr	a
      0002CD 34 01            [12] 1255 	addc	a, #(_light >> 8)
      0002CF FE               [12] 1256 	mov	r6,a
      0002D0 8F 04            [24] 1257 	mov	ar4,r7
      0002D2 74 02            [12] 1258 	mov	a,#0x02
      0002D4 2C               [12] 1259 	add	a, r4
      0002D5 F5 82            [12] 1260 	mov	dpl,a
      0002D7 C0 07            [24] 1261 	push	ar7
      0002D9 C0 06            [24] 1262 	push	ar6
      0002DB C0 05            [24] 1263 	push	ar5
      0002DD 12 14 D5         [24] 1264 	lcall	_EEPROM_read
      0002E0 AC 82            [24] 1265 	mov	r4, dpl
      0002E2 D0 05            [24] 1266 	pop	ar5
      0002E4 D0 06            [24] 1267 	pop	ar6
      0002E6 D0 07            [24] 1268 	pop	ar7
      0002E8 8D 82            [24] 1269 	mov	dpl,r5
      0002EA 8E 83            [24] 1270 	mov	dph,r6
      0002EC EC               [12] 1271 	mov	a,r4
      0002ED F0               [24] 1272 	movx	@dptr,a
      0002EE 0F               [12] 1273 	inc	r7
      0002EF BF 08 00         [24] 1274 	cjne	r7,#0x08,00229$
      0002F2                       1275 00229$:
      0002F2 40 D4            [24] 1276 	jc	00118$
                                   1277 ;	minikeys.c:127: for(i=0; i<LAYERS; i++)
      0002F4 7F 00            [12] 1278 	mov	r7,#0x00
                                   1279 ;	minikeys.c:128: for(j=0; j<3; j++) layerColors[i][j] = EEPROM_read(FLASH_LAYERS + i * 3 + j);
      0002F6                       1280 00146$:
      0002F6 EF               [12] 1281 	mov	a,r7
      0002F7 75 F0 03         [24] 1282 	mov	b,#0x03
      0002FA A4               [48] 1283 	mul	ab
      0002FB 24 CE            [12] 1284 	add	a, #_layerColors
      0002FD FD               [12] 1285 	mov	r5,a
      0002FE 74 01            [12] 1286 	mov	a,#(_layerColors >> 8)
      000300 35 F0            [12] 1287 	addc	a, b
      000302 FE               [12] 1288 	mov	r6,a
      000303 7C 00            [12] 1289 	mov	r4,#0x00
      000305                       1290 00120$:
      000305 EC               [12] 1291 	mov	a,r4
      000306 2D               [12] 1292 	add	a, r5
      000307 FA               [12] 1293 	mov	r2,a
      000308 E4               [12] 1294 	clr	a
      000309 3E               [12] 1295 	addc	a, r6
      00030A FB               [12] 1296 	mov	r3,a
      00030B 8F 01            [24] 1297 	mov	ar1,r7
      00030D E9               [12] 1298 	mov	a,r1
      00030E 75 F0 03         [24] 1299 	mov	b,#0x03
      000311 A4               [48] 1300 	mul	ab
      000312 24 0A            [12] 1301 	add	a, #0x0a
      000314 F9               [12] 1302 	mov	r1,a
      000315 8C 00            [24] 1303 	mov	ar0,r4
      000317 E8               [12] 1304 	mov	a,r0
      000318 29               [12] 1305 	add	a, r1
      000319 F5 82            [12] 1306 	mov	dpl,a
      00031B C0 07            [24] 1307 	push	ar7
      00031D C0 06            [24] 1308 	push	ar6
      00031F C0 05            [24] 1309 	push	ar5
      000321 C0 04            [24] 1310 	push	ar4
      000323 C0 03            [24] 1311 	push	ar3
      000325 C0 02            [24] 1312 	push	ar2
      000327 12 14 D5         [24] 1313 	lcall	_EEPROM_read
      00032A A9 82            [24] 1314 	mov	r1, dpl
      00032C D0 02            [24] 1315 	pop	ar2
      00032E D0 03            [24] 1316 	pop	ar3
      000330 D0 04            [24] 1317 	pop	ar4
      000332 D0 05            [24] 1318 	pop	ar5
      000334 D0 06            [24] 1319 	pop	ar6
      000336 D0 07            [24] 1320 	pop	ar7
      000338 8A 82            [24] 1321 	mov	dpl,r2
      00033A 8B 83            [24] 1322 	mov	dph,r3
      00033C E9               [12] 1323 	mov	a,r1
      00033D F0               [24] 1324 	movx	@dptr,a
      00033E 0C               [12] 1325 	inc	r4
      00033F BC 03 00         [24] 1326 	cjne	r4,#0x03,00231$
      000342                       1327 00231$:
      000342 40 C1            [24] 1328 	jc	00120$
                                   1329 ;	minikeys.c:127: for(i=0; i<LAYERS; i++)
      000344 0F               [12] 1330 	inc	r7
      000345 BF 03 00         [24] 1331 	cjne	r7,#0x03,00233$
      000348                       1332 00233$:
      000348 40 AC            [24] 1333 	jc	00146$
                                   1334 ;	minikeys.c:129: if(light.effect >= FX_COUNT) light.effect = FX_WAVE;
      00034A 90 01 C6         [24] 1335 	mov	dptr,#_light
      00034D E0               [24] 1336 	movx	a,@dptr
      00034E FF               [12] 1337 	mov	r7,a
      00034F BF 07 00         [24] 1338 	cjne	r7,#0x07,00235$
      000352                       1339 00235$:
      000352 40 06            [24] 1340 	jc	00108$
      000354 90 01 C6         [24] 1341 	mov	dptr,#_light
      000357 74 02            [12] 1342 	mov	a,#0x02
      000359 F0               [24] 1343 	movx	@dptr,a
      00035A                       1344 00108$:
                                   1345 ;	minikeys.c:130: if(!light.speed || light.speed > 10) light.speed = 5;
      00035A 90 01 CA         [24] 1346 	mov	dptr,#(_light + 0x0004)
      00035D E0               [24] 1347 	movx	a,@dptr
      00035E FF               [12] 1348 	mov	r7,a
      00035F 60 05            [24] 1349 	jz	00109$
      000361 EF               [12] 1350 	mov	a,r7
      000362 24 F5            [12] 1351 	add	a,#0xff - 0x0a
      000364 50 06            [24] 1352 	jnc	00110$
                                   1353 ;	free result
      000366                       1354 00109$:
      000366 90 01 CA         [24] 1355 	mov	dptr,#(_light + 0x0004)
      000369 74 05            [12] 1356 	mov	a,#0x05
      00036B F0               [24] 1357 	movx	@dptr,a
      00036C                       1358 00110$:
                                   1359 ;	minikeys.c:131: addr = FLASH_BINDINGS;
      00036C 7F 13            [12] 1360 	mov	r7,#0x13
                                   1361 ;	minikeys.c:132: for(i=0; i<LAYERS * CONTROLS; i++) {
      00036E 75 08 00         [24] 1362 	mov	_loadSettings_i_10000_511,#0x00
      000371                       1363 00127$:
                                   1364 ;	minikeys.c:133: header = EEPROM_read(addr++);
      000371 8F 82            [24] 1365 	mov	dpl,r7
      000373 0F               [12] 1366 	inc	r7
      000374 C0 07            [24] 1367 	push	ar7
      000376 12 14 D5         [24] 1368 	lcall	_EEPROM_read
      000379 AD 82            [24] 1369 	mov	r5, dpl
      00037B D0 07            [24] 1370 	pop	ar7
                                   1371 ;	minikeys.c:134: len = header & 0x1F;
      00037D 74 1F            [12] 1372 	mov	a,#0x1f
      00037F 5D               [12] 1373 	anl	a,r5
                                   1374 ;	minikeys.c:135: if(len >= SLOT_LEN || addr + len > FLASH_SIZE) { bindings[i][0] = 0; continue; }
      000380 F5 09            [12] 1375 	mov	_loadSettings_len_10000_511,a
      000382 C3               [12] 1376 	clr	c
      000383 94 0B            [12] 1377 	subb	a,#0x0b
      000385 50 1D            [24] 1378 	jnc	00112$
      000387 8F 02            [24] 1379 	mov	ar2,r7
      000389 7B 00            [12] 1380 	mov	r3,#0x00
      00038B A8 09            [24] 1381 	mov	r0,_loadSettings_len_10000_511
      00038D 79 00            [12] 1382 	mov	r1,#0x00
      00038F E8               [12] 1383 	mov	a,r0
      000390 2A               [12] 1384 	add	a, r2
      000391 FA               [12] 1385 	mov	r2,a
      000392 E9               [12] 1386 	mov	a,r1
      000393 3B               [12] 1387 	addc	a, r3
      000394 FB               [12] 1388 	mov	r3,a
      000395 C3               [12] 1389 	clr	c
      000396 74 80            [12] 1390 	mov	a,#0x80
      000398 9A               [12] 1391 	subb	a,r2
      000399 74 80            [12] 1392 	mov	a,#(0x00 ^ 0x80)
      00039B 8B F0            [24] 1393 	mov	b,r3
      00039D 63 F0 80         [24] 1394 	xrl	b,#0x80
      0003A0 95 F0            [12] 1395 	subb	a,b
      0003A2 50 14            [24] 1396 	jnc	00113$
                                   1397 ;	free result
      0003A4                       1398 00112$:
      0003A4 E5 08            [12] 1399 	mov	a,_loadSettings_i_10000_511
      0003A6 75 F0 0B         [24] 1400 	mov	b,#0x0b
      0003A9 A4               [48] 1401 	mul	ab
      0003AA 24 00            [12] 1402 	add	a, #_bindings
      0003AC F5 82            [12] 1403 	mov	dpl,a
      0003AE 74 01            [12] 1404 	mov	a,#(_bindings >> 8)
      0003B0 35 F0            [12] 1405 	addc	a, b
      0003B2 F5 83            [12] 1406 	mov	dph,a
      0003B4 E4               [12] 1407 	clr	a
      0003B5 F0               [24] 1408 	movx	@dptr,a
      0003B6 80 52            [24] 1409 	sjmp	00116$
      0003B8                       1410 00113$:
                                   1411 ;	minikeys.c:136: bindings[i][0] = header;
      0003B8 E5 08            [12] 1412 	mov	a,_loadSettings_i_10000_511
      0003BA 75 F0 0B         [24] 1413 	mov	b,#0x0b
      0003BD A4               [48] 1414 	mul	ab
      0003BE 24 00            [12] 1415 	add	a, #_bindings
      0003C0 FA               [12] 1416 	mov	r2,a
      0003C1 74 01            [12] 1417 	mov	a,#(_bindings >> 8)
      0003C3 35 F0            [12] 1418 	addc	a, b
      0003C5 FB               [12] 1419 	mov	r3,a
      0003C6 8A 82            [24] 1420 	mov	dpl,r2
      0003C8 8B 83            [24] 1421 	mov	dph,r3
      0003CA ED               [12] 1422 	mov	a,r5
      0003CB F0               [24] 1423 	movx	@dptr,a
                                   1424 ;	minikeys.c:137: for(j=0; j<len; j++) bindings[i][1 + j] = EEPROM_read(addr++);
      0003CC 8F 05            [24] 1425 	mov	ar5,r7
      0003CE 79 00            [12] 1426 	mov	r1,#0x00
      0003D0                       1427 00125$:
      0003D0 C3               [12] 1428 	clr	c
      0003D1 E9               [12] 1429 	mov	a,r1
      0003D2 95 09            [12] 1430 	subb	a,_loadSettings_len_10000_511
      0003D4 50 32            [24] 1431 	jnc	00158$
      0003D6 89 00            [24] 1432 	mov	ar0,r1
      0003D8 E8               [12] 1433 	mov	a,r0
      0003D9 04               [12] 1434 	inc	a
      0003DA 2A               [12] 1435 	add	a, r2
      0003DB F8               [12] 1436 	mov	r0,a
      0003DC E4               [12] 1437 	clr	a
      0003DD 3B               [12] 1438 	addc	a,r3
      0003DE FC               [12] 1439 	mov	r4,a
      0003DF 8D 82            [24] 1440 	mov	dpl,r5
      0003E1 0D               [12] 1441 	inc	r5
      0003E2 C0 05            [24] 1442 	push	ar5
      0003E4 C0 04            [24] 1443 	push	ar4
      0003E6 C0 03            [24] 1444 	push	ar3
      0003E8 C0 02            [24] 1445 	push	ar2
      0003EA C0 01            [24] 1446 	push	ar1
      0003EC C0 00            [24] 1447 	push	ar0
      0003EE 12 14 D5         [24] 1448 	lcall	_EEPROM_read
      0003F1 AE 82            [24] 1449 	mov	r6, dpl
      0003F3 D0 00            [24] 1450 	pop	ar0
      0003F5 D0 01            [24] 1451 	pop	ar1
      0003F7 D0 02            [24] 1452 	pop	ar2
      0003F9 D0 03            [24] 1453 	pop	ar3
      0003FB D0 04            [24] 1454 	pop	ar4
      0003FD D0 05            [24] 1455 	pop	ar5
      0003FF 88 82            [24] 1456 	mov	dpl,r0
      000401 8C 83            [24] 1457 	mov	dph,r4
      000403 EE               [12] 1458 	mov	a,r6
      000404 F0               [24] 1459 	movx	@dptr,a
      000405 09               [12] 1460 	inc	r1
      000406 80 C8            [24] 1461 	sjmp	00125$
      000408                       1462 00158$:
      000408 8D 07            [24] 1463 	mov	ar7,r5
      00040A                       1464 00116$:
                                   1465 ;	minikeys.c:132: for(i=0; i<LAYERS * CONTROLS; i++) {
      00040A 05 08            [12] 1466 	inc	_loadSettings_i_10000_511
      00040C 74 EE            [12] 1467 	mov	a,#0x100 - 0x12
      00040E 25 08            [12] 1468 	add	a,_loadSettings_i_10000_511
      000410 40 03            [24] 1469 	jc	00242$
      000412 02 03 71         [24] 1470 	ljmp	00127$
      000415                       1471 00242$:
                                   1472 ;	minikeys.c:139: }
      000415 22               [24] 1473 	ret
                                   1474 ;------------------------------------------------------------
                                   1475 ;Allocation info for local variables in function 'saveSettings'
                                   1476 ;------------------------------------------------------------
                                   1477 ;i             Allocated to registers r6 
                                   1478 ;j             Allocated to registers r4 
                                   1479 ;addr          Allocated to registers r7 
                                   1480 ;len           Allocated to registers r3 
                                   1481 ;total         Allocated to registers r7 
                                   1482 ;------------------------------------------------------------
                                   1483 ;	minikeys.c:142: uint8_t saveSettings(void) {
                                   1484 ;	-----------------------------------------
                                   1485 ;	 function saveSettings
                                   1486 ;	-----------------------------------------
      000416                       1487 _saveSettings:
                                   1488 ;	minikeys.c:143: uint8_t i, j, addr, len, total = FLASH_BINDINGS;
      000416 7F 13            [12] 1489 	mov	r7,#0x13
                                   1490 ;	minikeys.c:144: for(i=0; i<LAYERS * CONTROLS; i++) total += 1 + (bindings[i][0] & 0x1F);
      000418 7E 00            [12] 1491 	mov	r6,#0x00
      00041A                       1492 00109$:
      00041A EE               [12] 1493 	mov	a,r6
      00041B 75 F0 0B         [24] 1494 	mov	b,#0x0b
      00041E A4               [48] 1495 	mul	ab
      00041F 24 00            [12] 1496 	add	a, #_bindings
      000421 F5 82            [12] 1497 	mov	dpl,a
      000423 74 01            [12] 1498 	mov	a,#(_bindings >> 8)
      000425 35 F0            [12] 1499 	addc	a, b
      000427 F5 83            [12] 1500 	mov	dph,a
      000429 E0               [24] 1501 	movx	a,@dptr
      00042A FD               [12] 1502 	mov	r5,a
      00042B 74 1F            [12] 1503 	mov	a,#0x1f
      00042D 5D               [12] 1504 	anl	a,r5
      00042E 04               [12] 1505 	inc	a
      00042F 8F 04            [24] 1506 	mov	ar4,r7
      000431 2C               [12] 1507 	add	a, r4
      000432 FF               [12] 1508 	mov	r7,a
      000433 0E               [12] 1509 	inc	r6
      000434 BE 12 00         [24] 1510 	cjne	r6,#0x12,00220$
      000437                       1511 00220$:
      000437 40 E1            [24] 1512 	jc	00109$
                                   1513 ;	minikeys.c:145: if(total > FLASH_SIZE) return 0;
      000439 EF               [12] 1514 	mov	a,r7
      00043A 24 7F            [12] 1515 	add	a,#0xff - 0x80
      00043C 50 04            [24] 1516 	jnc	00103$
                                   1517 ;	free result
      00043E 75 82 00         [24] 1518 	mov	dpl, #0x00
      000441 22               [24] 1519 	ret
      000442                       1520 00103$:
                                   1521 ;	minikeys.c:146: EEPROM_update(0, FLASH_MAGIC);
      000442 75 19 4D         [24] 1522 	mov	_EEPROM_update_PARM_2,#0x4d
      000445 75 82 00         [24] 1523 	mov	dpl, #0x00
      000448 12 14 E5         [24] 1524 	lcall	_EEPROM_update
                                   1525 ;	minikeys.c:147: EEPROM_update(1, FLASH_VERSION);
      00044B 75 19 01         [24] 1526 	mov	_EEPROM_update_PARM_2,#0x01
      00044E 75 82 01         [24] 1527 	mov	dpl, #0x01
      000451 12 14 E5         [24] 1528 	lcall	_EEPROM_update
                                   1529 ;	minikeys.c:148: for(i=0; i<8; i++) EEPROM_update(FLASH_LIGHT + i, ((__xdata uint8_t*)&light)[i]);
      000454 7F 00            [12] 1530 	mov	r7,#0x00
      000456                       1531 00111$:
      000456 8F 06            [24] 1532 	mov	ar6,r7
      000458 0E               [12] 1533 	inc	r6
      000459 0E               [12] 1534 	inc	r6
      00045A EF               [12] 1535 	mov	a,r7
      00045B 24 C6            [12] 1536 	add	a, #_light
      00045D F5 82            [12] 1537 	mov	dpl,a
      00045F E4               [12] 1538 	clr	a
      000460 34 01            [12] 1539 	addc	a, #(_light >> 8)
      000462 F5 83            [12] 1540 	mov	dph,a
      000464 E0               [24] 1541 	movx	a,@dptr
      000465 F5 19            [12] 1542 	mov	_EEPROM_update_PARM_2,a
      000467 8E 82            [24] 1543 	mov	dpl, r6
      000469 C0 07            [24] 1544 	push	ar7
      00046B 12 14 E5         [24] 1545 	lcall	_EEPROM_update
      00046E D0 07            [24] 1546 	pop	ar7
      000470 0F               [12] 1547 	inc	r7
      000471 BF 08 00         [24] 1548 	cjne	r7,#0x08,00223$
      000474                       1549 00223$:
      000474 40 E0            [24] 1550 	jc	00111$
                                   1551 ;	minikeys.c:149: for(i=0; i<LAYERS; i++)
      000476 7F 00            [12] 1552 	mov	r7,#0x00
                                   1553 ;	minikeys.c:150: for(j=0; j<3; j++) EEPROM_update(FLASH_LAYERS + i * 3 + j, layerColors[i][j]);
      000478                       1554 00141$:
      000478 EF               [12] 1555 	mov	a,r7
      000479 75 F0 03         [24] 1556 	mov	b,#0x03
      00047C A4               [48] 1557 	mul	ab
      00047D 24 CE            [12] 1558 	add	a, #_layerColors
      00047F FD               [12] 1559 	mov	r5,a
      000480 74 01            [12] 1560 	mov	a,#(_layerColors >> 8)
      000482 35 F0            [12] 1561 	addc	a, b
      000484 FE               [12] 1562 	mov	r6,a
      000485 7C 00            [12] 1563 	mov	r4,#0x00
      000487                       1564 00113$:
      000487 8F 03            [24] 1565 	mov	ar3,r7
      000489 EB               [12] 1566 	mov	a,r3
      00048A 75 F0 03         [24] 1567 	mov	b,#0x03
      00048D A4               [48] 1568 	mul	ab
      00048E 24 0A            [12] 1569 	add	a, #0x0a
      000490 FB               [12] 1570 	mov	r3,a
      000491 8C 02            [24] 1571 	mov	ar2,r4
      000493 EA               [12] 1572 	mov	a,r2
      000494 2B               [12] 1573 	add	a, r3
      000495 FB               [12] 1574 	mov	r3,a
      000496 EC               [12] 1575 	mov	a,r4
      000497 2D               [12] 1576 	add	a, r5
      000498 F5 82            [12] 1577 	mov	dpl,a
      00049A E4               [12] 1578 	clr	a
      00049B 3E               [12] 1579 	addc	a, r6
      00049C F5 83            [12] 1580 	mov	dph,a
      00049E E0               [24] 1581 	movx	a,@dptr
      00049F F5 19            [12] 1582 	mov	_EEPROM_update_PARM_2,a
      0004A1 8B 82            [24] 1583 	mov	dpl, r3
      0004A3 C0 07            [24] 1584 	push	ar7
      0004A5 C0 06            [24] 1585 	push	ar6
      0004A7 C0 05            [24] 1586 	push	ar5
      0004A9 C0 04            [24] 1587 	push	ar4
      0004AB 12 14 E5         [24] 1588 	lcall	_EEPROM_update
      0004AE D0 04            [24] 1589 	pop	ar4
      0004B0 D0 05            [24] 1590 	pop	ar5
      0004B2 D0 06            [24] 1591 	pop	ar6
      0004B4 D0 07            [24] 1592 	pop	ar7
      0004B6 0C               [12] 1593 	inc	r4
      0004B7 BC 03 00         [24] 1594 	cjne	r4,#0x03,00225$
      0004BA                       1595 00225$:
      0004BA 40 CB            [24] 1596 	jc	00113$
                                   1597 ;	minikeys.c:149: for(i=0; i<LAYERS; i++)
      0004BC 0F               [12] 1598 	inc	r7
      0004BD BF 03 00         [24] 1599 	cjne	r7,#0x03,00227$
      0004C0                       1600 00227$:
      0004C0 40 B6            [24] 1601 	jc	00141$
                                   1602 ;	minikeys.c:151: addr = FLASH_BINDINGS;
      0004C2 7F 13            [12] 1603 	mov	r7,#0x13
                                   1604 ;	minikeys.c:152: for(i=0; i<LAYERS * CONTROLS; i++) {
      0004C4 7E 00            [12] 1605 	mov	r6,#0x00
      0004C6                       1606 00119$:
                                   1607 ;	minikeys.c:153: len = bindings[i][0] & 0x1F;
      0004C6 EE               [12] 1608 	mov	a,r6
      0004C7 75 F0 0B         [24] 1609 	mov	b,#0x0b
      0004CA A4               [48] 1610 	mul	ab
      0004CB FC               [12] 1611 	mov	r4,a
      0004CC AD F0            [24] 1612 	mov	r5,b
      0004CE 24 00            [12] 1613 	add	a, #_bindings
      0004D0 F5 82            [12] 1614 	mov	dpl,a
      0004D2 ED               [12] 1615 	mov	a,r5
      0004D3 34 01            [12] 1616 	addc	a, #(_bindings >> 8)
      0004D5 F5 83            [12] 1617 	mov	dph,a
      0004D7 E0               [24] 1618 	movx	a,@dptr
      0004D8 FB               [12] 1619 	mov	r3,a
      0004D9 53 03 1F         [24] 1620 	anl	ar3,#0x1f
                                   1621 ;	minikeys.c:154: for(j=0; j<=len; j++) EEPROM_update(addr++, bindings[i][j]);
      0004DC EC               [12] 1622 	mov	a,r4
      0004DD 24 00            [12] 1623 	add	a, #_bindings
      0004DF FC               [12] 1624 	mov	r4,a
      0004E0 ED               [12] 1625 	mov	a,r5
      0004E1 34 01            [12] 1626 	addc	a, #(_bindings >> 8)
      0004E3 FD               [12] 1627 	mov	r5,a
      0004E4 8F 02            [24] 1628 	mov	ar2,r7
      0004E6 79 00            [12] 1629 	mov	r1,#0x00
      0004E8                       1630 00117$:
      0004E8 8A 00            [24] 1631 	mov	ar0,r2
      0004EA 0A               [12] 1632 	inc	r2
      0004EB E9               [12] 1633 	mov	a,r1
      0004EC 2C               [12] 1634 	add	a, r4
      0004ED F5 82            [12] 1635 	mov	dpl,a
      0004EF E4               [12] 1636 	clr	a
      0004F0 3D               [12] 1637 	addc	a, r5
      0004F1 F5 83            [12] 1638 	mov	dph,a
      0004F3 E0               [24] 1639 	movx	a,@dptr
      0004F4 F5 19            [12] 1640 	mov	_EEPROM_update_PARM_2,a
      0004F6 88 82            [24] 1641 	mov	dpl, r0
      0004F8 C0 06            [24] 1642 	push	ar6
      0004FA C0 05            [24] 1643 	push	ar5
      0004FC C0 04            [24] 1644 	push	ar4
      0004FE C0 03            [24] 1645 	push	ar3
      000500 C0 02            [24] 1646 	push	ar2
      000502 C0 01            [24] 1647 	push	ar1
      000504 12 14 E5         [24] 1648 	lcall	_EEPROM_update
      000507 D0 01            [24] 1649 	pop	ar1
      000509 D0 02            [24] 1650 	pop	ar2
      00050B D0 03            [24] 1651 	pop	ar3
      00050D D0 04            [24] 1652 	pop	ar4
      00050F D0 05            [24] 1653 	pop	ar5
      000511 D0 06            [24] 1654 	pop	ar6
      000513 09               [12] 1655 	inc	r1
      000514 C3               [12] 1656 	clr	c
      000515 EB               [12] 1657 	mov	a,r3
      000516 99               [12] 1658 	subb	a,r1
      000517 50 CF            [24] 1659 	jnc	00117$
                                   1660 ;	free result
                                   1661 ;	minikeys.c:152: for(i=0; i<LAYERS * CONTROLS; i++) {
      000519 8A 07            [24] 1662 	mov	ar7,r2
      00051B 0E               [12] 1663 	inc	r6
      00051C BE 12 00         [24] 1664 	cjne	r6,#0x12,00230$
      00051F                       1665 00230$:
      00051F 40 A5            [24] 1666 	jc	00119$
                                   1667 ;	minikeys.c:156: return 1;
      000521 75 82 01         [24] 1668 	mov	dpl, #0x01
                                   1669 ;	minikeys.c:157: }
      000524 22               [24] 1670 	ret
                                   1671 ;------------------------------------------------------------
                                   1672 ;Allocation info for local variables in function 'sendKeys'
                                   1673 ;------------------------------------------------------------
                                   1674 ;extraKey      Allocated with name '_sendKeys_PARM_2'
                                   1675 ;extraMods     Allocated to registers r7 
                                   1676 ;i             Allocated to registers r7 
                                   1677 ;n             Allocated to registers r6 
                                   1678 ;------------------------------------------------------------
                                   1679 ;	minikeys.c:172: void sendKeys(uint8_t extraMods, uint8_t extraKey) {
                                   1680 ;	-----------------------------------------
                                   1681 ;	 function sendKeys
                                   1682 ;	-----------------------------------------
      000525                       1683 _sendKeys:
      000525 AF 82            [24] 1684 	mov	r7, dpl
                                   1685 ;	minikeys.c:173: uint8_t i, n = 3;
      000527 7E 03            [12] 1686 	mov	r6,#0x03
                                   1687 ;	minikeys.c:174: kbdReport[0] = 1;
      000529 90 01 E0         [24] 1688 	mov	dptr,#_kbdReport
      00052C 74 01            [12] 1689 	mov	a,#0x01
      00052E F0               [24] 1690 	movx	@dptr,a
                                   1691 ;	minikeys.c:175: kbdReport[1] = extraMods;
      00052F 90 01 E1         [24] 1692 	mov	dptr,#(_kbdReport + 0x0001)
      000532 EF               [12] 1693 	mov	a,r7
      000533 F0               [24] 1694 	movx	@dptr,a
                                   1695 ;	minikeys.c:176: kbdReport[2] = 0;
      000534 90 01 E2         [24] 1696 	mov	dptr,#(_kbdReport + 0x0002)
      000537 E4               [12] 1697 	clr	a
      000538 F0               [24] 1698 	movx	@dptr,a
                                   1699 ;	minikeys.c:177: for(i=3; i<9; i++) kbdReport[i] = 0;
      000539 7F 03            [12] 1700 	mov	r7,#0x03
      00053B                       1701 00108$:
      00053B EF               [12] 1702 	mov	a,r7
      00053C 24 E0            [12] 1703 	add	a, #_kbdReport
      00053E F5 82            [12] 1704 	mov	dpl,a
      000540 E4               [12] 1705 	clr	a
      000541 34 01            [12] 1706 	addc	a, #(_kbdReport >> 8)
      000543 F5 83            [12] 1707 	mov	dph,a
      000545 E4               [12] 1708 	clr	a
      000546 F0               [24] 1709 	movx	@dptr,a
      000547 0F               [12] 1710 	inc	r7
      000548 BF 09 00         [24] 1711 	cjne	r7,#0x09,00165$
      00054B                       1712 00165$:
      00054B 40 EE            [24] 1713 	jc	00108$
                                   1714 ;	minikeys.c:178: if(extraKey) kbdReport[n++] = extraKey;
      00054D E5 0A            [12] 1715 	mov	a,_sendKeys_PARM_2
      00054F 60 08            [24] 1716 	jz	00126$
      000551 7E 04            [12] 1717 	mov	r6,#0x04
      000553 90 01 E3         [24] 1718 	mov	dptr,#(_kbdReport + 0x0003)
      000556 E5 0A            [12] 1719 	mov	a,_sendKeys_PARM_2
      000558 F0               [24] 1720 	movx	@dptr,a
                                   1721 ;	minikeys.c:179: for(i=0; i<CONTROLS; i++) {
      000559                       1722 00126$:
      000559 8E 07            [24] 1723 	mov	ar7,r6
      00055B 7E 00            [12] 1724 	mov	r6,#0x00
      00055D                       1725 00110$:
                                   1726 ;	minikeys.c:180: kbdReport[1] |= heldMods[i];
      00055D 90 01 E1         [24] 1727 	mov	dptr,#(_kbdReport + 0x0001)
      000560 E0               [24] 1728 	movx	a,@dptr
      000561 FD               [12] 1729 	mov	r5,a
      000562 EE               [12] 1730 	mov	a,r6
      000563 24 F1            [12] 1731 	add	a, #_heldMods
      000565 F5 82            [12] 1732 	mov	dpl,a
      000567 E4               [12] 1733 	clr	a
      000568 34 01            [12] 1734 	addc	a, #(_heldMods >> 8)
      00056A F5 83            [12] 1735 	mov	dph,a
      00056C E0               [24] 1736 	movx	a,@dptr
      00056D 42 05            [12] 1737 	orl	ar5,a
      00056F 90 01 E1         [24] 1738 	mov	dptr,#(_kbdReport + 0x0001)
      000572 ED               [12] 1739 	mov	a,r5
      000573 F0               [24] 1740 	movx	@dptr,a
                                   1741 ;	minikeys.c:181: if(heldKeys[i] && n < 9) kbdReport[n++] = heldKeys[i];
      000574 EE               [12] 1742 	mov	a,r6
      000575 24 F7            [12] 1743 	add	a, #_heldKeys
      000577 F5 82            [12] 1744 	mov	dpl,a
      000579 E4               [12] 1745 	clr	a
      00057A 34 01            [12] 1746 	addc	a, #(_heldKeys >> 8)
      00057C F5 83            [12] 1747 	mov	dph,a
      00057E E0               [24] 1748 	movx	a,@dptr
      00057F FD               [12] 1749 	mov	r5,a
      000580 60 12            [24] 1750 	jz	00111$
      000582 BF 09 00         [24] 1751 	cjne	r7,#0x09,00169$
      000585                       1752 00169$:
      000585 50 0D            [24] 1753 	jnc	00111$
      000587 EF               [12] 1754 	mov	a,r7
      000588 24 E0            [12] 1755 	add	a, #_kbdReport
      00058A F5 82            [12] 1756 	mov	dpl,a
      00058C E4               [12] 1757 	clr	a
      00058D 34 01            [12] 1758 	addc	a, #(_kbdReport >> 8)
      00058F F5 83            [12] 1759 	mov	dph,a
      000591 0F               [12] 1760 	inc	r7
      000592 ED               [12] 1761 	mov	a,r5
      000593 F0               [24] 1762 	movx	@dptr,a
      000594                       1763 00111$:
                                   1764 ;	minikeys.c:179: for(i=0; i<CONTROLS; i++) {
      000594 0E               [12] 1765 	inc	r6
      000595 BE 06 00         [24] 1766 	cjne	r6,#0x06,00171$
      000598                       1767 00171$:
      000598 40 C3            [24] 1768 	jc	00110$
                                   1769 ;	minikeys.c:183: HID_sendReport(kbdReport, sizeof(kbdReport));
      00059A 75 1D 09         [24] 1770 	mov	_HID_sendReport_PARM_2,#0x09
      00059D 90 01 E0         [24] 1771 	mov	dptr,#_kbdReport
                                   1772 ;	minikeys.c:184: }
      0005A0 02 15 04         [24] 1773 	ljmp	_HID_sendReport
                                   1774 ;------------------------------------------------------------
                                   1775 ;Allocation info for local variables in function 'sendMedia'
                                   1776 ;------------------------------------------------------------
                                   1777 ;usage         Allocated to registers r6 r7 
                                   1778 ;------------------------------------------------------------
                                   1779 ;	minikeys.c:186: void sendMedia(uint16_t usage) {
                                   1780 ;	-----------------------------------------
                                   1781 ;	 function sendMedia
                                   1782 ;	-----------------------------------------
      0005A3                       1783 _sendMedia:
      0005A3 AE 82            [24] 1784 	mov	r6, dpl
      0005A5 AF 83            [24] 1785 	mov	r7, dph
                                   1786 ;	minikeys.c:187: conReport[0] = 2;
      0005A7 90 01 E9         [24] 1787 	mov	dptr,#_conReport
      0005AA 74 02            [12] 1788 	mov	a,#0x02
      0005AC F0               [24] 1789 	movx	@dptr,a
                                   1790 ;	minikeys.c:188: conReport[1] = usage & 0xFF;
      0005AD 8E 05            [24] 1791 	mov	ar5,r6
      0005AF 90 01 EA         [24] 1792 	mov	dptr,#(_conReport + 0x0001)
      0005B2 ED               [12] 1793 	mov	a,r5
      0005B3 F0               [24] 1794 	movx	@dptr,a
                                   1795 ;	minikeys.c:189: conReport[2] = usage >> 8;
      0005B4 8F 06            [24] 1796 	mov	ar6,r7
      0005B6 90 01 EB         [24] 1797 	mov	dptr,#(_conReport + 0x0002)
      0005B9 EE               [12] 1798 	mov	a,r6
      0005BA F0               [24] 1799 	movx	@dptr,a
                                   1800 ;	minikeys.c:190: HID_sendReport(conReport, sizeof(conReport));
      0005BB 75 1D 03         [24] 1801 	mov	_HID_sendReport_PARM_2,#0x03
      0005BE 90 01 E9         [24] 1802 	mov	dptr,#_conReport
                                   1803 ;	minikeys.c:191: }
      0005C1 02 15 04         [24] 1804 	ljmp	_HID_sendReport
                                   1805 ;------------------------------------------------------------
                                   1806 ;Allocation info for local variables in function 'sendMouse'
                                   1807 ;------------------------------------------------------------
                                   1808 ;y             Allocated with name '_sendMouse_PARM_2'
                                   1809 ;wheel         Allocated with name '_sendMouse_PARM_3'
                                   1810 ;x             Allocated to registers r7 
                                   1811 ;i             Allocated to registers r6 
                                   1812 ;------------------------------------------------------------
                                   1813 ;	minikeys.c:193: void sendMouse(int8_t x, int8_t y, int8_t wheel) {
                                   1814 ;	-----------------------------------------
                                   1815 ;	 function sendMouse
                                   1816 ;	-----------------------------------------
      0005C4                       1817 _sendMouse:
      0005C4 AF 82            [24] 1818 	mov	r7, dpl
                                   1819 ;	minikeys.c:195: mouseReport[0] = 3;
      0005C6 90 01 EC         [24] 1820 	mov	dptr,#_mouseReport
      0005C9 74 03            [12] 1821 	mov	a,#0x03
      0005CB F0               [24] 1822 	movx	@dptr,a
                                   1823 ;	minikeys.c:196: mouseReport[1] = 0;
      0005CC 90 01 ED         [24] 1824 	mov	dptr,#(_mouseReport + 0x0001)
      0005CF E4               [12] 1825 	clr	a
      0005D0 F0               [24] 1826 	movx	@dptr,a
                                   1827 ;	minikeys.c:197: for(i=0; i<CONTROLS; i++) mouseReport[1] |= heldButtons[i];
      0005D1 FE               [12] 1828 	mov	r6,a
      0005D2                       1829 00102$:
      0005D2 90 01 ED         [24] 1830 	mov	dptr,#(_mouseReport + 0x0001)
      0005D5 E0               [24] 1831 	movx	a,@dptr
      0005D6 FD               [12] 1832 	mov	r5,a
      0005D7 EE               [12] 1833 	mov	a,r6
      0005D8 24 FD            [12] 1834 	add	a, #_heldButtons
      0005DA F5 82            [12] 1835 	mov	dpl,a
      0005DC E4               [12] 1836 	clr	a
      0005DD 34 01            [12] 1837 	addc	a, #(_heldButtons >> 8)
      0005DF F5 83            [12] 1838 	mov	dph,a
      0005E1 E0               [24] 1839 	movx	a,@dptr
      0005E2 42 05            [12] 1840 	orl	ar5,a
      0005E4 90 01 ED         [24] 1841 	mov	dptr,#(_mouseReport + 0x0001)
      0005E7 ED               [12] 1842 	mov	a,r5
      0005E8 F0               [24] 1843 	movx	@dptr,a
      0005E9 0E               [12] 1844 	inc	r6
      0005EA BE 06 00         [24] 1845 	cjne	r6,#0x06,00121$
      0005ED                       1846 00121$:
      0005ED 40 E3            [24] 1847 	jc	00102$
                                   1848 ;	minikeys.c:198: mouseReport[2] = x;
      0005EF 90 01 EE         [24] 1849 	mov	dptr,#(_mouseReport + 0x0002)
      0005F2 EF               [12] 1850 	mov	a,r7
      0005F3 F0               [24] 1851 	movx	@dptr,a
                                   1852 ;	minikeys.c:199: mouseReport[3] = y;
      0005F4 90 01 EF         [24] 1853 	mov	dptr,#(_mouseReport + 0x0003)
      0005F7 E5 0B            [12] 1854 	mov	a,_sendMouse_PARM_2
      0005F9 F0               [24] 1855 	movx	@dptr,a
                                   1856 ;	minikeys.c:200: mouseReport[4] = wheel;
      0005FA 90 01 F0         [24] 1857 	mov	dptr,#(_mouseReport + 0x0004)
      0005FD E5 0C            [12] 1858 	mov	a,_sendMouse_PARM_3
      0005FF F0               [24] 1859 	movx	@dptr,a
                                   1860 ;	minikeys.c:201: HID_sendReport(mouseReport, sizeof(mouseReport));
      000600 75 1D 05         [24] 1861 	mov	_HID_sendReport_PARM_2,#0x05
      000603 90 01 EC         [24] 1862 	mov	dptr,#_mouseReport
                                   1863 ;	minikeys.c:202: }
      000606 02 15 04         [24] 1864 	ljmp	_HID_sendReport
                                   1865 ;------------------------------------------------------------
                                   1866 ;Allocation info for local variables in function 'controlDown'
                                   1867 ;------------------------------------------------------------
                                   1868 ;ctrl          Allocated with name '_controlDown_ctrl_10000_545'
                                   1869 ;s             Allocated to registers r5 r6 
                                   1870 ;type          Allocated to registers r3 
                                   1871 ;len           Allocated to registers r4 
                                   1872 ;i             Allocated with name '_controlDown_i_10000_546'
                                   1873 ;last          Allocated with name '_controlDown_last_10000_546'
                                   1874 ;------------------------------------------------------------
                                   1875 ;	minikeys.c:204: void controlDown(uint8_t ctrl) {
                                   1876 ;	-----------------------------------------
                                   1877 ;	 function controlDown
                                   1878 ;	-----------------------------------------
      000609                       1879 _controlDown:
      000609 85 82 0D         [24] 1880 	mov	_controlDown_ctrl_10000_545,dpl
                                   1881 ;	minikeys.c:205: __xdata uint8_t* s = bindings[activeLayer * CONTROLS + ctrl];
      00060C 78 28            [12] 1882 	mov	r0,#_activeLayer
      00060E E6               [12] 1883 	mov	a,@r0
      00060F 75 F0 06         [24] 1884 	mov	b,#0x06
      000612 A4               [48] 1885 	mul	ab
      000613 FE               [12] 1886 	mov	r6,a
      000614 AD F0            [24] 1887 	mov	r5,b
      000616 AB 0D            [24] 1888 	mov	r3,_controlDown_ctrl_10000_545
      000618 7C 00            [12] 1889 	mov	r4,#0x00
      00061A EB               [12] 1890 	mov	a,r3
      00061B 2E               [12] 1891 	add	a, r6
      00061C F5 1D            [12] 1892 	mov	__mulint_PARM_2,a
      00061E EC               [12] 1893 	mov	a,r4
      00061F 3D               [12] 1894 	addc	a, r5
      000620 F5 1E            [12] 1895 	mov	(__mulint_PARM_2 + 1),a
      000622 90 00 0B         [24] 1896 	mov	dptr,#0x000b
      000625 12 1A A8         [24] 1897 	lcall	__mulint
      000628 AD 82            [24] 1898 	mov	r5, dpl
      00062A AE 83            [24] 1899 	mov	r6, dph
      00062C ED               [12] 1900 	mov	a,r5
      00062D 24 00            [12] 1901 	add	a, #_bindings
      00062F FD               [12] 1902 	mov	r5,a
      000630 EE               [12] 1903 	mov	a,r6
      000631 34 01            [12] 1904 	addc	a, #(_bindings >> 8)
      000633 FE               [12] 1905 	mov	r6,a
                                   1906 ;	minikeys.c:206: uint8_t type = s[0] >> 5, len = s[0] & 0x1F, i, last;
      000634 8D 82            [24] 1907 	mov	dpl,r5
      000636 8E 83            [24] 1908 	mov	dph,r6
      000638 E0               [24] 1909 	movx	a,@dptr
      000639 FC               [12] 1910 	mov	r4,a
      00063A C4               [12] 1911 	swap	a
      00063B 03               [12] 1912 	rr	a
      00063C 54 07            [12] 1913 	anl	a,#0x07
      00063E FB               [12] 1914 	mov	r3,a
      00063F 53 04 1F         [24] 1915 	anl	ar4,#0x1f
                                   1916 ;	minikeys.c:207: switch(type) {
      000642 BB 01 02         [24] 1917 	cjne	r3,#0x01,00173$
      000645 80 0D            [24] 1918 	sjmp	00101$
      000647                       1919 00173$:
      000647 BB 02 03         [24] 1920 	cjne	r3,#0x02,00174$
      00064A 02 06 EB         [24] 1921 	ljmp	00105$
      00064D                       1922 00174$:
      00064D BB 03 03         [24] 1923 	cjne	r3,#0x03,00175$
      000650 02 07 0A         [24] 1924 	ljmp	00106$
      000653                       1925 00175$:
      000653 22               [24] 1926 	ret
                                   1927 ;	minikeys.c:208: case TYPE_KEYS:
      000654                       1928 00101$:
                                   1929 ;	minikeys.c:209: if(len < 2) return;
      000654 BC 02 00         [24] 1930 	cjne	r4,#0x02,00176$
      000657                       1931 00176$:
      000657 50 01            [24] 1932 	jnc	00103$
      000659 22               [24] 1933 	ret
      00065A                       1934 00103$:
                                   1935 ;	minikeys.c:210: last = len - 2;
      00065A EC               [12] 1936 	mov	a,r4
      00065B 24 FE            [12] 1937 	add	a,#0xfe
      00065D F5 0F            [12] 1938 	mov	_controlDown_last_10000_546,a
                                   1939 ;	minikeys.c:212: for(i=0; i<last; i+=2) {
      00065F 75 0E 00         [24] 1940 	mov	_controlDown_i_10000_546,#0x00
      000662                       1941 00113$:
      000662 C3               [12] 1942 	clr	c
      000663 E5 0E            [12] 1943 	mov	a,_controlDown_i_10000_546
      000665 95 0F            [12] 1944 	subb	a,_controlDown_last_10000_546
      000667 50 46            [24] 1945 	jnc	00104$
                                   1946 ;	minikeys.c:213: sendKeys(s[1 + i], s[2 + i]);
      000669 AA 0E            [24] 1947 	mov	r2,_controlDown_i_10000_546
      00066B 7C 00            [12] 1948 	mov	r4,#0x00
      00066D 74 01            [12] 1949 	mov	a,#0x01
      00066F 2A               [12] 1950 	add	a, r2
      000670 FB               [12] 1951 	mov	r3,a
      000671 E4               [12] 1952 	clr	a
      000672 3C               [12] 1953 	addc	a, r4
      000673 FF               [12] 1954 	mov	r7,a
      000674 EB               [12] 1955 	mov	a,r3
      000675 2D               [12] 1956 	add	a, r5
      000676 F5 82            [12] 1957 	mov	dpl,a
      000678 EF               [12] 1958 	mov	a,r7
      000679 3E               [12] 1959 	addc	a, r6
      00067A F5 83            [12] 1960 	mov	dph,a
      00067C E0               [24] 1961 	movx	a,@dptr
      00067D FF               [12] 1962 	mov	r7,a
      00067E 74 02            [12] 1963 	mov	a,#0x02
      000680 2A               [12] 1964 	add	a, r2
      000681 FA               [12] 1965 	mov	r2,a
      000682 E4               [12] 1966 	clr	a
      000683 3C               [12] 1967 	addc	a, r4
      000684 FC               [12] 1968 	mov	r4,a
      000685 EA               [12] 1969 	mov	a,r2
      000686 2D               [12] 1970 	add	a, r5
      000687 F5 82            [12] 1971 	mov	dpl,a
      000689 EC               [12] 1972 	mov	a,r4
      00068A 3E               [12] 1973 	addc	a, r6
      00068B F5 83            [12] 1974 	mov	dph,a
      00068D E0               [24] 1975 	movx	a,@dptr
      00068E F5 0A            [12] 1976 	mov	_sendKeys_PARM_2,a
      000690 8F 82            [24] 1977 	mov	dpl, r7
      000692 C0 06            [24] 1978 	push	ar6
      000694 C0 05            [24] 1979 	push	ar5
      000696 12 05 25         [24] 1980 	lcall	_sendKeys
                                   1981 ;	minikeys.c:214: sendKeys(0, 0);
      000699 75 0A 00         [24] 1982 	mov	_sendKeys_PARM_2,#0x00
      00069C 75 82 00         [24] 1983 	mov	dpl, #0x00
      00069F 12 05 25         [24] 1984 	lcall	_sendKeys
      0006A2 D0 05            [24] 1985 	pop	ar5
      0006A4 D0 06            [24] 1986 	pop	ar6
                                   1987 ;	minikeys.c:212: for(i=0; i<last; i+=2) {
      0006A6 AB 0E            [24] 1988 	mov	r3,_controlDown_i_10000_546
      0006A8 74 02            [12] 1989 	mov	a,#0x02
      0006AA 2B               [12] 1990 	add	a, r3
      0006AB F5 0E            [12] 1991 	mov	_controlDown_i_10000_546,a
      0006AD 80 B3            [24] 1992 	sjmp	00113$
      0006AF                       1993 00104$:
                                   1994 ;	minikeys.c:216: heldMods[ctrl] = s[1 + last];
      0006AF E5 0D            [12] 1995 	mov	a,_controlDown_ctrl_10000_545
      0006B1 24 F1            [12] 1996 	add	a, #_heldMods
      0006B3 FC               [12] 1997 	mov	r4,a
      0006B4 E4               [12] 1998 	clr	a
      0006B5 34 01            [12] 1999 	addc	a, #(_heldMods >> 8)
      0006B7 FF               [12] 2000 	mov	r7,a
      0006B8 E5 0F            [12] 2001 	mov	a,_controlDown_last_10000_546
      0006BA FB               [12] 2002 	mov	r3,a
      0006BB 04               [12] 2003 	inc	a
      0006BC 2D               [12] 2004 	add	a, r5
      0006BD F5 82            [12] 2005 	mov	dpl,a
      0006BF E4               [12] 2006 	clr	a
      0006C0 3E               [12] 2007 	addc	a,r6
      0006C1 F5 83            [12] 2008 	mov	dph,a
      0006C3 E0               [24] 2009 	movx	a,@dptr
      0006C4 8C 82            [24] 2010 	mov	dpl,r4
      0006C6 8F 83            [24] 2011 	mov	dph,r7
      0006C8 F0               [24] 2012 	movx	@dptr,a
                                   2013 ;	minikeys.c:217: heldKeys[ctrl] = s[2 + last];
      0006C9 E5 0D            [12] 2014 	mov	a,_controlDown_ctrl_10000_545
      0006CB 24 F7            [12] 2015 	add	a, #_heldKeys
      0006CD FC               [12] 2016 	mov	r4,a
      0006CE E4               [12] 2017 	clr	a
      0006CF 34 01            [12] 2018 	addc	a, #(_heldKeys >> 8)
      0006D1 FF               [12] 2019 	mov	r7,a
      0006D2 74 02            [12] 2020 	mov	a,#0x02
      0006D4 2B               [12] 2021 	add	a, r3
      0006D5 2D               [12] 2022 	add	a, r5
      0006D6 F5 82            [12] 2023 	mov	dpl,a
      0006D8 E4               [12] 2024 	clr	a
      0006D9 3E               [12] 2025 	addc	a,r6
      0006DA F5 83            [12] 2026 	mov	dph,a
      0006DC E0               [24] 2027 	movx	a,@dptr
      0006DD 8C 82            [24] 2028 	mov	dpl,r4
      0006DF 8F 83            [24] 2029 	mov	dph,r7
      0006E1 F0               [24] 2030 	movx	@dptr,a
                                   2031 ;	minikeys.c:218: sendKeys(0, 0);
      0006E2 75 0A 00         [24] 2032 	mov	_sendKeys_PARM_2,#0x00
      0006E5 75 82 00         [24] 2033 	mov	dpl, #0x00
                                   2034 ;	minikeys.c:219: break;
      0006E8 02 05 25         [24] 2035 	ljmp	_sendKeys
                                   2036 ;	minikeys.c:220: case TYPE_MEDIA:
      0006EB                       2037 00105$:
                                   2038 ;	minikeys.c:221: heldMediaCtrl = ctrl;
      0006EB 78 2B            [12] 2039 	mov	r0,#_heldMediaCtrl
      0006ED A6 0D            [24] 2040 	mov	@r0,_controlDown_ctrl_10000_545
                                   2041 ;	minikeys.c:222: sendMedia(s[1] | (uint16_t)s[2] << 8);
      0006EF 8D 82            [24] 2042 	mov	dpl,r5
      0006F1 8E 83            [24] 2043 	mov	dph,r6
      0006F3 A3               [24] 2044 	inc	dptr
      0006F4 E0               [24] 2045 	movx	a,@dptr
      0006F5 FF               [12] 2046 	mov	r7,a
      0006F6 8D 82            [24] 2047 	mov	dpl,r5
      0006F8 8E 83            [24] 2048 	mov	dph,r6
      0006FA A3               [24] 2049 	inc	dptr
      0006FB A3               [24] 2050 	inc	dptr
      0006FC E0               [24] 2051 	movx	a,@dptr
      0006FD FB               [12] 2052 	mov	r3,a
      0006FE E4               [12] 2053 	clr	a
      0006FF FA               [12] 2054 	mov	r2,a
      000700 4F               [12] 2055 	orl	a,r7
      000701 F5 82            [12] 2056 	mov	dpl,a
      000703 EB               [12] 2057 	mov	a,r3
      000704 4A               [12] 2058 	orl	a,r2
      000705 F5 83            [12] 2059 	mov	dph,a
                                   2060 ;	minikeys.c:223: break;
      000707 02 05 A3         [24] 2061 	ljmp	_sendMedia
                                   2062 ;	minikeys.c:224: case TYPE_MOUSE:
      00070A                       2063 00106$:
                                   2064 ;	minikeys.c:225: heldButtons[ctrl] = s[1];
      00070A E5 0D            [12] 2065 	mov	a,_controlDown_ctrl_10000_545
      00070C 24 FD            [12] 2066 	add	a, #_heldButtons
      00070E FC               [12] 2067 	mov	r4,a
      00070F E4               [12] 2068 	clr	a
      000710 34 01            [12] 2069 	addc	a, #(_heldButtons >> 8)
      000712 FF               [12] 2070 	mov	r7,a
      000713 8D 82            [24] 2071 	mov	dpl,r5
      000715 8E 83            [24] 2072 	mov	dph,r6
      000717 A3               [24] 2073 	inc	dptr
      000718 E0               [24] 2074 	movx	a,@dptr
      000719 8C 82            [24] 2075 	mov	dpl,r4
      00071B 8F 83            [24] 2076 	mov	dph,r7
      00071D F0               [24] 2077 	movx	@dptr,a
                                   2078 ;	minikeys.c:226: sendMouse(s[2], s[3], s[4]);
      00071E 8D 82            [24] 2079 	mov	dpl,r5
      000720 8E 83            [24] 2080 	mov	dph,r6
      000722 A3               [24] 2081 	inc	dptr
      000723 A3               [24] 2082 	inc	dptr
      000724 E0               [24] 2083 	movx	a,@dptr
      000725 FF               [12] 2084 	mov	r7,a
      000726 8D 82            [24] 2085 	mov	dpl,r5
      000728 8E 83            [24] 2086 	mov	dph,r6
      00072A A3               [24] 2087 	inc	dptr
      00072B A3               [24] 2088 	inc	dptr
      00072C A3               [24] 2089 	inc	dptr
      00072D E0               [24] 2090 	movx	a,@dptr
      00072E F5 0B            [12] 2091 	mov	_sendMouse_PARM_2,a
      000730 8D 82            [24] 2092 	mov	dpl,r5
      000732 8E 83            [24] 2093 	mov	dph,r6
      000734 A3               [24] 2094 	inc	dptr
      000735 A3               [24] 2095 	inc	dptr
      000736 A3               [24] 2096 	inc	dptr
      000737 A3               [24] 2097 	inc	dptr
      000738 E0               [24] 2098 	movx	a,@dptr
      000739 F5 0C            [12] 2099 	mov	_sendMouse_PARM_3,a
      00073B 8F 82            [24] 2100 	mov	dpl, r7
      00073D C0 06            [24] 2101 	push	ar6
      00073F C0 05            [24] 2102 	push	ar5
      000741 12 05 C4         [24] 2103 	lcall	_sendMouse
      000744 D0 05            [24] 2104 	pop	ar5
      000746 D0 06            [24] 2105 	pop	ar6
                                   2106 ;	minikeys.c:227: if(s[2] || s[3] || s[4]) sendMouse(0, 0, 0);
      000748 74 02            [12] 2107 	mov	a,#0x02
      00074A 2D               [12] 2108 	add	a, r5
      00074B FC               [12] 2109 	mov	r4,a
      00074C E4               [12] 2110 	clr	a
      00074D 3E               [12] 2111 	addc	a, r6
      00074E FF               [12] 2112 	mov	r7,a
      00074F 8C 82            [24] 2113 	mov	dpl,r4
      000751 8F 83            [24] 2114 	mov	dph,r7
      000753 E0               [24] 2115 	movx	a,@dptr
      000754 70 1C            [24] 2116 	jnz	00107$
      000756 74 03            [12] 2117 	mov	a,#0x03
      000758 2D               [12] 2118 	add	a, r5
      000759 FC               [12] 2119 	mov	r4,a
      00075A E4               [12] 2120 	clr	a
      00075B 3E               [12] 2121 	addc	a, r6
      00075C FF               [12] 2122 	mov	r7,a
      00075D 8C 82            [24] 2123 	mov	dpl,r4
      00075F 8F 83            [24] 2124 	mov	dph,r7
      000761 E0               [24] 2125 	movx	a,@dptr
      000762 70 0E            [24] 2126 	jnz	00107$
      000764 74 04            [12] 2127 	mov	a,#0x04
      000766 2D               [12] 2128 	add	a, r5
      000767 FD               [12] 2129 	mov	r5,a
      000768 E4               [12] 2130 	clr	a
      000769 3E               [12] 2131 	addc	a, r6
      00076A FE               [12] 2132 	mov	r6,a
      00076B 8D 82            [24] 2133 	mov	dpl,r5
      00076D 8E 83            [24] 2134 	mov	dph,r6
      00076F E0               [24] 2135 	movx	a,@dptr
      000770 60 0C            [24] 2136 	jz	00115$
      000772                       2137 00107$:
      000772 75 0B 00         [24] 2138 	mov	_sendMouse_PARM_2,#0x00
      000775 75 0C 00         [24] 2139 	mov	_sendMouse_PARM_3,#0x00
      000778 75 82 00         [24] 2140 	mov	dpl, #0x00
                                   2141 ;	minikeys.c:229: }
                                   2142 ;	minikeys.c:230: }
      00077B 02 05 C4         [24] 2143 	ljmp	_sendMouse
      00077E                       2144 00115$:
      00077E 22               [24] 2145 	ret
                                   2146 ;------------------------------------------------------------
                                   2147 ;Allocation info for local variables in function 'controlUp'
                                   2148 ;------------------------------------------------------------
                                   2149 ;ctrl          Allocated to registers r7 
                                   2150 ;------------------------------------------------------------
                                   2151 ;	minikeys.c:232: void controlUp(uint8_t ctrl) {
                                   2152 ;	-----------------------------------------
                                   2153 ;	 function controlUp
                                   2154 ;	-----------------------------------------
      00077F                       2155 _controlUp:
                                   2156 ;	minikeys.c:233: if(heldMods[ctrl] || heldKeys[ctrl]) {
      00077F E5 82            [12] 2157 	mov	a,dpl
      000781 FF               [12] 2158 	mov	r7,a
      000782 24 F1            [12] 2159 	add	a, #_heldMods
      000784 FD               [12] 2160 	mov	r5,a
      000785 E4               [12] 2161 	clr	a
      000786 34 01            [12] 2162 	addc	a, #(_heldMods >> 8)
      000788 FE               [12] 2163 	mov	r6,a
      000789 8D 82            [24] 2164 	mov	dpl,r5
      00078B 8E 83            [24] 2165 	mov	dph,r6
      00078D E0               [24] 2166 	movx	a,@dptr
      00078E 70 0F            [24] 2167 	jnz	00101$
      000790 EF               [12] 2168 	mov	a,r7
      000791 24 F7            [12] 2169 	add	a, #_heldKeys
      000793 FB               [12] 2170 	mov	r3,a
      000794 E4               [12] 2171 	clr	a
      000795 34 01            [12] 2172 	addc	a, #(_heldKeys >> 8)
      000797 FC               [12] 2173 	mov	r4,a
      000798 8B 82            [24] 2174 	mov	dpl,r3
      00079A 8C 83            [24] 2175 	mov	dph,r4
      00079C E0               [24] 2176 	movx	a,@dptr
      00079D 60 1E            [24] 2177 	jz	00102$
      00079F                       2178 00101$:
                                   2179 ;	minikeys.c:234: heldMods[ctrl] = 0;
      00079F 8D 82            [24] 2180 	mov	dpl,r5
      0007A1 8E 83            [24] 2181 	mov	dph,r6
      0007A3 E4               [12] 2182 	clr	a
      0007A4 F0               [24] 2183 	movx	@dptr,a
                                   2184 ;	minikeys.c:235: heldKeys[ctrl] = 0;
      0007A5 EF               [12] 2185 	mov	a,r7
      0007A6 24 F7            [12] 2186 	add	a, #_heldKeys
      0007A8 F5 82            [12] 2187 	mov	dpl,a
      0007AA E4               [12] 2188 	clr	a
      0007AB 34 01            [12] 2189 	addc	a, #(_heldKeys >> 8)
      0007AD F5 83            [12] 2190 	mov	dph,a
      0007AF E4               [12] 2191 	clr	a
      0007B0 F0               [24] 2192 	movx	@dptr,a
                                   2193 ;	minikeys.c:236: sendKeys(0, 0);
      0007B1 F5 0A            [12] 2194 	mov	_sendKeys_PARM_2,a
      0007B3 75 82 00         [24] 2195 	mov	dpl, #0x00
      0007B6 C0 07            [24] 2196 	push	ar7
      0007B8 12 05 25         [24] 2197 	lcall	_sendKeys
      0007BB D0 07            [24] 2198 	pop	ar7
      0007BD                       2199 00102$:
                                   2200 ;	minikeys.c:238: if(heldMediaCtrl == ctrl) {
      0007BD 78 2B            [12] 2201 	mov	r0,#_heldMediaCtrl
      0007BF E6               [12] 2202 	mov	a,@r0
      0007C0 B5 07 0E         [24] 2203 	cjne	a,ar7,00105$
                                   2204 ;	minikeys.c:239: heldMediaCtrl = 0xFF;
      0007C3 78 2B            [12] 2205 	mov	r0,#_heldMediaCtrl
      0007C5 76 FF            [12] 2206 	mov	@r0,#0xff
                                   2207 ;	minikeys.c:240: sendMedia(0);
      0007C7 90 00 00         [24] 2208 	mov	dptr,#0x0000
      0007CA C0 07            [24] 2209 	push	ar7
      0007CC 12 05 A3         [24] 2210 	lcall	_sendMedia
      0007CF D0 07            [24] 2211 	pop	ar7
      0007D1                       2212 00105$:
                                   2213 ;	minikeys.c:242: if(heldButtons[ctrl]) {
      0007D1 EF               [12] 2214 	mov	a,r7
      0007D2 24 FD            [12] 2215 	add	a, #_heldButtons
      0007D4 FE               [12] 2216 	mov	r6,a
      0007D5 E4               [12] 2217 	clr	a
      0007D6 34 01            [12] 2218 	addc	a, #(_heldButtons >> 8)
      0007D8 FF               [12] 2219 	mov	r7,a
      0007D9 8E 82            [24] 2220 	mov	dpl,r6
      0007DB 8F 83            [24] 2221 	mov	dph,r7
      0007DD E0               [24] 2222 	movx	a,@dptr
      0007DE 60 10            [24] 2223 	jz	00108$
                                   2224 ;	minikeys.c:243: heldButtons[ctrl] = 0;
      0007E0 8E 82            [24] 2225 	mov	dpl,r6
      0007E2 8F 83            [24] 2226 	mov	dph,r7
      0007E4 E4               [12] 2227 	clr	a
      0007E5 F0               [24] 2228 	movx	@dptr,a
                                   2229 ;	minikeys.c:244: sendMouse(0, 0, 0);
      0007E6 F5 0B            [12] 2230 	mov	_sendMouse_PARM_2,a
      0007E8 F5 0C            [12] 2231 	mov	_sendMouse_PARM_3,a
      0007EA 75 82 00         [24] 2232 	mov	dpl, #0x00
                                   2233 ;	minikeys.c:246: }
      0007ED 02 05 C4         [24] 2234 	ljmp	_sendMouse
      0007F0                       2235 00108$:
      0007F0 22               [24] 2236 	ret
                                   2237 ;------------------------------------------------------------
                                   2238 ;Allocation info for local variables in function 'releaseAll'
                                   2239 ;------------------------------------------------------------
                                   2240 ;i             Allocated to registers r7 
                                   2241 ;------------------------------------------------------------
                                   2242 ;	minikeys.c:248: void releaseAll(void) {
                                   2243 ;	-----------------------------------------
                                   2244 ;	 function releaseAll
                                   2245 ;	-----------------------------------------
      0007F1                       2246 _releaseAll:
                                   2247 ;	minikeys.c:250: for(i=0; i<CONTROLS; i++) controlUp(i);
      0007F1 7F 00            [12] 2248 	mov	r7,#0x00
      0007F3                       2249 00102$:
      0007F3 8F 82            [24] 2250 	mov	dpl, r7
      0007F5 C0 07            [24] 2251 	push	ar7
      0007F7 12 07 7F         [24] 2252 	lcall	_controlUp
      0007FA D0 07            [24] 2253 	pop	ar7
      0007FC 0F               [12] 2254 	inc	r7
      0007FD BF 06 00         [24] 2255 	cjne	r7,#0x06,00114$
      000800                       2256 00114$:
      000800 40 F1            [24] 2257 	jc	00102$
                                   2258 ;	minikeys.c:251: }
      000802 22               [24] 2259 	ret
                                   2260 ;------------------------------------------------------------
                                   2261 ;Allocation info for local variables in function 'setPixel'
                                   2262 ;------------------------------------------------------------
                                   2263 ;r             Allocated with name '_setPixel_PARM_2'
                                   2264 ;g             Allocated with name '_setPixel_PARM_3'
                                   2265 ;b             Allocated with name '_setPixel_PARM_4'
                                   2266 ;i             Allocated to registers r7 
                                   2267 ;------------------------------------------------------------
                                   2268 ;	minikeys.c:269: void setPixel(uint8_t i, uint8_t r, uint8_t g, uint8_t b) {
                                   2269 ;	-----------------------------------------
                                   2270 ;	 function setPixel
                                   2271 ;	-----------------------------------------
      000803                       2272 _setPixel:
                                   2273 ;	minikeys.c:270: pixels[i][0] = r; pixels[i][1] = g; pixels[i][2] = b;
      000803 E5 82            [12] 2274 	mov	a,dpl
      000805 75 F0 03         [24] 2275 	mov	b,#0x03
      000808 A4               [48] 2276 	mul	ab
      000809 24 03            [12] 2277 	add	a, #_pixels
      00080B FE               [12] 2278 	mov	r6,a
      00080C 74 02            [12] 2279 	mov	a,#(_pixels >> 8)
      00080E 35 F0            [12] 2280 	addc	a, b
      000810 FF               [12] 2281 	mov	r7,a
      000811 8E 82            [24] 2282 	mov	dpl,r6
      000813 8F 83            [24] 2283 	mov	dph,r7
      000815 E5 1D            [12] 2284 	mov	a,_setPixel_PARM_2
      000817 F0               [24] 2285 	movx	@dptr,a
      000818 8E 82            [24] 2286 	mov	dpl,r6
      00081A 8F 83            [24] 2287 	mov	dph,r7
      00081C A3               [24] 2288 	inc	dptr
      00081D E5 1E            [12] 2289 	mov	a,_setPixel_PARM_3
      00081F F0               [24] 2290 	movx	@dptr,a
      000820 8E 82            [24] 2291 	mov	dpl,r6
      000822 8F 83            [24] 2292 	mov	dph,r7
      000824 A3               [24] 2293 	inc	dptr
      000825 A3               [24] 2294 	inc	dptr
      000826 E5 1F            [12] 2295 	mov	a,_setPixel_PARM_4
      000828 F0               [24] 2296 	movx	@dptr,a
                                   2297 ;	minikeys.c:271: }
      000829 22               [24] 2298 	ret
                                   2299 ;------------------------------------------------------------
                                   2300 ;Allocation info for local variables in function 'setPixelScaled'
                                   2301 ;------------------------------------------------------------
                                   2302 ;color         Allocated with name '_setPixelScaled_PARM_2'
                                   2303 ;level         Allocated with name '_setPixelScaled_PARM_3'
                                   2304 ;i             Allocated to registers r7 
                                   2305 ;------------------------------------------------------------
                                   2306 ;	minikeys.c:273: void setPixelScaled(uint8_t i, __xdata uint8_t* color, uint8_t level) {
                                   2307 ;	-----------------------------------------
                                   2308 ;	 function setPixelScaled
                                   2309 ;	-----------------------------------------
      00082A                       2310 _setPixelScaled:
      00082A AF 82            [24] 2311 	mov	r7, dpl
                                   2312 ;	minikeys.c:274: setPixel(i, ((uint16_t)color[0] * level) >> 8, ((uint16_t)color[1] * level) >> 8,
      00082C AD 10            [24] 2313 	mov	r5,_setPixelScaled_PARM_2
      00082E AE 11            [24] 2314 	mov	r6,(_setPixelScaled_PARM_2 + 1)
      000830 8D 82            [24] 2315 	mov	dpl,r5
      000832 8E 83            [24] 2316 	mov	dph,r6
      000834 E0               [24] 2317 	movx	a,@dptr
      000835 FC               [12] 2318 	mov	r4,a
      000836 AB 12            [24] 2319 	mov	r3,_setPixelScaled_PARM_3
      000838 8B 02            [24] 2320 	mov	ar2,r3
      00083A 8C F0            [24] 2321 	mov	b,r4
      00083C EA               [12] 2322 	mov	a,r2
      00083D A4               [48] 2323 	mul	ab
      00083E AC F0            [24] 2324 	mov	r4,b
      000840 8C 1D            [24] 2325 	mov	_setPixel_PARM_2,r4
      000842 8D 82            [24] 2326 	mov	dpl,r5
      000844 8E 83            [24] 2327 	mov	dph,r6
      000846 A3               [24] 2328 	inc	dptr
      000847 E0               [24] 2329 	movx	a,@dptr
      000848 FC               [12] 2330 	mov	r4,a
      000849 8B 02            [24] 2331 	mov	ar2,r3
      00084B 8C F0            [24] 2332 	mov	b,r4
      00084D EA               [12] 2333 	mov	a,r2
      00084E A4               [48] 2334 	mul	ab
      00084F AC F0            [24] 2335 	mov	r4,b
      000851 8C 1E            [24] 2336 	mov	_setPixel_PARM_3,r4
                                   2337 ;	minikeys.c:275: ((uint16_t)color[2] * level) >> 8);
      000853 8D 82            [24] 2338 	mov	dpl,r5
      000855 8E 83            [24] 2339 	mov	dph,r6
      000857 A3               [24] 2340 	inc	dptr
      000858 A3               [24] 2341 	inc	dptr
      000859 E0               [24] 2342 	movx	a,@dptr
      00085A F5 F0            [12] 2343 	mov	b, a
      00085C EB               [12] 2344 	mov	a,r3
      00085D A4               [48] 2345 	mul	ab
      00085E AD F0            [24] 2346 	mov	r5,b
      000860 8D 1F            [24] 2347 	mov	_setPixel_PARM_4,r5
      000862 8F 82            [24] 2348 	mov	dpl, r7
                                   2349 ;	minikeys.c:276: }
      000864 02 08 03         [24] 2350 	ljmp	_setPixel
                                   2351 ;------------------------------------------------------------
                                   2352 ;Allocation info for local variables in function 'setPixelHue'
                                   2353 ;------------------------------------------------------------
                                   2354 ;hue           Allocated with name '_setPixelHue_PARM_2'
                                   2355 ;i             Allocated to registers r7 
                                   2356 ;region        Allocated to registers r6 
                                   2357 ;rise          Allocated to registers r5 
                                   2358 ;fall          Allocated to registers r4 
                                   2359 ;------------------------------------------------------------
                                   2360 ;	minikeys.c:278: void setPixelHue(uint8_t i, uint8_t hue) {
                                   2361 ;	-----------------------------------------
                                   2362 ;	 function setPixelHue
                                   2363 ;	-----------------------------------------
      000867                       2364 _setPixelHue:
      000867 AF 82            [24] 2365 	mov	r7, dpl
                                   2366 ;	minikeys.c:279: uint8_t region = hue / 43, rise = (hue - region * 43) * 6, fall = 255 - rise;
      000869 AE 13            [24] 2367 	mov	r6,_setPixelHue_PARM_2
      00086B 75 F0 2B         [24] 2368 	mov	b,#0x2b
      00086E EE               [12] 2369 	mov	a,r6
      00086F 84               [48] 2370 	div	ab
      000870 FE               [12] 2371 	mov	r6,a
      000871 75 F0 2B         [24] 2372 	mov	b,#0x2b
      000874 A4               [48] 2373 	mul	ab
      000875 FD               [12] 2374 	mov	r5,a
      000876 E5 13            [12] 2375 	mov	a,_setPixelHue_PARM_2
      000878 C3               [12] 2376 	clr	c
      000879 9D               [12] 2377 	subb	a,r5
      00087A 75 F0 06         [24] 2378 	mov	b,#0x06
      00087D A4               [48] 2379 	mul	ab
      00087E FD               [12] 2380 	mov	r5,a
      00087F FC               [12] 2381 	mov	r4,a
      000880 74 FF            [12] 2382 	mov	a,#0xff
      000882 C3               [12] 2383 	clr	c
      000883 9C               [12] 2384 	subb	a,r4
      000884 FC               [12] 2385 	mov	r4,a
                                   2386 ;	minikeys.c:280: switch(region) {
      000885 EE               [12] 2387 	mov	a,r6
      000886 24 FB            [12] 2388 	add	a,#0xff - 0x04
      000888 40 51            [24] 2389 	jc	00106$
                                   2390 ;	free result
      00088A EE               [12] 2391 	mov	a,r6
      00088B 2E               [12] 2392 	add	a,r6
                                   2393 ;	minikeys.c:281: case 0:  setPixel(i, 255, rise, 0); break;
      00088C 90 08 90         [24] 2394 	mov	dptr,#00118$
      00088F 73               [24] 2395 	jmp	@a+dptr
      000890                       2396 00118$:
      000890 80 08            [24] 2397 	sjmp	00101$
      000892 80 13            [24] 2398 	sjmp	00102$
      000894 80 1E            [24] 2399 	sjmp	00103$
      000896 80 29            [24] 2400 	sjmp	00104$
      000898 80 34            [24] 2401 	sjmp	00105$
      00089A                       2402 00101$:
      00089A 75 1D FF         [24] 2403 	mov	_setPixel_PARM_2,#0xff
      00089D 8D 1E            [24] 2404 	mov	_setPixel_PARM_3,r5
      00089F 75 1F 00         [24] 2405 	mov	_setPixel_PARM_4,#0x00
      0008A2 8F 82            [24] 2406 	mov	dpl, r7
                                   2407 ;	minikeys.c:282: case 1:  setPixel(i, fall, 255, 0); break;
      0008A4 02 08 03         [24] 2408 	ljmp	_setPixel
      0008A7                       2409 00102$:
      0008A7 8C 1D            [24] 2410 	mov	_setPixel_PARM_2,r4
      0008A9 75 1E FF         [24] 2411 	mov	_setPixel_PARM_3,#0xff
      0008AC 75 1F 00         [24] 2412 	mov	_setPixel_PARM_4,#0x00
      0008AF 8F 82            [24] 2413 	mov	dpl, r7
                                   2414 ;	minikeys.c:283: case 2:  setPixel(i, 0, 255, rise); break;
      0008B1 02 08 03         [24] 2415 	ljmp	_setPixel
      0008B4                       2416 00103$:
      0008B4 75 1D 00         [24] 2417 	mov	_setPixel_PARM_2,#0x00
      0008B7 75 1E FF         [24] 2418 	mov	_setPixel_PARM_3,#0xff
      0008BA 8D 1F            [24] 2419 	mov	_setPixel_PARM_4,r5
      0008BC 8F 82            [24] 2420 	mov	dpl, r7
                                   2421 ;	minikeys.c:284: case 3:  setPixel(i, 0, fall, 255); break;
      0008BE 02 08 03         [24] 2422 	ljmp	_setPixel
      0008C1                       2423 00104$:
      0008C1 75 1D 00         [24] 2424 	mov	_setPixel_PARM_2,#0x00
      0008C4 8C 1E            [24] 2425 	mov	_setPixel_PARM_3,r4
      0008C6 75 1F FF         [24] 2426 	mov	_setPixel_PARM_4,#0xff
      0008C9 8F 82            [24] 2427 	mov	dpl, r7
                                   2428 ;	minikeys.c:285: case 4:  setPixel(i, rise, 0, 255); break;
      0008CB 02 08 03         [24] 2429 	ljmp	_setPixel
      0008CE                       2430 00105$:
      0008CE 8D 1D            [24] 2431 	mov	_setPixel_PARM_2,r5
      0008D0 75 1E 00         [24] 2432 	mov	_setPixel_PARM_3,#0x00
      0008D3 75 1F FF         [24] 2433 	mov	_setPixel_PARM_4,#0xff
      0008D6 8F 82            [24] 2434 	mov	dpl, r7
                                   2435 ;	minikeys.c:286: default: setPixel(i, 255, 0, fall); break;
      0008D8 02 08 03         [24] 2436 	ljmp	_setPixel
      0008DB                       2437 00106$:
      0008DB 75 1D FF         [24] 2438 	mov	_setPixel_PARM_2,#0xff
      0008DE 75 1E 00         [24] 2439 	mov	_setPixel_PARM_3,#0x00
      0008E1 8C 1F            [24] 2440 	mov	_setPixel_PARM_4,r4
      0008E3 8F 82            [24] 2441 	mov	dpl, r7
                                   2442 ;	minikeys.c:287: }
                                   2443 ;	minikeys.c:288: }
      0008E5 02 08 03         [24] 2444 	ljmp	_setPixel
                                   2445 ;------------------------------------------------------------
                                   2446 ;Allocation info for local variables in function 'lightColor'
                                   2447 ;------------------------------------------------------------
                                   2448 ;	minikeys.c:292: __xdata uint8_t* lightColor(void) {
                                   2449 ;	-----------------------------------------
                                   2450 ;	 function lightColor
                                   2451 ;	-----------------------------------------
      0008E8                       2452 _lightColor:
                                   2453 ;	minikeys.c:293: tmpColor[0] = light.r; tmpColor[1] = light.g; tmpColor[2] = light.b;
      0008E8 90 01 C7         [24] 2454 	mov	dptr,#(_light + 0x0001)
      0008EB E0               [24] 2455 	movx	a,@dptr
      0008EC 90 02 18         [24] 2456 	mov	dptr,#_tmpColor
      0008EF F0               [24] 2457 	movx	@dptr,a
      0008F0 90 01 C8         [24] 2458 	mov	dptr,#(_light + 0x0002)
      0008F3 E0               [24] 2459 	movx	a,@dptr
      0008F4 90 02 19         [24] 2460 	mov	dptr,#(_tmpColor + 0x0001)
      0008F7 F0               [24] 2461 	movx	@dptr,a
      0008F8 90 01 C9         [24] 2462 	mov	dptr,#(_light + 0x0003)
      0008FB E0               [24] 2463 	movx	a,@dptr
      0008FC 90 02 1A         [24] 2464 	mov	dptr,#(_tmpColor + 0x0002)
      0008FF F0               [24] 2465 	movx	@dptr,a
                                   2466 ;	minikeys.c:294: return tmpColor;
      000900 90 02 18         [24] 2467 	mov	dptr,#_tmpColor
                                   2468 ;	minikeys.c:295: }
      000903 22               [24] 2469 	ret
                                   2470 ;------------------------------------------------------------
                                   2471 ;Allocation info for local variables in function 'flashPress'
                                   2472 ;------------------------------------------------------------
                                   2473 ;key           Allocated to registers r7 
                                   2474 ;i             Allocated with name '_flashPress_i_10000_575'
                                   2475 ;pixel         Allocated to registers r7 
                                   2476 ;------------------------------------------------------------
                                   2477 ;	minikeys.c:297: void flashPress(uint8_t key) {
                                   2478 ;	-----------------------------------------
                                   2479 ;	 function flashPress
                                   2480 ;	-----------------------------------------
      000904                       2481 _flashPress:
                                   2482 ;	minikeys.c:298: uint8_t i, pixel = keyPixel[key];
      000904 E5 82            [12] 2483 	mov	a,dpl
                                   2484 ;	minikeys.c:299: pressLevel[pixel] = 255;
      000906 90 1B 16         [24] 2485 	mov	dptr,#_keyPixel
      000909 93               [24] 2486 	movc	a,@a+dptr
      00090A FF               [12] 2487 	mov	r7,a
      00090B 24 0C            [12] 2488 	add	a, #_pressLevel
      00090D F5 82            [12] 2489 	mov	dpl,a
      00090F E4               [12] 2490 	clr	a
      000910 34 02            [12] 2491 	addc	a, #(_pressLevel >> 8)
      000912 F5 83            [12] 2492 	mov	dph,a
      000914 74 FF            [12] 2493 	mov	a,#0xff
      000916 F0               [24] 2494 	movx	@dptr,a
                                   2495 ;	minikeys.c:300: for(i=0; i<3; i++)
      000917 EF               [12] 2496 	mov	a,r7
      000918 75 F0 03         [24] 2497 	mov	b,#0x03
      00091B A4               [48] 2498 	mul	ab
      00091C 24 0F            [12] 2499 	add	a, #_pressColor
      00091E FE               [12] 2500 	mov	r6,a
      00091F 74 02            [12] 2501 	mov	a,#(_pressColor >> 8)
      000921 35 F0            [12] 2502 	addc	a, b
      000923 FF               [12] 2503 	mov	r7,a
      000924 75 1D 00         [24] 2504 	mov	_flashPress_i_10000_575,#0x00
      000927                       2505 00102$:
                                   2506 ;	minikeys.c:301: pressColor[pixel][i] = (light.flags & FLAG_MULTICOLOR) ? palette[pressCount & 3][i]
      000927 E5 1D            [12] 2507 	mov	a,_flashPress_i_10000_575
      000929 2E               [12] 2508 	add	a, r6
      00092A FB               [12] 2509 	mov	r3,a
      00092B E4               [12] 2510 	clr	a
      00092C 3F               [12] 2511 	addc	a, r7
      00092D FC               [12] 2512 	mov	r4,a
      00092E 90 01 CC         [24] 2513 	mov	dptr,#(_light + 0x0006)
      000931 E0               [24] 2514 	movx	a,@dptr
      000932 30 E0 20         [24] 2515 	jnb	acc.0,00106$
      000935 78 2E            [12] 2516 	mov	r0,#_pressCount
      000937 86 02            [24] 2517 	mov	ar2,@r0
      000939 74 03            [12] 2518 	mov	a,#0x03
      00093B 5A               [12] 2519 	anl	a,r2
      00093C 75 F0 03         [24] 2520 	mov	b,#0x03
      00093F A4               [48] 2521 	mul	ab
      000940 24 19            [12] 2522 	add	a,#_palette
      000942 FA               [12] 2523 	mov	r2,a
      000943 E4               [12] 2524 	clr	a
      000944 34 1B            [12] 2525 	addc	a, #(_palette >> 8)
      000946 FD               [12] 2526 	mov	r5,a
      000947 E5 1D            [12] 2527 	mov	a,_flashPress_i_10000_575
      000949 2A               [12] 2528 	add	a, r2
      00094A F5 82            [12] 2529 	mov	dpl,a
      00094C E4               [12] 2530 	clr	a
      00094D 3D               [12] 2531 	addc	a, r5
      00094E F5 83            [12] 2532 	mov	dph,a
      000950 E4               [12] 2533 	clr	a
      000951 93               [24] 2534 	movc	a,@a+dptr
      000952 FD               [12] 2535 	mov	r5,a
      000953 80 0D            [24] 2536 	sjmp	00107$
      000955                       2537 00106$:
                                   2538 ;	minikeys.c:302: : ((__xdata uint8_t*)&light.r)[i];
      000955 E5 1D            [12] 2539 	mov	a,_flashPress_i_10000_575
      000957 24 C7            [12] 2540 	add	a, #(_light + 0x0001)
      000959 F5 82            [12] 2541 	mov	dpl,a
      00095B E4               [12] 2542 	clr	a
      00095C 34 01            [12] 2543 	addc	a, #((_light + 0x0001) >> 8)
      00095E F5 83            [12] 2544 	mov	dph,a
      000960 E0               [24] 2545 	movx	a,@dptr
      000961 FD               [12] 2546 	mov	r5,a
      000962                       2547 00107$:
      000962 8B 82            [24] 2548 	mov	dpl,r3
      000964 8C 83            [24] 2549 	mov	dph,r4
      000966 ED               [12] 2550 	mov	a,r5
      000967 F0               [24] 2551 	movx	@dptr,a
                                   2552 ;	minikeys.c:300: for(i=0; i<3; i++)
      000968 05 1D            [12] 2553 	inc	_flashPress_i_10000_575
      00096A 74 FD            [12] 2554 	mov	a,#0x100 - 0x03
      00096C 25 1D            [12] 2555 	add	a,_flashPress_i_10000_575
      00096E 50 B7            [24] 2556 	jnc	00102$
                                   2557 ;	minikeys.c:303: pressCount++;
      000970 78 2E            [12] 2558 	mov	r0,#_pressCount
      000972 06               [12] 2559 	inc	@r0
                                   2560 ;	minikeys.c:304: }
      000973 22               [24] 2561 	ret
                                   2562 ;------------------------------------------------------------
                                   2563 ;Allocation info for local variables in function 'renderLights'
                                   2564 ;------------------------------------------------------------
                                   2565 ;i             Allocated with name '_renderLights_i_10000_578'
                                   2566 ;level         Allocated to registers r6 
                                   2567 ;step          Allocated to registers r7 
                                   2568 ;phase         Allocated with name '_renderLights_phase_10000_578'
                                   2569 ;cycle         Allocated to registers r4 
                                   2570 ;color         Allocated to registers r6 r7 
                                   2571 ;------------------------------------------------------------
                                   2572 ;	minikeys.c:306: void renderLights(void) {
                                   2573 ;	-----------------------------------------
                                   2574 ;	 function renderLights
                                   2575 ;	-----------------------------------------
      000974                       2576 _renderLights:
                                   2577 ;	minikeys.c:308: __xdata uint8_t* color = lightColor();
      000974 12 08 E8         [24] 2578 	lcall	_lightColor
      000977 AE 82            [24] 2579 	mov	r6, dpl
      000979 AF 83            [24] 2580 	mov	r7, dph
                                   2581 ;	minikeys.c:310: for(i=0; i<NEO_COUNT; i++) setPixel(i, 0, 0, 0);
      00097B 7D 00            [12] 2582 	mov	r5,#0x00
      00097D                       2583 00136$:
      00097D 75 1D 00         [24] 2584 	mov	_setPixel_PARM_2,#0x00
      000980 75 1E 00         [24] 2585 	mov	_setPixel_PARM_3,#0x00
      000983 75 1F 00         [24] 2586 	mov	_setPixel_PARM_4,#0x00
      000986 8D 82            [24] 2587 	mov	dpl, r5
      000988 C0 07            [24] 2588 	push	ar7
      00098A C0 06            [24] 2589 	push	ar6
      00098C C0 05            [24] 2590 	push	ar5
      00098E 12 08 03         [24] 2591 	lcall	_setPixel
      000991 D0 05            [24] 2592 	pop	ar5
      000993 D0 06            [24] 2593 	pop	ar6
      000995 D0 07            [24] 2594 	pop	ar7
      000997 0D               [12] 2595 	inc	r5
      000998 BD 03 00         [24] 2596 	cjne	r5,#0x03,00444$
      00099B                       2597 00444$:
      00099B 40 E0            [24] 2598 	jc	00136$
                                   2599 ;	minikeys.c:312: switch(light.effect) {
      00099D 90 01 C6         [24] 2600 	mov	dptr,#_light
      0009A0 E0               [24] 2601 	movx	a,@dptr
      0009A1 FD               [12] 2602 	mov  r5,a
      0009A2 24 F9            [12] 2603 	add	a,#0xff - 0x06
      0009A4 50 03            [24] 2604 	jnc	00446$
      0009A6 02 0B 43         [24] 2605 	ljmp	00219$
      0009A9                       2606 00446$:
                                   2607 ;	free result
      0009A9 ED               [12] 2608 	mov	a,r5
      0009AA 2D               [12] 2609 	add	a,r5
      0009AB 2D               [12] 2610 	add	a,r5
      0009AC 90 09 B0         [24] 2611 	mov	dptr,#00447$
      0009AF 73               [24] 2612 	jmp	@a+dptr
      0009B0                       2613 00447$:
      0009B0 02 0B 43         [24] 2614 	ljmp	00219$
      0009B3 02 0B 43         [24] 2615 	ljmp	00219$
      0009B6 02 0A 66         [24] 2616 	ljmp	00108$
      0009B9 02 09 C5         [24] 2617 	ljmp	00204$
      0009BC 02 09 E8         [24] 2618 	ljmp	00104$
      0009BF 02 0A 3A         [24] 2619 	ljmp	00209$
      0009C2 02 0B 04         [24] 2620 	ljmp	00114$
                                   2621 ;	minikeys.c:314: for(i=0; i<NEO_COUNT; i++) setPixelScaled(i, color, 255);
      0009C5                       2622 00204$:
      0009C5 7D 00            [12] 2623 	mov	r5,#0x00
      0009C7                       2624 00138$:
      0009C7 8E 10            [24] 2625 	mov	_setPixelScaled_PARM_2,r6
      0009C9 8F 11            [24] 2626 	mov	(_setPixelScaled_PARM_2 + 1),r7
      0009CB 75 12 FF         [24] 2627 	mov	_setPixelScaled_PARM_3,#0xff
      0009CE 8D 82            [24] 2628 	mov	dpl, r5
      0009D0 C0 07            [24] 2629 	push	ar7
      0009D2 C0 06            [24] 2630 	push	ar6
      0009D4 C0 05            [24] 2631 	push	ar5
      0009D6 12 08 2A         [24] 2632 	lcall	_setPixelScaled
      0009D9 D0 05            [24] 2633 	pop	ar5
      0009DB D0 06            [24] 2634 	pop	ar6
      0009DD D0 07            [24] 2635 	pop	ar7
      0009DF 0D               [12] 2636 	inc	r5
      0009E0 BD 03 00         [24] 2637 	cjne	r5,#0x03,00448$
      0009E3                       2638 00448$:
      0009E3 40 E2            [24] 2639 	jc	00138$
                                   2640 ;	minikeys.c:315: break;
      0009E5 02 0B 43         [24] 2641 	ljmp	00219$
                                   2642 ;	minikeys.c:317: case FX_BREATHE:
      0009E8                       2643 00104$:
                                   2644 ;	minikeys.c:318: phase = frame * light.speed;
      0009E8 90 01 CA         [24] 2645 	mov	dptr,#(_light + 0x0004)
      0009EB E0               [24] 2646 	movx	a,@dptr
      0009EC FD               [12] 2647 	mov	r5,a
      0009ED 78 2C            [12] 2648 	mov	r0,#_frame
      0009EF 86 04            [24] 2649 	mov	ar4,@r0
      0009F1 8C F0            [24] 2650 	mov	b,r4
      0009F3 ED               [12] 2651 	mov	a,r5
      0009F4 A4               [48] 2652 	mul	ab
      0009F5 FD               [12] 2653 	mov	r5,a
                                   2654 ;	minikeys.c:319: level = phase < 128 ? phase * 2 : (255 - phase) * 2;
      0009F6 BD 80 00         [24] 2655 	cjne	r5,#0x80,00450$
      0009F9                       2656 00450$:
      0009F9 50 0B            [24] 2657 	jnc	00162$
      0009FB 8D 03            [24] 2658 	mov	ar3,r5
      0009FD 7C 00            [12] 2659 	mov	r4,#0x00
      0009FF EB               [12] 2660 	mov	a,r3
      000A00 2B               [12] 2661 	add	a,r3
      000A01 FB               [12] 2662 	mov	r3,a
      000A02 EC               [12] 2663 	mov	a,r4
      000A03 33               [12] 2664 	rlc	a
      000A04 80 0E            [24] 2665 	sjmp	00163$
      000A06                       2666 00162$:
      000A06 74 FF            [12] 2667 	mov	a,#0xff
      000A08 C3               [12] 2668 	clr	c
      000A09 9D               [12] 2669 	subb	a,r5
      000A0A FD               [12] 2670 	mov	r5,a
      000A0B 33               [12] 2671 	rlc	a
      000A0C 95 E0            [12] 2672 	subb	a,acc
      000A0E FA               [12] 2673 	mov	r2,a
      000A0F ED               [12] 2674 	mov	a,r5
      000A10 2D               [12] 2675 	add	a,r5
      000A11 FB               [12] 2676 	mov	r3,a
      000A12 EA               [12] 2677 	mov	a,r2
      000A13 33               [12] 2678 	rlc	a
      000A14                       2679 00163$:
                                   2680 ;	minikeys.c:320: for(i=0; i<NEO_COUNT; i++) setPixelScaled(i, color, level);
      000A14 7D 00            [12] 2681 	mov	r5,#0x00
      000A16                       2682 00140$:
      000A16 8E 10            [24] 2683 	mov	_setPixelScaled_PARM_2,r6
      000A18 8F 11            [24] 2684 	mov	(_setPixelScaled_PARM_2 + 1),r7
      000A1A 8B 12            [24] 2685 	mov	_setPixelScaled_PARM_3,r3
      000A1C 8D 82            [24] 2686 	mov	dpl, r5
      000A1E C0 07            [24] 2687 	push	ar7
      000A20 C0 06            [24] 2688 	push	ar6
      000A22 C0 05            [24] 2689 	push	ar5
      000A24 C0 03            [24] 2690 	push	ar3
      000A26 12 08 2A         [24] 2691 	lcall	_setPixelScaled
      000A29 D0 03            [24] 2692 	pop	ar3
      000A2B D0 05            [24] 2693 	pop	ar5
      000A2D D0 06            [24] 2694 	pop	ar6
      000A2F D0 07            [24] 2695 	pop	ar7
      000A31 0D               [12] 2696 	inc	r5
      000A32 BD 03 00         [24] 2697 	cjne	r5,#0x03,00452$
      000A35                       2698 00452$:
      000A35 40 DF            [24] 2699 	jc	00140$
                                   2700 ;	minikeys.c:321: break;
      000A37 02 0B 43         [24] 2701 	ljmp	00219$
                                   2702 ;	minikeys.c:324: for(i=0; i<NEO_COUNT; i++) setPixelHue(i, frame * light.speed + i * 40);
      000A3A                       2703 00209$:
      000A3A 7F 00            [12] 2704 	mov	r7,#0x00
      000A3C                       2705 00142$:
      000A3C 90 01 CA         [24] 2706 	mov	dptr,#(_light + 0x0004)
      000A3F E0               [24] 2707 	movx	a,@dptr
      000A40 FE               [12] 2708 	mov	r6,a
      000A41 78 2C            [12] 2709 	mov	r0,#_frame
      000A43 86 05            [24] 2710 	mov	ar5,@r0
      000A45 8D F0            [24] 2711 	mov	b,r5
      000A47 EE               [12] 2712 	mov	a,r6
      000A48 A4               [48] 2713 	mul	ab
      000A49 FE               [12] 2714 	mov	r6,a
      000A4A 8F 05            [24] 2715 	mov	ar5,r7
      000A4C ED               [12] 2716 	mov	a,r5
      000A4D 75 F0 28         [24] 2717 	mov	b,#0x28
      000A50 A4               [48] 2718 	mul	ab
      000A51 2E               [12] 2719 	add	a, r6
      000A52 F5 13            [12] 2720 	mov	_setPixelHue_PARM_2,a
      000A54 8F 82            [24] 2721 	mov	dpl, r7
      000A56 C0 07            [24] 2722 	push	ar7
      000A58 12 08 67         [24] 2723 	lcall	_setPixelHue
      000A5B D0 07            [24] 2724 	pop	ar7
      000A5D 0F               [12] 2725 	inc	r7
      000A5E BF 03 00         [24] 2726 	cjne	r7,#0x03,00454$
      000A61                       2727 00454$:
      000A61 40 D9            [24] 2728 	jc	00142$
                                   2729 ;	minikeys.c:325: break;
      000A63 02 0B 43         [24] 2730 	ljmp	00219$
                                   2731 ;	minikeys.c:327: case FX_WAVE:
      000A66                       2732 00108$:
                                   2733 ;	minikeys.c:328: step = 16 - light.speed;              // frames per key
      000A66 90 01 CA         [24] 2734 	mov	dptr,#(_light + 0x0004)
      000A69 E0               [24] 2735 	movx	a,@dptr
      000A6A FF               [12] 2736 	mov	r7,a
      000A6B 74 10            [12] 2737 	mov	a,#0x10
      000A6D C3               [12] 2738 	clr	c
      000A6E 9F               [12] 2739 	subb	a,r7
                                   2740 ;	minikeys.c:329: cycle = frame / step / 6;             // 3 keys lit, then 3 steps dark
      000A6F F5 1D            [12] 2741 	mov	__divuint_PARM_2, a
      000A71 75 1E 00         [24] 2742 	mov	(__divuint_PARM_2 + 1),#0x00
      000A74 78 2C            [12] 2743 	mov	r0,#_frame
      000A76 86 82            [24] 2744 	mov	dpl, @r0
      000A78 08               [12] 2745 	inc	r0
      000A79 86 83            [24] 2746 	mov	dph, @r0
      000A7B 12 1A 7F         [24] 2747 	lcall	__divuint
      000A7E AE 82            [24] 2748 	mov	r6,dpl
      000A80 AF 83            [24] 2749 	mov	r7,dph
      000A82 75 1D 06         [24] 2750 	mov	__divuint_PARM_2,#0x06
      000A85 75 1E 00         [24] 2751 	mov	(__divuint_PARM_2 + 1),#0x00
      000A88 C0 07            [24] 2752 	push	ar7
      000A8A C0 06            [24] 2753 	push	ar6
      000A8C 12 1A 7F         [24] 2754 	lcall	__divuint
      000A8F AC 82            [24] 2755 	mov	r4, dpl
      000A91 D0 06            [24] 2756 	pop	ar6
      000A93 D0 07            [24] 2757 	pop	ar7
                                   2758 ;	minikeys.c:330: phase = (frame / step) % 6;
      000A95 75 1D 06         [24] 2759 	mov	__moduint_PARM_2,#0x06
      000A98 75 1E 00         [24] 2760 	mov	(__moduint_PARM_2 + 1),#0x00
      000A9B 8E 82            [24] 2761 	mov	dpl, r6
      000A9D 8F 83            [24] 2762 	mov	dph, r7
      000A9F C0 04            [24] 2763 	push	ar4
      000AA1 12 1A C5         [24] 2764 	lcall	__moduint
      000AA4 AE 82            [24] 2765 	mov	r6, dpl
      000AA6 D0 04            [24] 2766 	pop	ar4
      000AA8 8E 15            [24] 2767 	mov	_renderLights_phase_10000_578,r6
                                   2768 ;	minikeys.c:331: if(phase < 3) {
      000AAA 74 FD            [12] 2769 	mov	a,#0x100 - 0x03
      000AAC 25 15            [12] 2770 	add	a,_renderLights_phase_10000_578
      000AAE 50 03            [24] 2771 	jnc	00456$
      000AB0 02 0B 43         [24] 2772 	ljmp	00219$
      000AB3                       2773 00456$:
                                   2774 ;	minikeys.c:332: if(light.flags & FLAG_MULTICOLOR) {
      000AB3 90 01 CC         [24] 2775 	mov	dptr,#(_light + 0x0006)
      000AB6 E0               [24] 2776 	movx	a,@dptr
      000AB7 30 E0 33         [24] 2777 	jnb	acc.0,00111$
                                   2778 ;	minikeys.c:333: for(i=0; i<3; i++) tmpColor[i] = palette[cycle % 3][i];
      000ABA 7F 00            [12] 2779 	mov	r7,#0x00
      000ABC                       2780 00144$:
      000ABC EF               [12] 2781 	mov	a,r7
      000ABD 24 18            [12] 2782 	add	a, #_tmpColor
      000ABF FB               [12] 2783 	mov	r3,a
      000AC0 E4               [12] 2784 	clr	a
      000AC1 34 02            [12] 2785 	addc	a, #(_tmpColor >> 8)
      000AC3 FD               [12] 2786 	mov	r5,a
      000AC4 8C 02            [24] 2787 	mov	ar2,r4
      000AC6 75 F0 03         [24] 2788 	mov	b,#0x03
      000AC9 EA               [12] 2789 	mov	a,r2
      000ACA 84               [48] 2790 	div	ab
      000ACB E5 F0            [12] 2791 	mov	a,b
      000ACD 75 F0 03         [24] 2792 	mov	b,#0x03
      000AD0 A4               [48] 2793 	mul	ab
      000AD1 24 19            [12] 2794 	add	a,#_palette
      000AD3 FA               [12] 2795 	mov	r2,a
      000AD4 E4               [12] 2796 	clr	a
      000AD5 34 1B            [12] 2797 	addc	a, #(_palette >> 8)
      000AD7 FE               [12] 2798 	mov	r6,a
      000AD8 EF               [12] 2799 	mov	a,r7
      000AD9 2A               [12] 2800 	add	a, r2
      000ADA F5 82            [12] 2801 	mov	dpl,a
      000ADC E4               [12] 2802 	clr	a
      000ADD 3E               [12] 2803 	addc	a, r6
      000ADE F5 83            [12] 2804 	mov	dph,a
      000AE0 E4               [12] 2805 	clr	a
      000AE1 93               [24] 2806 	movc	a,@a+dptr
      000AE2 8B 82            [24] 2807 	mov	dpl,r3
      000AE4 8D 83            [24] 2808 	mov	dph,r5
      000AE6 F0               [24] 2809 	movx	@dptr,a
      000AE7 0F               [12] 2810 	inc	r7
      000AE8 BF 03 00         [24] 2811 	cjne	r7,#0x03,00458$
      000AEB                       2812 00458$:
      000AEB 40 CF            [24] 2813 	jc	00144$
      000AED                       2814 00111$:
                                   2815 ;	minikeys.c:335: setPixelScaled(keyPixel[phase], tmpColor, 255);
      000AED E5 15            [12] 2816 	mov	a,_renderLights_phase_10000_578
      000AEF 90 1B 16         [24] 2817 	mov	dptr,#_keyPixel
      000AF2 93               [24] 2818 	movc	a,@a+dptr
      000AF3 FF               [12] 2819 	mov	r7,a
      000AF4 75 10 18         [24] 2820 	mov	_setPixelScaled_PARM_2,#_tmpColor
      000AF7 75 11 02         [24] 2821 	mov	(_setPixelScaled_PARM_2 + 1),#(_tmpColor >> 8)
      000AFA 75 12 FF         [24] 2822 	mov	_setPixelScaled_PARM_3,#0xff
      000AFD 8F 82            [24] 2823 	mov	dpl, r7
      000AFF 12 08 2A         [24] 2824 	lcall	_setPixelScaled
                                   2825 ;	minikeys.c:337: break;
                                   2826 ;	minikeys.c:339: case FX_LAYER:
      000B02 80 3F            [24] 2827 	sjmp	00219$
      000B04                       2828 00114$:
                                   2829 ;	minikeys.c:340: setPixelScaled(0, layerColors[activeLayer], 255);
      000B04 78 28            [12] 2830 	mov	r0,#_activeLayer
      000B06 E6               [12] 2831 	mov	a,@r0
      000B07 75 F0 03         [24] 2832 	mov	b,#0x03
      000B0A A4               [48] 2833 	mul	ab
      000B0B 24 CE            [12] 2834 	add	a, #_layerColors
      000B0D F5 10            [12] 2835 	mov	_setPixelScaled_PARM_2,a
      000B0F 74 01            [12] 2836 	mov	a,#(_layerColors >> 8)
      000B11 35 F0            [12] 2837 	addc	a, b
      000B13 F5 11            [12] 2838 	mov	(_setPixelScaled_PARM_2 + 1),a
      000B15 75 12 FF         [24] 2839 	mov	_setPixelScaled_PARM_3,#0xff
      000B18 75 82 00         [24] 2840 	mov	dpl, #0x00
      000B1B 12 08 2A         [24] 2841 	lcall	_setPixelScaled
                                   2842 ;	minikeys.c:341: for(i=1; i<NEO_COUNT; i++) setPixelScaled(i, layerColors[activeLayer], 255);
      000B1E 7F 01            [12] 2843 	mov	r7,#0x01
      000B20                       2844 00146$:
      000B20 78 28            [12] 2845 	mov	r0,#_activeLayer
      000B22 E6               [12] 2846 	mov	a,@r0
      000B23 75 F0 03         [24] 2847 	mov	b,#0x03
      000B26 A4               [48] 2848 	mul	ab
      000B27 24 CE            [12] 2849 	add	a, #_layerColors
      000B29 F5 10            [12] 2850 	mov	_setPixelScaled_PARM_2,a
      000B2B 74 01            [12] 2851 	mov	a,#(_layerColors >> 8)
      000B2D 35 F0            [12] 2852 	addc	a, b
      000B2F F5 11            [12] 2853 	mov	(_setPixelScaled_PARM_2 + 1),a
      000B31 75 12 FF         [24] 2854 	mov	_setPixelScaled_PARM_3,#0xff
      000B34 8F 82            [24] 2855 	mov	dpl, r7
      000B36 C0 07            [24] 2856 	push	ar7
      000B38 12 08 2A         [24] 2857 	lcall	_setPixelScaled
      000B3B D0 07            [24] 2858 	pop	ar7
      000B3D 0F               [12] 2859 	inc	r7
      000B3E BF 03 00         [24] 2860 	cjne	r7,#0x03,00460$
      000B41                       2861 00460$:
      000B41 40 DD            [24] 2862 	jc	00146$
                                   2863 ;	minikeys.c:346: for(i=0; i<NEO_COUNT; i++) {
      000B43                       2864 00219$:
      000B43 7F 00            [12] 2865 	mov	r7,#0x00
      000B45                       2866 00148$:
                                   2867 ;	minikeys.c:347: if(pressLevel[i] && light.effect != FX_OFF && light.effect != FX_WAVE)
      000B45 EF               [12] 2868 	mov	a,r7
      000B46 24 0C            [12] 2869 	add	a, #_pressLevel
      000B48 F5 82            [12] 2870 	mov	dpl,a
      000B4A E4               [12] 2871 	clr	a
      000B4B 34 02            [12] 2872 	addc	a, #(_pressLevel >> 8)
      000B4D F5 83            [12] 2873 	mov	dph,a
      000B4F E0               [24] 2874 	movx	a,@dptr
      000B50 FE               [12] 2875 	mov	r6,a
      000B51 60 26            [24] 2876 	jz	00118$
      000B53 90 01 C6         [24] 2877 	mov	dptr,#_light
      000B56 E0               [24] 2878 	movx	a,@dptr
      000B57 FD               [12] 2879 	mov	r5,a
      000B58 60 1F            [24] 2880 	jz	00118$
      000B5A BD 02 02         [24] 2881 	cjne	r5,#0x02,00464$
      000B5D 80 1A            [24] 2882 	sjmp	00118$
      000B5F                       2883 00464$:
                                   2884 ;	minikeys.c:348: setPixelScaled(i, pressColor[i], pressLevel[i]);
      000B5F EF               [12] 2885 	mov	a,r7
      000B60 75 F0 03         [24] 2886 	mov	b,#0x03
      000B63 A4               [48] 2887 	mul	ab
      000B64 24 0F            [12] 2888 	add	a, #_pressColor
      000B66 F5 10            [12] 2889 	mov	_setPixelScaled_PARM_2,a
      000B68 74 02            [12] 2890 	mov	a,#(_pressColor >> 8)
      000B6A 35 F0            [12] 2891 	addc	a, b
      000B6C F5 11            [12] 2892 	mov	(_setPixelScaled_PARM_2 + 1),a
      000B6E 8E 12            [24] 2893 	mov	_setPixelScaled_PARM_3,r6
      000B70 8F 82            [24] 2894 	mov	dpl, r7
      000B72 C0 07            [24] 2895 	push	ar7
      000B74 12 08 2A         [24] 2896 	lcall	_setPixelScaled
      000B77 D0 07            [24] 2897 	pop	ar7
      000B79                       2898 00118$:
                                   2899 ;	minikeys.c:349: level = 4 + light.speed * 3;
      000B79 90 01 CA         [24] 2900 	mov	dptr,#(_light + 0x0004)
      000B7C E0               [24] 2901 	movx	a,@dptr
      000B7D 75 F0 03         [24] 2902 	mov	b,#0x03
      000B80 A4               [48] 2903 	mul	ab
      000B81 24 04            [12] 2904 	add	a, #0x04
      000B83 FE               [12] 2905 	mov	r6,a
                                   2906 ;	minikeys.c:350: pressLevel[i] = pressLevel[i] > level ? pressLevel[i] - level : 0;
      000B84 EF               [12] 2907 	mov	a,r7
      000B85 24 0C            [12] 2908 	add	a, #_pressLevel
      000B87 FC               [12] 2909 	mov	r4,a
      000B88 E4               [12] 2910 	clr	a
      000B89 34 02            [12] 2911 	addc	a, #(_pressLevel >> 8)
      000B8B FD               [12] 2912 	mov	r5,a
      000B8C 8C 82            [24] 2913 	mov	dpl,r4
      000B8E 8D 83            [24] 2914 	mov	dph,r5
      000B90 E0               [24] 2915 	movx	a,@dptr
      000B91 FB               [12] 2916 	mov	r3,a
      000B92 C3               [12] 2917 	clr	c
      000B93 EE               [12] 2918 	mov	a,r6
      000B94 9B               [12] 2919 	subb	a,r3
      000B95 50 0A            [24] 2920 	jnc	00164$
                                   2921 ;	free result
      000B97 8C 82            [24] 2922 	mov	dpl,r4
      000B99 8D 83            [24] 2923 	mov	dph,r5
      000B9B E0               [24] 2924 	movx	a,@dptr
      000B9C C3               [12] 2925 	clr	c
      000B9D 9E               [12] 2926 	subb	a,r6
      000B9E FE               [12] 2927 	mov	r6,a
      000B9F 80 02            [24] 2928 	sjmp	00165$
      000BA1                       2929 00164$:
      000BA1 7E 00            [12] 2930 	mov	r6,#0x00
      000BA3                       2931 00165$:
      000BA3 8C 82            [24] 2932 	mov	dpl,r4
      000BA5 8D 83            [24] 2933 	mov	dph,r5
      000BA7 EE               [12] 2934 	mov	a,r6
      000BA8 F0               [24] 2935 	movx	@dptr,a
                                   2936 ;	minikeys.c:346: for(i=0; i<NEO_COUNT; i++) {
      000BA9 0F               [12] 2937 	inc	r7
      000BAA BF 03 00         [24] 2938 	cjne	r7,#0x03,00466$
      000BAD                       2939 00466$:
      000BAD 40 96            [24] 2940 	jc	00148$
                                   2941 ;	minikeys.c:354: if(layerFlashFrames) {
      000BAF 78 2F            [12] 2942 	mov	r0,#_layerFlashFrames
      000BB1 E6               [12] 2943 	mov	a,@r0
      000BB2 60 54            [24] 2944 	jz	00128$
                                   2945 ;	minikeys.c:355: layerFlashFrames--;
      000BB4 78 2F            [12] 2946 	mov	r0,#_layerFlashFrames
      000BB6 16               [12] 2947 	dec	@r0
                                   2948 ;	minikeys.c:356: if(layerFlashFrames % 15 >= 6)
      000BB7 78 2F            [12] 2949 	mov	r0,#_layerFlashFrames
      000BB9 86 07            [24] 2950 	mov	ar7,@r0
      000BBB 75 F0 0F         [24] 2951 	mov	b,#0x0f
      000BBE EF               [12] 2952 	mov	a,r7
      000BBF 84               [48] 2953 	div	ab
      000BC0 AF F0            [24] 2954 	mov	r7,b
      000BC2 BF 06 00         [24] 2955 	cjne	r7,#0x06,00469$
      000BC5                       2956 00469$:
      000BC5 40 27            [24] 2957 	jc	00225$
                                   2958 ;	minikeys.c:357: for(i=0; i<NEO_COUNT; i++) setPixelScaled(i, layerColors[activeLayer], 255);
      000BC7 7F 00            [12] 2959 	mov	r7,#0x00
      000BC9                       2960 00150$:
      000BC9 78 28            [12] 2961 	mov	r0,#_activeLayer
      000BCB E6               [12] 2962 	mov	a,@r0
      000BCC 75 F0 03         [24] 2963 	mov	b,#0x03
      000BCF A4               [48] 2964 	mul	ab
      000BD0 24 CE            [12] 2965 	add	a, #_layerColors
      000BD2 F5 10            [12] 2966 	mov	_setPixelScaled_PARM_2,a
      000BD4 74 01            [12] 2967 	mov	a,#(_layerColors >> 8)
      000BD6 35 F0            [12] 2968 	addc	a, b
      000BD8 F5 11            [12] 2969 	mov	(_setPixelScaled_PARM_2 + 1),a
      000BDA 75 12 FF         [24] 2970 	mov	_setPixelScaled_PARM_3,#0xff
      000BDD 8F 82            [24] 2971 	mov	dpl, r7
      000BDF C0 07            [24] 2972 	push	ar7
      000BE1 12 08 2A         [24] 2973 	lcall	_setPixelScaled
      000BE4 D0 07            [24] 2974 	pop	ar7
      000BE6 0F               [12] 2975 	inc	r7
      000BE7 BF 03 00         [24] 2976 	cjne	r7,#0x03,00471$
      000BEA                       2977 00471$:
      000BEA 40 DD            [24] 2978 	jc	00150$
                                   2979 ;	minikeys.c:359: for(i=0; i<NEO_COUNT; i++) setPixel(i, 0, 0, 0);
      000BEC 80 1A            [24] 2980 	sjmp	00128$
      000BEE                       2981 00225$:
      000BEE 7F 00            [12] 2982 	mov	r7,#0x00
      000BF0                       2983 00152$:
      000BF0 75 1D 00         [24] 2984 	mov	_setPixel_PARM_2,#0x00
      000BF3 75 1E 00         [24] 2985 	mov	_setPixel_PARM_3,#0x00
      000BF6 75 1F 00         [24] 2986 	mov	_setPixel_PARM_4,#0x00
      000BF9 8F 82            [24] 2987 	mov	dpl, r7
      000BFB C0 07            [24] 2988 	push	ar7
      000BFD 12 08 03         [24] 2989 	lcall	_setPixel
      000C00 D0 07            [24] 2990 	pop	ar7
      000C02 0F               [12] 2991 	inc	r7
      000C03 BF 03 00         [24] 2992 	cjne	r7,#0x03,00473$
      000C06                       2993 00473$:
      000C06 40 E8            [24] 2994 	jc	00152$
      000C08                       2995 00128$:
                                   2996 ;	minikeys.c:363: if(errorFlashFrames) {
      000C08 78 30            [12] 2997 	mov	r0,#_errorFlashFrames
      000C0A E6               [12] 2998 	mov	a,@r0
      000C0B 60 32            [24] 2999 	jz	00230$
                                   3000 ;	minikeys.c:364: errorFlashFrames--;
      000C0D 78 30            [12] 3001 	mov	r0,#_errorFlashFrames
      000C0F 16               [12] 3002 	dec	@r0
                                   3003 ;	minikeys.c:365: for(i=0; i<NEO_COUNT; i++)
      000C10 7F 00            [12] 3004 	mov	r7,#0x00
      000C12                       3005 00154$:
                                   3006 ;	minikeys.c:366: setPixel(i, errorFlashFrames % 10 >= 5 ? 255 : 0, 0, 0);
      000C12 78 30            [12] 3007 	mov	r0,#_errorFlashFrames
      000C14 86 06            [24] 3008 	mov	ar6,@r0
      000C16 75 F0 0A         [24] 3009 	mov	b,#0x0a
      000C19 EE               [12] 3010 	mov	a,r6
      000C1A 84               [48] 3011 	div	ab
      000C1B AE F0            [24] 3012 	mov	r6,b
      000C1D BE 05 00         [24] 3013 	cjne	r6,#0x05,00476$
      000C20                       3014 00476$:
      000C20 40 04            [24] 3015 	jc	00166$
      000C22 7E FF            [12] 3016 	mov	r6,#0xff
      000C24 80 02            [24] 3017 	sjmp	00167$
      000C26                       3018 00166$:
      000C26 7E 00            [12] 3019 	mov	r6,#0x00
      000C28                       3020 00167$:
      000C28 8E 1D            [24] 3021 	mov	_setPixel_PARM_2,r6
      000C2A 75 1E 00         [24] 3022 	mov	_setPixel_PARM_3,#0x00
      000C2D 75 1F 00         [24] 3023 	mov	_setPixel_PARM_4,#0x00
      000C30 8F 82            [24] 3024 	mov	dpl, r7
      000C32 C0 07            [24] 3025 	push	ar7
      000C34 12 08 03         [24] 3026 	lcall	_setPixel
      000C37 D0 07            [24] 3027 	pop	ar7
                                   3028 ;	minikeys.c:365: for(i=0; i<NEO_COUNT; i++)
      000C39 0F               [12] 3029 	inc	r7
      000C3A BF 03 00         [24] 3030 	cjne	r7,#0x03,00478$
      000C3D                       3031 00478$:
      000C3D 40 D3            [24] 3032 	jc	00154$
                                   3033 ;	minikeys.c:369: for(i=0; i<NEO_COUNT; i++) {
      000C3F                       3034 00230$:
      000C3F 7F 00            [12] 3035 	mov	r7,#0x00
      000C41                       3036 00156$:
                                   3037 ;	minikeys.c:370: if(overrideMask & (1 << i)) setPixelScaled(i, overrideColors[i], 255);
      000C41 8F F0            [24] 3038 	mov	b,r7
      000C43 05 F0            [12] 3039 	inc	b
      000C45 7D 01            [12] 3040 	mov	r5,#0x01
      000C47 7E 00            [12] 3041 	mov	r6,#0x00
      000C49 80 06            [24] 3042 	sjmp	00481$
      000C4B                       3043 00480$:
      000C4B ED               [12] 3044 	mov	a,r5
      000C4C 2D               [12] 3045 	add	a,r5
      000C4D FD               [12] 3046 	mov	r5,a
      000C4E EE               [12] 3047 	mov	a,r6
      000C4F 33               [12] 3048 	rlc	a
      000C50 FE               [12] 3049 	mov	r6,a
      000C51                       3050 00481$:
      000C51 D5 F0 F7         [24] 3051 	djnz	b,00480$
      000C54 78 2A            [12] 3052 	mov	r0,#_overrideMask
      000C56 86 03            [24] 3053 	mov	ar3,@r0
      000C58 7C 00            [12] 3054 	mov	r4,#0x00
      000C5A EB               [12] 3055 	mov	a,r3
      000C5B 52 05            [12] 3056 	anl	ar5,a
      000C5D EC               [12] 3057 	mov	a,r4
      000C5E 52 06            [12] 3058 	anl	ar6,a
      000C60 ED               [12] 3059 	mov	a,r5
      000C61 4E               [12] 3060 	orl	a,r6
      000C62 60 1B            [24] 3061 	jz	00157$
      000C64 EF               [12] 3062 	mov	a,r7
      000C65 75 F0 03         [24] 3063 	mov	b,#0x03
      000C68 A4               [48] 3064 	mul	ab
      000C69 24 D7            [12] 3065 	add	a, #_overrideColors
      000C6B F5 10            [12] 3066 	mov	_setPixelScaled_PARM_2,a
      000C6D 74 01            [12] 3067 	mov	a,#(_overrideColors >> 8)
      000C6F 35 F0            [12] 3068 	addc	a, b
      000C71 F5 11            [12] 3069 	mov	(_setPixelScaled_PARM_2 + 1),a
      000C73 75 12 FF         [24] 3070 	mov	_setPixelScaled_PARM_3,#0xff
      000C76 8F 82            [24] 3071 	mov	dpl, r7
      000C78 C0 07            [24] 3072 	push	ar7
      000C7A 12 08 2A         [24] 3073 	lcall	_setPixelScaled
      000C7D D0 07            [24] 3074 	pop	ar7
      000C7F                       3075 00157$:
                                   3076 ;	minikeys.c:369: for(i=0; i<NEO_COUNT; i++) {
      000C7F 0F               [12] 3077 	inc	r7
      000C80 BF 03 00         [24] 3078 	cjne	r7,#0x03,00483$
      000C83                       3079 00483$:
      000C83 40 BC            [24] 3080 	jc	00156$
                                   3081 ;	minikeys.c:373: EA = 0;
                                   3082 ;	assignBit
      000C85 C2 AF            [12] 3083 	clr	_EA
                                   3084 ;	minikeys.c:374: for(i=0; i<NEO_COUNT; i++) {
      000C87 75 14 00         [24] 3085 	mov	_renderLights_i_10000_578,#0x00
      000C8A                       3086 00158$:
                                   3087 ;	minikeys.c:375: NEO_writeColor(((uint16_t)pixels[i][0] * light.brightness) >> 8,
      000C8A E5 14            [12] 3088 	mov	a,_renderLights_i_10000_578
      000C8C 75 F0 03         [24] 3089 	mov	b,#0x03
      000C8F A4               [48] 3090 	mul	ab
      000C90 24 03            [12] 3091 	add	a, #_pixels
      000C92 FD               [12] 3092 	mov	r5,a
      000C93 74 02            [12] 3093 	mov	a,#(_pixels >> 8)
      000C95 35 F0            [12] 3094 	addc	a, b
      000C97 FE               [12] 3095 	mov	r6,a
      000C98 8D 82            [24] 3096 	mov	dpl,r5
      000C9A 8E 83            [24] 3097 	mov	dph,r6
      000C9C E0               [24] 3098 	movx	a,@dptr
      000C9D FC               [12] 3099 	mov	r4,a
      000C9E 90 01 CB         [24] 3100 	mov	dptr,#(_light + 0x0005)
      000CA1 E0               [24] 3101 	movx	a,@dptr
      000CA2 FB               [12] 3102 	mov	r3,a
      000CA3 8C F0            [24] 3103 	mov	b,r4
      000CA5 A4               [48] 3104 	mul	ab
      000CA6 AC F0            [24] 3105 	mov	r4,b
      000CA8 8C 02            [24] 3106 	mov	ar2,r4
                                   3107 ;	minikeys.c:376: ((uint16_t)pixels[i][1] * light.brightness) >> 8,
      000CAA 8D 82            [24] 3108 	mov	dpl,r5
      000CAC 8E 83            [24] 3109 	mov	dph,r6
      000CAE A3               [24] 3110 	inc	dptr
      000CAF E0               [24] 3111 	movx	a,@dptr
      000CB0 FC               [12] 3112 	mov	r4,a
      000CB1 8B 07            [24] 3113 	mov	ar7,r3
      000CB3 8C F0            [24] 3114 	mov	b,r4
      000CB5 EF               [12] 3115 	mov	a,r7
      000CB6 A4               [48] 3116 	mul	ab
      000CB7 AC F0            [24] 3117 	mov	r4,b
      000CB9 8C 1A            [24] 3118 	mov	_NEO_writeColor_PARM_2,r4
                                   3119 ;	minikeys.c:377: ((uint16_t)pixels[i][2] * light.brightness) >> 8);
      000CBB 8D 82            [24] 3120 	mov	dpl,r5
      000CBD 8E 83            [24] 3121 	mov	dph,r6
      000CBF A3               [24] 3122 	inc	dptr
      000CC0 A3               [24] 3123 	inc	dptr
      000CC1 E0               [24] 3124 	movx	a,@dptr
      000CC2 F5 F0            [12] 3125 	mov	b, a
      000CC4 EB               [12] 3126 	mov	a,r3
      000CC5 A4               [48] 3127 	mul	ab
      000CC6 AE F0            [24] 3128 	mov	r6,b
      000CC8 8E 1B            [24] 3129 	mov	_NEO_writeColor_PARM_3,r6
      000CCA 8A 82            [24] 3130 	mov	dpl, r2
      000CCC 12 16 49         [24] 3131 	lcall	_NEO_writeColor
                                   3132 ;	minikeys.c:374: for(i=0; i<NEO_COUNT; i++) {
      000CCF 05 14            [12] 3133 	inc	_renderLights_i_10000_578
      000CD1 74 FD            [12] 3134 	mov	a,#0x100 - 0x03
      000CD3 25 14            [12] 3135 	add	a,_renderLights_i_10000_578
      000CD5 50 B3            [24] 3136 	jnc	00158$
                                   3137 ;	minikeys.c:379: EA = 1;
                                   3138 ;	assignBit
      000CD7 D2 AF            [12] 3139 	setb	_EA
                                   3140 ;	minikeys.c:380: }
      000CD9 22               [24] 3141 	ret
                                   3142 ;------------------------------------------------------------
                                   3143 ;Allocation info for local variables in function 'setLayer'
                                   3144 ;------------------------------------------------------------
                                   3145 ;layer         Allocated to registers r7 
                                   3146 ;------------------------------------------------------------
                                   3147 ;	minikeys.c:382: void setLayer(uint8_t layer) {
                                   3148 ;	-----------------------------------------
                                   3149 ;	 function setLayer
                                   3150 ;	-----------------------------------------
      000CDA                       3151 _setLayer:
      000CDA AF 82            [24] 3152 	mov	r7, dpl
                                   3153 ;	minikeys.c:383: if(layer >= LAYERS) return;
      000CDC BF 03 00         [24] 3154 	cjne	r7,#0x03,00130$
      000CDF                       3155 00130$:
      000CDF 40 01            [24] 3156 	jc	00102$
      000CE1 22               [24] 3157 	ret
      000CE2                       3158 00102$:
                                   3159 ;	minikeys.c:384: editLayer = layer;
      000CE2 78 29            [12] 3160 	mov	r0,#_editLayer
      000CE4 A6 07            [24] 3161 	mov	@r0,ar7
                                   3162 ;	minikeys.c:385: if(layer == activeLayer) return;
      000CE6 78 28            [12] 3163 	mov	r0,#_activeLayer
      000CE8 E6               [12] 3164 	mov	a,@r0
      000CE9 B5 07 01         [24] 3165 	cjne	a,ar7,00104$
      000CEC 22               [24] 3166 	ret
      000CED                       3167 00104$:
                                   3168 ;	minikeys.c:386: releaseAll();
      000CED C0 07            [24] 3169 	push	ar7
      000CEF 12 07 F1         [24] 3170 	lcall	_releaseAll
      000CF2 D0 07            [24] 3171 	pop	ar7
                                   3172 ;	minikeys.c:387: activeLayer = layer;
      000CF4 78 28            [12] 3173 	mov	r0,#_activeLayer
      000CF6 A6 07            [24] 3174 	mov	@r0,ar7
                                   3175 ;	minikeys.c:388: if(light.flags & FLAG_LAYERFLASH) layerFlashFrames = (layer + 1) * 15;
      000CF8 90 01 CC         [24] 3176 	mov	dptr,#(_light + 0x0006)
      000CFB E0               [24] 3177 	movx	a,@dptr
      000CFC 30 E1 09         [24] 3178 	jnb	acc.1,00107$
      000CFF 0F               [12] 3179 	inc	r7
      000D00 78 2F            [12] 3180 	mov	r0,#_layerFlashFrames
      000D02 EF               [12] 3181 	mov	a,r7
      000D03 75 F0 0F         [24] 3182 	mov	b,#0x0f
      000D06 A4               [48] 3183 	mul	ab
      000D07 F6               [12] 3184 	mov	@r0,a
      000D08                       3185 00107$:
                                   3186 ;	minikeys.c:389: }
      000D08 22               [24] 3187 	ret
                                   3188 ;------------------------------------------------------------
                                   3189 ;Allocation info for local variables in function 'enterBootloader'
                                   3190 ;------------------------------------------------------------
                                   3191 ;i             Allocated to registers r7 
                                   3192 ;------------------------------------------------------------
                                   3193 ;	minikeys.c:391: void enterBootloader(void) {
                                   3194 ;	-----------------------------------------
                                   3195 ;	 function enterBootloader
                                   3196 ;	-----------------------------------------
      000D09                       3197 _enterBootloader:
                                   3198 ;	minikeys.c:393: EA = 0;
                                   3199 ;	assignBit
      000D09 C2 AF            [12] 3200 	clr	_EA
                                   3201 ;	minikeys.c:394: for(i=0; i<NEO_COUNT * 3; i++) NEO_sendByte(100);   // all white
      000D0B 7F 00            [12] 3202 	mov	r7,#0x00
      000D0D                       3203 00103$:
      000D0D 75 82 64         [24] 3204 	mov	dpl, #0x64
      000D10 C0 07            [24] 3205 	push	ar7
      000D12 12 16 33         [24] 3206 	lcall	_NEO_sendByte
      000D15 D0 07            [24] 3207 	pop	ar7
      000D17 0F               [12] 3208 	inc	r7
      000D18 BF 09 00         [24] 3209 	cjne	r7,#0x09,00122$
      000D1B                       3210 00122$:
      000D1B 40 F0            [24] 3211 	jc	00103$
                                   3212 ;	src/system.h:161: USB_CTRL = 0;
      000D1D 75 E2 00         [24] 3213 	mov	_USB_CTRL,#0x00
                                   3214 ;	src/system.h:162: EA       = 0;
                                   3215 ;	assignBit
      000D20 C2 AF            [12] 3216 	clr	_EA
                                   3217 ;	src/system.h:163: TMOD     = 0;
      000D22 75 89 00         [24] 3218 	mov	_TMOD,#0x00
                                   3219 ;	src/system.h:166: __endasm;
      000D25 12 38 00         [24] 3220 	lcall #0x3800
                                   3221 ;	minikeys.c:395: BOOT_now();
                                   3222 ;	minikeys.c:396: }
      000D28 22               [24] 3223 	ret
                                   3224 ;------------------------------------------------------------
                                   3225 ;Allocation info for local variables in function 'controlIndex'
                                   3226 ;------------------------------------------------------------
                                   3227 ;key           Allocated to registers r7 
                                   3228 ;------------------------------------------------------------
                                   3229 ;	minikeys.c:404: uint8_t controlIndex(uint8_t key) {
                                   3230 ;	-----------------------------------------
                                   3231 ;	 function controlIndex
                                   3232 ;	-----------------------------------------
      000D29                       3233 _controlIndex:
      000D29 AF 82            [24] 3234 	mov	r7, dpl
                                   3235 ;	minikeys.c:405: if(key >= 1 && key <= 3) return key - 1;
      000D2B BF 01 00         [24] 3236 	cjne	r7,#0x01,00137$
      000D2E                       3237 00137$:
      000D2E 40 0C            [24] 3238 	jc	00102$
      000D30 EF               [12] 3239 	mov	a,r7
      000D31 24 FC            [12] 3240 	add	a,#0xff - 0x03
      000D33 40 07            [24] 3241 	jc	00102$
                                   3242 ;	free result
      000D35 8F 06            [24] 3243 	mov	ar6,r7
      000D37 EE               [12] 3244 	mov	a,r6
      000D38 14               [12] 3245 	dec	a
      000D39 F5 82            [12] 3246 	mov	dpl,a
      000D3B 22               [24] 3247 	ret
      000D3C                       3248 00102$:
                                   3249 ;	minikeys.c:406: if(key >= 13 && key <= 15) return key - 10;     // 13, 14, 15 -> 3, 4, 5
      000D3C BF 0D 00         [24] 3250 	cjne	r7,#0x0d,00140$
      000D3F                       3251 00140$:
      000D3F 40 0B            [24] 3252 	jc	00105$
      000D41 EF               [12] 3253 	mov	a,r7
      000D42 24 F0            [12] 3254 	add	a,#0xff - 0x0f
      000D44 40 06            [24] 3255 	jc	00105$
                                   3256 ;	free result
      000D46 EF               [12] 3257 	mov	a,r7
      000D47 24 F6            [12] 3258 	add	a,#0xf6
      000D49 F5 82            [12] 3259 	mov	dpl,a
      000D4B 22               [24] 3260 	ret
      000D4C                       3261 00105$:
                                   3262 ;	minikeys.c:407: return 0xFF;
      000D4C 75 82 FF         [24] 3263 	mov	dpl, #0xff
                                   3264 ;	minikeys.c:408: }
      000D4F 22               [24] 3265 	ret
                                   3266 ;------------------------------------------------------------
                                   3267 ;Allocation info for local variables in function 'handleCommand'
                                   3268 ;------------------------------------------------------------
                                   3269 ;ctrl          Allocated to registers r7 
                                   3270 ;layer         Allocated to registers r5 
                                   3271 ;type          Allocated to registers r6 
                                   3272 ;i             Allocated with name '_handleCommand_i_10000_623'
                                   3273 ;s             Allocated to registers r5 r7 
                                   3274 ;sloc0         Allocated with name '_handleCommand_sloc0_1_0'
                                   3275 ;------------------------------------------------------------
                                   3276 ;	minikeys.c:410: void handleCommand(void) {
                                   3277 ;	-----------------------------------------
                                   3278 ;	 function handleCommand
                                   3279 ;	-----------------------------------------
      000D50                       3280 _handleCommand:
                                   3281 ;	minikeys.c:414: switch(cmd[0]) {
      000D50 90 02 1B         [24] 3282 	mov	dptr,#_cmd
      000D53 E0               [24] 3283 	movx	a,@dptr
      000D54 FF               [12] 3284 	mov	r7,a
      000D55 BF A1 02         [24] 3285 	cjne	r7,#0xa1,00417$
      000D58 80 24            [24] 3286 	sjmp	00101$
      000D5A                       3287 00417$:
      000D5A BF AA 02         [24] 3288 	cjne	r7,#0xaa,00418$
      000D5D 80 31            [24] 3289 	sjmp	00104$
      000D5F                       3290 00418$:
      000D5F BF B0 02         [24] 3291 	cjne	r7,#0xb0,00419$
      000D62 80 38            [24] 3292 	sjmp	00107$
      000D64                       3293 00419$:
      000D64 BF B1 02         [24] 3294 	cjne	r7,#0xb1,00420$
      000D67 80 55            [24] 3295 	sjmp	00108$
      000D69                       3296 00420$:
      000D69 BF B2 03         [24] 3297 	cjne	r7,#0xb2,00421$
      000D6C 02 0E 0A         [24] 3298 	ljmp	00114$
      000D6F                       3299 00421$:
      000D6F BF B3 03         [24] 3300 	cjne	r7,#0xb3,00422$
      000D72 02 0E 88         [24] 3301 	ljmp	00121$
      000D75                       3302 00422$:
      000D75 BF BB 03         [24] 3303 	cjne	r7,#0xbb,00423$
      000D78 02 0F 37         [24] 3304 	ljmp	00125$
      000D7B                       3305 00423$:
      000D7B 02 0F 4B         [24] 3306 	ljmp	00129$
                                   3307 ;	minikeys.c:415: case 0xA1:                                    // A1 L: select (and activate) layer
      000D7E                       3308 00101$:
                                   3309 ;	minikeys.c:416: if(cmd[1] >= 1) setLayer(cmd[1] - 1);
      000D7E 90 02 1C         [24] 3310 	mov	dptr,#(_cmd + 0x0001)
      000D81 E0               [24] 3311 	movx	a,@dptr
      000D82 FE               [12] 3312 	mov	r6,a
      000D83 BE 01 00         [24] 3313 	cjne	r6,#0x01,00424$
      000D86                       3314 00424$:
      000D86 40 07            [24] 3315 	jc	00103$
      000D88 EE               [12] 3316 	mov	a,r6
      000D89 14               [12] 3317 	dec	a
      000D8A F5 82            [12] 3318 	mov	dpl,a
                                   3319 ;	minikeys.c:417: return;
      000D8C 02 0C DA         [24] 3320 	ljmp	_setLayer
      000D8F                       3321 00103$:
      000D8F 22               [24] 3322 	ret
                                   3323 ;	minikeys.c:419: case 0xAA:                                    // AA AA / AA A1: save
      000D90                       3324 00104$:
                                   3325 ;	minikeys.c:420: if(!saveSettings()) errorFlashFrames = 50;
      000D90 12 04 16         [24] 3326 	lcall	_saveSettings
      000D93 E5 82            [12] 3327 	mov	a, dpl
      000D95 70 04            [24] 3328 	jnz	00106$
      000D97 78 30            [12] 3329 	mov	r0,#_errorFlashFrames
      000D99 76 32            [12] 3330 	mov	@r0,#0x32
      000D9B                       3331 00106$:
                                   3332 ;	minikeys.c:421: return;
      000D9B 22               [24] 3333 	ret
                                   3334 ;	minikeys.c:423: case 0xB0:                                    // B0 (L<<4|8) mode: stock light modes
      000D9C                       3335 00107$:
                                   3336 ;	minikeys.c:424: light.effect = cmd[2] == 0 ? FX_OFF : cmd[2] == 1 ? FX_PRESS : FX_WAVE;
      000D9C 90 02 1D         [24] 3337 	mov	dptr,#(_cmd + 0x0002)
      000D9F E0               [24] 3338 	movx	a,@dptr
      000DA0 FE               [12] 3339 	mov	r6,a
      000DA1 70 03            [24] 3340 	jnz	00154$
      000DA3 FD               [12] 3341 	mov	r5,a
      000DA4 80 0B            [24] 3342 	sjmp	00155$
      000DA6                       3343 00154$:
      000DA6 BE 01 04         [24] 3344 	cjne	r6,#0x01,00156$
      000DA9 7E 01            [12] 3345 	mov	r6,#0x01
      000DAB 80 02            [24] 3346 	sjmp	00157$
      000DAD                       3347 00156$:
      000DAD 7E 02            [12] 3348 	mov	r6,#0x02
      000DAF                       3349 00157$:
      000DAF 8E 05            [24] 3350 	mov	ar5,r6
      000DB1                       3351 00155$:
      000DB1 90 01 C6         [24] 3352 	mov	dptr,#_light
      000DB4 ED               [12] 3353 	mov	a,r5
      000DB5 F0               [24] 3354 	movx	@dptr,a
                                   3355 ;	minikeys.c:425: light.flags |= FLAG_MULTICOLOR;
      000DB6 90 01 CC         [24] 3356 	mov	dptr,#(_light + 0x0006)
      000DB9 E0               [24] 3357 	movx	a,@dptr
      000DBA 44 01            [12] 3358 	orl	a,#0x01
      000DBC F0               [24] 3359 	movx	@dptr,a
                                   3360 ;	minikeys.c:426: return;
      000DBD 22               [24] 3361 	ret
                                   3362 ;	minikeys.c:428: case 0xB1:                                    // B1 effect r g b speed brightness flags
      000DBE                       3363 00108$:
                                   3364 ;	minikeys.c:429: if(cmd[1] < FX_COUNT) light.effect = cmd[1];
      000DBE 90 02 1C         [24] 3365 	mov	dptr,#(_cmd + 0x0001)
      000DC1 E0               [24] 3366 	movx	a,@dptr
      000DC2 FE               [12] 3367 	mov	r6,a
      000DC3 BE 07 00         [24] 3368 	cjne	r6,#0x07,00430$
      000DC6                       3369 00430$:
      000DC6 50 05            [24] 3370 	jnc	00110$
      000DC8 90 01 C6         [24] 3371 	mov	dptr,#_light
      000DCB EE               [12] 3372 	mov	a,r6
      000DCC F0               [24] 3373 	movx	@dptr,a
      000DCD                       3374 00110$:
                                   3375 ;	minikeys.c:430: light.r = cmd[2]; light.g = cmd[3]; light.b = cmd[4];
      000DCD 90 02 1D         [24] 3376 	mov	dptr,#(_cmd + 0x0002)
      000DD0 E0               [24] 3377 	movx	a,@dptr
      000DD1 90 01 C7         [24] 3378 	mov	dptr,#(_light + 0x0001)
      000DD4 F0               [24] 3379 	movx	@dptr,a
      000DD5 90 02 1E         [24] 3380 	mov	dptr,#(_cmd + 0x0003)
      000DD8 E0               [24] 3381 	movx	a,@dptr
      000DD9 90 01 C8         [24] 3382 	mov	dptr,#(_light + 0x0002)
      000DDC F0               [24] 3383 	movx	@dptr,a
      000DDD 90 02 1F         [24] 3384 	mov	dptr,#(_cmd + 0x0004)
      000DE0 E0               [24] 3385 	movx	a,@dptr
      000DE1 90 01 C9         [24] 3386 	mov	dptr,#(_light + 0x0003)
      000DE4 F0               [24] 3387 	movx	@dptr,a
                                   3388 ;	minikeys.c:431: if(cmd[5] >= 1 && cmd[5] <= 10) light.speed = cmd[5];
      000DE5 90 02 20         [24] 3389 	mov	dptr,#(_cmd + 0x0005)
      000DE8 E0               [24] 3390 	movx	a,@dptr
      000DE9 FE               [12] 3391 	mov	r6,a
      000DEA BE 01 00         [24] 3392 	cjne	r6,#0x01,00432$
      000DED                       3393 00432$:
      000DED 40 0A            [24] 3394 	jc	00112$
      000DEF EE               [12] 3395 	mov	a,r6
      000DF0 24 F5            [12] 3396 	add	a,#0xff - 0x0a
      000DF2 40 05            [24] 3397 	jc	00112$
                                   3398 ;	free result
      000DF4 90 01 CA         [24] 3399 	mov	dptr,#(_light + 0x0004)
      000DF7 EE               [12] 3400 	mov	a,r6
      000DF8 F0               [24] 3401 	movx	@dptr,a
      000DF9                       3402 00112$:
                                   3403 ;	minikeys.c:432: light.brightness = cmd[6];
      000DF9 90 02 21         [24] 3404 	mov	dptr,#(_cmd + 0x0006)
      000DFC E0               [24] 3405 	movx	a,@dptr
      000DFD 90 01 CB         [24] 3406 	mov	dptr,#(_light + 0x0005)
      000E00 F0               [24] 3407 	movx	@dptr,a
                                   3408 ;	minikeys.c:433: light.flags = cmd[7];
      000E01 90 02 22         [24] 3409 	mov	dptr,#(_cmd + 0x0007)
      000E04 E0               [24] 3410 	movx	a,@dptr
      000E05 90 01 CC         [24] 3411 	mov	dptr,#(_light + 0x0006)
      000E08 F0               [24] 3412 	movx	@dptr,a
                                   3413 ;	minikeys.c:434: return;
      000E09 22               [24] 3414 	ret
                                   3415 ;	minikeys.c:436: case 0xB2:                                    // B2 key r g b: live color (key 0 = all)
      000E0A                       3416 00114$:
                                   3417 ;	minikeys.c:437: if(cmd[1] == 0xFF) { overrideMask = 0; return; }
      000E0A 90 02 1C         [24] 3418 	mov	dptr,#(_cmd + 0x0001)
      000E0D E0               [24] 3419 	movx	a,@dptr
      000E0E FE               [12] 3420 	mov	r6,a
      000E0F BE FF 05         [24] 3421 	cjne	r6,#0xff,00206$
      000E12 78 2A            [12] 3422 	mov	r0,#_overrideMask
      000E14 76 00            [12] 3423 	mov	@r0,#0x00
      000E16 22               [24] 3424 	ret
                                   3425 ;	minikeys.c:438: for(i=0; i<NEO_COUNT; i++) {
      000E17                       3426 00206$:
      000E17 75 16 00         [24] 3427 	mov	_handleCommand_i_10000_623,#0x00
      000E1A                       3428 00146$:
                                   3429 ;	minikeys.c:439: if(cmd[1] == 0 || cmd[1] == i + 1) {
      000E1A 90 02 1C         [24] 3430 	mov	dptr,#(_cmd + 0x0001)
      000E1D E0               [24] 3431 	movx	a,@dptr
      000E1E FD               [12] 3432 	mov	r5,a
      000E1F 60 07            [24] 3433 	jz	00117$
      000E21 AC 16            [24] 3434 	mov	r4,_handleCommand_i_10000_623
      000E23 0C               [12] 3435 	inc	r4
      000E24 ED               [12] 3436 	mov	a,r5
      000E25 B5 04 57         [24] 3437 	cjne	a,ar4,00147$
      000E28                       3438 00117$:
                                   3439 ;	minikeys.c:440: ctrl = keyPixel[i];
      000E28 E5 16            [12] 3440 	mov	a,_handleCommand_i_10000_623
      000E2A 90 1B 16         [24] 3441 	mov	dptr,#_keyPixel
      000E2D 93               [24] 3442 	movc	a,@a+dptr
                                   3443 ;	minikeys.c:441: overrideColors[ctrl][0] = cmd[2];
      000E2E FD               [12] 3444 	mov	r5,a
      000E2F 75 F0 03         [24] 3445 	mov	b,#0x03
      000E32 A4               [48] 3446 	mul	ab
      000E33 24 D7            [12] 3447 	add	a, #_overrideColors
      000E35 FB               [12] 3448 	mov	r3,a
      000E36 74 01            [12] 3449 	mov	a,#(_overrideColors >> 8)
      000E38 35 F0            [12] 3450 	addc	a, b
      000E3A FC               [12] 3451 	mov	r4,a
      000E3B 8B 17            [24] 3452 	mov	_handleCommand_sloc0_1_0,r3
      000E3D 8C 18            [24] 3453 	mov	(_handleCommand_sloc0_1_0 + 1),r4
      000E3F 90 02 1D         [24] 3454 	mov	dptr,#(_cmd + 0x0002)
      000E42 E0               [24] 3455 	movx	a,@dptr
      000E43 85 17 82         [24] 3456 	mov	dpl,_handleCommand_sloc0_1_0
      000E46 85 18 83         [24] 3457 	mov	dph,(_handleCommand_sloc0_1_0 + 1)
      000E49 F0               [24] 3458 	movx	@dptr,a
                                   3459 ;	minikeys.c:442: overrideColors[ctrl][1] = cmd[3];
      000E4A 74 01            [12] 3460 	mov	a,#0x01
      000E4C 2B               [12] 3461 	add	a, r3
      000E4D F5 17            [12] 3462 	mov	_handleCommand_sloc0_1_0,a
      000E4F E4               [12] 3463 	clr	a
      000E50 3C               [12] 3464 	addc	a, r4
      000E51 F5 18            [12] 3465 	mov	(_handleCommand_sloc0_1_0 + 1),a
      000E53 90 02 1E         [24] 3466 	mov	dptr,#(_cmd + 0x0003)
      000E56 E0               [24] 3467 	movx	a,@dptr
      000E57 85 17 82         [24] 3468 	mov	dpl,_handleCommand_sloc0_1_0
      000E5A 85 18 83         [24] 3469 	mov	dph,(_handleCommand_sloc0_1_0 + 1)
      000E5D F0               [24] 3470 	movx	@dptr,a
                                   3471 ;	minikeys.c:443: overrideColors[ctrl][2] = cmd[4];
      000E5E 74 02            [12] 3472 	mov	a,#0x02
      000E60 2B               [12] 3473 	add	a, r3
      000E61 FB               [12] 3474 	mov	r3,a
      000E62 E4               [12] 3475 	clr	a
      000E63 3C               [12] 3476 	addc	a, r4
      000E64 FC               [12] 3477 	mov	r4,a
      000E65 90 02 1F         [24] 3478 	mov	dptr,#(_cmd + 0x0004)
      000E68 E0               [24] 3479 	movx	a,@dptr
      000E69 8B 82            [24] 3480 	mov	dpl,r3
      000E6B 8C 83            [24] 3481 	mov	dph,r4
      000E6D F0               [24] 3482 	movx	@dptr,a
                                   3483 ;	minikeys.c:444: overrideMask |= 1 << ctrl;
      000E6E 8D F0            [24] 3484 	mov	b,r5
      000E70 05 F0            [12] 3485 	inc	b
      000E72 74 01            [12] 3486 	mov	a,#0x01
      000E74 80 02            [24] 3487 	sjmp	00441$
      000E76                       3488 00440$:
      000E76 25 E0            [12] 3489 	add	a,acc
      000E78                       3490 00441$:
      000E78 D5 F0 FB         [24] 3491 	djnz	b,00440$
      000E7B 78 2A            [12] 3492 	mov	r0,#_overrideMask
      000E7D 46               [12] 3493 	orl	a,@r0
      000E7E F6               [12] 3494 	mov	@r0,a
      000E7F                       3495 00147$:
                                   3496 ;	minikeys.c:438: for(i=0; i<NEO_COUNT; i++) {
      000E7F 05 16            [12] 3497 	inc	_handleCommand_i_10000_623
      000E81 74 FD            [12] 3498 	mov	a,#0x100 - 0x03
      000E83 25 16            [12] 3499 	add	a,_handleCommand_i_10000_623
      000E85 50 93            [24] 3500 	jnc	00146$
                                   3501 ;	minikeys.c:447: return;
      000E87 22               [24] 3502 	ret
                                   3503 ;	minikeys.c:449: case 0xB3:                                    // B3 L r g b: layer color
      000E88                       3504 00121$:
                                   3505 ;	minikeys.c:450: if(cmd[1] >= 1 && cmd[1] <= LAYERS) {
      000E88 90 02 1C         [24] 3506 	mov	dptr,#(_cmd + 0x0001)
      000E8B E0               [24] 3507 	movx	a,@dptr
      000E8C FE               [12] 3508 	mov	r6,a
      000E8D BE 01 00         [24] 3509 	cjne	r6,#0x01,00443$
      000E90                       3510 00443$:
      000E90 50 01            [24] 3511 	jnc	00444$
      000E92 22               [24] 3512 	ret
      000E93                       3513 00444$:
      000E93 EE               [12] 3514 	mov	a,r6
      000E94 24 FC            [12] 3515 	add	a,#0xff - 0x03
      000E96 50 01            [24] 3516 	jnc	00445$
      000E98 22               [24] 3517 	ret
      000E99                       3518 00445$:
                                   3519 ;	free result
                                   3520 ;	minikeys.c:451: layerColors[cmd[1] - 1][0] = cmd[2];
      000E99 1E               [12] 3521 	dec	r6
      000E9A C2 D5            [12] 3522 	clr	F0
      000E9C 75 F0 03         [24] 3523 	mov	b,#0x03
      000E9F EE               [12] 3524 	mov	a,r6
      000EA0 30 E7 04         [24] 3525 	jnb	acc.7,00446$
      000EA3 B2 D5            [12] 3526 	cpl	F0
      000EA5 F4               [12] 3527 	cpl	a
      000EA6 04               [12] 3528 	inc	a
      000EA7                       3529 00446$:
      000EA7 A4               [48] 3530 	mul	ab
      000EA8 30 D5 0A         [24] 3531 	jnb	F0,00447$
      000EAB F4               [12] 3532 	cpl	a
      000EAC 24 01            [12] 3533 	add	a,#0x01
      000EAE C5 F0            [12] 3534 	xch	a,b
      000EB0 F4               [12] 3535 	cpl	a
      000EB1 34 00            [12] 3536 	addc	a,#0x00
      000EB3 C5 F0            [12] 3537 	xch	a,b
      000EB5                       3538 00447$:
      000EB5 24 CE            [12] 3539 	add	a, #_layerColors
      000EB7 FD               [12] 3540 	mov	r5,a
      000EB8 74 01            [12] 3541 	mov	a,#(_layerColors >> 8)
      000EBA 35 F0            [12] 3542 	addc	a, b
      000EBC FE               [12] 3543 	mov	r6,a
      000EBD 90 02 1D         [24] 3544 	mov	dptr,#(_cmd + 0x0002)
      000EC0 E0               [24] 3545 	movx	a,@dptr
      000EC1 8D 82            [24] 3546 	mov	dpl,r5
      000EC3 8E 83            [24] 3547 	mov	dph,r6
      000EC5 F0               [24] 3548 	movx	@dptr,a
                                   3549 ;	minikeys.c:452: layerColors[cmd[1] - 1][1] = cmd[3];
      000EC6 90 02 1C         [24] 3550 	mov	dptr,#(_cmd + 0x0001)
      000EC9 E0               [24] 3551 	movx	a,@dptr
      000ECA FE               [12] 3552 	mov	r6,a
      000ECB 1E               [12] 3553 	dec	r6
      000ECC C2 D5            [12] 3554 	clr	F0
      000ECE 75 F0 03         [24] 3555 	mov	b,#0x03
      000ED1 EE               [12] 3556 	mov	a,r6
      000ED2 30 E7 04         [24] 3557 	jnb	acc.7,00448$
      000ED5 B2 D5            [12] 3558 	cpl	F0
      000ED7 F4               [12] 3559 	cpl	a
      000ED8 04               [12] 3560 	inc	a
      000ED9                       3561 00448$:
      000ED9 A4               [48] 3562 	mul	ab
      000EDA 30 D5 0A         [24] 3563 	jnb	F0,00449$
      000EDD F4               [12] 3564 	cpl	a
      000EDE 24 01            [12] 3565 	add	a,#0x01
      000EE0 C5 F0            [12] 3566 	xch	a,b
      000EE2 F4               [12] 3567 	cpl	a
      000EE3 34 00            [12] 3568 	addc	a,#0x00
      000EE5 C5 F0            [12] 3569 	xch	a,b
      000EE7                       3570 00449$:
      000EE7 24 CE            [12] 3571 	add	a, #_layerColors
      000EE9 FD               [12] 3572 	mov	r5,a
      000EEA 74 01            [12] 3573 	mov	a,#(_layerColors >> 8)
      000EEC 35 F0            [12] 3574 	addc	a, b
      000EEE FE               [12] 3575 	mov	r6,a
      000EEF 0D               [12] 3576 	inc	r5
      000EF0 BD 00 01         [24] 3577 	cjne	r5,#0x00,00450$
      000EF3 0E               [12] 3578 	inc	r6
      000EF4                       3579 00450$:
      000EF4 90 02 1E         [24] 3580 	mov	dptr,#(_cmd + 0x0003)
      000EF7 E0               [24] 3581 	movx	a,@dptr
      000EF8 8D 82            [24] 3582 	mov	dpl,r5
      000EFA 8E 83            [24] 3583 	mov	dph,r6
      000EFC F0               [24] 3584 	movx	@dptr,a
                                   3585 ;	minikeys.c:453: layerColors[cmd[1] - 1][2] = cmd[4];
      000EFD 90 02 1C         [24] 3586 	mov	dptr,#(_cmd + 0x0001)
      000F00 E0               [24] 3587 	movx	a,@dptr
      000F01 FE               [12] 3588 	mov	r6,a
      000F02 1E               [12] 3589 	dec	r6
      000F03 C2 D5            [12] 3590 	clr	F0
      000F05 75 F0 03         [24] 3591 	mov	b,#0x03
      000F08 EE               [12] 3592 	mov	a,r6
      000F09 30 E7 04         [24] 3593 	jnb	acc.7,00451$
      000F0C B2 D5            [12] 3594 	cpl	F0
      000F0E F4               [12] 3595 	cpl	a
      000F0F 04               [12] 3596 	inc	a
      000F10                       3597 00451$:
      000F10 A4               [48] 3598 	mul	ab
      000F11 30 D5 0A         [24] 3599 	jnb	F0,00452$
      000F14 F4               [12] 3600 	cpl	a
      000F15 24 01            [12] 3601 	add	a,#0x01
      000F17 C5 F0            [12] 3602 	xch	a,b
      000F19 F4               [12] 3603 	cpl	a
      000F1A 34 00            [12] 3604 	addc	a,#0x00
      000F1C C5 F0            [12] 3605 	xch	a,b
      000F1E                       3606 00452$:
      000F1E 24 CE            [12] 3607 	add	a, #_layerColors
      000F20 FD               [12] 3608 	mov	r5,a
      000F21 74 01            [12] 3609 	mov	a,#(_layerColors >> 8)
      000F23 35 F0            [12] 3610 	addc	a, b
      000F25 FE               [12] 3611 	mov	r6,a
      000F26 74 02            [12] 3612 	mov	a,#0x02
      000F28 2D               [12] 3613 	add	a, r5
      000F29 FD               [12] 3614 	mov	r5,a
      000F2A E4               [12] 3615 	clr	a
      000F2B 3E               [12] 3616 	addc	a, r6
      000F2C FE               [12] 3617 	mov	r6,a
      000F2D 90 02 1F         [24] 3618 	mov	dptr,#(_cmd + 0x0004)
      000F30 E0               [24] 3619 	movx	a,@dptr
      000F31 8D 82            [24] 3620 	mov	dpl,r5
      000F33 8E 83            [24] 3621 	mov	dph,r6
      000F35 F0               [24] 3622 	movx	@dptr,a
                                   3623 ;	minikeys.c:455: return;
      000F36 22               [24] 3624 	ret
                                   3625 ;	minikeys.c:457: case 0xBB:                                    // BB 4D 4B: bootloader
      000F37                       3626 00125$:
                                   3627 ;	minikeys.c:458: if(cmd[1] == 0x4D && cmd[2] == 0x4B) enterBootloader();
      000F37 90 02 1C         [24] 3628 	mov	dptr,#(_cmd + 0x0001)
      000F3A E0               [24] 3629 	movx	a,@dptr
      000F3B FE               [12] 3630 	mov	r6,a
      000F3C BE 4D 0B         [24] 3631 	cjne	r6,#0x4d,00127$
      000F3F 90 02 1D         [24] 3632 	mov	dptr,#(_cmd + 0x0002)
      000F42 E0               [24] 3633 	movx	a,@dptr
      000F43 FE               [12] 3634 	mov	r6,a
      000F44 BE 4B 03         [24] 3635 	cjne	r6,#0x4b,00127$
                                   3636 ;	minikeys.c:459: return;
      000F47 02 0D 09         [24] 3637 	ljmp	_enterBootloader
      000F4A                       3638 00127$:
      000F4A 22               [24] 3639 	ret
                                   3640 ;	minikeys.c:460: }
      000F4B                       3641 00129$:
                                   3642 ;	minikeys.c:463: ctrl = controlIndex(cmd[0]);
      000F4B 8F 82            [24] 3643 	mov	dpl, r7
      000F4D 12 0D 29         [24] 3644 	lcall	_controlIndex
      000F50 AF 82            [24] 3645 	mov	r7, dpl
                                   3646 ;	minikeys.c:464: layer = (cmd[1] >> 4) - 1;
      000F52 90 02 1C         [24] 3647 	mov	dptr,#(_cmd + 0x0001)
      000F55 E0               [24] 3648 	movx	a,@dptr
      000F56 FE               [12] 3649 	mov	r6,a
      000F57 C4               [12] 3650 	swap	a
      000F58 54 0F            [12] 3651 	anl	a,#0x0f
      000F5A FD               [12] 3652 	mov	r5,a
      000F5B 1D               [12] 3653 	dec	r5
                                   3654 ;	minikeys.c:465: type = cmd[1] & 0x0F;
      000F5C 53 06 0F         [24] 3655 	anl	ar6,#0x0f
                                   3656 ;	minikeys.c:466: if(ctrl == 0xFF || layer >= LAYERS) return;
      000F5F BF FF 01         [24] 3657 	cjne	r7,#0xff,00457$
      000F62 22               [24] 3658 	ret
      000F63                       3659 00457$:
      000F63 BD 03 00         [24] 3660 	cjne	r5,#0x03,00458$
      000F66                       3661 00458$:
      000F66 40 01            [24] 3662 	jc	00131$
      000F68 22               [24] 3663 	ret
      000F69                       3664 00131$:
                                   3665 ;	minikeys.c:467: setLayer(layer);
      000F69 8D 82            [24] 3666 	mov	dpl, r5
      000F6B C0 07            [24] 3667 	push	ar7
      000F6D C0 06            [24] 3668 	push	ar6
      000F6F C0 05            [24] 3669 	push	ar5
      000F71 12 0C DA         [24] 3670 	lcall	_setLayer
      000F74 D0 05            [24] 3671 	pop	ar5
      000F76 D0 06            [24] 3672 	pop	ar6
      000F78 D0 07            [24] 3673 	pop	ar7
                                   3674 ;	minikeys.c:468: s = bindings[layer * CONTROLS + ctrl];
      000F7A ED               [12] 3675 	mov	a,r5
      000F7B 75 F0 06         [24] 3676 	mov	b,#0x06
      000F7E A4               [48] 3677 	mul	ab
      000F7F FD               [12] 3678 	mov	r5,a
      000F80 E4               [12] 3679 	clr	a
      000F81 FC               [12] 3680 	mov	r4,a
      000F82 FB               [12] 3681 	mov	r3,a
      000F83 EF               [12] 3682 	mov	a,r7
      000F84 2D               [12] 3683 	add	a, r5
      000F85 F5 1D            [12] 3684 	mov	__mulint_PARM_2,a
      000F87 EB               [12] 3685 	mov	a,r3
      000F88 3C               [12] 3686 	addc	a, r4
      000F89 F5 1E            [12] 3687 	mov	(__mulint_PARM_2 + 1),a
      000F8B 90 00 0B         [24] 3688 	mov	dptr,#0x000b
      000F8E C0 06            [24] 3689 	push	ar6
      000F90 12 1A A8         [24] 3690 	lcall	__mulint
      000F93 AD 82            [24] 3691 	mov	r5, dpl
      000F95 AF 83            [24] 3692 	mov	r7, dph
      000F97 D0 06            [24] 3693 	pop	ar6
      000F99 ED               [12] 3694 	mov	a,r5
      000F9A 24 00            [12] 3695 	add	a, #_bindings
      000F9C FD               [12] 3696 	mov	r5,a
      000F9D EF               [12] 3697 	mov	a,r7
      000F9E 34 01            [12] 3698 	addc	a, #(_bindings >> 8)
      000FA0 FF               [12] 3699 	mov	r7,a
                                   3700 ;	minikeys.c:469: switch(type) {
      000FA1 BE 01 02         [24] 3701 	cjne	r6,#0x01,00460$
      000FA4 80 0C            [24] 3702 	sjmp	00133$
      000FA6                       3703 00460$:
      000FA6 BE 02 02         [24] 3704 	cjne	r6,#0x02,00461$
      000FA9 80 75            [24] 3705 	sjmp	00142$
      000FAB                       3706 00461$:
      000FAB BE 03 03         [24] 3707 	cjne	r6,#0x03,00462$
      000FAE 02 10 48         [24] 3708 	ljmp	00143$
      000FB1                       3709 00462$:
      000FB1 22               [24] 3710 	ret
                                   3711 ;	minikeys.c:470: case TYPE_KEYS:                               // count index modifiers key
      000FB2                       3712 00133$:
                                   3713 ;	minikeys.c:471: if(cmd[2] > 5) return;
      000FB2 90 02 1D         [24] 3714 	mov	dptr,#(_cmd + 0x0002)
      000FB5 E0               [24] 3715 	movx	a,@dptr
      000FB6 FE               [12] 3716 	mov  r6,a
      000FB7 24 FA            [12] 3717 	add	a,#0xff - 0x05
      000FB9 50 01            [24] 3718 	jnc	00135$
                                   3719 ;	free result
      000FBB 22               [24] 3720 	ret
      000FBC                       3721 00135$:
                                   3722 ;	minikeys.c:472: if(cmd[3] == 0) {
      000FBC 90 02 1E         [24] 3723 	mov	dptr,#(_cmd + 0x0003)
      000FBF E0               [24] 3724 	movx	a,@dptr
      000FC0 FC               [12] 3725 	mov	r4,a
      000FC1 70 1F            [24] 3726 	jnz	00140$
                                   3727 ;	minikeys.c:473: s[0] = TYPE_KEYS << 5 | (cmd[2] * 2);
      000FC3 EE               [12] 3728 	mov	a,r6
      000FC4 2E               [12] 3729 	add	a,r6
      000FC5 FB               [12] 3730 	mov	r3,a
      000FC6 43 03 20         [24] 3731 	orl	ar3,#0x20
      000FC9 8D 82            [24] 3732 	mov	dpl,r5
      000FCB 8F 83            [24] 3733 	mov	dph,r7
      000FCD EB               [12] 3734 	mov	a,r3
      000FCE F0               [24] 3735 	movx	@dptr,a
                                   3736 ;	minikeys.c:474: for(i=1; i<SLOT_LEN; i++) s[i] = 0;
      000FCF 7B 01            [12] 3737 	mov	r3,#0x01
      000FD1                       3738 00148$:
      000FD1 EB               [12] 3739 	mov	a,r3
      000FD2 2D               [12] 3740 	add	a, r5
      000FD3 F5 82            [12] 3741 	mov	dpl,a
      000FD5 E4               [12] 3742 	clr	a
      000FD6 3F               [12] 3743 	addc	a, r7
      000FD7 F5 83            [12] 3744 	mov	dph,a
      000FD9 E4               [12] 3745 	clr	a
      000FDA F0               [24] 3746 	movx	@dptr,a
      000FDB 0B               [12] 3747 	inc	r3
      000FDC BB 0B 00         [24] 3748 	cjne	r3,#0x0b,00465$
      000FDF                       3749 00465$:
      000FDF 40 F0            [24] 3750 	jc	00148$
      000FE1 22               [24] 3751 	ret
      000FE2                       3752 00140$:
                                   3753 ;	minikeys.c:476: else if(cmd[3] <= cmd[2]) {
      000FE2 C3               [12] 3754 	clr	c
      000FE3 EE               [12] 3755 	mov	a,r6
      000FE4 9C               [12] 3756 	subb	a,r4
      000FE5 50 01            [24] 3757 	jnc	00467$
      000FE7 22               [24] 3758 	ret
      000FE8                       3759 00467$:
                                   3760 ;	free result
                                   3761 ;	minikeys.c:477: s[cmd[3] * 2 - 1] = cmd[4];
      000FE8 7E 00            [12] 3762 	mov	r6,#0x00
      000FEA EC               [12] 3763 	mov	a,r4
      000FEB 2C               [12] 3764 	add	a,r4
      000FEC FC               [12] 3765 	mov	r4,a
      000FED EE               [12] 3766 	mov	a,r6
      000FEE 33               [12] 3767 	rlc	a
      000FEF FE               [12] 3768 	mov	r6,a
      000FF0 1C               [12] 3769 	dec	r4
      000FF1 BC FF 01         [24] 3770 	cjne	r4,#0xff,00468$
      000FF4 1E               [12] 3771 	dec	r6
      000FF5                       3772 00468$:
      000FF5 EC               [12] 3773 	mov	a,r4
      000FF6 2D               [12] 3774 	add	a, r5
      000FF7 FC               [12] 3775 	mov	r4,a
      000FF8 EE               [12] 3776 	mov	a,r6
      000FF9 3F               [12] 3777 	addc	a, r7
      000FFA FE               [12] 3778 	mov	r6,a
      000FFB 90 02 1F         [24] 3779 	mov	dptr,#(_cmd + 0x0004)
      000FFE E0               [24] 3780 	movx	a,@dptr
      000FFF 8C 82            [24] 3781 	mov	dpl,r4
      001001 8E 83            [24] 3782 	mov	dph,r6
      001003 F0               [24] 3783 	movx	@dptr,a
                                   3784 ;	minikeys.c:478: s[cmd[3] * 2] = cmd[5];
      001004 90 02 1E         [24] 3785 	mov	dptr,#(_cmd + 0x0003)
      001007 E0               [24] 3786 	movx	a,@dptr
      001008 7C 00            [12] 3787 	mov	r4,#0x00
      00100A 25 E0            [12] 3788 	add	a,acc
      00100C FE               [12] 3789 	mov	r6,a
      00100D EC               [12] 3790 	mov	a,r4
      00100E 33               [12] 3791 	rlc	a
      00100F FC               [12] 3792 	mov	r4,a
      001010 EE               [12] 3793 	mov	a,r6
      001011 2D               [12] 3794 	add	a, r5
      001012 FE               [12] 3795 	mov	r6,a
      001013 EC               [12] 3796 	mov	a,r4
      001014 3F               [12] 3797 	addc	a, r7
      001015 FC               [12] 3798 	mov	r4,a
      001016 90 02 20         [24] 3799 	mov	dptr,#(_cmd + 0x0005)
      001019 E0               [24] 3800 	movx	a,@dptr
      00101A 8E 82            [24] 3801 	mov	dpl,r6
      00101C 8C 83            [24] 3802 	mov	dph,r4
      00101E F0               [24] 3803 	movx	@dptr,a
                                   3804 ;	minikeys.c:480: break;
                                   3805 ;	minikeys.c:481: case TYPE_MEDIA:                              // usage low, high
      00101F 22               [24] 3806 	ret
      001020                       3807 00142$:
                                   3808 ;	minikeys.c:482: s[0] = TYPE_MEDIA << 5 | 2;
      001020 8D 82            [24] 3809 	mov	dpl,r5
      001022 8F 83            [24] 3810 	mov	dph,r7
      001024 74 42            [12] 3811 	mov	a,#0x42
      001026 F0               [24] 3812 	movx	@dptr,a
                                   3813 ;	minikeys.c:483: s[1] = cmd[2]; s[2] = cmd[3];
      001027 74 01            [12] 3814 	mov	a,#0x01
      001029 2D               [12] 3815 	add	a, r5
      00102A FC               [12] 3816 	mov	r4,a
      00102B E4               [12] 3817 	clr	a
      00102C 3F               [12] 3818 	addc	a, r7
      00102D FE               [12] 3819 	mov	r6,a
      00102E 90 02 1D         [24] 3820 	mov	dptr,#(_cmd + 0x0002)
      001031 E0               [24] 3821 	movx	a,@dptr
      001032 8C 82            [24] 3822 	mov	dpl,r4
      001034 8E 83            [24] 3823 	mov	dph,r6
      001036 F0               [24] 3824 	movx	@dptr,a
      001037 74 02            [12] 3825 	mov	a,#0x02
      001039 2D               [12] 3826 	add	a, r5
      00103A FC               [12] 3827 	mov	r4,a
      00103B E4               [12] 3828 	clr	a
      00103C 3F               [12] 3829 	addc	a, r7
      00103D FE               [12] 3830 	mov	r6,a
      00103E 90 02 1E         [24] 3831 	mov	dptr,#(_cmd + 0x0003)
      001041 E0               [24] 3832 	movx	a,@dptr
      001042 8C 82            [24] 3833 	mov	dpl,r4
      001044 8E 83            [24] 3834 	mov	dph,r6
      001046 F0               [24] 3835 	movx	@dptr,a
                                   3836 ;	minikeys.c:484: break;
                                   3837 ;	minikeys.c:485: case TYPE_MOUSE:                              // buttons x y wheel modifiers
      001047 22               [24] 3838 	ret
      001048                       3839 00143$:
                                   3840 ;	minikeys.c:486: s[0] = TYPE_MOUSE << 5 | 5;
      001048 8D 82            [24] 3841 	mov	dpl,r5
      00104A 8F 83            [24] 3842 	mov	dph,r7
      00104C 74 65            [12] 3843 	mov	a,#0x65
      00104E F0               [24] 3844 	movx	@dptr,a
                                   3845 ;	minikeys.c:487: for(i=0; i<5; i++) s[1 + i] = cmd[2 + i];
      00104F 7E 00            [12] 3846 	mov	r6,#0x00
      001051                       3847 00150$:
      001051 8E 04            [24] 3848 	mov	ar4,r6
      001053 EC               [12] 3849 	mov	a,r4
      001054 04               [12] 3850 	inc	a
      001055 2D               [12] 3851 	add	a, r5
      001056 FB               [12] 3852 	mov	r3,a
      001057 E4               [12] 3853 	clr	a
      001058 3F               [12] 3854 	addc	a,r7
      001059 FC               [12] 3855 	mov	r4,a
      00105A 8E 02            [24] 3856 	mov	ar2,r6
      00105C 0A               [12] 3857 	inc	r2
      00105D 0A               [12] 3858 	inc	r2
      00105E EA               [12] 3859 	mov	a,r2
      00105F 24 1B            [12] 3860 	add	a, #_cmd
      001061 F5 82            [12] 3861 	mov	dpl,a
      001063 E4               [12] 3862 	clr	a
      001064 34 02            [12] 3863 	addc	a, #(_cmd >> 8)
      001066 F5 83            [12] 3864 	mov	dph,a
      001068 E0               [24] 3865 	movx	a,@dptr
      001069 8B 82            [24] 3866 	mov	dpl,r3
      00106B 8C 83            [24] 3867 	mov	dph,r4
      00106D F0               [24] 3868 	movx	@dptr,a
      00106E 0E               [12] 3869 	inc	r6
      00106F BE 05 00         [24] 3870 	cjne	r6,#0x05,00469$
      001072                       3871 00469$:
      001072 40 DD            [24] 3872 	jc	00150$
                                   3873 ;	minikeys.c:489: }
                                   3874 ;	minikeys.c:490: }
      001074 22               [24] 3875 	ret
                                   3876 ;------------------------------------------------------------
                                   3877 ;Allocation info for local variables in function 'readEncoder'
                                   3878 ;------------------------------------------------------------
                                   3879 ;	minikeys.c:506: uint8_t readEncoder(void) {
                                   3880 ;	-----------------------------------------
                                   3881 ;	 function readEncoder
                                   3882 ;	-----------------------------------------
      001075                       3883 _readEncoder:
                                   3884 ;	minikeys.c:507: return (PIN_read(PIN_ENC_A) ? 2 : 0) | (PIN_read(PIN_ENC_B) ? 1 : 0);
      001075 30 B0 04         [24] 3885 	jnb	_PP30,00103$
      001078 7F 02            [12] 3886 	mov	r7,#0x02
      00107A 80 02            [24] 3887 	sjmp	00104$
      00107C                       3888 00103$:
      00107C 7F 00            [12] 3889 	mov	r7,#0x00
      00107E                       3890 00104$:
      00107E 30 B1 04         [24] 3891 	jnb	_PP31,00105$
      001081 7E 01            [12] 3892 	mov	r6,#0x01
      001083 80 02            [24] 3893 	sjmp	00106$
      001085                       3894 00105$:
      001085 7E 00            [12] 3895 	mov	r6,#0x00
      001087                       3896 00106$:
      001087 EE               [12] 3897 	mov	a,r6
      001088 4F               [12] 3898 	orl	a,r7
      001089 F5 82            [12] 3899 	mov	dpl,a
                                   3900 ;	minikeys.c:508: }
      00108B 22               [24] 3901 	ret
                                   3902 ;------------------------------------------------------------
                                   3903 ;Allocation info for local variables in function 'pollEncoder'
                                   3904 ;------------------------------------------------------------
                                   3905 ;state         Allocated to registers r7 
                                   3906 ;------------------------------------------------------------
                                   3907 ;	minikeys.c:510: void pollEncoder(void) {
                                   3908 ;	-----------------------------------------
                                   3909 ;	 function pollEncoder
                                   3910 ;	-----------------------------------------
      00108C                       3911 _pollEncoder:
                                   3912 ;	minikeys.c:511: uint8_t state = readEncoder();
      00108C 12 10 75         [24] 3913 	lcall	_readEncoder
      00108F AF 82            [24] 3914 	mov	r7, dpl
                                   3915 ;	minikeys.c:512: if(state == encoderState) return;
      001091 78 31            [12] 3916 	mov	r0,#_encoderState
      001093 E6               [12] 3917 	mov	a,@r0
      001094 B5 07 01         [24] 3918 	cjne	a,ar7,00102$
      001097 22               [24] 3919 	ret
      001098                       3920 00102$:
                                   3921 ;	minikeys.c:513: encoderSteps += encoderTable[encoderState << 2 | state];
      001098 78 31            [12] 3922 	mov	r0,#_encoderState
      00109A E6               [12] 3923 	mov	a,@r0
      00109B 26               [12] 3924 	add	a,@r0
      00109C 25 E0            [12] 3925 	add	a,acc
      00109E 4F               [12] 3926 	orl	a,r7
      00109F 90 1B 25         [24] 3927 	mov	dptr,#_encoderTable
      0010A2 93               [24] 3928 	movc	a,@a+dptr
      0010A3 78 32            [12] 3929 	mov	r0,#_encoderSteps
      0010A5 26               [12] 3930 	add	a, @r0
      0010A6 F6               [12] 3931 	mov	@r0,a
                                   3932 ;	minikeys.c:514: encoderState = state;
      0010A7 78 31            [12] 3933 	mov	r0,#_encoderState
      0010A9 A6 07            [24] 3934 	mov	@r0,ar7
                                   3935 ;	minikeys.c:516: if(state == 3) {
      0010AB BF 03 42         [24] 3936 	cjne	r7,#0x03,00110$
                                   3937 ;	minikeys.c:517: if(encoderSteps <= -2) { controlDown(CTRL_KNOB_RIGHT); controlUp(CTRL_KNOB_RIGHT); flashPress(2); }
      0010AE 78 32            [12] 3938 	mov	r0,#_encoderSteps
      0010B0 C3               [12] 3939 	clr	c
      0010B1 74 7E            [12] 3940 	mov	a,#(0xfe ^ 0x80)
      0010B3 86 F0            [24] 3941 	mov	b,@r0
      0010B5 63 F0 80         [24] 3942 	xrl	b,#0x80
      0010B8 95 F0            [12] 3943 	subb	a,b
      0010BA 40 14            [24] 3944 	jc	00106$
                                   3945 ;	free result
      0010BC 75 82 05         [24] 3946 	mov	dpl, #0x05
      0010BF 12 06 09         [24] 3947 	lcall	_controlDown
      0010C2 75 82 05         [24] 3948 	mov	dpl, #0x05
      0010C5 12 07 7F         [24] 3949 	lcall	_controlUp
      0010C8 75 82 02         [24] 3950 	mov	dpl, #0x02
      0010CB 12 09 04         [24] 3951 	lcall	_flashPress
      0010CE 80 1C            [24] 3952 	sjmp	00107$
      0010D0                       3953 00106$:
                                   3954 ;	minikeys.c:518: else if(encoderSteps >= 2) { controlDown(CTRL_KNOB_LEFT); controlUp(CTRL_KNOB_LEFT); flashPress(2); }
      0010D0 78 32            [12] 3955 	mov	r0,#_encoderSteps
      0010D2 C3               [12] 3956 	clr	c
      0010D3 E6               [12] 3957 	mov	a,@r0
      0010D4 64 80            [12] 3958 	xrl	a,#0x80
      0010D6 94 82            [12] 3959 	subb	a,#0x82
      0010D8 40 12            [24] 3960 	jc	00107$
      0010DA 75 82 03         [24] 3961 	mov	dpl, #0x03
      0010DD 12 06 09         [24] 3962 	lcall	_controlDown
      0010E0 75 82 03         [24] 3963 	mov	dpl, #0x03
      0010E3 12 07 7F         [24] 3964 	lcall	_controlUp
      0010E6 75 82 02         [24] 3965 	mov	dpl, #0x02
      0010E9 12 09 04         [24] 3966 	lcall	_flashPress
      0010EC                       3967 00107$:
                                   3968 ;	minikeys.c:519: encoderSteps = 0;
      0010EC 78 32            [12] 3969 	mov	r0,#_encoderSteps
      0010EE 76 00            [12] 3970 	mov	@r0,#0x00
      0010F0                       3971 00110$:
                                   3972 ;	minikeys.c:521: }
      0010F0 22               [24] 3973 	ret
                                   3974 ;------------------------------------------------------------
                                   3975 ;Allocation info for local variables in function 'readButton'
                                   3976 ;------------------------------------------------------------
                                   3977 ;i             Allocated to registers r7 
                                   3978 ;------------------------------------------------------------
                                   3979 ;	minikeys.c:523: uint8_t readButton(uint8_t i) {
                                   3980 ;	-----------------------------------------
                                   3981 ;	 function readButton
                                   3982 ;	-----------------------------------------
      0010F1                       3983 _readButton:
                                   3984 ;	minikeys.c:524: switch(i) {
      0010F1 E5 82            [12] 3985 	mov	a,dpl
      0010F3 FF               [12] 3986 	mov	r7,a
      0010F4 60 0A            [24] 3987 	jz	00101$
      0010F6 BF 01 02         [24] 3988 	cjne	r7,#0x01,00130$
      0010F9 80 0F            [24] 3989 	sjmp	00102$
      0010FB                       3990 00130$:
                                   3991 ;	minikeys.c:525: case 0:  return !PIN_read(PIN_KEY1);
      0010FB BF 02 20         [24] 3992 	cjne	r7,#0x02,00104$
      0010FE 80 14            [24] 3993 	sjmp	00103$
      001100                       3994 00101$:
      001100 A2 91            [12] 3995 	mov	c,_PP11
      001102 B3               [12] 3996 	cpl	c
      001103 92 00            [24] 3997 	mov  _readButton_sloc0_1_0,c
      001105 E4               [12] 3998 	clr	a
      001106 33               [12] 3999 	rlc	a
      001107 F5 82            [12] 4000 	mov	dpl,a
                                   4001 ;	minikeys.c:526: case 1:  return !PIN_read(PIN_KEY2);
      001109 22               [24] 4002 	ret
      00110A                       4003 00102$:
      00110A A2 97            [12] 4004 	mov	c,_PP17
      00110C B3               [12] 4005 	cpl	c
      00110D 92 00            [24] 4006 	mov  _readButton_sloc0_1_0,c
      00110F E4               [12] 4007 	clr	a
      001110 33               [12] 4008 	rlc	a
      001111 F5 82            [12] 4009 	mov	dpl,a
                                   4010 ;	minikeys.c:527: case 2:  return !PIN_read(PIN_KEY3);
      001113 22               [24] 4011 	ret
      001114                       4012 00103$:
      001114 A2 96            [12] 4013 	mov	c,_PP16
      001116 B3               [12] 4014 	cpl	c
      001117 92 00            [24] 4015 	mov  _readButton_sloc0_1_0,c
      001119 E4               [12] 4016 	clr	a
      00111A 33               [12] 4017 	rlc	a
      00111B F5 82            [12] 4018 	mov	dpl,a
                                   4019 ;	minikeys.c:528: default: return !PIN_read(PIN_ENC_SW);
      00111D 22               [24] 4020 	ret
      00111E                       4021 00104$:
      00111E A2 B3            [12] 4022 	mov	c,_PP33
      001120 B3               [12] 4023 	cpl	c
      001121 92 00            [24] 4024 	mov  _readButton_sloc0_1_0,c
      001123 E4               [12] 4025 	clr	a
      001124 33               [12] 4026 	rlc	a
      001125 F5 82            [12] 4027 	mov	dpl,a
                                   4028 ;	minikeys.c:529: }
                                   4029 ;	minikeys.c:530: }
      001127 22               [24] 4030 	ret
                                   4031 ;------------------------------------------------------------
                                   4032 ;Allocation info for local variables in function 'pollButtons'
                                   4033 ;------------------------------------------------------------
                                   4034 ;i             Allocated to registers r7 
                                   4035 ;pressed       Allocated to registers r6 
                                   4036 ;ctrl          Allocated to registers r4 
                                   4037 ;------------------------------------------------------------
                                   4038 ;	minikeys.c:532: void pollButtons(void) {
                                   4039 ;	-----------------------------------------
                                   4040 ;	 function pollButtons
                                   4041 ;	-----------------------------------------
      001128                       4042 _pollButtons:
                                   4043 ;	minikeys.c:534: for(i=0; i<4; i++) {
      001128 7F 00            [12] 4044 	mov	r7,#0x00
      00112A                       4045 00110$:
                                   4046 ;	minikeys.c:535: pressed = readButton(i);
      00112A 8F 82            [24] 4047 	mov	dpl, r7
      00112C C0 07            [24] 4048 	push	ar7
      00112E 12 10 F1         [24] 4049 	lcall	_readButton
      001131 AE 82            [24] 4050 	mov	r6, dpl
      001133 D0 07            [24] 4051 	pop	ar7
                                   4052 ;	minikeys.c:536: if(pressed == buttonStable[i]) { buttonCount[i] = 0; continue; }
      001135 EF               [12] 4053 	mov	a,r7
      001136 24 27            [12] 4054 	add	a, #_buttonStable
      001138 FC               [12] 4055 	mov	r4,a
      001139 E4               [12] 4056 	clr	a
      00113A 34 02            [12] 4057 	addc	a, #(_buttonStable >> 8)
      00113C FD               [12] 4058 	mov	r5,a
      00113D 8C 82            [24] 4059 	mov	dpl,r4
      00113F 8D 83            [24] 4060 	mov	dph,r5
      001141 E0               [24] 4061 	movx	a,@dptr
      001142 FB               [12] 4062 	mov	r3,a
      001143 EE               [12] 4063 	mov	a,r6
      001144 B5 03 0E         [24] 4064 	cjne	a,ar3,00102$
      001147 EF               [12] 4065 	mov	a,r7
      001148 24 2B            [12] 4066 	add	a, #_buttonCount
      00114A F5 82            [12] 4067 	mov	dpl,a
      00114C E4               [12] 4068 	clr	a
      00114D 34 02            [12] 4069 	addc	a, #(_buttonCount >> 8)
      00114F F5 83            [12] 4070 	mov	dph,a
      001151 E4               [12] 4071 	clr	a
      001152 F0               [24] 4072 	movx	@dptr,a
      001153 80 5D            [24] 4073 	sjmp	00108$
      001155                       4074 00102$:
                                   4075 ;	minikeys.c:537: if(++buttonCount[i] < DEBOUNCE_MS) continue;
      001155 EF               [12] 4076 	mov	a,r7
      001156 24 2B            [12] 4077 	add	a, #_buttonCount
      001158 FA               [12] 4078 	mov	r2,a
      001159 E4               [12] 4079 	clr	a
      00115A 34 02            [12] 4080 	addc	a, #(_buttonCount >> 8)
      00115C FB               [12] 4081 	mov	r3,a
      00115D 8A 82            [24] 4082 	mov	dpl,r2
      00115F 8B 83            [24] 4083 	mov	dph,r3
      001161 E0               [24] 4084 	movx	a,@dptr
      001162 F9               [12] 4085 	mov	r1,a
      001163 09               [12] 4086 	inc	r1
      001164 8A 82            [24] 4087 	mov	dpl,r2
      001166 8B 83            [24] 4088 	mov	dph,r3
      001168 E9               [12] 4089 	mov	a,r1
      001169 F0               [24] 4090 	movx	@dptr,a
      00116A B9 05 00         [24] 4091 	cjne	r1,#0x05,00162$
      00116D                       4092 00162$:
      00116D 40 43            [24] 4093 	jc	00108$
                                   4094 ;	minikeys.c:538: buttonStable[i] = pressed;
      00116F 8C 82            [24] 4095 	mov	dpl,r4
      001171 8D 83            [24] 4096 	mov	dph,r5
      001173 EE               [12] 4097 	mov	a,r6
      001174 F0               [24] 4098 	movx	@dptr,a
                                   4099 ;	minikeys.c:539: buttonCount[i] = 0;
      001175 8A 82            [24] 4100 	mov	dpl,r2
      001177 8B 83            [24] 4101 	mov	dph,r3
      001179 E4               [12] 4102 	clr	a
      00117A F0               [24] 4103 	movx	@dptr,a
                                   4104 ;	minikeys.c:540: ctrl = i < 3 ? i : CTRL_KNOB_PRESS;
      00117B BF 03 00         [24] 4105 	cjne	r7,#0x03,00164$
      00117E                       4106 00164$:
      00117E E4               [12] 4107 	clr	a
      00117F 33               [12] 4108 	rlc	a
      001180 FD               [12] 4109 	mov	r5,a
      001181 60 04            [24] 4110 	jz	00113$
      001183 8F 04            [24] 4111 	mov	ar4,r7
      001185 80 02            [24] 4112 	sjmp	00114$
      001187                       4113 00113$:
      001187 7C 04            [12] 4114 	mov	r4,#0x04
      001189                       4115 00114$:
                                   4116 ;	minikeys.c:541: if(pressed) {
      001189 EE               [12] 4117 	mov	a,r6
      00118A 60 1D            [24] 4118 	jz	00106$
                                   4119 ;	minikeys.c:542: flashPress(i < 3 ? i : 2);
      00118C ED               [12] 4120 	mov	a,r5
      00118D 60 04            [24] 4121 	jz	00115$
      00118F 8F 06            [24] 4122 	mov	ar6,r7
      001191 80 02            [24] 4123 	sjmp	00116$
      001193                       4124 00115$:
      001193 7E 02            [12] 4125 	mov	r6,#0x02
      001195                       4126 00116$:
      001195 8E 82            [24] 4127 	mov	dpl,r6
      001197 C0 07            [24] 4128 	push	ar7
      001199 C0 04            [24] 4129 	push	ar4
      00119B 12 09 04         [24] 4130 	lcall	_flashPress
      00119E D0 04            [24] 4131 	pop	ar4
                                   4132 ;	minikeys.c:543: controlDown(ctrl);
      0011A0 8C 82            [24] 4133 	mov	dpl, r4
      0011A2 12 06 09         [24] 4134 	lcall	_controlDown
      0011A5 D0 07            [24] 4135 	pop	ar7
      0011A7 80 09            [24] 4136 	sjmp	00108$
      0011A9                       4137 00106$:
                                   4138 ;	minikeys.c:545: else controlUp(ctrl);
      0011A9 8C 82            [24] 4139 	mov	dpl, r4
      0011AB C0 07            [24] 4140 	push	ar7
      0011AD 12 07 7F         [24] 4141 	lcall	_controlUp
      0011B0 D0 07            [24] 4142 	pop	ar7
      0011B2                       4143 00108$:
                                   4144 ;	minikeys.c:534: for(i=0; i<4; i++) {
      0011B2 0F               [12] 4145 	inc	r7
      0011B3 BF 04 00         [24] 4146 	cjne	r7,#0x04,00168$
      0011B6                       4147 00168$:
      0011B6 50 03            [24] 4148 	jnc	00169$
      0011B8 02 11 2A         [24] 4149 	ljmp	00110$
      0011BB                       4150 00169$:
                                   4151 ;	minikeys.c:547: }
      0011BB 22               [24] 4152 	ret
                                   4153 ;------------------------------------------------------------
                                   4154 ;Allocation info for local variables in function 'diagRead'
                                   4155 ;------------------------------------------------------------
                                   4156 ;pin           Allocated to registers r7 
                                   4157 ;------------------------------------------------------------
                                   4158 ;	minikeys.c:559: uint8_t diagRead(uint8_t pin) {
                                   4159 ;	-----------------------------------------
                                   4160 ;	 function diagRead
                                   4161 ;	-----------------------------------------
      0011BC                       4162 _diagRead:
                                   4163 ;	minikeys.c:560: switch(pin) {
      0011BC E5 82            [12] 4164 	mov	a,dpl
      0011BE FF               [12] 4165 	mov	r7,a
      0011BF 24 F4            [12] 4166 	add	a,#0xff - 0x0b
      0011C1 40 7A            [24] 4167 	jc	00113$
                                   4168 ;	free result
      0011C3 EF               [12] 4169 	mov	a,r7
      0011C4 24 0A            [12] 4170 	add	a,#(00125$-3-.)
      0011C6 83               [24] 4171 	movc	a,@a+pc
      0011C7 F5 82            [12] 4172 	mov	dpl,a
      0011C9 EF               [12] 4173 	mov	a,r7
      0011CA 24 10            [12] 4174 	add	a,#(00126$-3-.)
      0011CC 83               [24] 4175 	movc	a,@a+pc
      0011CD F5 83            [12] 4176 	mov	dph,a
      0011CF E4               [12] 4177 	clr	a
      0011D0 73               [24] 4178 	jmp	@a+dptr
      0011D1                       4179 00125$:
      0011D1 E9                    4180 	.db	00101$
      0011D2 F0                    4181 	.db	00102$
      0011D3 F7                    4182 	.db	00103$
      0011D4 FE                    4183 	.db	00104$
      0011D5 05                    4184 	.db	00105$
      0011D6 0C                    4185 	.db	00106$
      0011D7 13                    4186 	.db	00107$
      0011D8 1A                    4187 	.db	00108$
      0011D9 21                    4188 	.db	00109$
      0011DA 28                    4189 	.db	00110$
      0011DB 2F                    4190 	.db	00111$
      0011DC 36                    4191 	.db	00112$
      0011DD                       4192 00126$:
      0011DD 11                    4193 	.db	00101$>>8
      0011DE 11                    4194 	.db	00102$>>8
      0011DF 11                    4195 	.db	00103$>>8
      0011E0 11                    4196 	.db	00104$>>8
      0011E1 12                    4197 	.db	00105$>>8
      0011E2 12                    4198 	.db	00106$>>8
      0011E3 12                    4199 	.db	00107$>>8
      0011E4 12                    4200 	.db	00108$>>8
      0011E5 12                    4201 	.db	00109$>>8
      0011E6 12                    4202 	.db	00110$>>8
      0011E7 12                    4203 	.db	00111$>>8
      0011E8 12                    4204 	.db	00112$>>8
                                   4205 ;	minikeys.c:561: case P10: return PIN_read(P10); case P11: return PIN_read(P11);
      0011E9                       4206 00101$:
      0011E9 A2 90            [12] 4207 	mov	c,_PP10
      0011EB E4               [12] 4208 	clr	a
      0011EC 33               [12] 4209 	rlc	a
      0011ED F5 82            [12] 4210 	mov	dpl,a
      0011EF 22               [24] 4211 	ret
      0011F0                       4212 00102$:
      0011F0 A2 91            [12] 4213 	mov	c,_PP11
      0011F2 E4               [12] 4214 	clr	a
      0011F3 33               [12] 4215 	rlc	a
      0011F4 F5 82            [12] 4216 	mov	dpl,a
      0011F6 22               [24] 4217 	ret
                                   4218 ;	minikeys.c:562: case P12: return PIN_read(P12); case P13: return PIN_read(P13);
      0011F7                       4219 00103$:
      0011F7 A2 92            [12] 4220 	mov	c,_PP12
      0011F9 E4               [12] 4221 	clr	a
      0011FA 33               [12] 4222 	rlc	a
      0011FB F5 82            [12] 4223 	mov	dpl,a
      0011FD 22               [24] 4224 	ret
      0011FE                       4225 00104$:
      0011FE A2 93            [12] 4226 	mov	c,_PP13
      001200 E4               [12] 4227 	clr	a
      001201 33               [12] 4228 	rlc	a
      001202 F5 82            [12] 4229 	mov	dpl,a
                                   4230 ;	minikeys.c:563: case P14: return PIN_read(P14); case P15: return PIN_read(P15);
      001204 22               [24] 4231 	ret
      001205                       4232 00105$:
      001205 A2 94            [12] 4233 	mov	c,_PP14
      001207 E4               [12] 4234 	clr	a
      001208 33               [12] 4235 	rlc	a
      001209 F5 82            [12] 4236 	mov	dpl,a
      00120B 22               [24] 4237 	ret
      00120C                       4238 00106$:
      00120C A2 95            [12] 4239 	mov	c,_PP15
      00120E E4               [12] 4240 	clr	a
      00120F 33               [12] 4241 	rlc	a
      001210 F5 82            [12] 4242 	mov	dpl,a
                                   4243 ;	minikeys.c:564: case P16: return PIN_read(P16); case P17: return PIN_read(P17);
      001212 22               [24] 4244 	ret
      001213                       4245 00107$:
      001213 A2 96            [12] 4246 	mov	c,_PP16
      001215 E4               [12] 4247 	clr	a
      001216 33               [12] 4248 	rlc	a
      001217 F5 82            [12] 4249 	mov	dpl,a
      001219 22               [24] 4250 	ret
      00121A                       4251 00108$:
      00121A A2 97            [12] 4252 	mov	c,_PP17
      00121C E4               [12] 4253 	clr	a
      00121D 33               [12] 4254 	rlc	a
      00121E F5 82            [12] 4255 	mov	dpl,a
                                   4256 ;	minikeys.c:565: case P30: return PIN_read(P30); case P31: return PIN_read(P31);
      001220 22               [24] 4257 	ret
      001221                       4258 00109$:
      001221 A2 B0            [12] 4259 	mov	c,_PP30
      001223 E4               [12] 4260 	clr	a
      001224 33               [12] 4261 	rlc	a
      001225 F5 82            [12] 4262 	mov	dpl,a
      001227 22               [24] 4263 	ret
      001228                       4264 00110$:
      001228 A2 B1            [12] 4265 	mov	c,_PP31
      00122A E4               [12] 4266 	clr	a
      00122B 33               [12] 4267 	rlc	a
      00122C F5 82            [12] 4268 	mov	dpl,a
                                   4269 ;	minikeys.c:566: case P32: return PIN_read(P32); case P33: return PIN_read(P33);
      00122E 22               [24] 4270 	ret
      00122F                       4271 00111$:
      00122F A2 B2            [12] 4272 	mov	c,_PP32
      001231 E4               [12] 4273 	clr	a
      001232 33               [12] 4274 	rlc	a
      001233 F5 82            [12] 4275 	mov	dpl,a
      001235 22               [24] 4276 	ret
      001236                       4277 00112$:
      001236 A2 B3            [12] 4278 	mov	c,_PP33
      001238 E4               [12] 4279 	clr	a
      001239 33               [12] 4280 	rlc	a
      00123A F5 82            [12] 4281 	mov	dpl,a
                                   4282 ;	minikeys.c:567: default:  return PIN_read(P35);
      00123C 22               [24] 4283 	ret
      00123D                       4284 00113$:
      00123D A2 B5            [12] 4285 	mov	c,_PP35
      00123F E4               [12] 4286 	clr	a
      001240 33               [12] 4287 	rlc	a
      001241 F5 82            [12] 4288 	mov	dpl,a
                                   4289 ;	minikeys.c:568: }
                                   4290 ;	minikeys.c:569: }
      001243 22               [24] 4291 	ret
                                   4292 ;------------------------------------------------------------
                                   4293 ;Allocation info for local variables in function 'diagType'
                                   4294 ;------------------------------------------------------------
                                   4295 ;usage         Allocated to registers 
                                   4296 ;------------------------------------------------------------
                                   4297 ;	minikeys.c:571: void diagType(uint8_t usage) {
                                   4298 ;	-----------------------------------------
                                   4299 ;	 function diagType
                                   4300 ;	-----------------------------------------
      001244                       4301 _diagType:
      001244 85 82 0A         [24] 4302 	mov	_sendKeys_PARM_2,dpl
                                   4303 ;	minikeys.c:572: sendKeys(0, usage);
      001247 75 82 00         [24] 4304 	mov	dpl, #0x00
      00124A 12 05 25         [24] 4305 	lcall	_sendKeys
                                   4306 ;	minikeys.c:573: sendKeys(0, 0);
      00124D 75 0A 00         [24] 4307 	mov	_sendKeys_PARM_2,#0x00
      001250 75 82 00         [24] 4308 	mov	dpl, #0x00
                                   4309 ;	minikeys.c:574: }
      001253 02 05 25         [24] 4310 	ljmp	_sendKeys
                                   4311 ;------------------------------------------------------------
                                   4312 ;Allocation info for local variables in function 'diagLoop'
                                   4313 ;------------------------------------------------------------
                                   4314 ;i             Allocated to registers r7 
                                   4315 ;now           Allocated to registers r6 
                                   4316 ;------------------------------------------------------------
                                   4317 ;	minikeys.c:576: void diagLoop(void) {
                                   4318 ;	-----------------------------------------
                                   4319 ;	 function diagLoop
                                   4320 ;	-----------------------------------------
      001256                       4321 _diagLoop:
                                   4322 ;	minikeys.c:578: P1_MOD_OC = 0xFF; P1_DIR_PU = 0xFF;             // all of port 1: input with pull-up
      001256 75 92 FF         [24] 4323 	mov	_P1_MOD_OC,#0xff
      001259 75 93 FF         [24] 4324 	mov	_P1_DIR_PU,#0xff
                                   4325 ;	minikeys.c:579: P3_MOD_OC |= 0x2F; P3_DIR_PU |= 0x2F;           // P3.0-3.3, P3.5 (not USB, not LEDs)
      00125C 43 96 2F         [24] 4326 	orl	_P3_MOD_OC,#0x2f
      00125F 43 97 2F         [24] 4327 	orl	_P3_DIR_PU,#0x2f
                                   4328 ;	minikeys.c:580: DLY_ms(20);
      001262 90 00 14         [24] 4329 	mov	dptr,#0x0014
      001265 12 14 7B         [24] 4330 	lcall	_DLY_ms
                                   4331 ;	minikeys.c:581: for(i=0; i<sizeof(diagPins); i++) diagLast[i] = diagRead(diagPins[i]);
      001268 7F 00            [12] 4332 	mov	r7,#0x00
      00126A                       4333 00113$:
      00126A EF               [12] 4334 	mov	a,r7
      00126B 24 2F            [12] 4335 	add	a, #_diagLast
      00126D FD               [12] 4336 	mov	r5,a
      00126E E4               [12] 4337 	clr	a
      00126F 34 02            [12] 4338 	addc	a, #(_diagLast >> 8)
      001271 FE               [12] 4339 	mov	r6,a
      001272 EF               [12] 4340 	mov	a,r7
      001273 90 1B 35         [24] 4341 	mov	dptr,#_diagPins
      001276 93               [24] 4342 	movc	a,@a+dptr
      001277 F5 82            [12] 4343 	mov	dpl,a
      001279 C0 07            [24] 4344 	push	ar7
      00127B C0 06            [24] 4345 	push	ar6
      00127D C0 05            [24] 4346 	push	ar5
      00127F 12 11 BC         [24] 4347 	lcall	_diagRead
      001282 AC 82            [24] 4348 	mov	r4, dpl
      001284 D0 05            [24] 4349 	pop	ar5
      001286 D0 06            [24] 4350 	pop	ar6
      001288 D0 07            [24] 4351 	pop	ar7
      00128A 8D 82            [24] 4352 	mov	dpl,r5
      00128C 8E 83            [24] 4353 	mov	dph,r6
      00128E EC               [12] 4354 	mov	a,r4
      00128F F0               [24] 4355 	movx	@dptr,a
      001290 0F               [12] 4356 	inc	r7
      001291 BF 0D 00         [24] 4357 	cjne	r7,#0x0d,00179$
      001294                       4358 00179$:
      001294 40 D4            [24] 4359 	jc	00113$
                                   4360 ;	minikeys.c:583: for(i=0; i<sizeof(diagPins); i++) {
      001296                       4361 00133$:
      001296 7F 00            [12] 4362 	mov	r7,#0x00
      001298                       4363 00115$:
                                   4364 ;	minikeys.c:584: now = diagRead(diagPins[i]);
      001298 EF               [12] 4365 	mov	a,r7
      001299 90 1B 35         [24] 4366 	mov	dptr,#_diagPins
      00129C 93               [24] 4367 	movc	a,@a+dptr
      00129D F5 82            [12] 4368 	mov	dpl,a
      00129F C0 07            [24] 4369 	push	ar7
      0012A1 12 11 BC         [24] 4370 	lcall	_diagRead
      0012A4 AE 82            [24] 4371 	mov	r6, dpl
      0012A6 D0 07            [24] 4372 	pop	ar7
                                   4373 ;	minikeys.c:585: if(now != diagLast[i]) {
      0012A8 EF               [12] 4374 	mov	a,r7
      0012A9 24 2F            [12] 4375 	add	a, #_diagLast
      0012AB FC               [12] 4376 	mov	r4,a
      0012AC E4               [12] 4377 	clr	a
      0012AD 34 02            [12] 4378 	addc	a, #(_diagLast >> 8)
      0012AF FD               [12] 4379 	mov	r5,a
      0012B0 8C 82            [24] 4380 	mov	dpl,r4
      0012B2 8D 83            [24] 4381 	mov	dph,r5
      0012B4 E0               [24] 4382 	movx	a,@dptr
      0012B5 FB               [12] 4383 	mov	r3,a
      0012B6 EE               [12] 4384 	mov	a,r6
      0012B7 B5 03 02         [24] 4385 	cjne	a,ar3,00181$
      0012BA 80 5D            [24] 4386 	sjmp	00116$
      0012BC                       4387 00181$:
                                   4388 ;	minikeys.c:586: diagLast[i] = now;
      0012BC 8C 82            [24] 4389 	mov	dpl,r4
      0012BE 8D 83            [24] 4390 	mov	dph,r5
      0012C0 EE               [12] 4391 	mov	a,r6
      0012C1 F0               [24] 4392 	movx	@dptr,a
                                   4393 ;	minikeys.c:587: if(!now) {                                // pulled low: type "p" port pin space
      0012C2 EE               [12] 4394 	mov	a,r6
      0012C3 70 54            [24] 4395 	jnz	00116$
                                   4396 ;	minikeys.c:588: diagType(0x13);
      0012C5 75 82 13         [24] 4397 	mov	dpl, #0x13
      0012C8 C0 07            [24] 4398 	push	ar7
      0012CA 12 12 44         [24] 4399 	lcall	_diagType
      0012CD D0 07            [24] 4400 	pop	ar7
                                   4401 ;	minikeys.c:589: diagType(0x1D + diagNames[i][0]);       // '1' = 0x1E
      0012CF EF               [12] 4402 	mov	a,r7
      0012D0 75 F0 02         [24] 4403 	mov	b,#0x02
      0012D3 A4               [48] 4404 	mul	ab
      0012D4 24 42            [12] 4405 	add	a, #_diagNames
      0012D6 FD               [12] 4406 	mov	r5,a
      0012D7 74 1B            [12] 4407 	mov	a,#(_diagNames >> 8)
      0012D9 35 F0            [12] 4408 	addc	a, b
      0012DB FE               [12] 4409 	mov	r6,a
      0012DC 8D 82            [24] 4410 	mov	dpl,r5
      0012DE 8E 83            [24] 4411 	mov	dph,r6
      0012E0 E4               [12] 4412 	clr	a
      0012E1 93               [24] 4413 	movc	a,@a+dptr
      0012E2 24 1D            [12] 4414 	add	a,#0x1d
      0012E4 F5 82            [12] 4415 	mov	dpl,a
      0012E6 C0 07            [24] 4416 	push	ar7
      0012E8 C0 06            [24] 4417 	push	ar6
      0012EA C0 05            [24] 4418 	push	ar5
      0012EC 12 12 44         [24] 4419 	lcall	_diagType
      0012EF D0 05            [24] 4420 	pop	ar5
      0012F1 D0 06            [24] 4421 	pop	ar6
      0012F3 D0 07            [24] 4422 	pop	ar7
                                   4423 ;	minikeys.c:590: diagType(diagNames[i][1] ? 0x1D + diagNames[i][1] : 0x27);
      0012F5 8D 82            [24] 4424 	mov	dpl,r5
      0012F7 8E 83            [24] 4425 	mov	dph,r6
      0012F9 A3               [24] 4426 	inc	dptr
      0012FA E4               [12] 4427 	clr	a
      0012FB 93               [24] 4428 	movc	a,@a+dptr
      0012FC FE               [12] 4429 	mov	r6,a
      0012FD 60 09            [24] 4430 	jz	00119$
      0012FF 74 1D            [12] 4431 	mov	a,#0x1d
      001301 2E               [12] 4432 	add	a, r6
      001302 FD               [12] 4433 	mov	r5,a
      001303 33               [12] 4434 	rlc	a
      001304 95 E0            [12] 4435 	subb	a,acc
      001306 80 02            [24] 4436 	sjmp	00120$
      001308                       4437 00119$:
      001308 7D 27            [12] 4438 	mov	r5,#0x27
      00130A                       4439 00120$:
      00130A 8D 82            [24] 4440 	mov	dpl,r5
      00130C C0 07            [24] 4441 	push	ar7
      00130E 12 12 44         [24] 4442 	lcall	_diagType
                                   4443 ;	minikeys.c:591: diagType(0x2C);
      001311 75 82 2C         [24] 4444 	mov	dpl, #0x2c
      001314 12 12 44         [24] 4445 	lcall	_diagType
      001317 D0 07            [24] 4446 	pop	ar7
      001319                       4447 00116$:
                                   4448 ;	minikeys.c:583: for(i=0; i<sizeof(diagPins); i++) {
      001319 0F               [12] 4449 	inc	r7
      00131A BF 0D 00         [24] 4450 	cjne	r7,#0x0d,00184$
      00131D                       4451 00184$:
      00131D 50 03            [24] 4452 	jnc	00185$
      00131F 02 12 98         [24] 4453 	ljmp	00115$
      001322                       4454 00185$:
                                   4455 ;	minikeys.c:595: while(CMD_take(cmd)) handleCommand();         // keeps BB 4D 4B working
      001322                       4456 00107$:
      001322 90 02 1B         [24] 4457 	mov	dptr,#_cmd
      001325 12 15 35         [24] 4458 	lcall	_CMD_take
      001328 E5 82            [12] 4459 	mov	a, dpl
      00132A 60 05            [24] 4460 	jz	00109$
      00132C 12 0D 50         [24] 4461 	lcall	_handleCommand
      00132F 80 F1            [24] 4462 	sjmp	00107$
      001331                       4463 00109$:
                                   4464 ;	minikeys.c:596: DLY_ms(5);
      001331 90 00 05         [24] 4465 	mov	dptr,#0x0005
      001334 12 14 7B         [24] 4466 	lcall	_DLY_ms
                                   4467 ;	minikeys.c:598: }
      001337 02 12 96         [24] 4468 	ljmp	00133$
                                   4469 ;------------------------------------------------------------
                                   4470 ;Allocation info for local variables in function 'main'
                                   4471 ;------------------------------------------------------------
                                   4472 ;i             Allocated to registers r6 
                                   4473 ;ms            Allocated to registers r7 
                                   4474 ;------------------------------------------------------------
                                   4475 ;	minikeys.c:605: void main(void) {
                                   4476 ;	-----------------------------------------
                                   4477 ;	 function main
                                   4478 ;	-----------------------------------------
      00133A                       4479 _main:
                                   4480 ;	minikeys.c:606: uint8_t i, ms = 0;
      00133A 7F 00            [12] 4481 	mov	r7,#0x00
                                   4482 ;	minikeys.c:608: NEO_init();
                                   4483 ;	assignBit
      00133C C2 B4            [12] 4484 	clr	_PP34
      00133E 53 96 EF         [24] 4485 	anl	_P3_MOD_OC,#0xef
      001341 43 97 10         [24] 4486 	orl	_P3_DIR_PU,#0x10
                                   4487 ;	src/system.h:71: SAFE_MOD = 0x55;
      001344 75 A1 55         [24] 4488 	mov	_SAFE_MOD,#0x55
                                   4489 ;	src/system.h:72: SAFE_MOD = 0xAA;                              // enter safe mode
      001347 75 A1 AA         [24] 4490 	mov	_SAFE_MOD,#0xaa
                                   4491 ;	src/system.h:80: __asm__("anl _CLOCK_CFG, #0b11111000");
      00134A 53 B9 F8         [24] 4492 	anl	_CLOCK_CFG, #0b11111000
                                   4493 ;	src/system.h:81: __asm__("orl _CLOCK_CFG, #0b00000101");     // 16MHz	
      00134D 43 B9 05         [24] 4494 	orl	_CLOCK_CFG, #0b00000101
                                   4495 ;	src/system.h:100: SAFE_MOD = 0x00;                              // terminate safe mode
      001350 75 A1 00         [24] 4496 	mov	_SAFE_MOD,#0x00
                                   4497 ;	minikeys.c:610: DLY_ms(10);
      001353 90 00 0A         [24] 4498 	mov	dptr,#0x000a
      001356 C0 07            [24] 4499 	push	ar7
      001358 12 14 7B         [24] 4500 	lcall	_DLY_ms
                                   4501 ;	minikeys.c:612: PIN_input_PU(PIN_KEY1);
      00135B 43 92 02         [24] 4502 	orl	_P1_MOD_OC,#0x02
      00135E 43 93 02         [24] 4503 	orl	_P1_DIR_PU,#0x02
                                   4504 ;	minikeys.c:613: PIN_input_PU(PIN_KEY2);
      001361 43 92 80         [24] 4505 	orl	_P1_MOD_OC,#0x80
      001364 43 93 80         [24] 4506 	orl	_P1_DIR_PU,#0x80
                                   4507 ;	minikeys.c:614: PIN_input_PU(PIN_KEY3);
      001367 43 92 40         [24] 4508 	orl	_P1_MOD_OC,#0x40
      00136A 43 93 40         [24] 4509 	orl	_P1_DIR_PU,#0x40
                                   4510 ;	minikeys.c:615: PIN_input_PU(PIN_ENC_A);
      00136D 43 96 01         [24] 4511 	orl	_P3_MOD_OC,#0x01
      001370 43 97 01         [24] 4512 	orl	_P3_DIR_PU,#0x01
                                   4513 ;	minikeys.c:616: PIN_input_PU(PIN_ENC_B);
      001373 43 96 02         [24] 4514 	orl	_P3_MOD_OC,#0x02
      001376 43 97 02         [24] 4515 	orl	_P3_DIR_PU,#0x02
                                   4516 ;	minikeys.c:617: PIN_input_PU(PIN_ENC_SW);
      001379 43 96 08         [24] 4517 	orl	_P3_MOD_OC,#0x08
      00137C 43 97 08         [24] 4518 	orl	_P3_DIR_PU,#0x08
                                   4519 ;	minikeys.c:618: DLY_ms(5);
      00137F 90 00 05         [24] 4520 	mov	dptr,#0x0005
      001382 12 14 7B         [24] 4521 	lcall	_DLY_ms
      001385 D0 07            [24] 4522 	pop	ar7
                                   4523 ;	minikeys.c:620: if(!PIN_read(PIN_KEY1)) enterBootloader();
      001387 20 91 07         [24] 4524 	jb	_PP11,00140$
      00138A C0 07            [24] 4525 	push	ar7
      00138C 12 0D 09         [24] 4526 	lcall	_enterBootloader
      00138F D0 07            [24] 4527 	pop	ar7
                                   4528 ;	minikeys.c:622: for(i=0; i<CONTROLS; i++) { heldMods[i] = 0; heldKeys[i] = 0; heldButtons[i] = 0; }
      001391                       4529 00140$:
      001391 7E 00            [12] 4530 	mov	r6,#0x00
      001393                       4531 00116$:
      001393 EE               [12] 4532 	mov	a,r6
      001394 24 F1            [12] 4533 	add	a, #_heldMods
      001396 F5 82            [12] 4534 	mov	dpl,a
      001398 E4               [12] 4535 	clr	a
      001399 34 01            [12] 4536 	addc	a, #(_heldMods >> 8)
      00139B F5 83            [12] 4537 	mov	dph,a
      00139D E4               [12] 4538 	clr	a
      00139E F0               [24] 4539 	movx	@dptr,a
      00139F EE               [12] 4540 	mov	a,r6
      0013A0 24 F7            [12] 4541 	add	a, #_heldKeys
      0013A2 F5 82            [12] 4542 	mov	dpl,a
      0013A4 E4               [12] 4543 	clr	a
      0013A5 34 01            [12] 4544 	addc	a, #(_heldKeys >> 8)
      0013A7 F5 83            [12] 4545 	mov	dph,a
      0013A9 E4               [12] 4546 	clr	a
      0013AA F0               [24] 4547 	movx	@dptr,a
      0013AB EE               [12] 4548 	mov	a,r6
      0013AC 24 FD            [12] 4549 	add	a, #_heldButtons
      0013AE F5 82            [12] 4550 	mov	dpl,a
      0013B0 E4               [12] 4551 	clr	a
      0013B1 34 01            [12] 4552 	addc	a, #(_heldButtons >> 8)
      0013B3 F5 83            [12] 4553 	mov	dph,a
      0013B5 E4               [12] 4554 	clr	a
      0013B6 F0               [24] 4555 	movx	@dptr,a
      0013B7 0E               [12] 4556 	inc	r6
      0013B8 BE 06 00         [24] 4557 	cjne	r6,#0x06,00222$
      0013BB                       4558 00222$:
      0013BB 40 D6            [24] 4559 	jc	00116$
                                   4560 ;	minikeys.c:623: for(i=0; i<NEO_COUNT; i++) pressLevel[i] = 0;
      0013BD 7E 00            [12] 4561 	mov	r6,#0x00
      0013BF                       4562 00118$:
      0013BF EE               [12] 4563 	mov	a,r6
      0013C0 24 0C            [12] 4564 	add	a, #_pressLevel
      0013C2 F5 82            [12] 4565 	mov	dpl,a
      0013C4 E4               [12] 4566 	clr	a
      0013C5 34 02            [12] 4567 	addc	a, #(_pressLevel >> 8)
      0013C7 F5 83            [12] 4568 	mov	dph,a
      0013C9 E4               [12] 4569 	clr	a
      0013CA F0               [24] 4570 	movx	@dptr,a
      0013CB 0E               [12] 4571 	inc	r6
      0013CC BE 03 00         [24] 4572 	cjne	r6,#0x03,00224$
      0013CF                       4573 00224$:
      0013CF 40 EE            [24] 4574 	jc	00118$
                                   4575 ;	minikeys.c:624: for(i=0; i<4; i++) { buttonStable[i] = 0; buttonCount[i] = 0; }
      0013D1 7E 00            [12] 4576 	mov	r6,#0x00
      0013D3                       4577 00120$:
      0013D3 EE               [12] 4578 	mov	a,r6
      0013D4 24 27            [12] 4579 	add	a, #_buttonStable
      0013D6 F5 82            [12] 4580 	mov	dpl,a
      0013D8 E4               [12] 4581 	clr	a
      0013D9 34 02            [12] 4582 	addc	a, #(_buttonStable >> 8)
      0013DB F5 83            [12] 4583 	mov	dph,a
      0013DD E4               [12] 4584 	clr	a
      0013DE F0               [24] 4585 	movx	@dptr,a
      0013DF EE               [12] 4586 	mov	a,r6
      0013E0 24 2B            [12] 4587 	add	a, #_buttonCount
      0013E2 F5 82            [12] 4588 	mov	dpl,a
      0013E4 E4               [12] 4589 	clr	a
      0013E5 34 02            [12] 4590 	addc	a, #(_buttonCount >> 8)
      0013E7 F5 83            [12] 4591 	mov	dph,a
      0013E9 E4               [12] 4592 	clr	a
      0013EA F0               [24] 4593 	movx	@dptr,a
      0013EB 0E               [12] 4594 	inc	r6
      0013EC BE 04 00         [24] 4595 	cjne	r6,#0x04,00226$
      0013EF                       4596 00226$:
      0013EF 40 E2            [24] 4597 	jc	00120$
                                   4598 ;	minikeys.c:625: encoderState = readEncoder();
      0013F1 C0 07            [24] 4599 	push	ar7
      0013F3 12 10 75         [24] 4600 	lcall	_readEncoder
      0013F6 E5 82            [12] 4601 	mov	a, dpl
      0013F8 78 31            [12] 4602 	mov	r0,#_encoderState
      0013FA F6               [12] 4603 	mov	@r0,a
                                   4604 ;	minikeys.c:626: loadSettings();
      0013FB 12 02 AA         [24] 4605 	lcall	_loadSettings
                                   4606 ;	minikeys.c:628: HID_init();
      0013FE 12 14 FD         [24] 4607 	lcall	_HID_init
                                   4608 ;	minikeys.c:631: DLY_ms(1500);                             // let the host finish enumerating
      001401 90 05 DC         [24] 4609 	mov	dptr,#0x05dc
      001404 12 14 7B         [24] 4610 	lcall	_DLY_ms
                                   4611 ;	minikeys.c:632: diagLoop();
      001407 12 12 56         [24] 4612 	lcall	_diagLoop
      00140A D0 07            [24] 4613 	pop	ar7
                                   4614 ;	minikeys.c:636: for(i=0; i<4; i++) {                    // 1 ms, sampling the knob every 250 us
      00140C                       4615 00146$:
      00140C 7E 00            [12] 4616 	mov	r6,#0x00
      00140E                       4617 00122$:
                                   4618 ;	minikeys.c:637: pollEncoder();
      00140E C0 07            [24] 4619 	push	ar7
      001410 C0 06            [24] 4620 	push	ar6
      001412 12 10 8C         [24] 4621 	lcall	_pollEncoder
                                   4622 ;	minikeys.c:638: DLY_us(250);
      001415 90 00 FA         [24] 4623 	mov	dptr,#0x00fa
      001418 12 14 5C         [24] 4624 	lcall	_DLY_us
      00141B D0 06            [24] 4625 	pop	ar6
      00141D D0 07            [24] 4626 	pop	ar7
                                   4627 ;	minikeys.c:636: for(i=0; i<4; i++) {                    // 1 ms, sampling the knob every 250 us
      00141F 0E               [12] 4628 	inc	r6
      001420 BE 04 00         [24] 4629 	cjne	r6,#0x04,00228$
      001423                       4630 00228$:
      001423 40 E9            [24] 4631 	jc	00122$
                                   4632 ;	minikeys.c:640: pollButtons();
      001425 C0 07            [24] 4633 	push	ar7
      001427 12 11 28         [24] 4634 	lcall	_pollButtons
      00142A D0 07            [24] 4635 	pop	ar7
                                   4636 ;	minikeys.c:641: while(CMD_take(cmd)) handleCommand();
      00142C                       4637 00107$:
      00142C 90 02 1B         [24] 4638 	mov	dptr,#_cmd
      00142F C0 07            [24] 4639 	push	ar7
      001431 12 15 35         [24] 4640 	lcall	_CMD_take
      001434 E5 82            [12] 4641 	mov	a, dpl
      001436 D0 07            [24] 4642 	pop	ar7
      001438 60 09            [24] 4643 	jz	00109$
      00143A C0 07            [24] 4644 	push	ar7
      00143C 12 0D 50         [24] 4645 	lcall	_handleCommand
      00143F D0 07            [24] 4646 	pop	ar7
      001441 80 E9            [24] 4647 	sjmp	00107$
      001443                       4648 00109$:
                                   4649 ;	minikeys.c:642: if(++ms >= 20) {
      001443 0F               [12] 4650 	inc	r7
      001444 BF 14 00         [24] 4651 	cjne	r7,#0x14,00231$
      001447                       4652 00231$:
      001447 40 C3            [24] 4653 	jc	00146$
                                   4654 ;	minikeys.c:643: ms = 0;
      001449 7F 00            [12] 4655 	mov	r7,#0x00
                                   4656 ;	minikeys.c:644: frame++;
      00144B 78 2C            [12] 4657 	mov	r0,#_frame
      00144D 06               [12] 4658 	inc	@r0
      00144E B6 00 02         [24] 4659 	cjne	@r0,#0x00,00233$
      001451 08               [12] 4660 	inc	r0
      001452 06               [12] 4661 	inc	@r0
      001453                       4662 00233$:
                                   4663 ;	minikeys.c:645: renderLights();
      001453 C0 07            [24] 4664 	push	ar7
      001455 12 09 74         [24] 4665 	lcall	_renderLights
      001458 D0 07            [24] 4666 	pop	ar7
                                   4667 ;	minikeys.c:648: }
      00145A 80 B0            [24] 4668 	sjmp	00146$
                                   4669 	.area CSEG    (CODE)
                                   4670 	.area CONST   (CODE)
                                   4671 	.area CONST   (CODE)
      001B16                       4672 _keyPixel:
      001B16 00                    4673 	.db #0x00	; 0
      001B17 01                    4674 	.db #0x01	; 1
      001B18 02                    4675 	.db #0x02	; 2
                                   4676 	.area CSEG    (CODE)
                                   4677 	.area CONST   (CODE)
      001B19                       4678 _palette:
      001B19 FF                    4679 	.db #0xff	; 255
      001B1A 14                    4680 	.db #0x14	; 20
      001B1B 1E                    4681 	.db #0x1e	; 30
      001B1C 1E                    4682 	.db #0x1e	; 30
      001B1D 50                    4683 	.db #0x50	; 80	'P'
      001B1E FF                    4684 	.db #0xff	; 255
      001B1F 1E                    4685 	.db #0x1e	; 30
      001B20 FF                    4686 	.db #0xff	; 255
      001B21 50                    4687 	.db #0x50	; 80	'P'
      001B22 96                    4688 	.db #0x96	; 150
      001B23 3C                    4689 	.db #0x3c	; 60
      001B24 FF                    4690 	.db #0xff	; 255
                                   4691 	.area CSEG    (CODE)
                                   4692 	.area CONST   (CODE)
      001B25                       4693 _encoderTable:
      001B25 00                    4694 	.db #0x00	;  0
      001B26 FF                    4695 	.db #0xff	; -1
      001B27 01                    4696 	.db #0x01	;  1
      001B28 00                    4697 	.db #0x00	;  0
      001B29 01                    4698 	.db #0x01	;  1
      001B2A 00                    4699 	.db #0x00	;  0
      001B2B 00                    4700 	.db #0x00	;  0
      001B2C FF                    4701 	.db #0xff	; -1
      001B2D FF                    4702 	.db #0xff	; -1
      001B2E 00                    4703 	.db #0x00	;  0
      001B2F 00                    4704 	.db #0x00	;  0
      001B30 01                    4705 	.db #0x01	;  1
      001B31 00                    4706 	.db #0x00	;  0
      001B32 01                    4707 	.db #0x01	;  1
      001B33 FF                    4708 	.db #0xff	; -1
      001B34 00                    4709 	.db #0x00	;  0
                                   4710 	.area CSEG    (CODE)
                                   4711 	.area CONST   (CODE)
      001B35                       4712 _diagPins:
      001B35 00                    4713 	.db #0x00	; 0
      001B36 01                    4714 	.db #0x01	; 1
      001B37 02                    4715 	.db #0x02	; 2
      001B38 03                    4716 	.db #0x03	; 3
      001B39 04                    4717 	.db #0x04	; 4
      001B3A 05                    4718 	.db #0x05	; 5
      001B3B 06                    4719 	.db #0x06	; 6
      001B3C 07                    4720 	.db #0x07	; 7
      001B3D 08                    4721 	.db #0x08	; 8
      001B3E 09                    4722 	.db #0x09	; 9
      001B3F 0A                    4723 	.db #0x0a	; 10
      001B40 0B                    4724 	.db #0x0b	; 11
      001B41 0D                    4725 	.db #0x0d	; 13
                                   4726 	.area CSEG    (CODE)
                                   4727 	.area CONST   (CODE)
      001B42                       4728 _diagNames:
      001B42 01                    4729 	.db #0x01	; 1
      001B43 00                    4730 	.db #0x00	; 0
      001B44 01                    4731 	.db #0x01	; 1
      001B45 01                    4732 	.db #0x01	; 1
      001B46 01                    4733 	.db #0x01	; 1
      001B47 02                    4734 	.db #0x02	; 2
      001B48 01                    4735 	.db #0x01	; 1
      001B49 03                    4736 	.db #0x03	; 3
      001B4A 01                    4737 	.db #0x01	; 1
      001B4B 04                    4738 	.db #0x04	; 4
      001B4C 01                    4739 	.db #0x01	; 1
      001B4D 05                    4740 	.db #0x05	; 5
      001B4E 01                    4741 	.db #0x01	; 1
      001B4F 06                    4742 	.db #0x06	; 6
      001B50 01                    4743 	.db #0x01	; 1
      001B51 07                    4744 	.db #0x07	; 7
      001B52 03                    4745 	.db #0x03	; 3
      001B53 00                    4746 	.db #0x00	; 0
      001B54 03                    4747 	.db #0x03	; 3
      001B55 01                    4748 	.db #0x01	; 1
      001B56 03                    4749 	.db #0x03	; 3
      001B57 02                    4750 	.db #0x02	; 2
      001B58 03                    4751 	.db #0x03	; 3
      001B59 03                    4752 	.db #0x03	; 3
      001B5A 03                    4753 	.db #0x03	; 3
      001B5B 05                    4754 	.db #0x05	; 5
                                   4755 	.area CSEG    (CODE)
                                   4756 	.area CABS    (ABS,CODE)
