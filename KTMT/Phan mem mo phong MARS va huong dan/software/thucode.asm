.data
string: .asciiz
so_ky_tu_nhap: .asciiz "Nhap chuoi:"
so_chu_thuong: .asciiz "So chu thuong xuat hien:"
so_chu_hoa: .asciiz "\nSo chu hoa xuat hien:"
so_chu_so: .asciiz "\nSo chu so xuat hien:"
.text
main:
	#Nhap chuoi
	li $v0, 4
	la $a0, so_ky_tu_nhap
	syscall
	li $v0, 8 #Khai bao gia tri cho thanh ghi v0
	la $a0, string#Khai bao dia chi cho thanh ghi a0
	li $a1, 100 #so luong ky tu cho phep nhap
	syscall#Nhap chuoi
	li $t1,0 #Bat dau dem chu thuong 
	li $t2,0 #Bat dau dem chu hoa
	li $t3, 0 #Bat dau dem chu so
	move $s0, $a0 #Luu dia chi thanh ghi $a0
	li $t4, 0 #Khai bao bien i
	li $s1, 10#Khai bao \n
	li $s2, 97#Khai bao a
	li $s3, 122#Khai  bao z
	li $s4, 65#Khai  bao A
	li $s5, 90#Khai  bao Z
	li $s6, 48#Khai  bao 0
	li $s7, 57#Khai  bao 9
loop:
	add $t0, $s0, $t4
	lb $t6, 0($t0)
	#Vong lap dem chu thương
	beq $t6, $s1, exit
	bge $t6, $s2, check_chu_thuong
	bge $t6, $s4, check_chu_hoa
	bge $t6, $s6, check_chu_so
	j next_loop
check_chu_thuong:
	ble $t6, $s3, tang_thuong
	j next_loop
	tang_thuong:
	addi $t1, $t1, 1
	j next_loop
check_chu_hoa:
	ble $t6, $s5, tang_hoa
	j next_loop
	tang_hoa:
	addi $t4, $t4, 1
	addi $t2, $t2, 1
	j next_loop
check_chu_so:
	ble $t6, $s7, tang_so
	j next_loop
	tang_so:
	addi $t3, $t3, 1
	j next_loop
next_loop:
	addi $t4, $t4, 1
	j loop
exit:
	#Xuat ket qua dem thuong
		li $v0, 4
		la $a0, so_chu_thuong
		syscall
	
		li $v0, 1
		move $a0, $t1
		syscall
	#Xuat ket qua dem hoa
		li $v0, 4
		la $a0, so_chu_hoa
		syscall
		
		li $v0, 1
		move $a0, $t2
		syscall
	#Xuat ket qua dem so
		li $v0, 4
		la $a0, so_chu_so
		syscall
	
		li $v0, 1
		move $a0, $t3
		syscall
