.data
	newline: .ascii "\n"
.text
main: 
	li $t7, 0
	li $t6, 0
	li $v0, 5
	syscall #load value a
	move $t0, $v0 # move a to t0
	li $v0, 5 
	syscall #load value b
	move $t1 $v0 #move value b to t1
	li $t3, 0 #make t3 as index start
	
	
loop:
	##Stuff
	add $t2,$t2,$t1 # bassicly, t2 = t2 + b
	addi $t3,$t3,1 # Increment t3 with 1
	
	bne  $t0,$t3, loop # Check if a != t3
	#Return values here
	bne $t7, $t6, loop3
	

frac:
	li $t7, 1
	move $t5, $t2 # move sum t3 to argument t5
	li $t2, 0
	li $v0, 5
	syscall
	move $t1, $v0
	li $t0, 1
loop2:
	li $t3, 0
	j loop
loop3:
	move $t0, $t2
	li $t2, 0
	sub $t1, $t1,1
	bne $t1,1, loop2
	
li $v0, 1
move $a0, $t5
syscall
li $v0, 4
la $a0, newline
syscall
li $v0, 1
move $a0, $t0
syscall


	
