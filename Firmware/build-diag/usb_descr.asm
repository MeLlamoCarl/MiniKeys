;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.6.0 #16555 (Mac OS X ppc)
;--------------------------------------------------------
	.module usb_descr
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _InterfDescr
	.globl _SerDescr
	.globl _ProdDescr
	.globl _ManufDescr
	.globl _LangDescr
	.globl _ReportDescrLen
	.globl _ReportDescr
	.globl _CfgDescr
	.globl _DevDescr
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
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
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
_DevDescr:
	.db #0x12	; 18
	.db #0x01	; 1
	.byte #0x10, #0x01	; 272
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.byte #0x89, #0x11	; 4489
	.byte #0x90, #0x88	; 34960
	.byte #0x01, #0x20	; 8193
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.area CSEG    (CODE)
	.area CONST   (CODE)
_CfgDescr:
	.db #0x09	; 9
	.db #0x02	; 2
	.byte #0x32, #0x00	; 50
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x32	; 50	'2'
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x04	; 4
	.db #0x09	; 9
	.db #0x21	; 33
	.byte #0x10, #0x01	; 272
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x22	; 34
	.byte #0x7f, #0x00	; 127
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x81	; 129
	.db #0x03	; 3
	.byte #0x10, #0x00	; 16
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x03	; 3
	.byte #0x40, #0x00	; 64
	.db #0x01	; 1
	.area CSEG    (CODE)
	.area CONST   (CODE)
_ReportDescr:
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x06	; 6
	.db #0xa1	; 161
	.db #0x01	; 1
	.db #0x85	; 133
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0xe0	; 224
	.db #0x29	; 41
	.db #0xe7	; 231
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x95	; 149
	.db #0x08	; 8
	.db #0x75	; 117	'u'
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x95	; 149
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x08	; 8
	.db #0x81	; 129
	.db #0x03	; 3
	.db #0x95	; 149
	.db #0x06	; 6
	.db #0x75	; 117	'u'
	.db #0x08	; 8
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x29	; 41
	.db #0xe7	; 231
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x05	; 5
	.db #0x0c	; 12
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0xa1	; 161
	.db #0x01	; 1
	.db #0x85	; 133
	.db #0x02	; 2
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x26	; 38
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x2a	; 42
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x95	; 149
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x10	; 16
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x02	; 2
	.db #0xa1	; 161
	.db #0x01	; 1
	.db #0x85	; 133
	.db #0x03	; 3
	.db #0x09	; 9
	.db #0x01	; 1
	.db #0xa1	; 161
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x09	; 9
	.db #0x19	; 25
	.db #0x01	; 1
	.db #0x29	; 41
	.db #0x03	; 3
	.db #0x15	; 21
	.db #0x00	; 0
	.db #0x25	; 37
	.db #0x01	; 1
	.db #0x95	; 149
	.db #0x03	; 3
	.db #0x75	; 117	'u'
	.db #0x01	; 1
	.db #0x81	; 129
	.db #0x02	; 2
	.db #0x95	; 149
	.db #0x01	; 1
	.db #0x75	; 117	'u'
	.db #0x05	; 5
	.db #0x81	; 129
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x01	; 1
	.db #0x09	; 9
	.db #0x30	; 48	'0'
	.db #0x09	; 9
	.db #0x31	; 49	'1'
	.db #0x09	; 9
	.db #0x38	; 56	'8'
	.db #0x15	; 21
	.db #0x81	; 129
	.db #0x25	; 37
	.db #0x7f	; 127
	.db #0x75	; 117	'u'
	.db #0x08	; 8
	.db #0x95	; 149
	.db #0x03	; 3
	.db #0x81	; 129
	.db #0x06	; 6
	.db #0xc0	; 192
	.db #0xc0	; 192
	.area CSEG    (CODE)
	.area CONST   (CODE)
_ReportDescrLen:
	.db #0x7f	; 127
	.area CSEG    (CODE)
	.area CONST   (CODE)
_LangDescr:
	.byte #0x04, #0x03	; 772
	.byte #0x09, #0x04	; 1033
	.area CSEG    (CODE)
	.area CONST   (CODE)
_ManufDescr:
	.byte #0x12, #0x03	; 786
	.byte #0x4d, #0x00	; 77
	.byte #0x69, #0x00	; 105
	.byte #0x6e, #0x00	; 110
	.byte #0x69, #0x00	; 105
	.byte #0x4b, #0x00	; 75
	.byte #0x65, #0x00	; 101
	.byte #0x79, #0x00	; 121
	.byte #0x73, #0x00	; 115
	.area CSEG    (CODE)
	.area CONST   (CODE)
_ProdDescr:
	.byte #0x20, #0x03	; 800
	.byte #0x4d, #0x00	; 77
	.byte #0x69, #0x00	; 105
	.byte #0x6e, #0x00	; 110
	.byte #0x69, #0x00	; 105
	.byte #0x4b, #0x00	; 75
	.byte #0x65, #0x00	; 101
	.byte #0x79, #0x00	; 121
	.byte #0x73, #0x00	; 115
	.byte #0x20, #0x00	; 32
	.byte #0x4b, #0x00	; 75
	.byte #0x65, #0x00	; 101
	.byte #0x79, #0x00	; 121
	.byte #0x70, #0x00	; 112
	.byte #0x61, #0x00	; 97
	.byte #0x64, #0x00	; 100
	.area CSEG    (CODE)
	.area CONST   (CODE)
_SerDescr:
	.byte #0x0a, #0x03	; 778
	.byte #0x4d, #0x00	; 77
	.byte #0x4b, #0x00	; 75
	.byte #0x30, #0x00	; 48
	.byte #0x31, #0x00	; 49
	.area CSEG    (CODE)
	.area CONST   (CODE)
_InterfDescr:
	.byte #0x12, #0x03	; 786
	.byte #0x4d, #0x00	; 77
	.byte #0x69, #0x00	; 105
	.byte #0x6e, #0x00	; 110
	.byte #0x69, #0x00	; 105
	.byte #0x4b, #0x00	; 75
	.byte #0x65, #0x00	; 101
	.byte #0x79, #0x00	; 121
	.byte #0x73, #0x00	; 115
	.area CSEG    (CODE)
	.area CABS    (ABS,CODE)
