# HW1
    
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
        li      $v0, 4                  # String
        la      $a0, prompt
        syscall
        li      $v0, 5                  # Read int, into $s0
        syscall
      move    $s0, $v0
    
        li      $v0, 4                  # String
        la      $a0, prompt
        syscall

       li       $v0, 5
       syscall
       move    $t1, $v0  #$t1 is a second input number



        # See if it's a 1, go to hourglass
        li      $t0, 1
        beq     $s0, $t0, hourglass


       #if it's a 2 go to star
        j   superstar


hourglass:

	        



	li $t4, 1
	li $t3, 1	#initial value 1
	add $s3,$t1,$zero
	add $s3,$s3,$s3	#$s3=2*second number
	add $s4,$s3,$zero
	addi   $s4,$s4,-1   #$s4=2*second number-1
	move $s7,$t1
	addi $s7,$s7,-2
	add $s7,$s7,$s7

 loop1:	
	

	beq $t3,$s3,h2
	


	beq $t3,$t4,loopinner1
	
	j part2
loopinner1:
	li $t5, 0
loopinner11:
              li  $v0, 4                  # String
              la    $a0, starr
              syscall
	addi $t5,$t5,1
	bne $t5,$s3,loopinner11
	
              li  $v0, 4                  # String
              la    $a0, nl
              syscall
	
	j hourglassfinal


part2:
	li $t5,0
	li $t6,0
	move $t4,$t3   
	addi $t5,$t5,2  # $t5=2
	div $t3,$t5
	mfhi $t6		#reminder
	li $t4,0
	bne $t6,$t0,loopinner2   #if $t6 !=1 goto loopinner2
	j part3              

loopinner2:
	
	
	j hourglassfinal

part3:	
	
	li $t2,1		#k=1
	li $t6,0
	move $t4,$t3   
	li $t5,0
	addi $t5,$t5,2  # $t5=2
	div $t4,$t5
	mflo $t6
	sub $t4,$t4,$t6
	addi $t4,$t4,1  #$t4=(i-(i/2))+1

	li $t7,3
	li $t2,1

loopinner3:
	li  $v0, 4                  # String
              la    $a0, space
              syscall
	addi $t7,$t7,1
	slt $s1,$t7,$t4
	bne $s1,$zero,loopinner3	#if $t7!=$t4(2*second number) goto loopinner
	beq $t7,$t4,loopinner3	

	j part4
   
	
part4:
	li  $v0, 4                  # String
              la    $a0, starr
              syscall

	li $t7,0		#k=1
	
	beq $s7,$zero,afterloopinner4
	
	
	
loopinner4:
	
	li  $v0, 4                  # String
              la    $a0, space
              syscall
	addi $t7,$t7,1
	slt $s2,$t7,$s7
	bne $s2,$zero,loopinner4	#k2<=(2*d)-hh
	beq $s2,$t2,loopinner4
	
	addi $s7,$s7,-2
afterloopinner4:

	li  $v0, 4                  # String
              la    $a0, starr
              syscall

	move $t4,$t3   
	li $t5,0
	li $t6,0
	addi $t5,$t5,2  # $t5=2
	div $t4,$t5
	mflo $t6
	sub $t4,$t4,$t6
	addi $t4,$t4,1  #$t4=(i-(i/2))+1

	li $t7,3
	li $t2,1
loopinner5:
	li  $v0, 4                  # String
              la    $a0, space
              syscall
	addi $t7,$t7,1
	slt $s1,$t7,$t4

	bne $s1,$zero,loopinner5	#if $t7!=$t4(2*second number) goto loopinner




	li  $v0, 4                  # String
              la    $a0, nl
              syscall

		




hourglassfinal:
		addi $t3,$t3,1
		j loop1






h2:
	li $t4, 0
	li $t3, 0	
	li $t5, 0
	li $t6, 0
	li $t7, 0
	li $t2, 0   
	li $s1, 0
	li $s3, 0	
	li $s5, 0
	li $s6, 0
	li $s7, 0
	li $s2, 0 
	li $s4, 0
	        



	li $t4, 1
	li $t3, 1	#initial value 1
	li $s5,0
	addi $s5,$s5,1
	add $s3,$t1,$zero
	add $s3,$s3,$s3	#$s3=2*second number
	add $s4,$s3,$zero
	move $t3,$s3
	
	addi   $s4,$s4,-1   #$s4=2*second number-1
	move $s7,$t1
	addi $s7,$s7,-2
	add $s7,$s7,$s7
	move $s4,$zero
	

 l1:	
	

	beq $t3,$zero,final
	


	beq $t3,$s5,linner1
	
	j p2
