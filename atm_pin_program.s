.data  # Data segment: messages and arrays


msg1: .asciiz "Please enter the ["
msg2: .asciiz "] correct PIN\n"
msg3: .asciiz "] PIN\n"
msg4: .asciiz "Try again in 5 seconds\n"
msg5: .asciiz "Your card has been deactivated because you entered the wrong PIN 6 times\n"
msg6: .asciiz "End of options\n"
msg7: .asciiz "Correct PIN\n"
msg8: .asciiz "Please enter a number\n"
msg9: .asciiz "In array stogianni the ones are:"
msg10: .asciiz "\nThe zeros in array stogianni are:"
msg11: .asciiz "\nPlease enter a positive number\n"

.align 2

epitixes_pin: .space (16)

pin: .space (16)

stogianni: .space (60)

.text  # Code segment

# Main program: PIN input, validation and array processing
main:

li $t8,0

li $s1,1

li $s3,0
li $s4,0

    li $t1, 1
    li $t2, 0

 fill:

    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, msg2
    syscall

read_pin_correct :

li $v0, 5
syscall
move $t4, $v0

sw $t4, epitixes_pin($t2)

addi $t2, $t2, 4
addi $t1, $t1, 1

ble $t1, 4, read_pin_correct

li $t1, 1
li $t2, 0
li $t0, 0

 repeat :

li $t1, 1
li $t2, 0
addi $t0 , $t0 , 1

    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, msg3
    syscall

    beq  $t0 , 3 , wrong_pin1
    beq $t0 , 6 , wrong_pin2

read_pin :

li $v0, 5
syscall
move $t4, $v0

sw $t4, pin($t2)

addi $t2, $t2, 4
addi $t1, $t1, 1

ble $t1, 4, read_pin

li $t1, 1
li $t2, 0

sigkrisi :

	lw $t5, pin($t2)
	lw $t6, epitixes_pin($t2)


	bne $t5 , $t6 , repeat

	addi $t2, $t2, 4
	addi $t1, $t1, 1

	ble $t1 , 4 , sigkrisi

li $v0,11
li $a0,10
syscall

li $v0 ,4
la $a0 , msg7
syscall

li $v0,11
li $a0,10
syscall

li $t0,0
li $t1,0
li $t2,0

	li $v0 ,4
	la $a0 ,msg8
	syscall

fill_array_stogianni :

	li $v0,5
	syscall

	blt $v0 , 0 , negative_number1

	addi $t0 , $t0 ,1

	sw $v0, stogianni($t1)

	addi $t1 , $t1 , 4

	ble $t0 , 15 , fill_array_stogianni

li $t1, 0

li $v0,4
la $a0 , msg9
syscall

count_ones :

	lw $t2, stogianni($t1)
	beq $t2 , 1 , find_ones

continue_count1 :

	addi $t1 , $t1 ,4
	ble $t1 , 56 , count_ones

li $v0 , 1
move $a0, $s3
syscall

li $v0,4
la $a0 , msg10
syscall

li $t1,0

count_zero :

	lw $t2 , stogianni($t1)
	beq $t2 , 0 , find_zero

continue_count0 :
	addi $t1 , $t1 ,4
	ble $t1 , 56 , count_zero

li $v0 ,1
move $a0 ,$s4
syscall

li $t1,0

loop_dinami :

	lw $t2, stogianni($t1)

divide_if_zero :

	beq $t2 , 0 , continue_dinami

up_if_not_zero :

	beq $t2 , 1 , continue_dinami

addi $t8 , $t8 , 1

continue_dinami :

	addi $t1 , $t1 , 4
	ble $t1 , 56 , loop_dinami

beq $t8 , 15 , next1

li $v0 ,11
li $a0,10
syscall

loop2 :
li $t1,0

loop_count_if_zero :

	lw $t2 , stogianni($t1)
	beq $t2 , 1 , continue_loop_count

divide_if_zero2 :

	beq $t2 , 0 , break
	j continue_loop_count

break :
div $t8 , $s1
addi $s1 ,$s1 ,1
mflo $t8

continue_loop_count :

	addi $t1 ,$t1 ,4
	ble $t1 ,56 ,loop_count_if_zero
j loop2

negative_number1 :

li $v0,11
li $a0,10
syscall
li $v0,4
la $a0 ,msg11
syscall

li $t0,0
li $t1,0
li $t2,0

