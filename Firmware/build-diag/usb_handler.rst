                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.6.0 #16555 (Mac OS X ppc)
                                      4 ;--------------------------------------------------------
                                      5 	.module usb_handler
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _USB_EP0_OUT
                                     12 	.globl _USB_EP0_IN
                                     13 	.globl _USB_EP0_SETUP
                                     14 	.globl _USB_EP0_copyDescr
                                     15 	.globl _CMD_EP2_OUT
                                     16 	.globl _HID_EP1_IN
                                     17 	.globl _HID_reset
                                     18 	.globl _HID_setup
                                     19 	.globl _UIF_BUS_RST
                                     20 	.globl _UIF_DETECT
                                     21 	.globl _UIF_TRANSFER
                                     22 	.globl _UIF_SUSPEND
                                     23 	.globl _UIF_HST_SOF
                                     24 	.globl _UIF_FIFO_OV
                                     25 	.globl _U_SIE_FREE
                                     26 	.globl _U_TOG_OK
                                     27 	.globl _U_IS_NAK
                                     28 	.globl _ADC_CHAN0
                                     29 	.globl _ADC_CHAN1
                                     30 	.globl _CMP_CHAN
                                     31 	.globl _ADC_START
                                     32 	.globl _ADC_IF
                                     33 	.globl _CMP_IF
                                     34 	.globl _CMPO
                                     35 	.globl _U1RI
                                     36 	.globl _U1TI
                                     37 	.globl _U1RB8
                                     38 	.globl _U1TB8
                                     39 	.globl _U1REN
                                     40 	.globl _U1SMOD
                                     41 	.globl _U1SM0
                                     42 	.globl _S0_R_FIFO
                                     43 	.globl _S0_T_FIFO
                                     44 	.globl _S0_FREE
                                     45 	.globl _S0_IF_BYTE
                                     46 	.globl _S0_IF_FIRST
                                     47 	.globl _S0_IF_OV
                                     48 	.globl _S0_FST_ACT
                                     49 	.globl _CP_RL2
                                     50 	.globl _C_T2
                                     51 	.globl _TR2
                                     52 	.globl _EXEN2
                                     53 	.globl _TCLK
                                     54 	.globl _RCLK
                                     55 	.globl _EXF2
                                     56 	.globl _CAP1F
                                     57 	.globl _TF2
                                     58 	.globl _RI
                                     59 	.globl _TI
                                     60 	.globl _RB8
                                     61 	.globl _TB8
                                     62 	.globl _REN
                                     63 	.globl _SM2
                                     64 	.globl _SM1
                                     65 	.globl _SM0
                                     66 	.globl _IT0
                                     67 	.globl _IE0
                                     68 	.globl _IT1
                                     69 	.globl _IE1
                                     70 	.globl _TR0
                                     71 	.globl _TF0
                                     72 	.globl _TR1
                                     73 	.globl _TF1
                                     74 	.globl _RXD
                                     75 	.globl _PWM1_
                                     76 	.globl _TXD
                                     77 	.globl _PWM2_
                                     78 	.globl _AIN3
                                     79 	.globl _VBUS1
                                     80 	.globl _INT0
                                     81 	.globl _TXD1_
                                     82 	.globl _INT1
                                     83 	.globl _T0
                                     84 	.globl _RXD1_
                                     85 	.globl _PWM2
                                     86 	.globl _T1
                                     87 	.globl _UDP
                                     88 	.globl _UDM
                                     89 	.globl _TIN0
                                     90 	.globl _CAP1
                                     91 	.globl _T2
                                     92 	.globl _AIN0
                                     93 	.globl _VBUS2
                                     94 	.globl _TIN1
                                     95 	.globl _CAP2
                                     96 	.globl _T2EX
                                     97 	.globl _RXD_
                                     98 	.globl _TXD_
                                     99 	.globl _AIN1
                                    100 	.globl _UCC1
                                    101 	.globl _TIN2
                                    102 	.globl _SCS
                                    103 	.globl _CAP1_
                                    104 	.globl _T2_
                                    105 	.globl _AIN2
                                    106 	.globl _UCC2
                                    107 	.globl _TIN3
                                    108 	.globl _PWM1
                                    109 	.globl _MOSI
                                    110 	.globl _TIN4
                                    111 	.globl _RXD1
                                    112 	.globl _MISO
                                    113 	.globl _TIN5
                                    114 	.globl _TXD1
                                    115 	.globl _SCK
                                    116 	.globl _IE_SPI0
                                    117 	.globl _IE_TKEY
                                    118 	.globl _IE_USB
                                    119 	.globl _IE_ADC
                                    120 	.globl _IE_UART1
                                    121 	.globl _IE_PWMX
                                    122 	.globl _IE_GPIO
                                    123 	.globl _IE_WDOG
                                    124 	.globl _PX0
                                    125 	.globl _PT0
                                    126 	.globl _PX1
                                    127 	.globl _PT1
                                    128 	.globl _PS
                                    129 	.globl _PT2
                                    130 	.globl _PL_FLAG
                                    131 	.globl _PH_FLAG
                                    132 	.globl _EX0
                                    133 	.globl _ET0
                                    134 	.globl _EX1
                                    135 	.globl _ET1
                                    136 	.globl _ES
                                    137 	.globl _ET2
                                    138 	.globl _E_DIS
                                    139 	.globl _EA
                                    140 	.globl _P
                                    141 	.globl _F1
                                    142 	.globl _OV
                                    143 	.globl _RS0
                                    144 	.globl _RS1
                                    145 	.globl _F0
                                    146 	.globl _AC
                                    147 	.globl _CY
                                    148 	.globl _UEP1_DMA_H
                                    149 	.globl _UEP1_DMA_L
                                    150 	.globl _UEP1_DMA
                                    151 	.globl _UEP0_DMA_H
                                    152 	.globl _UEP0_DMA_L
                                    153 	.globl _UEP0_DMA
                                    154 	.globl _UEP2_3_MOD
                                    155 	.globl _UEP4_1_MOD
                                    156 	.globl _UEP3_DMA_H
                                    157 	.globl _UEP3_DMA_L
                                    158 	.globl _UEP3_DMA
                                    159 	.globl _UEP2_DMA_H
                                    160 	.globl _UEP2_DMA_L
                                    161 	.globl _UEP2_DMA
                                    162 	.globl _USB_DEV_AD
                                    163 	.globl _USB_CTRL
                                    164 	.globl _USB_INT_EN
                                    165 	.globl _UEP4_T_LEN
                                    166 	.globl _UEP4_CTRL
                                    167 	.globl _UEP0_T_LEN
                                    168 	.globl _UEP0_CTRL
                                    169 	.globl _USB_RX_LEN
                                    170 	.globl _USB_MIS_ST
                                    171 	.globl _USB_INT_ST
                                    172 	.globl _USB_INT_FG
                                    173 	.globl _UEP3_T_LEN
                                    174 	.globl _UEP3_CTRL
                                    175 	.globl _UEP2_T_LEN
                                    176 	.globl _UEP2_CTRL
                                    177 	.globl _UEP1_T_LEN
                                    178 	.globl _UEP1_CTRL
                                    179 	.globl _UDEV_CTRL
                                    180 	.globl _USB_C_CTRL
                                    181 	.globl _TKEY_DATH
                                    182 	.globl _TKEY_DATL
                                    183 	.globl _TKEY_DAT
                                    184 	.globl _TKEY_CTRL
                                    185 	.globl _ADC_DATA
                                    186 	.globl _ADC_CFG
                                    187 	.globl _ADC_CTRL
                                    188 	.globl _SBAUD1
                                    189 	.globl _SBUF1
                                    190 	.globl _SCON1
                                    191 	.globl _SPI0_SETUP
                                    192 	.globl _SPI0_CK_SE
                                    193 	.globl _SPI0_CTRL
                                    194 	.globl _SPI0_DATA
                                    195 	.globl _SPI0_STAT
                                    196 	.globl _PWM_CK_SE
                                    197 	.globl _PWM_CTRL
                                    198 	.globl _PWM_DATA1
                                    199 	.globl _PWM_DATA2
                                    200 	.globl _T2CAP1H
                                    201 	.globl _T2CAP1L
                                    202 	.globl _T2CAP1
                                    203 	.globl _TH2
                                    204 	.globl _TL2
                                    205 	.globl _T2COUNT
                                    206 	.globl _RCAP2H
                                    207 	.globl _RCAP2L
                                    208 	.globl _RCAP2
                                    209 	.globl _T2MOD
                                    210 	.globl _T2CON
                                    211 	.globl _SBUF
                                    212 	.globl _SCON
                                    213 	.globl _TH1
                                    214 	.globl _TH0
                                    215 	.globl _TL1
                                    216 	.globl _TL0
                                    217 	.globl _TMOD
                                    218 	.globl _TCON
                                    219 	.globl _XBUS_AUX
                                    220 	.globl _PIN_FUNC
                                    221 	.globl _P3_DIR_PU
                                    222 	.globl _P3_MOD_OC
                                    223 	.globl _P3
                                    224 	.globl _P2
                                    225 	.globl _P1_DIR_PU
                                    226 	.globl _P1_MOD_OC
                                    227 	.globl _P1
                                    228 	.globl _ROM_CTRL
                                    229 	.globl _ROM_DATA_H
                                    230 	.globl _ROM_DATA_L
                                    231 	.globl _ROM_DATA
                                    232 	.globl _ROM_ADDR_H
                                    233 	.globl _ROM_ADDR_L
                                    234 	.globl _ROM_ADDR
                                    235 	.globl _GPIO_IE
                                    236 	.globl _IP_EX
                                    237 	.globl _IE_EX
                                    238 	.globl _IP
                                    239 	.globl _IE
                                    240 	.globl _WDOG_COUNT
                                    241 	.globl _RESET_KEEP
                                    242 	.globl _WAKE_CTRL
                                    243 	.globl _CLOCK_CFG
                                    244 	.globl _PCON
                                    245 	.globl _GLOBAL_CFG
                                    246 	.globl _SAFE_MOD
                                    247 	.globl _DPH
                                    248 	.globl _DPL
                                    249 	.globl _SP
                                    250 	.globl _B
                                    251 	.globl _ACC
                                    252 	.globl _PSW
                                    253 	.globl _EP2_buffer
                                    254 	.globl _EP1_buffer
                                    255 	.globl _EP0_buffer
                                    256 	.globl _pDescr
                                    257 	.globl _UsbConfig
                                    258 	.globl _SetupReq
                                    259 	.globl _SetupLen
                                    260 	.globl _USB_interrupt
                                    261 	.globl _USB_init
                                    262 ;--------------------------------------------------------
                                    263 ; special function registers
                                    264 ;--------------------------------------------------------
                                    265 	.area RSEG    (ABS,DATA)
      000000                        266 	.org 0x0000
                           0000D0   267 _PSW	=	0x00d0
                           0000E0   268 _ACC	=	0x00e0
                           0000F0   269 _B	=	0x00f0
                           000081   270 _SP	=	0x0081
                           000082   271 _DPL	=	0x0082
                           000083   272 _DPH	=	0x0083
                           0000A1   273 _SAFE_MOD	=	0x00a1
                           0000B1   274 _GLOBAL_CFG	=	0x00b1
                           000087   275 _PCON	=	0x0087
                           0000B9   276 _CLOCK_CFG	=	0x00b9
                           0000A9   277 _WAKE_CTRL	=	0x00a9
                           0000FE   278 _RESET_KEEP	=	0x00fe
                           0000FF   279 _WDOG_COUNT	=	0x00ff
                           0000A8   280 _IE	=	0x00a8
                           0000B8   281 _IP	=	0x00b8
                           0000E8   282 _IE_EX	=	0x00e8
                           0000E9   283 _IP_EX	=	0x00e9
                           0000C7   284 _GPIO_IE	=	0x00c7
                           008584   285 _ROM_ADDR	=	0x8584
                           000084   286 _ROM_ADDR_L	=	0x0084
                           000085   287 _ROM_ADDR_H	=	0x0085
                           008F8E   288 _ROM_DATA	=	0x8f8e
                           00008E   289 _ROM_DATA_L	=	0x008e
                           00008F   290 _ROM_DATA_H	=	0x008f
                           000086   291 _ROM_CTRL	=	0x0086
                           000090   292 _P1	=	0x0090
                           000092   293 _P1_MOD_OC	=	0x0092
                           000093   294 _P1_DIR_PU	=	0x0093
                           0000A0   295 _P2	=	0x00a0
                           0000B0   296 _P3	=	0x00b0
                           000096   297 _P3_MOD_OC	=	0x0096
                           000097   298 _P3_DIR_PU	=	0x0097
                           0000C6   299 _PIN_FUNC	=	0x00c6
                           0000A2   300 _XBUS_AUX	=	0x00a2
                           000088   301 _TCON	=	0x0088
                           000089   302 _TMOD	=	0x0089
                           00008A   303 _TL0	=	0x008a
                           00008B   304 _TL1	=	0x008b
                           00008C   305 _TH0	=	0x008c
                           00008D   306 _TH1	=	0x008d
                           000098   307 _SCON	=	0x0098
                           000099   308 _SBUF	=	0x0099
                           0000C8   309 _T2CON	=	0x00c8
                           0000C9   310 _T2MOD	=	0x00c9
                           00CBCA   311 _RCAP2	=	0xcbca
                           0000CA   312 _RCAP2L	=	0x00ca
                           0000CB   313 _RCAP2H	=	0x00cb
                           00CDCC   314 _T2COUNT	=	0xcdcc
                           0000CC   315 _TL2	=	0x00cc
                           0000CD   316 _TH2	=	0x00cd
                           00CFCE   317 _T2CAP1	=	0xcfce
                           0000CE   318 _T2CAP1L	=	0x00ce
                           0000CF   319 _T2CAP1H	=	0x00cf
                           00009B   320 _PWM_DATA2	=	0x009b
                           00009C   321 _PWM_DATA1	=	0x009c
                           00009D   322 _PWM_CTRL	=	0x009d
                           00009E   323 _PWM_CK_SE	=	0x009e
                           0000F8   324 _SPI0_STAT	=	0x00f8
                           0000F9   325 _SPI0_DATA	=	0x00f9
                           0000FA   326 _SPI0_CTRL	=	0x00fa
                           0000FB   327 _SPI0_CK_SE	=	0x00fb
                           0000FC   328 _SPI0_SETUP	=	0x00fc
                           0000C0   329 _SCON1	=	0x00c0
                           0000C1   330 _SBUF1	=	0x00c1
                           0000C2   331 _SBAUD1	=	0x00c2
                           000080   332 _ADC_CTRL	=	0x0080
                           00009A   333 _ADC_CFG	=	0x009a
                           00009F   334 _ADC_DATA	=	0x009f
                           0000C3   335 _TKEY_CTRL	=	0x00c3
                           00C5C4   336 _TKEY_DAT	=	0xc5c4
                           0000C4   337 _TKEY_DATL	=	0x00c4
                           0000C5   338 _TKEY_DATH	=	0x00c5
                           000091   339 _USB_C_CTRL	=	0x0091
                           0000D1   340 _UDEV_CTRL	=	0x00d1
                           0000D2   341 _UEP1_CTRL	=	0x00d2
                           0000D3   342 _UEP1_T_LEN	=	0x00d3
                           0000D4   343 _UEP2_CTRL	=	0x00d4
                           0000D5   344 _UEP2_T_LEN	=	0x00d5
                           0000D6   345 _UEP3_CTRL	=	0x00d6
                           0000D7   346 _UEP3_T_LEN	=	0x00d7
                           0000D8   347 _USB_INT_FG	=	0x00d8
                           0000D9   348 _USB_INT_ST	=	0x00d9
                           0000DA   349 _USB_MIS_ST	=	0x00da
                           0000DB   350 _USB_RX_LEN	=	0x00db
                           0000DC   351 _UEP0_CTRL	=	0x00dc
                           0000DD   352 _UEP0_T_LEN	=	0x00dd
                           0000DE   353 _UEP4_CTRL	=	0x00de
                           0000DF   354 _UEP4_T_LEN	=	0x00df
                           0000E1   355 _USB_INT_EN	=	0x00e1
                           0000E2   356 _USB_CTRL	=	0x00e2
                           0000E3   357 _USB_DEV_AD	=	0x00e3
                           00E5E4   358 _UEP2_DMA	=	0xe5e4
                           0000E4   359 _UEP2_DMA_L	=	0x00e4
                           0000E5   360 _UEP2_DMA_H	=	0x00e5
                           00E7E6   361 _UEP3_DMA	=	0xe7e6
                           0000E6   362 _UEP3_DMA_L	=	0x00e6
                           0000E7   363 _UEP3_DMA_H	=	0x00e7
                           0000EA   364 _UEP4_1_MOD	=	0x00ea
                           0000EB   365 _UEP2_3_MOD	=	0x00eb
                           00EDEC   366 _UEP0_DMA	=	0xedec
                           0000EC   367 _UEP0_DMA_L	=	0x00ec
                           0000ED   368 _UEP0_DMA_H	=	0x00ed
                           00EFEE   369 _UEP1_DMA	=	0xefee
                           0000EE   370 _UEP1_DMA_L	=	0x00ee
                           0000EF   371 _UEP1_DMA_H	=	0x00ef
                                    372 ;--------------------------------------------------------
                                    373 ; special function bits
                                    374 ;--------------------------------------------------------
                                    375 	.area RSEG    (ABS,DATA)
      000000                        376 	.org 0x0000
                           0000D7   377 _CY	=	0x00d7
                           0000D6   378 _AC	=	0x00d6
                           0000D5   379 _F0	=	0x00d5
                           0000D4   380 _RS1	=	0x00d4
                           0000D3   381 _RS0	=	0x00d3
                           0000D2   382 _OV	=	0x00d2
                           0000D1   383 _F1	=	0x00d1
                           0000D0   384 _P	=	0x00d0
                           0000AF   385 _EA	=	0x00af
                           0000AE   386 _E_DIS	=	0x00ae
                           0000AD   387 _ET2	=	0x00ad
                           0000AC   388 _ES	=	0x00ac
                           0000AB   389 _ET1	=	0x00ab
                           0000AA   390 _EX1	=	0x00aa
                           0000A9   391 _ET0	=	0x00a9
                           0000A8   392 _EX0	=	0x00a8
                           0000BF   393 _PH_FLAG	=	0x00bf
                           0000BE   394 _PL_FLAG	=	0x00be
                           0000BD   395 _PT2	=	0x00bd
                           0000BC   396 _PS	=	0x00bc
                           0000BB   397 _PT1	=	0x00bb
                           0000BA   398 _PX1	=	0x00ba
                           0000B9   399 _PT0	=	0x00b9
                           0000B8   400 _PX0	=	0x00b8
                           0000EF   401 _IE_WDOG	=	0x00ef
                           0000EE   402 _IE_GPIO	=	0x00ee
                           0000ED   403 _IE_PWMX	=	0x00ed
                           0000EC   404 _IE_UART1	=	0x00ec
                           0000EB   405 _IE_ADC	=	0x00eb
                           0000EA   406 _IE_USB	=	0x00ea
                           0000E9   407 _IE_TKEY	=	0x00e9
                           0000E8   408 _IE_SPI0	=	0x00e8
                           000097   409 _SCK	=	0x0097
                           000097   410 _TXD1	=	0x0097
                           000097   411 _TIN5	=	0x0097
                           000096   412 _MISO	=	0x0096
                           000096   413 _RXD1	=	0x0096
                           000096   414 _TIN4	=	0x0096
                           000095   415 _MOSI	=	0x0095
                           000095   416 _PWM1	=	0x0095
                           000095   417 _TIN3	=	0x0095
                           000095   418 _UCC2	=	0x0095
                           000095   419 _AIN2	=	0x0095
                           000094   420 _T2_	=	0x0094
                           000094   421 _CAP1_	=	0x0094
                           000094   422 _SCS	=	0x0094
                           000094   423 _TIN2	=	0x0094
                           000094   424 _UCC1	=	0x0094
                           000094   425 _AIN1	=	0x0094
                           000093   426 _TXD_	=	0x0093
                           000092   427 _RXD_	=	0x0092
                           000091   428 _T2EX	=	0x0091
                           000091   429 _CAP2	=	0x0091
                           000091   430 _TIN1	=	0x0091
                           000091   431 _VBUS2	=	0x0091
                           000091   432 _AIN0	=	0x0091
                           000090   433 _T2	=	0x0090
                           000090   434 _CAP1	=	0x0090
                           000090   435 _TIN0	=	0x0090
                           0000B7   436 _UDM	=	0x00b7
                           0000B6   437 _UDP	=	0x00b6
                           0000B5   438 _T1	=	0x00b5
                           0000B4   439 _PWM2	=	0x00b4
                           0000B4   440 _RXD1_	=	0x00b4
                           0000B4   441 _T0	=	0x00b4
                           0000B3   442 _INT1	=	0x00b3
                           0000B2   443 _TXD1_	=	0x00b2
                           0000B2   444 _INT0	=	0x00b2
                           0000B2   445 _VBUS1	=	0x00b2
                           0000B2   446 _AIN3	=	0x00b2
                           0000B1   447 _PWM2_	=	0x00b1
                           0000B1   448 _TXD	=	0x00b1
                           0000B0   449 _PWM1_	=	0x00b0
                           0000B0   450 _RXD	=	0x00b0
                           00008F   451 _TF1	=	0x008f
                           00008E   452 _TR1	=	0x008e
                           00008D   453 _TF0	=	0x008d
                           00008C   454 _TR0	=	0x008c
                           00008B   455 _IE1	=	0x008b
                           00008A   456 _IT1	=	0x008a
                           000089   457 _IE0	=	0x0089
                           000088   458 _IT0	=	0x0088
                           00009F   459 _SM0	=	0x009f
                           00009E   460 _SM1	=	0x009e
                           00009D   461 _SM2	=	0x009d
                           00009C   462 _REN	=	0x009c
                           00009B   463 _TB8	=	0x009b
                           00009A   464 _RB8	=	0x009a
                           000099   465 _TI	=	0x0099
                           000098   466 _RI	=	0x0098
                           0000CF   467 _TF2	=	0x00cf
                           0000CF   468 _CAP1F	=	0x00cf
                           0000CE   469 _EXF2	=	0x00ce
                           0000CD   470 _RCLK	=	0x00cd
                           0000CC   471 _TCLK	=	0x00cc
                           0000CB   472 _EXEN2	=	0x00cb
                           0000CA   473 _TR2	=	0x00ca
                           0000C9   474 _C_T2	=	0x00c9
                           0000C8   475 _CP_RL2	=	0x00c8
                           0000FF   476 _S0_FST_ACT	=	0x00ff
                           0000FE   477 _S0_IF_OV	=	0x00fe
                           0000FD   478 _S0_IF_FIRST	=	0x00fd
                           0000FC   479 _S0_IF_BYTE	=	0x00fc
                           0000FB   480 _S0_FREE	=	0x00fb
                           0000FA   481 _S0_T_FIFO	=	0x00fa
                           0000F8   482 _S0_R_FIFO	=	0x00f8
                           0000C7   483 _U1SM0	=	0x00c7
                           0000C5   484 _U1SMOD	=	0x00c5
                           0000C4   485 _U1REN	=	0x00c4
                           0000C3   486 _U1TB8	=	0x00c3
                           0000C2   487 _U1RB8	=	0x00c2
                           0000C1   488 _U1TI	=	0x00c1
                           0000C0   489 _U1RI	=	0x00c0
                           000087   490 _CMPO	=	0x0087
                           000086   491 _CMP_IF	=	0x0086
                           000085   492 _ADC_IF	=	0x0085
                           000084   493 _ADC_START	=	0x0084
                           000083   494 _CMP_CHAN	=	0x0083
                           000081   495 _ADC_CHAN1	=	0x0081
                           000080   496 _ADC_CHAN0	=	0x0080
                           0000DF   497 _U_IS_NAK	=	0x00df
                           0000DE   498 _U_TOG_OK	=	0x00de
                           0000DD   499 _U_SIE_FREE	=	0x00dd
                           0000DC   500 _UIF_FIFO_OV	=	0x00dc
                           0000DB   501 _UIF_HST_SOF	=	0x00db
                           0000DA   502 _UIF_SUSPEND	=	0x00da
                           0000D9   503 _UIF_TRANSFER	=	0x00d9
                           0000D8   504 _UIF_DETECT	=	0x00d8
                           0000D8   505 _UIF_BUS_RST	=	0x00d8
                                    506 ;--------------------------------------------------------
                                    507 ; overlayable register banks
                                    508 ;--------------------------------------------------------
                                    509 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        510 	.ds 8
                                    511 ;--------------------------------------------------------
                                    512 ; internal ram data
                                    513 ;--------------------------------------------------------
                                    514 	.area DSEG    (DATA)
      000022                        515 _SetupLen::
      000022                        516 	.ds 2
      000024                        517 _SetupReq::
      000024                        518 	.ds 1
      000025                        519 _UsbConfig::
      000025                        520 	.ds 1
      000026                        521 _pDescr::
      000026                        522 	.ds 2
                                    523 ;--------------------------------------------------------
                                    524 ; overlayable items in internal ram
                                    525 ;--------------------------------------------------------
                                    526 	.area	OSEG    (OVR,DATA)
                                    527 ;--------------------------------------------------------
                                    528 ; indirectly addressable internal ram data
                                    529 ;--------------------------------------------------------
                                    530 	.area ISEG    (DATA)
                                    531 ;--------------------------------------------------------
                                    532 ; absolute internal ram data
                                    533 ;--------------------------------------------------------
                                    534 	.area IABS    (ABS,DATA)
                                    535 	.area IABS    (ABS,DATA)
                                    536 ;--------------------------------------------------------
                                    537 ; bit data
                                    538 ;--------------------------------------------------------
                                    539 	.area BSEG    (BIT)
                                    540 ;--------------------------------------------------------
                                    541 ; paged external ram data
                                    542 ;--------------------------------------------------------
                                    543 	.area PSEG    (PAG,XDATA)
                                    544 ;--------------------------------------------------------
                                    545 ; uninitialized external ram data
                                    546 ;--------------------------------------------------------
                                    547 	.area XSEG    (XDATA)
                           000000   548 _EP0_buffer	=	0x0000
                           000040   549 _EP1_buffer	=	0x0040
                           000052   550 _EP2_buffer	=	0x0052
                                    551 ;--------------------------------------------------------
                                    552 ; absolute external ram data
                                    553 ;--------------------------------------------------------
                                    554 	.area XABS    (ABS,XDATA)
                                    555 ;--------------------------------------------------------
                                    556 ; initialized external ram data
                                    557 ;--------------------------------------------------------
                                    558 	.area HOME    (CODE)
                                    559 	.area GSINIT0 (CODE)
                                    560 	.area GSINIT1 (CODE)
                                    561 	.area GSINIT2 (CODE)
                                    562 	.area GSINIT3 (CODE)
                                    563 	.area GSINIT4 (CODE)
                                    564 	.area GSINIT5 (CODE)
                                    565 	.area GSINIT  (CODE)
                                    566 	.area GSFINAL (CODE)
                                    567 	.area CSEG    (CODE)
                                    568 ;--------------------------------------------------------
                                    569 ; global & static initialisations
                                    570 ;--------------------------------------------------------
                                    571 	.area HOME    (CODE)
                                    572 	.area GSINIT  (CODE)
                                    573 	.area GSFINAL (CODE)
                                    574 	.area GSINIT  (CODE)
                                    575 ;--------------------------------------------------------
                                    576 ; Home
                                    577 ;--------------------------------------------------------
                                    578 	.area HOME    (CODE)
                                    579 	.area HOME    (CODE)
                                    580 ;--------------------------------------------------------
                                    581 ; code
                                    582 ;--------------------------------------------------------
                                    583 	.area CSEG    (CODE)
                                    584 ;------------------------------------------------------------
                                    585 ;Allocation info for local variables in function 'USB_EP0_copyDescr'
                                    586 ;------------------------------------------------------------
                                    587 ;len           Allocated to registers 
                                    588 ;------------------------------------------------------------
                                    589 ;	src/usb_handler.c:18: void USB_EP0_copyDescr(uint8_t len) {
                                    590 ;	-----------------------------------------
                                    591 ;	 function USB_EP0_copyDescr
                                    592 ;	-----------------------------------------
      0016B7                        593 _USB_EP0_copyDescr:
                           000007   594 	ar7 = 0x07
                           000006   595 	ar6 = 0x06
                           000005   596 	ar5 = 0x05
                           000004   597 	ar4 = 0x04
                           000003   598 	ar3 = 0x03
                           000002   599 	ar2 = 0x02
                           000001   600 	ar1 = 0x01
                           000000   601 	ar0 = 0x00
                                    602 ;	src/usb_handler.c:35: __endasm;
      0016B7 C0 07            [24]  603 	push ar7 ; r7 -> stack
      0016B9 AF 82            [24]  604 	mov r7, dpl ; r7 <- len
      0016BB 05 A2            [12]  605 	inc _XBUS_AUX ; select dptr1
      0016BD 90 00 00         [24]  606 	mov dptr, #_EP0_buffer ; dptr1 <- EP0_buffer
      0016C0 15 A2            [12]  607 	dec _XBUS_AUX ; select dptr0
      0016C2 85 26 82         [24]  608 	mov dpl, _pDescr ; dptr0 <- *pDescr
      0016C5 85 27 83         [24]  609 	mov dph, (_pDescr + 1)
      0016C8                        610 01$:
      0016C8 E4               [12]  611 	clr a ; acc <- #0
      0016C9 93               [24]  612 	movc a, @a+dptr ; acc <- *pDescr[dptr0]
      0016CA A3               [24]  613 	inc dptr ; inc dptr0
      0016CB A5                     614 	.DB 0xA5 ; acc -> EP0_buffer[dptr1] & inc dptr1
      0016CC DF FA            [24]  615 	djnz r7, 01$ ; repeat len times
      0016CE D0 07            [24]  616 	pop ar7 ; r7 <- stack
                                    617 ;	src/usb_handler.c:36: }
      0016D0 22               [24]  618 	ret
                                    619 ;------------------------------------------------------------
                                    620 ;Allocation info for local variables in function 'USB_EP0_SETUP'
                                    621 ;------------------------------------------------------------
                                    622 ;len           Allocated to registers r7 
                                    623 ;------------------------------------------------------------
                                    624 ;	src/usb_handler.c:42: void USB_EP0_SETUP(void) {
                                    625 ;	-----------------------------------------
                                    626 ;	 function USB_EP0_SETUP
                                    627 ;	-----------------------------------------
      0016D1                        628 _USB_EP0_SETUP:
                                    629 ;	src/usb_handler.c:43: uint8_t len = USB_RX_LEN;
      0016D1 AF DB            [24]  630 	mov	r7,_USB_RX_LEN
                                    631 ;	src/usb_handler.c:44: if(len == (sizeof(USB_SETUP_REQ))) {
      0016D3 BF 08 02         [24]  632 	cjne	r7,#0x08,00419$
      0016D6 80 03            [24]  633 	sjmp	00420$
      0016D8                        634 00419$:
      0016D8 02 19 76         [24]  635 	ljmp	00175$
      0016DB                        636 00420$:
                                    637 ;	src/usb_handler.c:45: SetupLen = ((uint16_t)USB_setupBuf->wLengthH<<8) | (USB_setupBuf->wLengthL);
      0016DB 90 00 07         [24]  638 	mov	dptr,#(_EP0_buffer + 0x0007)
      0016DE E0               [24]  639 	movx	a,@dptr
      0016DF FE               [12]  640 	mov	r6,a
      0016E0 7F 00            [12]  641 	mov	r7,#0x00
      0016E2 90 00 06         [24]  642 	mov	dptr,#(_EP0_buffer + 0x0006)
      0016E5 E0               [24]  643 	movx	a,@dptr
      0016E6 FD               [12]  644 	mov	r5,a
      0016E7 7C 00            [12]  645 	mov	r4,#0x00
      0016E9 4F               [12]  646 	orl	a,r7
      0016EA F5 22            [12]  647 	mov	_SetupLen,a
      0016EC EC               [12]  648 	mov	a,r4
      0016ED 4E               [12]  649 	orl	a,r6
      0016EE F5 23            [12]  650 	mov	(_SetupLen + 1),a
                                    651 ;	src/usb_handler.c:46: len = 0;                                      // default is success and upload 0 length
                                    652 ;	src/usb_handler.c:47: SetupReq = USB_setupBuf->bRequest;
      0016F0 90 00 01         [24]  653 	mov	dptr,#(_EP0_buffer + 0x0001)
      0016F3 E0               [24]  654 	movx	a,@dptr
      0016F4 F5 24            [12]  655 	mov	_SetupReq,a
                                    656 ;	src/usb_handler.c:49: if( (USB_setupBuf->bRequestType & USB_REQ_TYP_MASK) != USB_REQ_TYP_STANDARD ) {
      0016F6 90 00 00         [24]  657 	mov	dptr,#_EP0_buffer
      0016F9 E0               [24]  658 	movx	a,@dptr
      0016FA FE               [12]  659 	mov	r6,a
      0016FB 54 60            [12]  660 	anl	a,#0x60
      0016FD 60 05            [24]  661 	jz	00172$
                                    662 ;	src/usb_handler.c:53: len = 0xFF;                                 // command not supported
      0016FF 7F FF            [12]  663 	mov	r7,#0xff
      001701 02 19 78         [24]  664 	ljmp	00176$
      001704                        665 00172$:
                                    666 ;	src/usb_handler.c:58: switch(SetupReq) {                          // request ccfType
      001704 E5 24            [12]  667 	mov	a,_SetupReq
      001706 24 F4            [12]  668 	add	a,#0xff - 0x0b
      001708 50 03            [24]  669 	jnc	00422$
      00170A 02 19 72         [24]  670 	ljmp	00169$
      00170D                        671 00422$:
                                    672 ;	free result
      00170D E5 24            [12]  673 	mov	a,_SetupReq
      00170F 24 0B            [12]  674 	add	a,#(00423$-3-.)
      001711 83               [24]  675 	movc	a,@a+pc
      001712 F5 82            [12]  676 	mov	dpl,a
      001714 E5 24            [12]  677 	mov	a,_SetupReq
      001716 24 10            [12]  678 	add	a,#(00424$-3-.)
      001718 83               [24]  679 	movc	a,@a+pc
      001719 F5 83            [12]  680 	mov	dph,a
      00171B E4               [12]  681 	clr	a
      00171C 73               [24]  682 	jmp	@a+dptr
      00171D                        683 00423$:
      00171D 54                     684 	.db	00165$
      00171E 52                     685 	.db	00129$
      00171F 72                     686 	.db	00169$
      001720 BC                     687 	.db	00146$
      001721 72                     688 	.db	00169$
      001722 22                     689 	.db	00122$
      001723 35                     690 	.db	00101$
      001724 72                     691 	.db	00169$
      001725 2E                     692 	.db	00123$
      001726 49                     693 	.db	00126$
      001727 78                     694 	.db	00176$
      001728 78                     695 	.db	00176$
      001729                        696 00424$:
      001729 19                     697 	.db	00165$>>8
      00172A 18                     698 	.db	00129$>>8
      00172B 19                     699 	.db	00169$>>8
      00172C 18                     700 	.db	00146$>>8
      00172D 19                     701 	.db	00169$>>8
      00172E 18                     702 	.db	00122$>>8
      00172F 17                     703 	.db	00101$>>8
      001730 19                     704 	.db	00169$>>8
      001731 18                     705 	.db	00123$>>8
      001732 18                     706 	.db	00126$>>8
      001733 19                     707 	.db	00176$>>8
      001734 19                     708 	.db	00176$>>8
                                    709 ;	src/usb_handler.c:59: case USB_GET_DESCRIPTOR:
      001735                        710 00101$:
                                    711 ;	src/usb_handler.c:60: switch(USB_setupBuf->wValueH) {
      001735 90 00 03         [24]  712 	mov	dptr,#(_EP0_buffer + 0x0003)
      001738 E0               [24]  713 	movx	a,@dptr
      001739 FE               [12]  714 	mov	r6,a
      00173A BE 01 02         [24]  715 	cjne	r6,#0x01,00425$
      00173D 80 12            [24]  716 	sjmp	00102$
      00173F                        717 00425$:
      00173F BE 02 02         [24]  718 	cjne	r6,#0x02,00426$
      001742 80 17            [24]  719 	sjmp	00103$
      001744                        720 00426$:
      001744 BE 03 02         [24]  721 	cjne	r6,#0x03,00427$
      001747 80 1C            [24]  722 	sjmp	00104$
      001749                        723 00427$:
      001749 BE 22 02         [24]  724 	cjne	r6,#0x22,00428$
      00174C 80 69            [24]  725 	sjmp	00112$
      00174E                        726 00428$:
      00174E 02 17 CF         [24]  727 	ljmp	00116$
                                    728 ;	src/usb_handler.c:62: case USB_DESCR_TYP_DEVICE:            // Device Descriptor
      001751                        729 00102$:
                                    730 ;	src/usb_handler.c:63: pDescr = (uint8_t*)&DevDescr;       // put descriptor into out buffer
      001751 75 26 5C         [24]  731 	mov	_pDescr,#_DevDescr
      001754 75 27 1B         [24]  732 	mov	(_pDescr + 1),#(_DevDescr >> 8)
                                    733 ;	src/usb_handler.c:64: len = sizeof(DevDescr);             // descriptor length
      001757 7F 12            [12]  734 	mov	r7,#0x12
                                    735 ;	src/usb_handler.c:65: break;
                                    736 ;	src/usb_handler.c:67: case USB_DESCR_TYP_CONFIG:            // Configuration Descriptor
      001759 80 76            [24]  737 	sjmp	00117$
      00175B                        738 00103$:
                                    739 ;	src/usb_handler.c:68: pDescr = (uint8_t*)&CfgDescr;       // put descriptor into out buffer
      00175B 75 26 6E         [24]  740 	mov	_pDescr,#_CfgDescr
      00175E 75 27 1B         [24]  741 	mov	(_pDescr + 1),#(_CfgDescr >> 8)
                                    742 ;	src/usb_handler.c:69: len = sizeof(CfgDescr);             // descriptor length
      001761 7F 32            [12]  743 	mov	r7,#0x32
                                    744 ;	src/usb_handler.c:70: break;
                                    745 ;	src/usb_handler.c:72: case USB_DESCR_TYP_STRING:
      001763 80 6C            [24]  746 	sjmp	00117$
      001765                        747 00104$:
                                    748 ;	src/usb_handler.c:73: switch(USB_setupBuf->wValueL) {      // String Descriptor Index
      001765 90 00 02         [24]  749 	mov	dptr,#(_EP0_buffer + 0x0002)
      001768 E0               [24]  750 	movx	a,@dptr
      001769 FE               [12]  751 	mov  r6,a
      00176A 24 FB            [12]  752 	add	a,#0xff - 0x04
      00176C 40 38            [24]  753 	jc	00110$
                                    754 ;	free result
      00176E EE               [12]  755 	mov	a,r6
      00176F 2E               [12]  756 	add	a,r6
                                    757 ;	src/usb_handler.c:74: case 0:   pDescr = USB_STR_DESCR_i0; break;
      001770 90 17 74         [24]  758 	mov	dptr,#00430$
      001773 73               [24]  759 	jmp	@a+dptr
      001774                        760 00430$:
      001774 80 08            [24]  761 	sjmp	00105$
      001776 80 0E            [24]  762 	sjmp	00106$
      001778 80 14            [24]  763 	sjmp	00107$
      00177A 80 1A            [24]  764 	sjmp	00108$
      00177C 80 20            [24]  765 	sjmp	00109$
      00177E                        766 00105$:
      00177E 75 26 20         [24]  767 	mov	_pDescr,#_LangDescr
      001781 75 27 1C         [24]  768 	mov	(_pDescr + 1),#(_LangDescr >> 8)
                                    769 ;	src/usb_handler.c:75: case 1:   pDescr = USB_STR_DESCR_i1; break;
      001784 80 26            [24]  770 	sjmp	00111$
      001786                        771 00106$:
      001786 75 26 24         [24]  772 	mov	_pDescr,#_ManufDescr
      001789 75 27 1C         [24]  773 	mov	(_pDescr + 1),#(_ManufDescr >> 8)
                                    774 ;	src/usb_handler.c:76: case 2:   pDescr = USB_STR_DESCR_i2; break;
      00178C 80 1E            [24]  775 	sjmp	00111$
      00178E                        776 00107$:
      00178E 75 26 36         [24]  777 	mov	_pDescr,#_ProdDescr
      001791 75 27 1C         [24]  778 	mov	(_pDescr + 1),#(_ProdDescr >> 8)
                                    779 ;	src/usb_handler.c:77: case 3:   pDescr = USB_STR_DESCR_i3; break;
      001794 80 16            [24]  780 	sjmp	00111$
      001796                        781 00108$:
      001796 75 26 56         [24]  782 	mov	_pDescr,#_SerDescr
      001799 75 27 1C         [24]  783 	mov	(_pDescr + 1),#(_SerDescr >> 8)
                                    784 ;	src/usb_handler.c:79: case 4:   pDescr = USB_STR_DESCR_i4; break;
      00179C 80 0E            [24]  785 	sjmp	00111$
      00179E                        786 00109$:
      00179E 75 26 60         [24]  787 	mov	_pDescr,#_InterfDescr
      0017A1 75 27 1C         [24]  788 	mov	(_pDescr + 1),#(_InterfDescr >> 8)
                                    789 ;	src/usb_handler.c:96: default:  pDescr = USB_STR_DESCR_ix; break;
      0017A4 80 06            [24]  790 	sjmp	00111$
      0017A6                        791 00110$:
      0017A6 75 26 56         [24]  792 	mov	_pDescr,#_SerDescr
      0017A9 75 27 1C         [24]  793 	mov	(_pDescr + 1),#(_SerDescr >> 8)
                                    794 ;	src/usb_handler.c:97: }
      0017AC                        795 00111$:
                                    796 ;	src/usb_handler.c:98: len = pDescr[0];                    // descriptor length
      0017AC 85 26 82         [24]  797 	mov	dpl,_pDescr
      0017AF 85 27 83         [24]  798 	mov	dph,(_pDescr + 1)
      0017B2 E4               [12]  799 	clr	a
      0017B3 93               [24]  800 	movc	a,@a+dptr
      0017B4 FF               [12]  801 	mov	r7,a
                                    802 ;	src/usb_handler.c:99: break;
                                    803 ;	src/usb_handler.c:102: case USB_DESCR_TYP_REPORT:
      0017B5 80 1A            [24]  804 	sjmp	00117$
      0017B7                        805 00112$:
                                    806 ;	src/usb_handler.c:103: if(USB_setupBuf->wValueL == 0) {
      0017B7 90 00 02         [24]  807 	mov	dptr,#(_EP0_buffer + 0x0002)
      0017BA E0               [24]  808 	movx	a,@dptr
      0017BB 70 0E            [24]  809 	jnz	00114$
                                    810 ;	src/usb_handler.c:104: pDescr = USB_REPORT_DESCR;
      0017BD 75 26 A0         [24]  811 	mov	_pDescr,#_ReportDescr
      0017C0 75 27 1B         [24]  812 	mov	(_pDescr + 1),#(_ReportDescr >> 8)
                                    813 ;	src/usb_handler.c:105: len = USB_REPORT_DESCR_LEN;
      0017C3 90 1C 1F         [24]  814 	mov	dptr,#_ReportDescrLen
      0017C6 E4               [12]  815 	clr	a
      0017C7 93               [24]  816 	movc	a,@a+dptr
      0017C8 FF               [12]  817 	mov	r7,a
      0017C9 80 06            [24]  818 	sjmp	00117$
      0017CB                        819 00114$:
                                    820 ;	src/usb_handler.c:107: else len = 0xff;
      0017CB 7F FF            [12]  821 	mov	r7,#0xff
                                    822 ;	src/usb_handler.c:108: break;
                                    823 ;	src/usb_handler.c:111: default:
      0017CD 80 02            [24]  824 	sjmp	00117$
      0017CF                        825 00116$:
                                    826 ;	src/usb_handler.c:112: len = 0xff;                         // unsupported descriptors or error
      0017CF 7F FF            [12]  827 	mov	r7,#0xff
                                    828 ;	src/usb_handler.c:114: }
      0017D1                        829 00117$:
                                    830 ;	src/usb_handler.c:116: if(len != 0xff) {
      0017D1 BF FF 03         [24]  831 	cjne	r7,#0xff,00432$
      0017D4 02 19 78         [24]  832 	ljmp	00176$
      0017D7                        833 00432$:
                                    834 ;	src/usb_handler.c:117: if(SetupLen > len) SetupLen = len;    // limit length
      0017D7 8F 05            [24]  835 	mov	ar5,r7
      0017D9 7E 00            [12]  836 	mov	r6,#0x00
      0017DB C3               [12]  837 	clr	c
      0017DC ED               [12]  838 	mov	a,r5
      0017DD 95 22            [12]  839 	subb	a,_SetupLen
      0017DF EE               [12]  840 	mov	a,r6
      0017E0 95 23            [12]  841 	subb	a,(_SetupLen + 1)
      0017E2 50 04            [24]  842 	jnc	00119$
                                    843 ;	free result
      0017E4 8D 22            [24]  844 	mov	_SetupLen,r5
      0017E6 8E 23            [24]  845 	mov	(_SetupLen + 1),r6
      0017E8                        846 00119$:
                                    847 ;	src/usb_handler.c:118: len = SetupLen >= EP0_SIZE ? EP0_SIZE : SetupLen;
      0017E8 AD 22            [24]  848 	mov	r5,_SetupLen
      0017EA AE 23            [24]  849 	mov	r6,(_SetupLen + 1)
      0017EC C3               [12]  850 	clr	c
      0017ED ED               [12]  851 	mov	a,r5
      0017EE 94 40            [12]  852 	subb	a,#0x40
      0017F0 EE               [12]  853 	mov	a,r6
      0017F1 94 00            [12]  854 	subb	a,#0x00
      0017F3 40 04            [24]  855 	jc	00185$
      0017F5 7D 40            [12]  856 	mov	r5,#0x40
      0017F7 80 02            [24]  857 	sjmp	00186$
      0017F9                        858 00185$:
      0017F9 AD 22            [24]  859 	mov	r5,_SetupLen
      0017FB                        860 00186$:
      0017FB 8D 07            [24]  861 	mov	ar7,r5
                                    862 ;	src/usb_handler.c:119: USB_EP0_copyDescr(len);               // copy descriptor to Ep0
      0017FD 8F 82            [24]  863 	mov	dpl, r7
      0017FF 12 16 B7         [24]  864 	lcall	_USB_EP0_copyDescr
                                    865 ;	src/usb_handler.c:120: SetupLen -= len;
      001802 8F 05            [24]  866 	mov	ar5,r7
      001804 7E 00            [12]  867 	mov	r6,#0x00
      001806 AB 22            [24]  868 	mov	r3,_SetupLen
      001808 AC 23            [24]  869 	mov	r4,(_SetupLen + 1)
      00180A EB               [12]  870 	mov	a,r3
      00180B C3               [12]  871 	clr	c
      00180C 9D               [12]  872 	subb	a,r5
      00180D FB               [12]  873 	mov	r3,a
      00180E EC               [12]  874 	mov	a,r4
      00180F 9E               [12]  875 	subb	a,r6
      001810 FC               [12]  876 	mov	r4,a
      001811 8B 22            [24]  877 	mov	_SetupLen,r3
      001813 8C 23            [24]  878 	mov	(_SetupLen + 1),r4
                                    879 ;	src/usb_handler.c:121: pDescr += len;
      001815 EF               [12]  880 	mov	a,r7
      001816 25 26            [12]  881 	add	a, _pDescr
      001818 F5 26            [12]  882 	mov	_pDescr,a
      00181A E4               [12]  883 	clr	a
      00181B 35 27            [12]  884 	addc	a, (_pDescr + 1)
      00181D F5 27            [12]  885 	mov	(_pDescr + 1),a
                                    886 ;	src/usb_handler.c:123: break;
      00181F 02 19 78         [24]  887 	ljmp	00176$
                                    888 ;	src/usb_handler.c:125: case USB_SET_ADDRESS:
      001822                        889 00122$:
                                    890 ;	src/usb_handler.c:126: SetupLen = USB_setupBuf->wValueL;        // save the assigned address
      001822 90 00 02         [24]  891 	mov	dptr,#(_EP0_buffer + 0x0002)
      001825 E0               [24]  892 	movx	a,@dptr
      001826 F5 22            [12]  893 	mov	_SetupLen, a
      001828 75 23 00         [24]  894 	mov	(_SetupLen + 1),#0x00
                                    895 ;	src/usb_handler.c:127: break;
      00182B 02 19 78         [24]  896 	ljmp	00176$
                                    897 ;	src/usb_handler.c:129: case USB_GET_CONFIGURATION:
      00182E                        898 00123$:
                                    899 ;	src/usb_handler.c:130: EP0_buffer[0] = UsbConfig;
      00182E 90 00 00         [24]  900 	mov	dptr,#_EP0_buffer
      001831 E5 25            [12]  901 	mov	a,_UsbConfig
      001833 F0               [24]  902 	movx	@dptr,a
                                    903 ;	src/usb_handler.c:131: if (SetupLen >= 1) len = 1;
      001834 AD 22            [24]  904 	mov	r5,_SetupLen
      001836 AE 23            [24]  905 	mov	r6,(_SetupLen + 1)
      001838 C3               [12]  906 	clr	c
      001839 ED               [12]  907 	mov	a,r5
      00183A 94 01            [12]  908 	subb	a,#0x01
      00183C EE               [12]  909 	mov	a,r6
      00183D 94 00            [12]  910 	subb	a,#0x00
      00183F 50 03            [24]  911 	jnc	00435$
      001841 02 19 78         [24]  912 	ljmp	00176$
      001844                        913 00435$:
      001844 7F 01            [12]  914 	mov	r7,#0x01
                                    915 ;	src/usb_handler.c:132: break;
      001846 02 19 78         [24]  916 	ljmp	00176$
                                    917 ;	src/usb_handler.c:134: case USB_SET_CONFIGURATION:
      001849                        918 00126$:
                                    919 ;	src/usb_handler.c:135: UsbConfig = USB_setupBuf->wValueL;
      001849 90 00 02         [24]  920 	mov	dptr,#(_EP0_buffer + 0x0002)
      00184C E0               [24]  921 	movx	a,@dptr
      00184D F5 25            [12]  922 	mov	_UsbConfig,a
                                    923 ;	src/usb_handler.c:136: break;
      00184F 02 19 78         [24]  924 	ljmp	00176$
                                    925 ;	src/usb_handler.c:144: case USB_CLEAR_FEATURE:
      001852                        926 00129$:
                                    927 ;	src/usb_handler.c:145: if( (USB_setupBuf->bRequestType & 0x1F) == USB_REQ_RECIP_DEVICE ) {
      001852 90 00 00         [24]  928 	mov	dptr,#_EP0_buffer
      001855 E0               [24]  929 	movx	a,@dptr
      001856 54 1F            [12]  930 	anl	a,#0x1f
      001858 70 2D            [24]  931 	jnz	00144$
                                    932 ;	src/usb_handler.c:146: if( ( ( (uint16_t)USB_setupBuf->wValueH << 8 ) | USB_setupBuf->wValueL ) == 0x01 ) {
      00185A 90 00 03         [24]  933 	mov	dptr,#(_EP0_buffer + 0x0003)
      00185D E0               [24]  934 	movx	a,@dptr
      00185E FD               [12]  935 	mov	r5,a
      00185F 7E 00            [12]  936 	mov	r6,#0x00
      001861 90 00 02         [24]  937 	mov	dptr,#(_EP0_buffer + 0x0002)
      001864 E0               [24]  938 	movx	a,@dptr
      001865 7B 00            [12]  939 	mov	r3,#0x00
      001867 42 06            [12]  940 	orl	ar6,a
      001869 EB               [12]  941 	mov	a,r3
      00186A 42 05            [12]  942 	orl	ar5,a
      00186C BE 01 13         [24]  943 	cjne	r6,#0x01,00134$
      00186F BD 00 10         [24]  944 	cjne	r5,#0x00,00134$
                                    945 ;	src/usb_handler.c:147: if( ((uint8_t*)&CfgDescr)[7] & 0x20) {
      001872 90 1B 75         [24]  946 	mov	dptr,#(_CfgDescr + 0x0007)
      001875 E4               [12]  947 	clr	a
      001876 93               [24]  948 	movc	a,@a+dptr
      001877 30 E5 03         [24]  949 	jnb	acc.5,00440$
      00187A 02 19 78         [24]  950 	ljmp	00176$
      00187D                        951 00440$:
                                    952 ;	src/usb_handler.c:150: else len = 0xFF;               // failed
      00187D 7F FF            [12]  953 	mov	r7,#0xff
      00187F 02 19 78         [24]  954 	ljmp	00176$
      001882                        955 00134$:
                                    956 ;	src/usb_handler.c:152: else len = 0xFF;                 // failed
      001882 7F FF            [12]  957 	mov	r7,#0xff
      001884 02 19 78         [24]  958 	ljmp	00176$
      001887                        959 00144$:
                                    960 ;	src/usb_handler.c:154: else if( (USB_setupBuf->bRequestType & USB_REQ_RECIP_MASK) == USB_REQ_RECIP_ENDP ) {
      001887 90 00 00         [24]  961 	mov	dptr,#_EP0_buffer
      00188A E0               [24]  962 	movx	a,@dptr
      00188B FE               [12]  963 	mov	r6,a
      00188C 53 06 1F         [24]  964 	anl	ar6,#0x1f
      00188F BE 02 25         [24]  965 	cjne	r6,#0x02,00141$
                                    966 ;	src/usb_handler.c:155: switch(USB_setupBuf->wIndexL) {
      001892 90 00 04         [24]  967 	mov	dptr,#(_EP0_buffer + 0x0004)
      001895 E0               [24]  968 	movx	a,@dptr
      001896 FE               [12]  969 	mov	r6,a
      001897 BE 02 02         [24]  970 	cjne	r6,#0x02,00443$
      00189A 80 05            [24]  971 	sjmp	00136$
      00189C                        972 00443$:
                                    973 ;	src/usb_handler.c:182: case 0x02:
      00189C BE 81 13         [24]  974 	cjne	r6,#0x81,00138$
      00189F 80 06            [24]  975 	sjmp	00137$
      0018A1                        976 00136$:
                                    977 ;	src/usb_handler.c:183: UEP2_CTRL = UEP2_CTRL & ~ ( bUEP_R_TOG | MASK_UEP_R_RES ) | UEP_R_RES_ACK;
      0018A1 53 D4 73         [24]  978 	anl	_UEP2_CTRL,#0x73
                                    979 ;	src/usb_handler.c:184: break;
      0018A4 02 19 78         [24]  980 	ljmp	00176$
                                    981 ;	src/usb_handler.c:187: case 0x81:
      0018A7                        982 00137$:
                                    983 ;	src/usb_handler.c:188: UEP1_CTRL = UEP1_CTRL & ~ ( bUEP_T_TOG | MASK_UEP_T_RES ) | UEP_T_RES_NAK;
      0018A7 74 BC            [12]  984 	mov	a,#0xbc
      0018A9 55 D2            [12]  985 	anl	a,_UEP1_CTRL
      0018AB 44 02            [12]  986 	orl	a,#0x02
      0018AD F5 D2            [12]  987 	mov	_UEP1_CTRL,a
                                    988 ;	src/usb_handler.c:189: break;
      0018AF 02 19 78         [24]  989 	ljmp	00176$
                                    990 ;	src/usb_handler.c:196: default:
      0018B2                        991 00138$:
                                    992 ;	src/usb_handler.c:197: len = 0xFF;                 // unsupported endpoint
      0018B2 7F FF            [12]  993 	mov	r7,#0xff
                                    994 ;	src/usb_handler.c:199: }
      0018B4 02 19 78         [24]  995 	ljmp	00176$
      0018B7                        996 00141$:
                                    997 ;	src/usb_handler.c:201: else len = 0xFF;                  // unsupported for non-endpoint
      0018B7 7F FF            [12]  998 	mov	r7,#0xff
                                    999 ;	src/usb_handler.c:202: break;
      0018B9 02 19 78         [24] 1000 	ljmp	00176$
                                   1001 ;	src/usb_handler.c:204: case USB_SET_FEATURE:
      0018BC                       1002 00146$:
                                   1003 ;	src/usb_handler.c:205: if( (USB_setupBuf->bRequestType & 0x1F) == USB_REQ_RECIP_DEVICE ) {
      0018BC 90 00 00         [24] 1004 	mov	dptr,#_EP0_buffer
      0018BF E0               [24] 1005 	movx	a,@dptr
      0018C0 54 1F            [12] 1006 	anl	a,#0x1f
      0018C2 70 2D            [24] 1007 	jnz	00163$
                                   1008 ;	src/usb_handler.c:206: if( ( ( (uint16_t)USB_setupBuf->wValueH << 8 ) | USB_setupBuf->wValueL ) == 0x01 ) {
      0018C4 90 00 03         [24] 1009 	mov	dptr,#(_EP0_buffer + 0x0003)
      0018C7 E0               [24] 1010 	movx	a,@dptr
      0018C8 FD               [12] 1011 	mov	r5,a
      0018C9 7E 00            [12] 1012 	mov	r6,#0x00
      0018CB 90 00 02         [24] 1013 	mov	dptr,#(_EP0_buffer + 0x0002)
      0018CE E0               [24] 1014 	movx	a,@dptr
      0018CF 7B 00            [12] 1015 	mov	r3,#0x00
      0018D1 42 06            [12] 1016 	orl	ar6,a
      0018D3 EB               [12] 1017 	mov	a,r3
      0018D4 42 05            [12] 1018 	orl	ar5,a
      0018D6 BE 01 13         [24] 1019 	cjne	r6,#0x01,00150$
      0018D9 BD 00 10         [24] 1020 	cjne	r5,#0x00,00150$
                                   1021 ;	src/usb_handler.c:207: if( !(((uint8_t*)&CfgDescr)[7] & 0x20) ) len = 0xFF;  // failed
      0018DC 90 1B 75         [24] 1022 	mov	dptr,#(_CfgDescr + 0x0007)
      0018DF E4               [12] 1023 	clr	a
      0018E0 93               [24] 1024 	movc	a,@a+dptr
      0018E1 30 E5 03         [24] 1025 	jnb	acc.5,00449$
      0018E4 02 19 78         [24] 1026 	ljmp	00176$
      0018E7                       1027 00449$:
      0018E7 7F FF            [12] 1028 	mov	r7,#0xff
      0018E9 02 19 78         [24] 1029 	ljmp	00176$
      0018EC                       1030 00150$:
                                   1031 ;	src/usb_handler.c:209: else len = 0xFF;                                        // failed
      0018EC 7F FF            [12] 1032 	mov	r7,#0xff
      0018EE 02 19 78         [24] 1033 	ljmp	00176$
      0018F1                       1034 00163$:
                                   1035 ;	src/usb_handler.c:211: else if( (USB_setupBuf->bRequestType & 0x1F) == USB_REQ_RECIP_ENDP ) {
      0018F1 90 00 00         [24] 1036 	mov	dptr,#_EP0_buffer
      0018F4 E0               [24] 1037 	movx	a,@dptr
      0018F5 FE               [12] 1038 	mov	r6,a
      0018F6 53 06 1F         [24] 1039 	anl	ar6,#0x1f
      0018F9 BE 02 54         [24] 1040 	cjne	r6,#0x02,00160$
                                   1041 ;	src/usb_handler.c:212: if( ( ( (uint16_t)USB_setupBuf->wValueH << 8 ) | USB_setupBuf->wValueL ) == 0x00 ) {
      0018FC 90 00 03         [24] 1042 	mov	dptr,#(_EP0_buffer + 0x0003)
      0018FF E0               [24] 1043 	movx	a,@dptr
      001900 FD               [12] 1044 	mov	r5,a
      001901 7E 00            [12] 1045 	mov	r6,#0x00
      001903 90 00 02         [24] 1046 	mov	dptr,#(_EP0_buffer + 0x0002)
      001906 E0               [24] 1047 	movx	a,@dptr
      001907 7B 00            [12] 1048 	mov	r3,#0x00
      001909 42 06            [12] 1049 	orl	ar6,a
      00190B EB               [12] 1050 	mov	a,r3
      00190C 42 05            [12] 1051 	orl	ar5,a
      00190E EE               [12] 1052 	mov	a,r6
      00190F 4D               [12] 1053 	orl	a,r5
      001910 70 3A            [24] 1054 	jnz	00157$
                                   1055 ;	src/usb_handler.c:213: switch( ( (uint16_t)USB_setupBuf->wIndexH << 8 ) | USB_setupBuf->wIndexL ) {
      001912 90 00 05         [24] 1056 	mov	dptr,#(_EP0_buffer + 0x0005)
      001915 E0               [24] 1057 	movx	a,@dptr
      001916 FD               [12] 1058 	mov	r5,a
      001917 7E 00            [12] 1059 	mov	r6,#0x00
      001919 90 00 04         [24] 1060 	mov	dptr,#(_EP0_buffer + 0x0004)
      00191C E0               [24] 1061 	movx	a,@dptr
      00191D 7B 00            [12] 1062 	mov	r3,#0x00
      00191F 42 06            [12] 1063 	orl	ar6,a
      001921 EB               [12] 1064 	mov	a,r3
      001922 42 05            [12] 1065 	orl	ar5,a
      001924 BE 02 05         [24] 1066 	cjne	r6,#0x02,00453$
      001927 BD 00 02         [24] 1067 	cjne	r5,#0x00,00453$
      00192A 80 08            [24] 1068 	sjmp	00152$
      00192C                       1069 00453$:
                                   1070 ;	src/usb_handler.c:240: case 0x02:
      00192C BE 81 19         [24] 1071 	cjne	r6,#0x81,00154$
      00192F BD 00 16         [24] 1072 	cjne	r5,#0x00,00154$
      001932 80 0A            [24] 1073 	sjmp	00153$
      001934                       1074 00152$:
                                   1075 ;	src/usb_handler.c:241: UEP2_CTRL = UEP2_CTRL & (~bUEP_R_TOG) | UEP_R_RES_STALL;// Set EP2 OUT Stall 
      001934 74 7F            [12] 1076 	mov	a,#0x7f
      001936 55 D4            [12] 1077 	anl	a,_UEP2_CTRL
      001938 44 0C            [12] 1078 	orl	a,#0x0c
      00193A F5 D4            [12] 1079 	mov	_UEP2_CTRL,a
                                   1080 ;	src/usb_handler.c:242: break;
                                   1081 ;	src/usb_handler.c:245: case 0x81:
      00193C 80 3A            [24] 1082 	sjmp	00176$
      00193E                       1083 00153$:
                                   1084 ;	src/usb_handler.c:246: UEP1_CTRL = UEP1_CTRL & (~bUEP_T_TOG) | UEP_T_RES_STALL;// Set EP1 IN STALL 
      00193E 74 BF            [12] 1085 	mov	a,#0xbf
      001940 55 D2            [12] 1086 	anl	a,_UEP1_CTRL
      001942 44 03            [12] 1087 	orl	a,#0x03
      001944 F5 D2            [12] 1088 	mov	_UEP1_CTRL,a
                                   1089 ;	src/usb_handler.c:247: break;
                                   1090 ;	src/usb_handler.c:254: default:
      001946 80 30            [24] 1091 	sjmp	00176$
      001948                       1092 00154$:
                                   1093 ;	src/usb_handler.c:255: len = 0xFF;               // failed
      001948 7F FF            [12] 1094 	mov	r7,#0xff
                                   1095 ;	src/usb_handler.c:257: }
      00194A 80 2C            [24] 1096 	sjmp	00176$
      00194C                       1097 00157$:
                                   1098 ;	src/usb_handler.c:259: else len = 0xFF;                // failed
      00194C 7F FF            [12] 1099 	mov	r7,#0xff
      00194E 80 28            [24] 1100 	sjmp	00176$
      001950                       1101 00160$:
                                   1102 ;	src/usb_handler.c:261: else len = 0xFF;                  // failed
      001950 7F FF            [12] 1103 	mov	r7,#0xff
                                   1104 ;	src/usb_handler.c:262: break;
                                   1105 ;	src/usb_handler.c:264: case USB_GET_STATUS:
      001952 80 24            [24] 1106 	sjmp	00176$
      001954                       1107 00165$:
                                   1108 ;	src/usb_handler.c:265: EP0_buffer[0] = 0x00;
      001954 90 00 00         [24] 1109 	mov	dptr,#_EP0_buffer
      001957 E4               [12] 1110 	clr	a
      001958 F0               [24] 1111 	movx	@dptr,a
                                   1112 ;	src/usb_handler.c:266: EP0_buffer[1] = 0x00;
      001959 90 00 01         [24] 1113 	mov	dptr,#(_EP0_buffer + 0x0001)
      00195C F0               [24] 1114 	movx	@dptr,a
                                   1115 ;	src/usb_handler.c:267: if(SetupLen >= 2) len = 2;
      00195D AD 22            [24] 1116 	mov	r5,_SetupLen
      00195F AE 23            [24] 1117 	mov	r6,(_SetupLen + 1)
      001961 C3               [12] 1118 	clr	c
      001962 ED               [12] 1119 	mov	a,r5
      001963 94 02            [12] 1120 	subb	a,#0x02
      001965 EE               [12] 1121 	mov	a,r6
      001966 94 00            [12] 1122 	subb	a,#0x00
      001968 40 04            [24] 1123 	jc	00167$
      00196A 7F 02            [12] 1124 	mov	r7,#0x02
      00196C 80 0A            [24] 1125 	sjmp	00176$
      00196E                       1126 00167$:
                                   1127 ;	src/usb_handler.c:268: else len = SetupLen;
      00196E AF 22            [24] 1128 	mov	r7,_SetupLen
                                   1129 ;	src/usb_handler.c:269: break;
                                   1130 ;	src/usb_handler.c:271: default:
      001970 80 06            [24] 1131 	sjmp	00176$
      001972                       1132 00169$:
                                   1133 ;	src/usb_handler.c:272: len = 0xff;                       // failed
      001972 7F FF            [12] 1134 	mov	r7,#0xff
                                   1135 ;	src/usb_handler.c:274: }
      001974 80 02            [24] 1136 	sjmp	00176$
      001976                       1137 00175$:
                                   1138 ;	src/usb_handler.c:277: else len = 0xff;                          // wrong packet length
      001976 7F FF            [12] 1139 	mov	r7,#0xff
      001978                       1140 00176$:
                                   1141 ;	src/usb_handler.c:279: if(len == 0xff) {
      001978 BF FF 07         [24] 1142 	cjne	r7,#0xff,00181$
                                   1143 ;	src/usb_handler.c:280: SetupReq = 0xFF;
      00197B 75 24 FF         [24] 1144 	mov	_SetupReq,#0xff
                                   1145 ;	src/usb_handler.c:281: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_STALL | UEP_T_RES_STALL;//STALL
      00197E 75 DC CF         [24] 1146 	mov	_UEP0_CTRL,#0xcf
      001981 22               [24] 1147 	ret
      001982                       1148 00181$:
                                   1149 ;	src/usb_handler.c:283: else if(len <= EP0_SIZE) {      // Tx data to host or send 0-length packet
      001982 EF               [12] 1150 	mov	a,r7
      001983 24 BF            [12] 1151 	add	a,#0xff - 0x40
      001985 40 06            [24] 1152 	jc	00178$
                                   1153 ;	free result
                                   1154 ;	src/usb_handler.c:284: UEP0_T_LEN = len;
      001987 8F DD            [24] 1155 	mov	_UEP0_T_LEN,r7
                                   1156 ;	src/usb_handler.c:285: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;// Expect DATA1, Answer ACK
      001989 75 DC C0         [24] 1157 	mov	_UEP0_CTRL,#0xc0
      00198C 22               [24] 1158 	ret
      00198D                       1159 00178$:
                                   1160 ;	src/usb_handler.c:288: UEP0_T_LEN = 0;  // Tx data to host or send 0-length packet
      00198D 75 DD 00         [24] 1161 	mov	_UEP0_T_LEN,#0x00
                                   1162 ;	src/usb_handler.c:289: UEP0_CTRL = bUEP_R_TOG | bUEP_T_TOG | UEP_R_RES_ACK | UEP_T_RES_ACK;// Expect DATA1, Answer ACK
      001990 75 DC C0         [24] 1163 	mov	_UEP0_CTRL,#0xc0
                                   1164 ;	src/usb_handler.c:291: }
      001993 22               [24] 1165 	ret
                                   1166 ;------------------------------------------------------------
                                   1167 ;Allocation info for local variables in function 'USB_EP0_IN'
                                   1168 ;------------------------------------------------------------
                                   1169 ;len           Allocated to registers r6 
                                   1170 ;------------------------------------------------------------
                                   1171 ;	src/usb_handler.c:293: void USB_EP0_IN(void) {
                                   1172 ;	-----------------------------------------
                                   1173 ;	 function USB_EP0_IN
                                   1174 ;	-----------------------------------------
      001994                       1175 _USB_EP0_IN:
                                   1176 ;	src/usb_handler.c:295: switch(SetupReq) {
      001994 74 05            [12] 1177 	mov	a,#0x05
      001996 B5 24 02         [24] 1178 	cjne	a,_SetupReq,00130$
      001999 80 40            [24] 1179 	sjmp	00102$
      00199B                       1180 00130$:
      00199B 74 06            [12] 1181 	mov	a,#0x06
      00199D B5 24 49         [24] 1182 	cjne	a,_SetupReq,00103$
                                   1183 ;	src/usb_handler.c:298: len = SetupLen >= EP0_SIZE ? EP0_SIZE : SetupLen;
      0019A0 AE 22            [24] 1184 	mov	r6,_SetupLen
      0019A2 AF 23            [24] 1185 	mov	r7,(_SetupLen + 1)
      0019A4 C3               [12] 1186 	clr	c
      0019A5 EE               [12] 1187 	mov	a,r6
      0019A6 94 40            [12] 1188 	subb	a,#0x40
      0019A8 EF               [12] 1189 	mov	a,r7
      0019A9 94 00            [12] 1190 	subb	a,#0x00
      0019AB 40 04            [24] 1191 	jc	00107$
      0019AD 7E 40            [12] 1192 	mov	r6,#0x40
      0019AF 80 02            [24] 1193 	sjmp	00108$
      0019B1                       1194 00107$:
      0019B1 AE 22            [24] 1195 	mov	r6,_SetupLen
      0019B3                       1196 00108$:
                                   1197 ;	src/usb_handler.c:299: USB_EP0_copyDescr(len);                     // copy descriptor to Ep0                                
      0019B3 8E 82            [24] 1198 	mov	dpl, r6
      0019B5 12 16 B7         [24] 1199 	lcall	_USB_EP0_copyDescr
                                   1200 ;	src/usb_handler.c:300: SetupLen  -= len;
      0019B8 8E 05            [24] 1201 	mov	ar5,r6
      0019BA 7F 00            [12] 1202 	mov	r7,#0x00
      0019BC AB 22            [24] 1203 	mov	r3,_SetupLen
      0019BE AC 23            [24] 1204 	mov	r4,(_SetupLen + 1)
      0019C0 EB               [12] 1205 	mov	a,r3
      0019C1 C3               [12] 1206 	clr	c
      0019C2 9D               [12] 1207 	subb	a,r5
      0019C3 FB               [12] 1208 	mov	r3,a
      0019C4 EC               [12] 1209 	mov	a,r4
      0019C5 9F               [12] 1210 	subb	a,r7
      0019C6 FC               [12] 1211 	mov	r4,a
      0019C7 8B 22            [24] 1212 	mov	_SetupLen,r3
      0019C9 8C 23            [24] 1213 	mov	(_SetupLen + 1),r4
                                   1214 ;	src/usb_handler.c:301: pDescr    += len;
      0019CB EE               [12] 1215 	mov	a,r6
      0019CC 25 26            [12] 1216 	add	a, _pDescr
      0019CE F5 26            [12] 1217 	mov	_pDescr,a
      0019D0 E4               [12] 1218 	clr	a
      0019D1 35 27            [12] 1219 	addc	a, (_pDescr + 1)
      0019D3 F5 27            [12] 1220 	mov	(_pDescr + 1),a
                                   1221 ;	src/usb_handler.c:302: UEP0_T_LEN = len;
      0019D5 8E DD            [24] 1222 	mov	_UEP0_T_LEN,r6
                                   1223 ;	src/usb_handler.c:303: UEP0_CTRL ^= bUEP_T_TOG;                    // switch between DATA0 and DATA1
      0019D7 63 DC 40         [24] 1224 	xrl	_UEP0_CTRL,#0x40
                                   1225 ;	src/usb_handler.c:304: break;
                                   1226 ;	src/usb_handler.c:306: case USB_SET_ADDRESS:
      0019DA 22               [24] 1227 	ret
      0019DB                       1228 00102$:
                                   1229 ;	src/usb_handler.c:307: USB_DEV_AD = USB_DEV_AD & bUDA_GP_BIT | SetupLen;
      0019DB E5 E3            [12] 1230 	mov	a,_USB_DEV_AD
      0019DD 54 80            [12] 1231 	anl	a,#0x80
      0019DF FF               [12] 1232 	mov	r7,a
      0019E0 E5 22            [12] 1233 	mov	a,_SetupLen
      0019E2 4F               [12] 1234 	orl	a,r7
      0019E3 F5 E3            [12] 1235 	mov	_USB_DEV_AD,a
                                   1236 ;	src/usb_handler.c:308: UEP0_CTRL  = UEP_R_RES_ACK | UEP_T_RES_NAK;
      0019E5 75 DC 02         [24] 1237 	mov	_UEP0_CTRL,#0x02
                                   1238 ;	src/usb_handler.c:309: break;
                                   1239 ;	src/usb_handler.c:311: default:
      0019E8 22               [24] 1240 	ret
      0019E9                       1241 00103$:
                                   1242 ;	src/usb_handler.c:312: UEP0_T_LEN = 0;                             // end of transaction
      0019E9 75 DD 00         [24] 1243 	mov	_UEP0_T_LEN,#0x00
                                   1244 ;	src/usb_handler.c:313: UEP0_CTRL  = UEP_R_RES_ACK | UEP_T_RES_NAK;
      0019EC 75 DC 02         [24] 1245 	mov	_UEP0_CTRL,#0x02
                                   1246 ;	src/usb_handler.c:315: }
                                   1247 ;	src/usb_handler.c:316: }
      0019EF 22               [24] 1248 	ret
                                   1249 ;------------------------------------------------------------
                                   1250 ;Allocation info for local variables in function 'USB_EP0_OUT'
                                   1251 ;------------------------------------------------------------
                                   1252 ;	src/usb_handler.c:318: void USB_EP0_OUT(void) {
                                   1253 ;	-----------------------------------------
                                   1254 ;	 function USB_EP0_OUT
                                   1255 ;	-----------------------------------------
      0019F0                       1256 _USB_EP0_OUT:
                                   1257 ;	src/usb_handler.c:319: UEP0_T_LEN = 0;
      0019F0 75 DD 00         [24] 1258 	mov	_UEP0_T_LEN,#0x00
                                   1259 ;	src/usb_handler.c:320: UEP0_CTRL |= UEP_R_RES_ACK | UEP_T_RES_NAK;     // respond Nak
      0019F3 43 DC 02         [24] 1260 	orl	_UEP0_CTRL,#0x02
                                   1261 ;	src/usb_handler.c:321: }
      0019F6 22               [24] 1262 	ret
                                   1263 ;------------------------------------------------------------
                                   1264 ;Allocation info for local variables in function 'USB_interrupt'
                                   1265 ;------------------------------------------------------------
                                   1266 ;callIndex     Allocated to registers r7 
                                   1267 ;------------------------------------------------------------
                                   1268 ;	src/usb_handler.c:329: void USB_interrupt(void) {   // inline not really working in multiple files in SDCC
                                   1269 ;	-----------------------------------------
                                   1270 ;	 function USB_interrupt
                                   1271 ;	-----------------------------------------
      0019F7                       1272 _USB_interrupt:
                                   1273 ;	src/usb_handler.c:330: if(UIF_TRANSFER) {
      0019F7 30 D9 47         [24] 1274 	jnb	_UIF_TRANSFER,00120$
                                   1275 ;	src/usb_handler.c:332: uint8_t callIndex = USB_INT_ST & MASK_UIS_ENDP;
      0019FA E5 D9            [12] 1276 	mov	a,_USB_INT_ST
      0019FC 54 0F            [12] 1277 	anl	a,#0x0f
      0019FE FF               [12] 1278 	mov	r7,a
                                   1279 ;	src/usb_handler.c:333: switch (USB_INT_ST & MASK_UIS_TOKEN) {
      0019FF E5 D9            [12] 1280 	mov	a,_USB_INT_ST
      001A01 54 30            [12] 1281 	anl	a,#0x30
      001A03 FE               [12] 1282 	mov	r6,a
      001A04 60 0F            [24] 1283 	jz	00101$
      001A06 BE 10 02         [24] 1284 	cjne	r6,#0x10,00222$
      001A09 80 34            [24] 1285 	sjmp	00118$
      001A0B                       1286 00222$:
      001A0B BE 20 02         [24] 1287 	cjne	r6,#0x20,00223$
      001A0E 80 17            [24] 1288 	sjmp	00109$
      001A10                       1289 00223$:
                                   1290 ;	src/usb_handler.c:334: case UIS_TOKEN_OUT:
      001A10 BE 30 2C         [24] 1291 	cjne	r6,#0x30,00118$
      001A13 80 24            [24] 1292 	sjmp	00114$
      001A15                       1293 00101$:
                                   1294 ;	src/usb_handler.c:335: switch (callIndex) {
      001A15 EF               [12] 1295 	mov	a,r7
      001A16 60 05            [24] 1296 	jz	00102$
                                   1297 ;	src/usb_handler.c:336: case 0: EP0_OUT_callback(); break;
      001A18 BF 02 24         [24] 1298 	cjne	r7,#0x02,00118$
      001A1B 80 05            [24] 1299 	sjmp	00103$
      001A1D                       1300 00102$:
      001A1D 12 19 F0         [24] 1301 	lcall	_USB_EP0_OUT
                                   1302 ;	src/usb_handler.c:341: case 2: EP2_OUT_callback(); break;
      001A20 80 1D            [24] 1303 	sjmp	00118$
      001A22                       1304 00103$:
      001A22 12 15 B6         [24] 1305 	lcall	_CMD_EP2_OUT
                                   1306 ;	src/usb_handler.c:372: case UIS_TOKEN_IN:
      001A25 80 18            [24] 1307 	sjmp	00118$
      001A27                       1308 00109$:
                                   1309 ;	src/usb_handler.c:373: switch (callIndex) {
      001A27 EF               [12] 1310 	mov	a,r7
      001A28 60 05            [24] 1311 	jz	00110$
                                   1312 ;	src/usb_handler.c:374: case 0: EP0_IN_callback(); break;
      001A2A BF 01 12         [24] 1313 	cjne	r7,#0x01,00118$
      001A2D 80 05            [24] 1314 	sjmp	00111$
      001A2F                       1315 00110$:
      001A2F 12 19 94         [24] 1316 	lcall	_USB_EP0_IN
                                   1317 ;	src/usb_handler.c:376: case 1: EP1_IN_callback(); break;
      001A32 80 0B            [24] 1318 	sjmp	00118$
      001A34                       1319 00111$:
      001A34 12 15 A8         [24] 1320 	lcall	_HID_EP1_IN
                                   1321 ;	src/usb_handler.c:390: case UIS_TOKEN_SETUP:
      001A37 80 06            [24] 1322 	sjmp	00118$
      001A39                       1323 00114$:
                                   1324 ;	src/usb_handler.c:391: switch (callIndex) {
      001A39 EF               [12] 1325 	mov	a,r7
      001A3A 70 03            [24] 1326 	jnz	00118$
                                   1327 ;	src/usb_handler.c:392: case 0: EP0_SETUP_callback(); break;
      001A3C 12 16 D1         [24] 1328 	lcall	_USB_EP0_SETUP
                                   1329 ;	src/usb_handler.c:408: }
      001A3F                       1330 00118$:
                                   1331 ;	src/usb_handler.c:409: UIF_TRANSFER = 0;                       // clear interrupt flag
                                   1332 ;	assignBit
      001A3F C2 D9            [12] 1333 	clr	_UIF_TRANSFER
      001A41                       1334 00120$:
                                   1335 ;	src/usb_handler.c:413: if(UIF_BUS_RST) {
      001A41 30 D8 0F         [24] 1336 	jnb	_UIF_BUS_RST,00122$
                                   1337 ;	src/usb_handler.c:414: UEP0_CTRL = UEP_R_RES_ACK | UEP_T_RES_NAK;
      001A44 75 DC 02         [24] 1338 	mov	_UEP0_CTRL,#0x02
                                   1339 ;	src/usb_handler.c:417: USB_RESET_handler();                    // custom reset handler
      001A47 12 15 9F         [24] 1340 	lcall	_HID_reset
                                   1341 ;	src/usb_handler.c:420: USB_DEV_AD   = 0x00;
      001A4A 75 E3 00         [24] 1342 	mov	_USB_DEV_AD,#0x00
                                   1343 ;	src/usb_handler.c:421: UIF_SUSPEND  = 0;
                                   1344 ;	assignBit
      001A4D C2 DA            [12] 1345 	clr	_UIF_SUSPEND
                                   1346 ;	src/usb_handler.c:422: UIF_TRANSFER = 0;
                                   1347 ;	assignBit
      001A4F C2 D9            [12] 1348 	clr	_UIF_TRANSFER
                                   1349 ;	src/usb_handler.c:423: UIF_BUS_RST  = 0;                       // clear interrupt flag
                                   1350 ;	assignBit
      001A51 C2 D8            [12] 1351 	clr	_UIF_BUS_RST
      001A53                       1352 00122$:
                                   1353 ;	src/usb_handler.c:427: if (UIF_SUSPEND) {
                                   1354 ;	src/usb_handler.c:428: UIF_SUSPEND = 0;
                                   1355 ;	assignBit
      001A53 10 DA 01         [24] 1356 	jbc	_UIF_SUSPEND,00231$
      001A56 22               [24] 1357 	ret
      001A57                       1358 00231$:
                                   1359 ;	src/usb_handler.c:429: if ( !(USB_MIS_ST & bUMS_SUSPEND) ) USB_INT_FG = 0xFF;  // clear interrupt flag
      001A57 E5 DA            [12] 1360 	mov	a,_USB_MIS_ST
      001A59 20 E2 03         [24] 1361 	jb	acc.2,00127$
      001A5C 75 D8 FF         [24] 1362 	mov	_USB_INT_FG,#0xff
      001A5F                       1363 00127$:
                                   1364 ;	src/usb_handler.c:431: }
      001A5F 22               [24] 1365 	ret
                                   1366 ;------------------------------------------------------------
                                   1367 ;Allocation info for local variables in function 'USB_init'
                                   1368 ;------------------------------------------------------------
                                   1369 ;	src/usb_handler.c:438: void USB_init(void) {
                                   1370 ;	-----------------------------------------
                                   1371 ;	 function USB_init
                                   1372 ;	-----------------------------------------
      001A60                       1373 _USB_init:
                                   1374 ;	src/usb_handler.c:441: | bUC_DMA_EN;                 // DMA enable
      001A60 75 E2 29         [24] 1375 	mov	_USB_CTRL,#0x29
                                   1376 ;	src/usb_handler.c:443: | bUD_PORT_EN;                // Enable port, full-speed
      001A63 75 D1 81         [24] 1377 	mov	_UDEV_CTRL,#0x81
                                   1378 ;	src/usb_handler.c:450: UEP0_DMA    = EP0_ADDR;                   // EP0 data transfer address
      001A66 E4               [12] 1379 	clr	a
      001A67 F5 EC            [12] 1380 	mov	((_UEP0_DMA >> 0) & 0xFF),a
      001A69 F5 ED            [12] 1381 	mov	((_UEP0_DMA >> 8) & 0xFF),a
                                   1382 ;	src/usb_handler.c:452: | UEP_T_RES_NAK;              // EP0 IN transaction returns NAK
      001A6B 75 DC 02         [24] 1383 	mov	_UEP0_CTRL,#0x02
                                   1384 ;	src/usb_handler.c:455: USB_INIT_handler();                       // Custom EP init handler
      001A6E 12 15 86         [24] 1385 	lcall	_HID_setup
                                   1386 ;	src/usb_handler.c:460: | bUIE_BUS_RST;               // Enable device mode USB bus reset interrupt
      001A71 43 E1 07         [24] 1387 	orl	_USB_INT_EN,#0x07
                                   1388 ;	src/usb_handler.c:462: USB_INT_FG |= 0x1F;                       // Clear interrupt flag
      001A74 43 D8 1F         [24] 1389 	orl	_USB_INT_FG,#0x1f
                                   1390 ;	src/usb_handler.c:463: IE_USB      = 1;                          // Enable USB interrupt
                                   1391 ;	assignBit
      001A77 D2 EA            [12] 1392 	setb	_IE_USB
                                   1393 ;	src/usb_handler.c:464: EA          = 1;                          // Enable global interrupts
                                   1394 ;	assignBit
      001A79 D2 AF            [12] 1395 	setb	_EA
                                   1396 ;	src/usb_handler.c:466: UEP0_T_LEN  = 0;                          // Must be zero at start
      001A7B 75 DD 00         [24] 1397 	mov	_UEP0_T_LEN,#0x00
                                   1398 ;	src/usb_handler.c:467: }
      001A7E 22               [24] 1399 	ret
                                   1400 	.area CSEG    (CODE)
                                   1401 	.area CONST   (CODE)
                                   1402 	.area CABS    (ABS,CODE)
