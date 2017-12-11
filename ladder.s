.equ LOW,    0
.equ HIGH,   1
.equ INPUT,  0
.equ OUTPUT, 1

//LED WiringPi Configuration
.equ BLUETWO, 6
.equ BLUEONE, 26
.equ YELLOWTWO, 27
.equ YELLOWONE,  28
.equ RED,     29

//Button WiringPi Configuration
.equ BUTTON,  1

.data
.global setup			//Sets up WiringPi
.global main			//Main
.section .text

.align 4
main:
	push {lr}		//Saves Original lr
	bl setup		//Branch to setUp
	bl gameWhile		//Branch to gameWhile
	mov r0, #0		//Moves #0 to r0
	pop {pc}

.align 4
setup:
	push {lr}		//Saves Original lr
	bl wiringPiSetup	//Branch to wiringPiSetup

	mov r0, #BLUETWO	//Moves BLUETWO to r0
	mov r1, #OUTPUT		//Moves OUTPUT to r1
	bl pinMode		//Branch to pinMode

	mov r0, #BLUEONE	//Moves BLUEONE to r0
	mov r1, #OUTPUT		//Moves OUTPUT to r1
	bl pinMode		//Branch to pinMode

	mov r0, #YELLOWTWO	//Moves YELLOWTWO to r0
	mov r1, #OUTPUT		//Moves OUTPUT to r1
	bl pinMode		//Branch to pinMode

	mov r0, #YELLOWONE	//Moves YELLOWONE to r0
	mov r1, #OUTPUT		//Moves OUTPUT to r1
	bl pinMode		//Branch to pinMode

	mov r0, #RED		//Moves RED to r0
	mov r1, #OUTPUT		//Moves OUTPUT to r1
	bl pinMode		//Branch to pinMode

	mov r0, #BUTTON		//Moves BUTTON to r0
	mov r1, #INPUT		//Moves INPUT to r1
	bl pinMode		//Branch to pinMode

	pop {pc}

.align 4
clear:
	push {lr}		//Saves Original lr
	
	mov r0, #BLUETWO	//Moves BLUETWO to r0
	mov r1, #LOW		//Moves LOW to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #BLUEONE	//Moves BLUEONE to r0
	mov r1, #LOW		//Moves LOW to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #YELLOWTWO	//Moves YELLOWTWO to r0
	mov r1, #LOW		//Moves LOW to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #YELLOWONE	//Moves YELLOWONE to r0
	mov r1, #LOW		//Moves LOW to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #RED		//Moves RED to r0
	mov r1, #LOW		//Moves LOW to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #500		//Moves 500 to r0
	bl delay		//Branch to delay

	bal gameWhile		//Branch to gameWhile

	pop {pc}

.align 4
gameWhile:
	push {lr}		//Saves Original lr

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalRead
	cmp r0, #HIGH		//Compares HIGH to r0
	bne clear		//Branch to clear if equal

	mov r0, #RED		//Moves RED to r0
	mov r1, #HIGH		//Moves HIGH to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #250		//Moves 250 to r0
	bl delay		//Branch to delay

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalRead
	cmp r0, #HIGH		//Compares HIGH to r0
	beq clear		//Branch to clear if equal
	bl yellowOneGame	//Branch to yellowGame

yellowOneGame:
	mov r0, #YELLOWONE	//Moves YELLOWONE to r0
	mov r1, #HIGH		//Moves HIGH to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #100		//Moves 100 to r0
	bl delay		//Branch to delay

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalRead
	cmp r0, #HIGH		//Compares HIGH to r0
	bne clear		//Branch to clear if equal

	mov r0, #YELLOWONE	//Moves YELLOWONE to r0
	mov r1, #LOW		//Moves LOW to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #500		//Moves 500 to r0
	bl delay		//Branch to delay

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalRead
	cmp r0, #HIGH		//Compares HIGH to r0
	bne clear		//Branch to clear if equal

	mov r0, #250		//Moves 250 to r0
	bl delay		//Branch to delay

	mov r0, #YELLOWONE	//Moves YELLOWONE to r0
	mov r1, #HIGH		//Moves HIGH to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #250		//Moves 250 to r0
	bl delay		//Branch to delay

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalRead
	cmp r0, #HIGH		//Compares HIGH to r0
	beq yellowOneGame	//Branch to yellowOneGame if equal
	bl yellowTwoGame	//Branch to blueOneGame

