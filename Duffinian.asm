	.data
numero: .word 1126

	.text
main:	la $t0,numero
	lw $s0,0($t0)
	ble $s0,1,non_duffiniano
	move $s1,$s0
	li $s6,1
	li $s3,2
	li $s7,0
	#li $s2,1
	
	
ciclo_fattori:
	beq $s1,1,fine_fattorizzazione	#beq,$s1,$s2,fine_fattorizzazione
	div $s1,$s3
	mfhi $t1
	bne $t1,$zero,prossimo_divisore	
	bne $s3,$s1,vero_composto
	beq $s7,$zero,non_duffiniano	#nessun divisore tra 2 e n-1 trovato, quindi è primo
	j ultimo_fattore 
vero_composto:
	li $s7,1
	li $s4,0
	j conta_esponente
ultimo_fattore:
	li $s4,1	#esponente=1
	
	li $s5,1
	add $s5,$s5,$s1
	mult $s6,$s5
	mfhi $t8
	mflo $s6
	srl $t9,$s6,31
	beq $t9,$zero,POS1
	li $t9,-1
POS1:
	bne $t8,$t9,overflow
    
	j fine_fattorizzazione
	

conta_esponente:
	div $s1,$s3
	mfhi $t1	#t1=resto
	bne $t1,$zero,esponente_finito
	mflo $s1	#s1=s1/p
	addi $s4,$s4,1
	j conta_esponente
esponente_finito:
	li $s5,1	#somma=1
	li $t2,1	#p^0=1
	li $t3,0
costruisci_blocco:
	beq $t3,$s4,blocco_finito
	mult $t2,$s3
	mfhi $t8
	mflo $t2
	srl $t9,$t2,31
	beq $t9,$zero,POS2
	li $t9,-1
POS2:
	bne $t8,$t9,overflow
	
	addu $t0,$s5,$t2
	xor $t1,$s5,$t2
	bltz $t1,no_overflow
	xor $t2,$s5,$t0
	bltz $t2,overflow
no_overflow:
	move $s5,$t0

	addi $t3,$t3,1
	j costruisci_blocco
blocco_finito:
	mult $s6,$s5
	mfhi $t8
	mflo $s6
	srl $t9,$s6,31
	beq $t9,$zero,POS3
	li $t9,-1
POS3:
	bne $t8,$t9,overflow

	j ciclo_fattori
prossimo_divisore:
	addi $s3,$s3,1
	j ciclo_fattori
fine_fattorizzazione:	
	move $t0,$s0
	move $t1,$s6
mcd_loop:
	beq $t1,$zero,mcd_finito
	div $t0, $t1
	mfhi $t2	#resto
	move $t0,$t1
	move $t1,$t2
	j mcd_loop
mcd_finito:
	li $t3,1
	beq $t0,$t3,duffiniano
	j non_duffiniano
	
duffiniano:
	li $v0,1
	j fine
non_duffiniano:
	li $v0,0
	j fine


overflow:
    	li $v0,-1      
    	j fine
fine:
	j fine
	