linner1:
	li $t5, 0
linner11:
              li  $v0, 4                  # String
              la    $a0, starr
              syscall
	addi $t5,$t5,1
	bne $t5,$s3,linner11
	
              li  $v0, 4                  # String
              la    $a0, nl
              syscall
	
	j hourf


p2:
	li $t5,0
	li $t6,0
	move $t4,$t3   
	addi $t5,$t5,2  # $t5=2
	div $t3,$t5
	mfhi $t6		#reminder
	li $t4,0
	bne $t6,$t0,linner2   #if $t6 !=1 goto loopinner2
	j p3              

linner2:
	
	
	j hourf

p3:	
	
	li $t2,1		#k=1
	li $t6,0
	move $t4,$t3   
	li $t5,0
	addi $t5,$t5,2  # $t5=2
	div $t4,$t5
	mflo $t6
	sub $t4,$t4,$t6
	addi $t4,$t4,1  #$t4=(i-(i/2))+1

	li $t7,3
	li $t2,1

linner3:
	li  $v0, 4                  # String
              la    $a0, space
              syscall
	addi $t7,$t7,1
	slt $s1,$t7,$t4
	bne $s1,$zero,linner3	#if $t7!=$t4(2*second number) goto loopinner
	beq $t7,$t4,linner3	

	j p4
   
	
p4:
	li  $v0, 4                  # String
              la    $a0, starr
              syscall

	li $t7,0		#k=1
	
	beq $s4,$zero,afterlinner41
	
	
	
linner4:
	li $t5,0
	li  $v0, 4                  # String
              la    $a0, space
              syscall
	addi $t7,$t7,1
	
	slt $s2,$t7,$s4
	bne $s2,$zero,linner4	#k2<=(2*d)-hh
	beq $s2,$t2,linner4
afterlinner41:
	addi $s4,$s4,2
afterlinner4:
	
	li  $v0, 4                  # String
              la    $a0, starr
              syscall

	move $t4,$t3   
	li $t5,0
	li $t6,0
	addi $t5,$t5,2  # $t5=2
	div $t4,$t5
	mflo $t6
	sub $t4,$t4,$t6
	addi $t4,$t4,1  #$t4=(i-(i/2))+1

	li $t7,3
	li $t2,1
linner5:
	li  $v0, 4                  # String
              la    $a0, space
              syscall
	addi $t7,$t7,1
	slt $s1,$t7,$t4

	bne $s1,$zero,linner5	#if $t7!=$t4(2*second number) goto loopinner




	li  $v0, 4                  # String
              la    $a0, nl
              syscall


		




hourf:
		addi $t3,$t3,-1
		j l1



superstar:
		li $t4, 0	#use to initial any loop
	li $t3, 0	#initial value
	li $t5, 0
	li $t6, 0	#reminder
	li $t7, 0
	li $t2, 0   
	li $s1, 0
	li $s3, 0	
	li $s5, 0
	li $s6, 0
	li $s7, 0
	li $s2, 0 
	li $s4, 0
	        
	
	move $s6,$t1	#$s6=$t1
	add $s6,$s6,$s6	#$s6*2
	add $s6,$s6,$t1	#$s6*3
	addi $s6,$s6,1	#$s6*3+1
	move $s5,$t1	#$s5=$t1
	add $s5,$s5,$s5	#$s5*2
	addi $s5,$s5,1	#$s5*2+1
		
	
	li $t3,1
	

cycle1:
	
	beq $t3,$s5,h3
	addi $t7,$t3,1
	li $t5,0
	li $t6,0
	addi $t5,$t5,2  # $t5=2
	div $t3,$t5
	mfhi $t6
	beq $t6,$zero, cycle1change
	li $t4,1
	j cycle11
