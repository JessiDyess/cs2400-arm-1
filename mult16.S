		;		ARM Programming Assignment #1: 16 bit multiplier
		;
		;		Write a 16-bit multiplier, meaning numbers that have their high 16 bits set to 0.
		;		Use the standard shift-and-add operation.
		;		Note that we cannot address half-words here. We can only address words and bytes (B).
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		
numbers	DCD		0b1100101010010001, 0b1111010101000011
result	FILL		4
carry	FILL		4
		adr		r0, numbers  ; loads address of numbers
		mov		r1, #0       ; will be used as the offest wo that we can get every bit 
		ldr		r2,[r0,r1]   
		mov		r1, #4       ; changes address 
		ldr		r3,[r0,r1]
		mov		r4, #0
		mov		r5, #1       ; mask for bitwise AND in loop  
		mov		r6, #16
		mov		r7, #0
loop
		and		r7, r3, r5   ; Perform bitwise operation 
		cmp		r7, #0       ; check msb
		beq		mustAdd      ; if the most significant bit is 0 add first 
		
then
		mov		r2,r2, lsl #1 ; perform the shift left on the first number 
		mov		r3,r3,asr #1  ; perform the shift right on the second number 
		sub		r6, r6, #1
		cmp		r6, #0
		beq		exitLoop
		b		loop
		
exitLoop
		end
		
		
mustAdd
		add		r4,r4,r2  ; add here if the most significant bit is 0
		b		then
