.equ LOW,    0
.equ HIGH,   1
.equ INPUT,  0
.equ OUTPUT, 1

//LED WiringPi Configuration
.equ BLUETWO, 26
.equ BLUEONE, 27
.equ YELLOW,  28
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

	mov r0, #YELLOW		//Moves YELLOW to r0
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
