	.text
	.globl     __start	
__start:


    ori $t6, $zero, 0 # counter
    ori $t0, $zero, 0 # negative
    ori $t1, $zero, 0 # positive
    ori $t2, $zero, 0 # zero
    ori $t3, $zero, 0 # odd
    ori $t4, $zero, 0 # even
    lw $t5, 0x1014($zero) # array
    ori $t7, $t7, 800
    

loop:
    addi $t6, $t6, 4 #counter
    
    andi $s2, $t5, 1 #for even numbers

    slt $s4, $t5, $zero #for negative
    
    slt $s5, $zero, $t5 #for positive

    add $t3, $t3, $s2 #increment even

    add $t0, $t0, $s4 #increment negative

    add $t1, $t1, $s5 #increment positive

    
    lw $t5, 0x1014($t6)
    bne $t6, $t7, loop

    ori $t2, $t2, 200 #load 200 to make neccessary subtractions
    ori $t4, $t4, 200 #load 200 to make neccessary subtractions

    sw $t0, 0x1000($zero) #store negatives
    sw $t3, 0x100C($zero) #store odds

    sub $t2, $t2, $t1 #do 200 - positives

    sub $t4, $t4, $t3 #do 200 - odds to get the evens
    sw $t1, 0x1004($zero) #store positive
    
    sub $t2, $t2, $t0 #do 200 - positives - negatives to get the number of zeroes
    
    ori $v0, $v0, 10 #for syscall to end program
    sw $t4, 0x1010($zero) #store even
    
    sw $t2, 0x1008($zero) #store zero
    
	syscall


.data
.org 0x1000
N: .word 0
P: .word 0
Z: .word 0
O: .word 0
E: .word 0
A: .word -89, 44, -69, -54, -56, -88, -42, -32, -94, -71, 0, -64, 73, 20, -44, -81, 67, -81, 100, -10, -12, 3, -3, -9, 72, -32, -65, 29, 34, -50, -77, 4, 13, 6, -69, 68, -60, -2, 7, 66, -46, -56, -39, -62, 10, -43, 38, -10, -62, -12, 2, 37, -76, -39, 27, -88, 94, -51, 70, 9, 68, -21, -55, 0, -13, -80, 96, -18, -31, 77, -9, 75, -46, 74, -76, -27, 84, 4, -46, -84, -34, 38, 48, -19, 22, -64, 76, -54, -56, -54, -20, -24, 76, -78, -82, -57, 90, 42, -84, -53, 22, -20, 20, 29, 59, -72, -75, 4, -33, 24, -54, 36, 53, -100, 96, -76, 95, 69, 100, 63, -2, 48, 51, 37, 99, 74, 22, -49, 25, 20, 77, 39, 0, 84, 23, 54, -23, -55, 41, 34, -80, -2, -98, 23, 28, 61, 55, -44, -22, 18, 97, -36, -32, 17, 70, 80, 9, -51, -99, -61, 69, 0, 39, 90, -12, -83, -19, -76, 83, 77, 35, -33, 31, 25, -99, -14, -3, -38, 43, -80, 39, -32, 44, 78, 35, 78, 5, 46, 42, -41, 1, 49, -87, 31, 22, 17, -81, -98, -58, -7