		;		ARM Programming Assignment #1: Capitalizer
		;
		;		Write a program that goes through the characters in chars,
		;		and Capitalizes every lower-case letter that it finds..
		;		Write the number of capitalizations the program performed
		;		In the caps "fill" memory provided.
		
		;		Your code here
		
chars	DCD		'a', 'B', '5', 'q', '0', 'O', '1', 's', 'b', 'i', 'G'
caps		FILL		4
		
		ADR		R0, chars      ; loads the address of the first chaarcter of the array into register 0
		MOV		R1, #0         ; Put 0 into R1, this will be used as offset to allow traversal through the array
		MOV		R2, #0         ; Put 0 into R2, this will count how many characters get capitalized
		MOV		R4 , #0        ; keeps track of location in the array
loop
		LDR		R3, [R0, R1]   ; Loads the data from the address held in R0 plus the offset into R3
		MOV		R1, #4         ; Changes offest to 4 so form now on the offset will change the address when added to r0
		CMP		R3, #96        ; make comparison
break
		BGT		cap            ; branch to cap if the character is lowercase
		ADD		R4, R4, #4
		CMP		R4, #48
		BLT		iscap          ; if less branch to add count
		B		exit           ; else branch to exit ending loop
		
cap
		SUB		R3, R3, #32    ; subtract 32, this will change the asci code to represent the capital letter instead of the lowercase
		STR		R3, [R0]       ; stores result directly to memory
		ADD		R0, R0, R1     ; adds offset to address held at R0 going to next element in array
		ADD		R4, R4, #4     ; adds 4 to array counter (array size)
		B		loop   ; go back to loop
		
counter
		ADD		R2, R2, #1     ; Updates counter
		B		pause  ; Returns to pause
		
mid
		CMP		R3, #64
		BGT		counter
		B		break
iscap
		STR		R3, [R0]       ; stores current in memory
		ADD		R0, R0, R1     ; adds offset to addres in R0
		B		loop           ; returns to loop
		
		
exit
		STR		R2, [R0]
		END
