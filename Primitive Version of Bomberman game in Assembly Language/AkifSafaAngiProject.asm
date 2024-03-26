			.data
SizeStr:		.asciiz "Please enter size of map: "
StepStr:		.asciiz "Please enter number of seconds: "
InputStr:		.asciiz "Please enter input of map:\n"
NewLine:		.asciiz "\n"
 
			.text
Main:			# Get map size from user
			la $a0, SizeStr # Add address of "Please enter size of map: "
			li $v0, 4 # v0 = 4 to print string
			syscall # Call syscall

			li $v0, 5 # v0 = 5 to read int from user
			syscall # Call syscall
			move $s0, $v0 # Move int input to s0
					
			# Get number of seconds
			la $a0, StepStr # Add address of "Please enter number of seconds: "
			li $v0, 4 # v0 = 4 to print string
			syscall # Call syscall
			
			li $v0, 5 # v0 = 5 to read int from user
			syscall # Call syscall
			move $s1, $v0 # Move int input to s0
			
			mul $t0, $s0, $s0 # Multiply size to find map size
			# Allocate memory for char map array
			add $a0, $zero, $t0 # a0 = 0 + t0, set a0 to map size, indicates how many bytes will allocate 
			li $v0, 9 # vo = 0 to allocate memory
			syscall # Call syscall
			move $s2, $v0 # Get address of string's memory to s2 register
			# Allocate memory for BombStepArray
			sll $t1, $t0, 2 # shift t0 2 bit, it means multiply with 4 and set t1
			add $a0, $zero, $t1 # Add how many bytes will allocate for int memory, char memory * 4
			li $v0, 9 # vo = 0 to allocate memory
			syscall # Call syscall
			move $s4, $v0 # Get address of int memory to s4 register
			
			
			add $s3, $zero, $zero # Counter of step, initialized as 0
			sge $t1, $s1, 1 # If number of seconds greater than 1, NoS >= 1
			bne $t1, 1, ExitProgram # If it's not 1, means that it's less than 1 so there is no step to turn
			addi $s3, $s3, 1 # Increases counter, s3 = s3 + 1
			
			# Get map from user
			la $a0, InputStr # Add address of "Please enter input of map: "
			li $v0, 4 # v0 = 4 to print string
			syscall # Call syscall
			
			move $a0, $s2 # Get address of MapArray to a0 register
			addi $t0, $t0, 1 # t0 = t0 + 1, # Map Size = sizeInput * sizeInput + 1(for ending character)
			add $a1, $zero, $t0 # Add t0 to a1, to indicate how many bytes string will get from user
			li $v0, 8 # Load 8 to v0 register to determine program will get input from user
			syscall # Call syscall to terminate v0's value and get input from user
			
			#Set bombs' step to UserPlace
			li $t0, 0 # t0 = 0
			li $t1, 1 # t1 = 1
			move $t2, $s2 # Get address of string map to t2 register
			move $t3, $s4 # Get address of int map to t3 regsiter
			# Loop for setting userPlace
			mul $t6, $s0, $s0 # Multiply size to find map size
			add $t5, $zero, $zero # Loop index -> t5, initialized as 0
UserPlaceLoop:		beq $t5, $t6, MainLoop # If index equal to bound of loop, jump to MainLoop
			lb $t4, 0($t2) # Get char from map string array
			beq $t4, 46, CharDot # If char equals to '.'
			beq $t4, 79, CharO # If char equals to 'O'

	CharO:		sw $t1, 0($t3) # Add int t1 to t3 address, int map array's current index = 1
			addi $t3, $t3, 4 # Go to next int of t3
			addi $t2, $t2, 1 # Go to next char of t2
			add, $t5, $t5, 1 # Increases loop index
			j UserPlaceLoop # Jump to the beginning of the loop
	CharDot:	sw $t0, 0($t3) # Add int t0 to t3 address, int map array's current index = 0
			addi $t3, $t3, 4 # Go to next int of t3
			addi $t2, $t2, 1 # Go to next char of t2
			add, $t5, $t5, 1 # Increases loop index
			j UserPlaceLoop # Jump to the beginning of the loop


MainLoop:		beq $s3, $s1, Exit # If counter of step equals to step input from user, finish the program
			addi $s3, $s3, 1 # Increases counter of step
			jal SecondStep
			j MainLoop


SecondStep:					add $t0, $zero, $zero # OuterLoop index -> t0, initialized as 0
						move $t2, $s2 # Get address of string map to t2 register
						move $t3, $s4 # Get address of int map to t3 register
						move $s7, $ra # Save current back address to s7

		SecondStepOuterLoop:		beq $t0, $s0, ExitSecondStepLoop # If outer loop finishes, exit the loop
						add $t1, $zero, $zero # InnerLoop index -> t1, initialized as 0
						addi $t0, $t0, 1 # Increases outer loop's index
		SecondStepInnerLoop:		beq $t1, $s0, SecondStepOuterLoop # If inner loop finishes, go to beginning of the outer loop
						lb $t4, 0($t2) # Get char from string array's current address
						beq $t4, 46, SecondStepCond # If char is equal to '.'
						add $t1, $t1, 1 # Increases inner loop's index 
						addi $t3, $t3, 4 # Go to next int of array
						addi $t2, $t2, 1  # Go to next char of array
						j SecondStepInnerLoop # Go back to beginning of the inner loop

			SecondStepCond:			li $t5, 79 # Load decimal number of 'O' to t5
							li $t6, 0  # Load zero to t6
							sb $t5, 0($t2) # Load char 'O' to string array's current address
							sw $t6, 0($t3) # Load 0 to int array's current address
							add $t1, $t1, 1 # Increases inner loop's index 
							addi $t3, $t3, 4 # Go to next int of array
							addi $t2, $t2, 1  # Go to next char of array
							j SecondStepInnerLoop # Go back to beginning of the inner loop
							
		ExitSecondStepLoop:			beq $s3, $s1, Exit # If counter of step equals to step input from user, finish the program
							addi $s3, $s3, 1 # Increases counter of step
							j ThirdStep


