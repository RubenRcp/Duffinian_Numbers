	.data 
numero: .word 0x4000000
	.text
main:	la $t0,numero
	lw $s0,0($t0)
	li $s3,2
loop:	mult $s3,$s3
	mfhi $t1
	mflo $s2
	bne $t1,$zero,overflow
	bltu $s2,$s0,sotto_radice
	move $v0,$s3
	j fine
	
sotto_radice:
	addi $s3,$s3,1
	j loop
overflow:
	li $v0,-1
	j fine
fine:
	j fine
	
	