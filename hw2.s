# hw2 
    
        .text
        .globl  main
main:
       
        # Place a zero in the sum
        li      $s1, 0
        li      $v0, 4                  # String
        la      $a0, hello
        syscall
        
        # Issume a prompt and read a string.
read:   
        la     $t7,aa		#$t7=&aa
        la     $t6,size		#$t6=$size

        li      $v0, 4                  # String
        la      $a0, prompt
        syscall

        li      $v0, 5                  # Read int, into $s0
        syscall
        move    $s0, $v0	#$s0=a
        move    $s1, $s0	#$s1=$s0

        li      $v0, 4                  # String
        la      $a0, prompt
        syscall

        li      $v0, 5                  # Read int, into $s1
        syscall
        move    $s2, $v0	#$s2=b
        move    $s3, $s2	#$s3=$s2
        j       calc

calc:
	li $s6,1		#$s6=x
	li $s7,0		#$s7=y
	li $s5,0		#$s5=gcd
	li $t0,0		#$t0=count
	li $t1,0		#judge big or small
	add $t4,$t7,$t0	#$t4 = $t7 + $t0
	j loop1

loop1:
	beq $s0,$zero,part2
	beq $s2,$zero,part2	
	slt $t1,$s0,$s2
	beq $t1,$zero,condition1
	j condition2

condition1:
	sw      $s0, 0($t4)
	addi    $t0,$t0,4
	addi    $t4,$t4,4	#$t4 = $t7 + $t0
	 sw     $s2, 0($t4)
	addi    $t0,$t0,4
	addi    $t4,$t4,4	#$t4 = $t7 + $t0
	
	li $t6,0 		#reminder
	div $s0,$s2
	mfhi $t6	
	move $s0,$t6

	j loop1	


condition2:
	 sw      $s2, 0($t4)
	addi    $t0,$t0,4
	addi    $t4,$t4,4	#$t4 = $t7 + $t0
	sw       $s0, 0($t4)
	addi    $t0,$t0,4
	addi    $t4,$t4,4	#$t4 = $t7 + $t0

	
	li $t6,0 		#reminder
	div $s2,$s0
	mfhi $t6	
	move $s2,$t6
	
	j loop1
	

part2:
	beq $s0,$zero,part2condition1
	j part2condition2
	
part2condition1:
	 move $s5,$s2
	sw     $s5, 0($t4)
	addi  $t0,$t0,4
	add   $t4,$t7,$t0	#$t4 = $t7 + $t0
	sw     $zero, 0($t4)
	addi  $t0,$t0,-4


	j part3

part2condition2:
	move $s5,$s0
	sw     $zero, 0($t4)
	addi  $t0,$t0,4
	add   $t4,$t7,$t0	#$t4 = $t7 + $t0
	sw     $s5, 0($t4)
	addi  $t0,$t0,-4


	j part3

	
	


part3:
	li $t8,-8
	li $t3,0
	li $t6,0
	li $t2,0		#temp
	li $t4,0
	move $t3,$t0
	
	addi $t3,$t3,-8	#int i=count-8
loop2:
	slt    $t1,$t3,$zero
	bne $t1,$zero,part4
	move $t2,$s6
	move $s6,$s7

	add   $t4,$t7,$t3	#$t4 = $t7 + $t3
	lw      $s0,0($t4)
	addi   $t4,$t4,4
	lw      $s2,0($t4)
	li       $t6,0
	div     $s0,$s2
	mflo   $t6
	move $t5,$t6
	li $t9,0
	mul $t9,$t6,$s7





loop21:
	sub $s7,$t2,$t9
	addi $t3,$t3,-8
	j loop2


     
	
	
part4:

	li $t1,0
	slt $t1,$s1,$s3
	bne $t1,$zero,part41
	j part42

part41:
	 li      $v0, 1
        	move    $a0, $s7
        	syscall	

	li      $v0, 4
        	la    $a0, nl
        	syscall
	

	 li      $v0, 1
        	move    $a0, $s6
        	syscall

	
	li      $v0, 4
        	la    $a0, nl
        	syscall
	
	 li      $v0, 1
        	move    $a0, $s5
        	syscall
	
	
	li      $v0, 4
        	la    $a0, nl
        	syscall
	



	j final

part42:	
	li      $v0, 1
        	move    $a0, $s6
        	syscall	

	li      $v0, 4
        	la    $a0, nl
        	syscall
	

	 li      $v0, 1
        	move    $a0, $s7
        	syscall

	
	li      $v0, 4
        	la    $a0, nl
        	syscall
	
	 li      $v0, 1
        	move    $a0, $s5
        	syscall
	
	
	li      $v0, 4
        	la    $a0, nl
        	syscall
	



	

	j final	


final:
jr $ra














        .data
prompt: .asciiz ">"                     # Input prompt
tmsg:   .asciiz "The total is: "        # Total message.
nl:     .asciiz "\n"                    # Newline
hello:	.asciiz "Input intergers\n"
aa:	.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
size:  .word 20
