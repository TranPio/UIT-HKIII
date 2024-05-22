.data
	nhap: .ascii "Nhap vao mot chuoi: " 
	xuat:	.space 100
	DK_dung:	.ascii "\n"
.text 
	main:
	#Khai bao gia tri thanh ghi v0	
		li $v0, 8 
	#Khai bao dia chi thanh ghi a0
		la $a0, nhap
	#So ky tu cho phep nhap
		li $a1, 100
		syscall
		
		li $t1, 0
		la $t0, nhap 
		lb $t2, DK_dung
		add $t3, $t0, $t1
		lb $t4, 0($t3)
	loop_1:
	#Su dung do dai chuoi
		beq $t4, $t2, exit_1
		addi $t1, $t1, 1
		add $t3, $t1, $t0
		lb $t4, 0($t3)
		j loop_1
	exit_1:
		move $s1, $t1
		la $t5, xuat
		li $t6, 0
		add $t7, $t5, $t6
		lb $s2, 0($t7)
	loop_2:
		beqz $t1, exit_2
		subi $t1, $t1, 1
		add $t3, $t1, $t0
		lb $t4, 0($t3)
		move $s2, $t4
		sb $s2, 0($t7)
		addi $t6, $t6, 1
		add $t7, $t5, $t6
		lb $s2, 0($t7)
		j loop_2
	exit_2:
		la $t0, xuat
		add $t2, $t0, $t1
		lb $t3, 0($t2)
		li $t8, 2
	loop_3:
		beq $s1, $t1, exit_3
		div $t1, $t8
		mfhi $t4
		bnez $t4, ky_tu_ke_tiep 
		blt $t3, 97, ky_tu_ke_tiep 
		bgt $t3, 122, ky_tu_ke_tiep 
		subi $t3, $t3, 32
		sb $t3, 0($t2)
		j ky_tu_ke_tiep
	exit_3:
		move $a0, $t0
		li $v0, 4 
		syscall
	
		li $v0, 10 
		syscall
	ky_tu_ke_tiep:
		addi $t1, $t1, 1
		add $t2, $t1, $t0
		lb $t3, 0($t2)
		j loop_3
