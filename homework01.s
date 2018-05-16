/*-------------------- homework01.s---------------------------kimdohwan*/
/*q1. use a assembly, input 2 numbers and printout.
q2. make functions add(), sub(), mul(), div() and printout by function.
q3. case of normalrity is return 0 ,abnormality is return -1(-1 is two's complement)
-----------------------------------------------------------------------*/
.data
//First message
.balign 4
message1 : .asciz "Hey, type a frist number: "
//Second message
.balign 4
message2 : .asciz "and, type a second number: "

//add message
.balign 4
add_message : .asciz "add is %d + %d = %d\n"
//sub message
.balign 4
sub_message : .asciz "sub is %d - %d = %d\n"
//multi message
.balign 4
mul_message : .asciz "mul is %d * %d = %d\n"
//div message
.balign 4
div_message : .asciz "div is %d / %d = %d\n"

//Format pattern for scanf
.balign 4
scan_pattern1 : .asciz "%d"
.balign 4
scan_pattern2 : .asciz "%d"

//where scanf will store the number read1,2
.balign 4
number_read1: .word 0
number_read2: .word 0

.balign 4
return1: .word 0
return2: .word -1

.text

//add function
add_function :
	ldr	r4, address_of_return2
	str	lr, [r4]
	
	ldr	r1, address_of_number_read1		//r1 <-&number_read1
	ldr	r1, [r1]				//r1 <-*r1
	ldr	r2, address_of_number_read2		//r2 <-&number_read2
	ldr	r2, [r2]				//r2 < *r2
	add	r3, r1, r2				//r3 <- r1 + r2
	ldr	r0, address_of_add_message		//r0 <- &addr_add_msg
	bl	printf					//call to printf	
	
	ldr	lr, address_of_return2
	ldr	lr, [lr]
	bx	lr

address_of_add_message :.word add_message

//sub function
sub_function :
	ldr	r4, address_of_return2
	str	lr, [r4]
	
	ldr	r1, address_of_number_read1		//r1 <-&number_read1
	ldr	r1, [r1]				//r1 <-*r1
	ldr	r2, address_of_number_read2		//r2 <-&number_read2
	ldr	r2, [r2]				//r2 < *r2
	sub	r3, r1, r2
	ldr	r0, address_of_sub_message
	bl	printf
	
	ldr	lr, address_of_return2
	ldr	lr, [lr]
	bx	lr

address_of_sub_message : .word sub_message

//multi function
mul_function :
	ldr	r4, address_of_return2
	str	lr, [r4]
	
	ldr	r1, address_of_number_read1		//r1 <-&number_read1
	ldr	r1, [r1]				//r1 <-*r1
	ldr	r2, address_of_number_read2		//r2 <-&number_read2
	ldr	r2, [r2]				//r2 < *r2
	mul	r3, r1, r2
	ldr	r0, address_of_mul_message
	bl	printf
	
	ldr	lr, address_of_return2
	ldr	lr, [lr]
	bx	lr

address_of_mul_message : .word mul_message

//div function
div_function :
	ldr	r4, address_of_return2
	str	lr, [r4]
	
	ldr	r1, address_of_number_read1		//r1 <-&number_read1
	ldr	r1, [r1]				//r1 <-*r1
	ldr	r2, address_of_number_read2		//r2 <-&number_read2
	ldr	r2, [r2]				//r2 < *r2
	sdiv	r3, r1, r2
	ldr	r0, address_of_div_message
	bl	printf
	
	ldr	lr, address_of_return2
	ldr	lr, [lr]
	bx	lr

address_of_div_message : .word div_message
//main function
.global main
main:
	ldr	r1, address_of_return1			//r1 <- &addr_return
	str	lr, [r1]				//*r1<- lr
	//scan data
	ldr	r0, address_of_message1			//r0 <- &addr_msg1
	bl	printf					//call to printf
	ldr	r0, address_of_scan_pattern1		//r0 <-scan1
	ldr	r1, address_of_number_read1		//r1 <-read1
	bl	scanf					//call to scanf
	ldr	r0, address_of_message2			//r0 <- &addr_msg2
	bl	printf					//call to printf
	ldr	r0, address_of_scan_pattern2		//r0 <-scan2
	ldr	r1, address_of_number_read2		//r1 <-read2
	bl	scanf

	bl	add_function
	bl	sub_function
	bl	mul_function
	bl	div_function
	
	ldr	lr, address_of_return1
	ldr	lr, [lr]
	bx	lr

//define address
address_of_message1 : .word message1
address_of_message2 : .word message2
address_of_scan_pattern1 : .word scan_pattern1
address_of_scan_pattern2 : .word scan_pattern2
address_of_number_read1 : .word number_read1
address_of_number_read2 : .word number_read2
address_of_return1 : .word return1
address_of_return2 : .word return2
//External
.global printf
.global scanf