yellowTwoGame:
	mov r0, #YELLOWTWO	//Moves YELLOWTWO to r0
	mov r1, #HIGH		//Moves HIGH to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #100		//Moves 100 to r0
	bl delay		//Branch to delay

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalRead
	cmp r0, #HIGH		//Compares HIGH to r0
	bne clear		//Branch to clear if equal

	mov r0, #YELLOWTWO	//Moves YELLOWTWO to r0
	mov r1, #LOW		//Moves LOW to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #500		//Moves 500 to r0
	bl delay		//Branch to delay

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalRead
	cmp r0, #HIGH		//Compares HIGH to r0
	bne clear		//Branch to clear if equal

	mov r0, #250		//Moves 250 to r0
	bl delay		//Branch to delay

	mov r0, #YELLOWTWO	//Moves YELLOWTWO to r0
	mov r1, #HIGH		//Moves HIGH to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #250		//Moves 250 to r0
	bl delay		//Branch to delay

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalRead
	cmp r0, #HIGH		//Compares HIGH to r0
	beq yellowTwoGame	//Branch to yellowTwoGame if equal
	bl blueOneGame		//Branch to blueOneGame

blueOneGame:
	mov r0, #BLUEONE	//Moves BLUEONE to r0
	mov r1, #HIGH		//Moves HIGH to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #100		//Moves 100 to r0
	bl delay		//Branch to delay

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalRead
	cmp r0, #HIGH		//Compares HIGH to r0
	bne clear		//Branch to clear if equal

	mov r0, #BLUEONE	//Moves BLUEONE to r0
	mov r1, #LOW		//Moves LOW to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #250		//Moves 250 to r0
	bl delay		//Branch to delay

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalRead
	cmp r0, #HIGH		//Compares HIGH to r0
	bne clear		//Branch to clear if equal

	mov r0, #250		//Moves 250 to r0
	bl delay		//Branch to delay

	mov r0, #BLUEONE	//Moves BLUEONE to r0
	mov r1, #HIGH		//Moves HIGH to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #250		//Moves 250 to r0
	bl delay		//Branch to delay

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalRead
	cmp r0, #HIGH		//Compares HIGH to r0
	beq blueOneGame		//Branch to blueOneGame if equal
	bl blueTwoGame		//Branch to blueTwoGame

blueTwoGame:
	mov r0, #BLUETWO	//Moves BLUETWO to r0
	mov r1, #HIGH		//Moves HIGH to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #100		//Moves 100 to r0
	bl delay		//Branch to delay

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalRead
	cmp r0, #HIGH		//Compares HIGH to r0
	bne clear		//Branch to clear if equal

	mov r0, #BLUETWO	//Moves BLUETWO to r0
	mov r1, #LOW		//Moves LOW to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #250		//Moves 250 to r0
	bl delay		//Branch to delay

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalRead
	cmp r0, #HIGH		//Compares HIGH to r0
	bne clear		//Branch to clear if equal

	mov r0, #250		//Moves 250 to r0
	bl delay		//Branch to delay

	mov r0, #BLUETWO	//Moves BLUETWO to r0
	mov r1, #HIGH		//Moves HIGH to r1
	bl digitalWrite		//Branch to digitalWrite

	mov r0, #250		//Moves 250 to r0
	bl delay		//Branch to delay

	mov r0, #BUTTON		//Moves BUTTON to r0
	bl digitalRead		//Branch to digitalREAD
	cmp r0, #HIGH		//Compares HIGH to r0
	beq blueTwoGame		//Branch to blueTwoGame if equal

	mov r0, #1000		//Moves 1000 to r0
	bl delay		//Branch to delay

	pop {pc}