cycle1change:
	li      $v0, 4                  # String
        	la      $a0, nl
        	syscall
	j cyclef


		
cycle11:
	
	 li      $v0, 4                  # String
       	 la      $a0, space
        	 syscall
	addi $t4,$t4,1
	bne $t4,$s6,cycle11
	addi $s6,$s6,-1
	j cycle112


cycle112:
	li $t4,0

cycle12:
	
	beq $t4,$t7,cyclef
	li $t5,0
	li $t6,0
	addi $t5,$t5,2  # $t5=2
	div $t4,$t5
	mfhi $t6
	beq $t6,$zero,cycle1even
	j cycle1odd
cycle1even:
	 li      $v0, 4                  # String
       	 la      $a0, space
        	 syscall
	addi $t4,$t4,1
	j cycle12
cycle1odd:
	li      $v0, 4                  # String
       	 la      $a0, starr
        	 syscall	
	addi $t4,$t4,1
	j cycle12




cyclef:
		
		addi $t3,$t3,1
		j cycle1




h3:
	li $t4, 0
	li $t3, 0	
	li $t5, 0
	li $t6, 0
	li $t7, 0
	li $t2, 0   
	li $s1, 0
	li $s3, 0	
	li $s5, 0
	li $s6, 0
	li $s7, 0
	li $s2, 0 
	li $s4, 0
	
	move $s6,$t1	#$s6=$t1
	add $s6,$s6,$s6	#$s6*2
	add $s6,$s6,$t1	#$s6*3
	addi $s6,$s6,1
	add $s7,$s6,$s6
	addi $s7,$s7,2	#$s7=6*$t1+2

	move $s5,$t1	#$s5=$t1
	add $s5,$s5,$s5	
		#$s5=$t1*2+1
	
	li $t3,1      


star2:
	beq $s5,$t3,qq
	j qq2
qq:	
	li      $v0, 4                  # String
        	la      $a0, nl
        	syscall
	j h4
qq2:
	li $t5,0
	li $t6,0
	addi $t5,$t5,2  # $t5=2
	div $t3,$t5
	mfhi $t6
	beq $t6,$zero,star2even
	j star2part2
star2even:
	
	j star2final

star2part2:
	li $t4,1
	li $t5,0
	li $t6,0
	addi $t5,$t5,2  # $t5=2
	div $t3,$t5
	mflo $t6
	li $t7,0
	move $t7,$t6
	addi $t7,$t7,2

star2part2loop1:
	beq $t4,$t7,star2part3
	li      $v0, 4                  # String
        	la      $a0, space
        	syscall
	addi $t4,$t4,1
	j star2part2loop1
	
star2part3:
	li $t4,3	
star2part2loop2:
	beq $t4,$s7,star2final2
	li $t5,0
	li $t6,0
	addi $t5,$t5,2  # $t5=2
	div $t4,$t5
	mfhi $t6
	beq $t6,$zero,star2even2
	j star2odd2
star2even2:
	 li      $v0, 4                  # String
       	 la      $a0, space
        	 syscall
	addi $t4,$t4,1
	j star2part2loop2
star2odd2:
	li      $v0, 4                  # String
       	 la      $a0, starr
        	 syscall	
	addi $t4,$t4,1
	j star2part2loop2	
	




star2final:
	addi $t3,$t3,1
	j star2

star2final2:
	sub $s7,$s7,2
	addi $t3,$t3,1
	beq $t3,$s5,end
	li      $v0, 4                  # String
       	la      $a0, nl
        	syscall	
end:
	j star2





h4:
	li $t4, 0
	li $t3, 0	
	li $t5, 0
	li $t6, 0
	li $t7, 0
	li $t2, 0   
	li $s1, 0
	li $s3, 0	
	li $s5, 0
	li $s6, 0
	li $s7, 0
	li $s2, 0 
	li $s4, 0
	
	move $s7,$t1
	move $s6,$t1
	add    $s6,$s6,$s6	#$s6=2*$t1
	add    $s7,$s7,$t1	#$s7=2*$t1
	add    $s7,$s7,$s7	#$s7=4*$t1
	addi   $s7,$s7,2	#$s7=4*$t1+2
	move $t3,$s6
	addi  $t3,$t3,2       


