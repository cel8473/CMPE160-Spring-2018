/*LAB 12*/
typedef int Int32;
typedef short int Int16;
typedef char Int8;
typedef unsigned int UInt32;
typedef unsigned short int UInt16;
typedef unsigned char UInt8;


/* assembly language subroutines */
char GetChar (void);
void Init_UART0_IRQ (void);
void PutChar (char Character);
void PutNumU (UInt8);
void PutStringSB (char String[], int StringBufferCapacity);
void Init_LED(void);
void NewLine(void);
void Turn_G(void);
void Turn_R(void);
void Turn_B(void);
void Turn_OFF(void);
void Init_PIT_IRQ(void);
int KeyPressed(void);
void StartStopWatch(void);
UInt32 getCount(void);
