.data
    TB_nhap : .asciiz "Nhap vao mot chuoi: "
    TB_xuat: .asciiz "Chuoi da dao nguoc la: "
    TB_too_short: .asciiz "Chuoi it nhat phai co 20 ky tu."
    nhap: .space 100
    xuat: .space 100
    DK_dung: .asciiz "\n"

.text
main:

    # In thông báo yêu cầu nhập chuỗi
    li $v0, 4     
    la $a0, TB_nhap
    syscall
    
    # Nhập chuỗi
    li $v0, 8 
    la $a0, nhap
    li $a1, 100
    syscall
    
     # Tính độ dài của chuỗi
    li $t0, 0         # Số ký tự hiện tại
    la $t1, nhap      # Địa chỉ bắt đầu của chuỗi
count_length:
    lb $t2, 0($t1)    # Đọc ký tự từ bộ nhớ
    beqz $t2, end_count  # Nếu ký tự là NULL (\0) thì kết thúc
    addi $t1, $t1, 1    # Tăng địa chỉ vùng nhớ lên 1 byte
    addi $t0, $t0, 1    # Tăng biến đếm lên 1
    j count_length      # Quay lại vòng lặp
    
    end_count:
    # Kiểm tra nếu độ dài chuỗi ít nhất 20 ký tự
    bge $t0, 20, reverse_string  # Nếu có ít nhất 20 ký tự, chuyển đến phần đảo ngược chuỗi
    li $v0, 4
    la $a0, TB_too_short
    syscall
    j end_program
    
reverse_string:
    # Tìm chiều dài chuỗi
    li $t1, 0
    la $t0, nhap 
    lb $t2, DK_dung
    add $t3, $t0, $t1
    lb $t4, 0($t3)

    # In thông báo xuất chuỗi đảo ngược
    li $v0, 4     
    la $a0, TB_xuat
    syscall
    
loop_1:
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

end_program:
    # Kết thúc chương trình
    li $v0, 10 
    syscall