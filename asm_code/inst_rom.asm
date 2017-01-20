
inst_rom.om:     file format elf32-tradbigmips

Disassembly of section .text:

00000000 <_start>:
   0:	20020005 	addi	v0,zero,5
   4:	2003000c 	addi	v1,zero,12
   8:	2067fff7 	addi	a3,v1,-9
   c:	00e22025 	or	a0,a3,v0
  10:	00642824 	and	a1,v1,a0
  14:	00a42820 	add	a1,a1,a0
  18:	10a70013 	beq	a1,a3,68 <end>
  1c:	00000000 	nop
  20:	0064202a 	slt	a0,v1,a0
  24:	10800002 	beqz	a0,30 <around>
  28:	00000000 	nop
  2c:	20050000 	addi	a1,zero,0

00000030 <around>:
  30:	00e2202a 	slt	a0,a3,v0
  34:	00853820 	add	a3,a0,a1
  38:	00e23822 	sub	a3,a3,v0
  3c:	ac670044 	sw	a3,68(v1)
  40:	8c020050 	lw	v0,80(zero)
  44:	2003000a 	addi	v1,zero,10
  48:	20020000 	addi	v0,zero,0

0000004c <loop>:
  4c:	20420001 	addi	v0,v0,1
  50:	2063ffff 	addi	v1,v1,-1
  54:	10600004 	beqz	v1,68 <end>
  58:	00000000 	nop
  5c:	08000013 	j	4c <loop>
  60:	00000000 	nop
  64:	20020001 	addi	v0,zero,1

00000068 <end>:
  68:	ac020054 	sw	v0,84(zero)
Disassembly of section .reginfo:

00000000 <.reginfo>:
   0:	000000bc 	0xbc
	...