j fill_array_stogianni

negative_number2 :

li $v0,11
li $a0,10
syscall
li $v0,4
la $a0 ,msg11
syscall

li $t0,0
li $t1,0
li $t2,0

j replace_odd

negative_number3 :

li $v0,11
li $a0,10
syscall
li $v0,4
la $a0 ,msg11
syscall

li $t0,0
li $t1,0
li $t2,0

j replace_even

negative_number4 :

li $v0,11
li $a0,10
syscall
li $v0,4
la $a0 ,msg11
syscall

li $t0,0
li $t1,0
li $t2,0

j replace_max_min

find_ones :

addi $s3 , $s3 ,1
j continue_count1

find_zero :

addi $s4 ,$s4 ,1
j continue_count0

next1 :

li $t1,0
li $t2,0

replace_odd :

li $v0,11
li $a0,10
syscall
li $v0,11
li $a0,10
syscall
li $v0 ,4
la $a0 ,msg8
syscall

li $v0,5
syscall
blt $v0 ,0 ,negative_number2
move $t7, $v0

loop_replace_odd :

	lw $t2 , stogianni($t1)
	addi $t0 ,$t0 ,1
	div $t0 ,$s1
	mfhi $s7

beq $s7 , 0 ,continue_rest

sw $t7 , stogianni($t1)

continue_rest :

addi $t1 ,$t1 ,4
ble $t1 ,56 ,loop_replace_odd

li $t0,0
li $t1,0

replace_even :

li $v0,11
li $a0,10
syscall
li $v0,11
li $a0,10
syscall
li $v0 ,4
la $a0 ,msg8
syscall

li $v0,5
syscall
blt $v0 ,0 ,negative_number3
move $t6, $v0

loop_replace_even :

	lw $t2 , stogianni($t1)
	addi $t0 ,$t0 ,1
	div $t0 ,$s1
	mfhi $s7

bne $s7 , 0 ,continue_rest2

sw $t6 , stogianni($t1)

continue_rest2 :

addi $t1 ,$t1 ,4
ble $t1 ,56 ,loop_replace_even

li $t0,0
li $t1,0

replace_max_min :

li $v0,11
li $a0,10
syscall
li $v0,11
li $a0,10
syscall
li $v0 ,4
la $a0 ,msg8
syscall

li $v0,5
syscall
blt $v0 ,0 ,negative_number4
move $t3, $v0

li $t9,0
li $t0,1

find_max_min :

	lw $t2 , stogianni($t1)
	bgt $t2 , $t9 , find_max
	j continue_max_min

find_max :

move $t9 ,$t2

continue_max_min :

	addi $t1 ,$t1 ,4
	ble $t1 ,56 ,find_max_min

loop_division :
li $t1,0

loop_meso_orou :

	lw $t2 , stogianni($t1)
	add $t5 ,$t3 ,$t9
	add $t3 , $t2 , $t5
	addi $t0 ,$t0 ,1
	addu $t7 , $t2 , $t7

continue_max_min2 :

	addi $t1 ,$t1 ,4
	ble $t1 ,56 ,loop_meso_orou

div $t3 , $t0
mflo $t3
sw $t3 , stogianni($t7)

li $t1,0
li $t2,0

loop_print :

	lw $t2, stogianni($t1)

li $v0 ,1
move $a0 ,$t2
syscall

li $v0,11
li $a0,10
syscall

	addi $t1 ,$t1 ,4
	ble $t1 ,56 ,loop_print

li $t0 , 0
li $t7 , 0

wait :

li $t1 ,0

loop_sum :

	lw $t2 , stogianni($t1)
	add $t0 ,$t0 ,$t2

addi $t1 ,$t1 ,4
ble $t1 ,56 ,loop_sum

addi $t7 , $t7 ,1
blt $t7 , 5 , wait

avg :

div $t0 ,$t7
mflo $t0

li $v0 ,1
move $a0 ,$t0
syscall

li $t0 , 0
li $t7 , 0

wait2 :

li $t1 ,0

loop_sum2 :

	lw $t2 , stogianni($t1)
	add $t0 ,$t0 ,$t2

addi $t1 ,$t1 ,4
ble $t1 ,56 ,loop_sum2

addi $t7 , $t7 ,1 
blt $t7 , 10 , wait2

# Program termination
end :

li $v0,5
la $a0 , msg6
syscall

li $v0,10
syscall
