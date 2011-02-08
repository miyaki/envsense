//-----------------------------------------------
//-@MicroMonitor-PC				-
//-						-
//-  •¶Žšˆ—ŠÖ˜AŠÖ”				-
//-  Copyright(c) by M.Kuwano(PastelMagic)	-
//-	All Rights Reserved			-
//-----------------------------------------------


extern const unsigned char _ctypes[256];

#define isascii(c) ((((c)&0x80) == 0)? 1: 0)
#define isalpha(c) (((_ctypes[(c)]&0x03) == 0)?0:1)
#define isupper(c) (_ctypes[(c)]&0X01)
#define islower(c) (((_ctypes[(c)]&0X02)==0)?0:1)
#define isdigit(c)  (((_ctypes[(c)]&0X04)==0)?0:1)
#define isxdigit(c) (((_ctypes[(c)]&0x08)==0)?0:1)
#define isalnum(c) (((_ctypes[(c)]&0x07) == 0)?0:1)
#define isspace(c) (((_ctypes[(c)]&0X10) == 0)?0:1)
#define ispunct(c) (((_ctypes[(c)]&0X20) == 0)?0:1)
#define isgraph(c) (((_ctypes[(c)]&0X40) == 0)?0:1)
#define iscntrl(c) (((_ctypes[(c)]&0X80) == 0)?0:1)

#define	isprint(c)	(((c)>=0X20)&&((c)<=0X7E))

#define _tolower(c) ((c)+('a'-'A'))
#define _toupper(c) ((c)-('a'-'A'))


