.syntax unified

.global	read_sp
read_sp:
	mov r0 ,sp
	bx lr  

.global	read_msp
read_msp:
	mrs r0,msp 
	isb
	bx lr

.global	read_psp
read_psp:
	mrs r0,psp
	isb
	bx lr

.global	read_ctrl
read_ctrl:
	mrs r0,control 
	isb
	bx lr


.global	start_user
start_user:
	mov lr,r0	
	msr psp,r1  
	mov r0,0b11    
	msr control,r0 
	isb
	blx lr


.global	sw_priv
sw_priv:
	mov r0, 0b10
	msr control, r0
	isb
	bx lr
