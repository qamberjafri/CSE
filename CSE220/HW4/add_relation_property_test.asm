# add test cases to data section
# Test your code with different Network layouts
# Don't assume that we will use the same layout in all our tests
.data
Name1: .asciiz "Cacophonix"
Name2: .asciiz "Getafix"
Frnd_prop: .asciiz "FRIEND"

Network:
  .word 5   #total_nodes (bytes 0 - 3)
  .word 10  #total_edges (bytes 4- 7)
  .word 12  #size_of_node (bytes 8 - 11)
  .word 12  #size_of_edge (bytes 12 - 15)
  .word 3   #curr_num_of_nodes (bytes 16 - 19)
  .word 2   #curr_num_of_edges (bytes 20 - 23)
  .asciiz "NAME" # Name property (bytes 24 - 28)
  .asciiz "FRIEND" # FRIEND property (bytes 29 - 35)
   # nodes (bytes 36 - 95)	
  .asciiz "Jane Doe\0\0\0\0John Doe\0\0\0\0Ali Tourre\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"
   # set of edges (bytes 96 - 215)
  .word 268501056 268501092 0 268501068 268501092 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

.text:
main:
	la $a0, Network
	#jal create_person
	move $s0, $a0
	
	la $a0, Network
	addi $a1, $a0, 72
	addi $a2, $a0, 48
	la $a3, Frnd_prop
	addi $sp, $sp, -4
	li $s1, 1
	sw $s1, 0($sp) 
	jal add_relation_property
	
	#write test code
	
	move $a0,$v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
	
.include "hw4.asm"
