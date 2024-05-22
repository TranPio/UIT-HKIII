.data
string: .space 100
prompt: .asciiz "\nNhap chuoi: "
result_lowercase: .asciiz "\nSo chu cai thuong: "
result_uppercase: .asciiz "\nSo chu cai hoa: "
result_digit: .asciiz "\nSo chu so: "

.text
main:
    # In lời nhắc nhập chuỗi
    li $v0, 4
    la $a0, prompt
    syscall

    # Nhận chuỗi từ người dùng
    li $v0, 8
    la $a0, string
    li $a1, 100
    syscall
    
    # Khởi tạo biến đếm
    li $t0, 0    # Đếm chữ thường
    li $t1, 0    # Đếm chữ hoa
    li $t2, -1    # Đếm số
    la $t3, string  # Địa chỉ của chuỗi

count_loop:
    lb $t4, 0($t3)  # Lấy kí tự tiếp theo từ chuỗi
    beqz $t4, end_count  # Nếu kí tự là NULL, dừng đếm

    # Kiểm tra và đếm số
    li $t5, 48   # Mã ASCII '0'
    li $t6, 57   # Mã ASCII '9'
    ble $t4, $t6, add_so
    b check_hoa

check_hoa:
    # Kiểm tra và đếm chữ hoa
    li $t5, 65   # Mã ASCII 'A'
    li $t6, 90   # Mã ASCII 'Z'
    ble $t4, $t6, add_hoa
    b check_thuong

check_thuong:
    # Kiểm tra và đếm chữ thường
    li $t5, 97   # Mã ASCII 'a'
    li $t6, 122  # Mã ASCII 'z'
    ble $t4, $t6, add_thuong
    b next_check

add_so:
    addi $t2, $t2, 1
    j next_check

add_hoa:
    addi $t1, $t1, 1
    j next_check

add_thuong:
    addi $t0, $t0, 1
    addi $t3, $t3, 1
    j count_loop

next_check:
    addi $t3, $t3, 1      # Chuyển sang ký tự tiếp theo
    j count_loop

end_count:
    # In kết quả
    li $v0, 4
    la $a0, result_lowercase
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, result_uppercase
    syscall
    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, result_digit
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