star3:
	beq $zero,$t3,h5

	li $t5,0
	li $t6,0
	addi $t5,$t5,2  # $t5=2
	div $t3,$t5
	mfhi $t6
	beq $t6,$zero,star3even
	j star3part2
star3even:

	j star3final

star3part2:
	li $t5,0
	li $t6,0
	addi $t5,$t5,2  # $t5=2
	div $t3,$t5
	mflo $t6
	move $t4,$t6
	addi $t4,$t4,1

star3part2loop1:
	beq $t4,$zero,star3part3
	li      $v0, 4                  # String
        	la      $a0, space
        	syscall
	addi $t4,$t4,-1
	j star3part2loop1
	
star3part3:
	move $t4,$s7		#a=e2+1	
	addi  $t4,$t4,-1
star3part2loop2:
	beq $t4,$zero,star3final2
	li $t5,0
	li $t6,0
	addi $t5,$t5,2  # $t5=2
	div $t4,$t5
	mfhi $t6
	beq $t6,$zero,star3even2
	j star3odd2
star3even2:
	 li      $v0, 4                  # String
       	 la      $a0, space
        	 syscall
	addi $t4,$t4,-1
	j star3part2loop2
star3odd2:
	li      $v0, 4                  # String
       	 la      $a0, starr
        	 syscall	
	addi $t4,$t4,-1
	j star3part2loop2	
	




star3final:
	addi $t3,$t3,-1
	j star3

star3final2:
	addi $s7,$s7,2
	li      $v0, 4                  # String
       	la      $a0, nl
        	syscall	
	addi $t3,$t3,-1
	
	j star3




h5:
	li $t4, 0	#use to initial any loop
	li $t3, 0	#initial value
	li $t5, 0
	li $t6, 0	#reminder
	li $t7, 0
	li $t2, 0   
	li $s1, 0
	li $s3, 0	
	li $s5, 0
	li $s6, 0
	li $s7, 0
	li $s2, 0 
	li $s4, 0
	        
	
	move $s6,$t1	#$s6=$t1
	add $s6,$s6,$s6	#$s6*2
	add $s6,$s6,$t1	#$s6*3
	addi $s6,$s6,1	#$s6*3+1
	move $s5,$t1	#$s5=$t1
	move $s4,$t1
	add $s5,$s5,$s5	#$s5=$t1*2
	add $s4,$s4,$s4	#$s4=$t1*2
	addi $s5,$s5,2	#$s5=$t1*2+2
	
		
	
	move $t3,$s4
	

star4:
	
	beq $t3,$zero,final
	addi $t7,$t3,1
	li $t5,0
	li $t6,0
	beq $t3,$s4,qq3
	j qq4
qq3:	
	
	j star4f
qq4:
	addi $t5,$t5,2  # $t5=2
	div $t3,$t5
	mfhi $t6
	beq $t6,$zero, star4change
	move $t4,$s5
	j star41
star4change:

	li      $v0, 4                  # String
        	la      $a0, nl
        	syscall
	j star4f


		
star41:
	
	 li      $v0, 4                  # String
       	 la      $a0, space
        	 syscall
	addi $t4,$t4,-1
	bne $t4,$zero,star41
	addi $s5,$s5,1
	j star412


star412:
	move $t4,$t3
	li $s3,-1

star42:
	
	beq $t4,$s3,star4f
	li $t5,0
	li $t6,0
	addi $t5,$t5,2  # $t5=2
	div $t4,$t5
	mfhi $t6
	beq $t6,$zero,star4even
	j star4odd
star4even:
	 li      $v0, 4                  # String
       	 la      $a0, space
        	 syscall
	addi $t4,$t4,-1
	j star42
star4odd:
	li      $v0, 4                  # String
       	 la      $a0, starr
        	 syscall	
	addi $t4,$t4,-1
	j star42




star4f:
	
		addi $t3,$t3,-1
		j star4




final:
jr $ra

      .data
prompt: .asciiz ">"                     # Input prompt
tmsg:   .asciiz "The total is: "        # Total message.
nl:     .asciiz "\n"                    # Newline
hello:	.asciiz "Input what shape you want\n"
starr: .asciiz "*"  #star
space: .asciiz " " #space