ThirdStep:					add $t0, $zero, $zero # OuterLoop index -> t0, initialized as 0
						move $t2, $s2 # Get address of string map to t2 register
						move $t3, $s4 # Get address of int map to t3 register

		ThirdStepOuterLoop:		beq $t0, $s0, ExitThirdStepLoop # If outer loop finishes, exit the loop
						add $t1, $zero, $zero # InnerLoop index -> t1, initialized as 0
		ThirdStepInnerLoop:		beq $t1, $s0, ThirdStepInnerLoopExit # If inner loop finishes, go to label to increase outer loop index
						jal ControlPlace # Go to control char subroutine
						add $t1, $t1, 1 # Increases inner loop's index 
						addi $t3, $t3, 4 # Go to next int of array
						addi $t2, $t2, 1  # Go to next char of array
						j ThirdStepInnerLoop # Go back to beginning of the inner loop
						

		ThirdStepInnerLoopExit:		addi $t0, $t0, 1 # Increases outer loop's index
						j ThirdStepOuterLoop  # Go back to beginning of the outer loop
		
ExitThirdStepLoop:		move $ra, $s7 # Get back old address to ra
				jr $ra # Go to beginning of the main loop


ControlPlace:			li $t6, 0  # Load 0 to t6
				li $t7, 1  # Load 1 to t7
				lw $t5, 0($t3) # Get int from int array's current address
				beq $t5, 1, ControlPlaceSit2 # If t5 == 1
				lb $t4, 0($t2) # Get char from string array's current address
				beq $t4, 79, ControlPlaceSit1 # If t4 == 'O'
				jr $ra # Jump back to ra
				
	ControlPlaceSit1:	sw $t7, 0($t3) # Store 1(int) int array's current address
				jr $ra # Jump back to ra
	
	ControlPlaceSit2:	li $t5, 46 # Load decimal number of '.' to t5
				sw $t6, 0($t3) # Load int 0 to string array's current address
				sb $t5, 0($t2) # Load char '.' to string array's current address
				
		ContPlaceCond1:		addi $t0, $t0, -1 # Decreases index i by one to control up char of the current location
					beq $t0, -1, ContPlaceCond2 # If t0 == -1, go to next condition
					sub $t8, $t2, $s0 # Current address - size, to go to the up char of the current location
					sb $t5, 0($t8) # Load char '.' to string array's current address
					
		ContPlaceCond2:		addi $t0, $t0, 1 # Reset index i to previous state.
		
					addi $t0, $t0, 1 # Increases index i by one to control down char of the current location
					beq $t0, $s0, ContPlaceCond3 # If t0 == s0(Outside the boundaries of the map), go to next condition
					add $t8, $t2, $s0 # Current address + size, to go to the down char of the current location
					sb $t5, 0($t8) # Load char '.' to string array's current address
				
		ContPlaceCond3:		addi $t0, $t0, -1 # Reset index i to previous state.
		
					addi $t1, $t1, -1  # Decreases index j by one to control left char of the current location
					beq $t1, -1, ContPlaceCond4 # If t1 == -1, go to next condition
					add $t8, $t2, -1 # Current address - 1, to go to the left char of the current location
					sb $t5, 0($t8) # Load char '.' to string array's current address
				
		ContPlaceCond4:		addi $t1, $t1, 1 # Reset index j to previous state.
		
					addi $t1, $t1, 1 # Increases index j by one to control right char of the current location
					beq $t1, $s0, ExitContPlace # If t1 == s0(Outside the boundaries of the map), go to next condition
					add $t8, $t2, 1  # Current address + 1, to go to the right char of current location
					sb $t5, 0($t8) # Load char '.' to string array's current address
					
		ExitContPlace:		addi $t1, $t1, -1 # Reset index j to previous state.
					jr $ra # Jump back to ra

MapPrint:			# Print Map Loop
				move $t0, $s2 # Load address of string map array to t0 register
				add $t1, $zero, $zero # Outside loop index -> t1, initialized as 0
	MapPrintLoop:		beq $t1, $s0, ExitMapPrintLoop # If outer loop finishes, exit the loop
				la $a0, NewLine # Get address of NewLine to a0 register
				li $v0, 4 # Load 4 to v0 register to determine program will print string
				syscall # Call syscall to terminate v0's value and print string
				add $t3, $zero, $zero # Inside loop index -> t3, initialized as 0
				addi $t1, $t1, 1 # Increases outer loop's index

	MapPrintInsideLoop:	beq $t3, $s0, MapPrintLoop # If inner loop finishes, go to beginning of the outer loop
				lb $a0, 0($t0) # Load char from current address
				li $v0, 11 # vo = 11 to print char
				syscall # Call syscall

				addi $t3, $t3, 1 # Increases inner loop's index
				addi $t0, $t0, 1 # Go to next char of array
				j MapPrintInsideLoop # Go to beginning of the outer loop
			
ExitMapPrintLoop:		jr $ra # Jump back to ra


Exit:			jal MapPrint # Jump and link to MapPrint

ExitProgram:		li $v0,10 # v0 = 10 to terminate program
			syscall  # call syscall
