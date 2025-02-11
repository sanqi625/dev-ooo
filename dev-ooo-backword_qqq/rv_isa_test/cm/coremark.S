
/tools/zdchen/riscv-proj/hello_world/build/coremark.elf:     file format elf32-littleriscv


Disassembly of section .text:

80000000 <__start>:
80000000:	00000093          	li	ra,0
80000004:	00000113          	li	sp,0
80000008:	00000193          	li	gp,0
8000000c:	00000213          	li	tp,0
80000010:	00000293          	li	t0,0
80000014:	00000313          	li	t1,0
80000018:	00000393          	li	t2,0
8000001c:	00000413          	li	s0,0
80000020:	00000493          	li	s1,0
80000024:	00000513          	li	a0,0
80000028:	00000593          	li	a1,0
8000002c:	00000613          	li	a2,0
80000030:	00000693          	li	a3,0
80000034:	00000713          	li	a4,0
80000038:	00000793          	li	a5,0
8000003c:	00000813          	li	a6,0
80000040:	00000893          	li	a7,0
80000044:	00000913          	li	s2,0
80000048:	00000993          	li	s3,0
8000004c:	00000a13          	li	s4,0
80000050:	00000a93          	li	s5,0
80000054:	00000b13          	li	s6,0
80000058:	00000b93          	li	s7,0
8000005c:	00000c13          	li	s8,0
80000060:	00000c93          	li	s9,0
80000064:	00000d13          	li	s10,0
80000068:	00000d93          	li	s11,0
8000006c:	00000e13          	li	t3,0
80000070:	00000e93          	li	t4,0
80000074:	00000f13          	li	t5,0
80000078:	00000f93          	li	t6,0
8000007c:	40000117          	auipc	sp,0x40000
80000080:	f8410113          	add	sp,sp,-124 # c0000000 <__stack_base>
80000084:	20001297          	auipc	t0,0x20001
80000088:	88828293          	add	t0,t0,-1912 # a000090c <__bss_end>
8000008c:	20001317          	auipc	t1,0x20001
80000090:	88030313          	add	t1,t1,-1920 # a000090c <__bss_end>

80000094 <clear_bss_loop>:
80000094:	0002a023          	sw	zero,0(t0)
80000098:	00428293          	add	t0,t0,4
8000009c:	fe62cce3          	blt	t0,t1,80000094 <clear_bss_loop>
800000a0:	20001297          	auipc	t0,0x20001
800000a4:	84428293          	add	t0,t0,-1980 # a00008e4 <__sbss_start>
800000a8:	20001317          	auipc	t1,0x20001
800000ac:	86430313          	add	t1,t1,-1948 # a000090c <__bss_end>

800000b0 <clear_sbss_loop>:
800000b0:	0002a023          	sw	zero,0(t0)
800000b4:	00428293          	add	t0,t0,4
800000b8:	fe62cce3          	blt	t0,t1,800000b0 <clear_sbss_loop>
800000bc:	058050ef          	jal	80005114 <main>
800000c0:	061040ef          	jal	80004920 <to_host>
800000c4:	10500073          	wfi

800000c8 <__udivdi3>:
#endif

#ifdef L_udivdi3
UDWtype
__udivdi3 (UDWtype n, UDWtype d)
{
800000c8:	00050893          	mv	a7,a0
800000cc:	00058313          	mv	t1,a1
  d0 = dd.s.low;
800000d0:	00060713          	mv	a4,a2
  n0 = nn.s.low;
800000d4:	00050813          	mv	a6,a0
  n1 = nn.s.high;
800000d8:	00058793          	mv	a5,a1
  if (d1 == 0)
800000dc:	28069263          	bnez	a3,80000360 <__udivdi3+0x298>
      if (d0 > n1)
800000e0:	a00005b7          	lui	a1,0xa0000
800000e4:	03c58593          	add	a1,a1,60 # a000003c <__clz_tab>
800000e8:	0ec37663          	bgeu	t1,a2,800001d4 <__udivdi3+0x10c>
	  count_leading_zeros (bm, d0);
800000ec:	000106b7          	lui	a3,0x10
800000f0:	0cd67863          	bgeu	a2,a3,800001c0 <__udivdi3+0xf8>
800000f4:	10063693          	sltiu	a3,a2,256
800000f8:	0016b693          	seqz	a3,a3
800000fc:	00369693          	sll	a3,a3,0x3
80000100:	00d65533          	srl	a0,a2,a3
80000104:	00a585b3          	add	a1,a1,a0
80000108:	0005c583          	lbu	a1,0(a1)
8000010c:	02000513          	li	a0,32
80000110:	00d586b3          	add	a3,a1,a3
80000114:	40d505b3          	sub	a1,a0,a3
	  if (bm != 0)
80000118:	00d50c63          	beq	a0,a3,80000130 <__udivdi3+0x68>
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
8000011c:	00b317b3          	sll	a5,t1,a1
80000120:	00d8d6b3          	srl	a3,a7,a3
	      d0 = d0 << bm;
80000124:	00b61733          	sll	a4,a2,a1
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
80000128:	00f6e7b3          	or	a5,a3,a5
	      n0 = n0 << bm;
8000012c:	00b89833          	sll	a6,a7,a1
	  udiv_qrnnd (q0, n0, n1, n0, d0);
80000130:	01075593          	srl	a1,a4,0x10
80000134:	02b7d333          	divu	t1,a5,a1
80000138:	01071613          	sll	a2,a4,0x10
8000013c:	01065613          	srl	a2,a2,0x10
80000140:	02b7f7b3          	remu	a5,a5,a1
80000144:	00030513          	mv	a0,t1
80000148:	026608b3          	mul	a7,a2,t1
8000014c:	01079693          	sll	a3,a5,0x10
80000150:	01085793          	srl	a5,a6,0x10
80000154:	00d7e7b3          	or	a5,a5,a3
80000158:	0117fe63          	bgeu	a5,a7,80000174 <__udivdi3+0xac>
8000015c:	00f707b3          	add	a5,a4,a5
80000160:	fff30513          	add	a0,t1,-1
80000164:	00e7e863          	bltu	a5,a4,80000174 <__udivdi3+0xac>
80000168:	0117f663          	bgeu	a5,a7,80000174 <__udivdi3+0xac>
8000016c:	ffe30513          	add	a0,t1,-2
80000170:	00e787b3          	add	a5,a5,a4
80000174:	411787b3          	sub	a5,a5,a7
80000178:	02b7d8b3          	divu	a7,a5,a1
8000017c:	01081813          	sll	a6,a6,0x10
80000180:	01085813          	srl	a6,a6,0x10
80000184:	02b7f7b3          	remu	a5,a5,a1
80000188:	031606b3          	mul	a3,a2,a7
8000018c:	01079793          	sll	a5,a5,0x10
80000190:	00f86833          	or	a6,a6,a5
80000194:	00088793          	mv	a5,a7
80000198:	00d87c63          	bgeu	a6,a3,800001b0 <__udivdi3+0xe8>
8000019c:	01070833          	add	a6,a4,a6
800001a0:	fff88793          	add	a5,a7,-1
800001a4:	00e86663          	bltu	a6,a4,800001b0 <__udivdi3+0xe8>
800001a8:	00d87463          	bgeu	a6,a3,800001b0 <__udivdi3+0xe8>
800001ac:	ffe88793          	add	a5,a7,-2
800001b0:	01051513          	sll	a0,a0,0x10
800001b4:	00f56533          	or	a0,a0,a5
	      q1 = 0;
800001b8:	00000593          	li	a1,0
  return __udivmoddi4 (n, d, (UDWtype *) 0);
}
800001bc:	00008067          	ret
	  count_leading_zeros (bm, d0);
800001c0:	01000537          	lui	a0,0x1000
800001c4:	01800693          	li	a3,24
800001c8:	f2a67ce3          	bgeu	a2,a0,80000100 <__udivdi3+0x38>
800001cc:	01000693          	li	a3,16
800001d0:	f31ff06f          	j	80000100 <__udivdi3+0x38>
	  count_leading_zeros (bm, d0);
800001d4:	00000693          	li	a3,0
	  if (d0 == 0)
800001d8:	00060c63          	beqz	a2,800001f0 <__udivdi3+0x128>
	  count_leading_zeros (bm, d0);
800001dc:	000107b7          	lui	a5,0x10
800001e0:	0cf67063          	bgeu	a2,a5,800002a0 <__udivdi3+0x1d8>
800001e4:	10063693          	sltiu	a3,a2,256
800001e8:	0016b693          	seqz	a3,a3
800001ec:	00369693          	sll	a3,a3,0x3
800001f0:	00d657b3          	srl	a5,a2,a3
800001f4:	00f585b3          	add	a1,a1,a5
800001f8:	0005c783          	lbu	a5,0(a1)
800001fc:	00d787b3          	add	a5,a5,a3
80000200:	02000693          	li	a3,32
80000204:	40f685b3          	sub	a1,a3,a5
	  if (bm == 0)
80000208:	0af69663          	bne	a3,a5,800002b4 <__udivdi3+0x1ec>
	      n1 -= d0;
8000020c:	40c307b3          	sub	a5,t1,a2
	      q1 = 1;
80000210:	00100593          	li	a1,1
	  udiv_qrnnd (q0, n0, n1, n0, d0);
80000214:	01075893          	srl	a7,a4,0x10
80000218:	0317de33          	divu	t3,a5,a7
8000021c:	01071613          	sll	a2,a4,0x10
80000220:	01065613          	srl	a2,a2,0x10
80000224:	01085693          	srl	a3,a6,0x10
80000228:	0317f7b3          	remu	a5,a5,a7
8000022c:	000e0513          	mv	a0,t3
80000230:	03c60333          	mul	t1,a2,t3
80000234:	01079793          	sll	a5,a5,0x10
80000238:	00f6e7b3          	or	a5,a3,a5
8000023c:	0067fe63          	bgeu	a5,t1,80000258 <__udivdi3+0x190>
80000240:	00f707b3          	add	a5,a4,a5
80000244:	fffe0513          	add	a0,t3,-1
80000248:	00e7e863          	bltu	a5,a4,80000258 <__udivdi3+0x190>
8000024c:	0067f663          	bgeu	a5,t1,80000258 <__udivdi3+0x190>
80000250:	ffee0513          	add	a0,t3,-2
80000254:	00e787b3          	add	a5,a5,a4
80000258:	406787b3          	sub	a5,a5,t1
8000025c:	0317d333          	divu	t1,a5,a7
80000260:	01081813          	sll	a6,a6,0x10
80000264:	01085813          	srl	a6,a6,0x10
80000268:	0317f7b3          	remu	a5,a5,a7
8000026c:	026606b3          	mul	a3,a2,t1
80000270:	01079793          	sll	a5,a5,0x10
80000274:	00f86833          	or	a6,a6,a5
80000278:	00030793          	mv	a5,t1
8000027c:	00d87c63          	bgeu	a6,a3,80000294 <__udivdi3+0x1cc>
80000280:	01070833          	add	a6,a4,a6
80000284:	fff30793          	add	a5,t1,-1
80000288:	00e86663          	bltu	a6,a4,80000294 <__udivdi3+0x1cc>
8000028c:	00d87463          	bgeu	a6,a3,80000294 <__udivdi3+0x1cc>
80000290:	ffe30793          	add	a5,t1,-2
80000294:	01051513          	sll	a0,a0,0x10
80000298:	00f56533          	or	a0,a0,a5
8000029c:	00008067          	ret
	  count_leading_zeros (bm, d0);
800002a0:	010007b7          	lui	a5,0x1000
800002a4:	01800693          	li	a3,24
800002a8:	f4f674e3          	bgeu	a2,a5,800001f0 <__udivdi3+0x128>
800002ac:	01000693          	li	a3,16
800002b0:	f41ff06f          	j	800001f0 <__udivdi3+0x128>
	      d0 = d0 << bm;
800002b4:	00b61733          	sll	a4,a2,a1
	      n2 = n1 >> b;
800002b8:	00f356b3          	srl	a3,t1,a5
	      udiv_qrnnd (q1, n1, n2, n1, d0);
800002bc:	01075513          	srl	a0,a4,0x10
	      n1 = (n1 << bm) | (n0 >> b);
800002c0:	00b31333          	sll	t1,t1,a1
800002c4:	00f8d7b3          	srl	a5,a7,a5
800002c8:	0067e7b3          	or	a5,a5,t1
	      udiv_qrnnd (q1, n1, n2, n1, d0);
800002cc:	02a6d333          	divu	t1,a3,a0
800002d0:	01071613          	sll	a2,a4,0x10
800002d4:	01065613          	srl	a2,a2,0x10
	      n0 = n0 << bm;
800002d8:	00b89833          	sll	a6,a7,a1
	      udiv_qrnnd (q1, n1, n2, n1, d0);
800002dc:	02a6f6b3          	remu	a3,a3,a0
800002e0:	026608b3          	mul	a7,a2,t1
800002e4:	01069593          	sll	a1,a3,0x10
800002e8:	0107d693          	srl	a3,a5,0x10
800002ec:	00b6e6b3          	or	a3,a3,a1
800002f0:	00030593          	mv	a1,t1
800002f4:	0116fe63          	bgeu	a3,a7,80000310 <__udivdi3+0x248>
800002f8:	00d706b3          	add	a3,a4,a3
800002fc:	fff30593          	add	a1,t1,-1
80000300:	00e6e863          	bltu	a3,a4,80000310 <__udivdi3+0x248>
80000304:	0116f663          	bgeu	a3,a7,80000310 <__udivdi3+0x248>
80000308:	ffe30593          	add	a1,t1,-2
8000030c:	00e686b3          	add	a3,a3,a4
80000310:	411686b3          	sub	a3,a3,a7
80000314:	02a6d8b3          	divu	a7,a3,a0
80000318:	01079793          	sll	a5,a5,0x10
8000031c:	0107d793          	srl	a5,a5,0x10
80000320:	02a6f6b3          	remu	a3,a3,a0
80000324:	03160633          	mul	a2,a2,a7
80000328:	01069693          	sll	a3,a3,0x10
8000032c:	00d7e7b3          	or	a5,a5,a3
80000330:	00088693          	mv	a3,a7
80000334:	00c7fe63          	bgeu	a5,a2,80000350 <__udivdi3+0x288>
80000338:	00f707b3          	add	a5,a4,a5
8000033c:	fff88693          	add	a3,a7,-1
80000340:	00e7e863          	bltu	a5,a4,80000350 <__udivdi3+0x288>
80000344:	00c7f663          	bgeu	a5,a2,80000350 <__udivdi3+0x288>
80000348:	ffe88693          	add	a3,a7,-2
8000034c:	00e787b3          	add	a5,a5,a4
80000350:	01059593          	sll	a1,a1,0x10
80000354:	40c787b3          	sub	a5,a5,a2
80000358:	00d5e5b3          	or	a1,a1,a3
8000035c:	eb9ff06f          	j	80000214 <__udivdi3+0x14c>
      if (d1 > n1)
80000360:	18d5e663          	bltu	a1,a3,800004ec <__udivdi3+0x424>
	  count_leading_zeros (bm, d1);
80000364:	000107b7          	lui	a5,0x10
80000368:	04f6f463          	bgeu	a3,a5,800003b0 <__udivdi3+0x2e8>
8000036c:	1006b713          	sltiu	a4,a3,256
80000370:	00173713          	seqz	a4,a4
80000374:	00371713          	sll	a4,a4,0x3
80000378:	a00007b7          	lui	a5,0xa0000
8000037c:	00e6d5b3          	srl	a1,a3,a4
80000380:	03c78793          	add	a5,a5,60 # a000003c <__clz_tab>
80000384:	00b787b3          	add	a5,a5,a1
80000388:	0007c783          	lbu	a5,0(a5)
8000038c:	00e787b3          	add	a5,a5,a4
80000390:	02000713          	li	a4,32
80000394:	40f705b3          	sub	a1,a4,a5
	  if (bm == 0)
80000398:	02f71663          	bne	a4,a5,800003c4 <__udivdi3+0x2fc>
		  q0 = 1;
8000039c:	00100513          	li	a0,1
	      if (n1 > d1 || n0 >= d0)
800003a0:	e066eee3          	bltu	a3,t1,800001bc <__udivdi3+0xf4>
800003a4:	00c8b533          	sltu	a0,a7,a2
800003a8:	00153513          	seqz	a0,a0
800003ac:	00008067          	ret
	  count_leading_zeros (bm, d1);
800003b0:	010007b7          	lui	a5,0x1000
800003b4:	01800713          	li	a4,24
800003b8:	fcf6f0e3          	bgeu	a3,a5,80000378 <__udivdi3+0x2b0>
800003bc:	01000713          	li	a4,16
800003c0:	fb9ff06f          	j	80000378 <__udivdi3+0x2b0>
	      d1 = (d1 << bm) | (d0 >> b);
800003c4:	00f65733          	srl	a4,a2,a5
800003c8:	00b696b3          	sll	a3,a3,a1
800003cc:	00d766b3          	or	a3,a4,a3
	      n2 = n1 >> b;
800003d0:	00f35733          	srl	a4,t1,a5
	      n1 = (n1 << bm) | (n0 >> b);
800003d4:	00b31333          	sll	t1,t1,a1
800003d8:	00f8d7b3          	srl	a5,a7,a5
800003dc:	0067e7b3          	or	a5,a5,t1
	      udiv_qrnnd (q0, n1, n2, n1, d1);
800003e0:	0106d313          	srl	t1,a3,0x10
800003e4:	02675eb3          	divu	t4,a4,t1
800003e8:	01069813          	sll	a6,a3,0x10
800003ec:	01085813          	srl	a6,a6,0x10
	      d0 = d0 << bm;
800003f0:	00b61633          	sll	a2,a2,a1
	      udiv_qrnnd (q0, n1, n2, n1, d1);
800003f4:	02677733          	remu	a4,a4,t1
800003f8:	03d80e33          	mul	t3,a6,t4
800003fc:	01071513          	sll	a0,a4,0x10
80000400:	0107d713          	srl	a4,a5,0x10
80000404:	00a76733          	or	a4,a4,a0
80000408:	000e8513          	mv	a0,t4
8000040c:	01c77e63          	bgeu	a4,t3,80000428 <__udivdi3+0x360>
80000410:	00e68733          	add	a4,a3,a4
80000414:	fffe8513          	add	a0,t4,-1
80000418:	00d76863          	bltu	a4,a3,80000428 <__udivdi3+0x360>
8000041c:	01c77663          	bgeu	a4,t3,80000428 <__udivdi3+0x360>
80000420:	ffee8513          	add	a0,t4,-2
80000424:	00d70733          	add	a4,a4,a3
80000428:	41c70733          	sub	a4,a4,t3
8000042c:	02675e33          	divu	t3,a4,t1
80000430:	01079793          	sll	a5,a5,0x10
80000434:	0107d793          	srl	a5,a5,0x10
80000438:	02677733          	remu	a4,a4,t1
8000043c:	03c80833          	mul	a6,a6,t3
80000440:	01071713          	sll	a4,a4,0x10
80000444:	00e7e7b3          	or	a5,a5,a4
80000448:	000e0713          	mv	a4,t3
8000044c:	0107fe63          	bgeu	a5,a6,80000468 <__udivdi3+0x3a0>
80000450:	00f687b3          	add	a5,a3,a5
80000454:	fffe0713          	add	a4,t3,-1
80000458:	00d7e863          	bltu	a5,a3,80000468 <__udivdi3+0x3a0>
8000045c:	0107f663          	bgeu	a5,a6,80000468 <__udivdi3+0x3a0>
80000460:	ffee0713          	add	a4,t3,-2
80000464:	00d787b3          	add	a5,a5,a3
80000468:	01051513          	sll	a0,a0,0x10
	      umul_ppmm (m1, m0, q0, d0);
8000046c:	00010e37          	lui	t3,0x10
	      udiv_qrnnd (q0, n1, n2, n1, d1);
80000470:	00e56533          	or	a0,a0,a4
	      umul_ppmm (m1, m0, q0, d0);
80000474:	fffe0693          	add	a3,t3,-1 # ffff <__stack_size+0xbfff>
80000478:	00d57733          	and	a4,a0,a3
	      udiv_qrnnd (q0, n1, n2, n1, d1);
8000047c:	410787b3          	sub	a5,a5,a6
	      umul_ppmm (m1, m0, q0, d0);
80000480:	00d676b3          	and	a3,a2,a3
80000484:	01055813          	srl	a6,a0,0x10
80000488:	01065613          	srl	a2,a2,0x10
8000048c:	02d70333          	mul	t1,a4,a3
80000490:	02d806b3          	mul	a3,a6,a3
80000494:	02c70733          	mul	a4,a4,a2
80000498:	02c80833          	mul	a6,a6,a2
8000049c:	00d70633          	add	a2,a4,a3
800004a0:	01035713          	srl	a4,t1,0x10
800004a4:	00c70733          	add	a4,a4,a2
800004a8:	00d77463          	bgeu	a4,a3,800004b0 <__udivdi3+0x3e8>
800004ac:	01c80833          	add	a6,a6,t3
800004b0:	01075693          	srl	a3,a4,0x10
800004b4:	010686b3          	add	a3,a3,a6
	      if (m1 > n1 || (m1 == n1 && m0 > n0))
800004b8:	02d7e663          	bltu	a5,a3,800004e4 <__udivdi3+0x41c>
800004bc:	ced79ee3          	bne	a5,a3,800001b8 <__udivdi3+0xf0>
	      umul_ppmm (m1, m0, q0, d0);
800004c0:	000107b7          	lui	a5,0x10
800004c4:	fff78793          	add	a5,a5,-1 # ffff <__stack_size+0xbfff>
800004c8:	00f77733          	and	a4,a4,a5
800004cc:	01071713          	sll	a4,a4,0x10
800004d0:	00f37333          	and	t1,t1,a5
	      n0 = n0 << bm;
800004d4:	00b898b3          	sll	a7,a7,a1
	      umul_ppmm (m1, m0, q0, d0);
800004d8:	00670733          	add	a4,a4,t1
	      q1 = 0;
800004dc:	00000593          	li	a1,0
	      if (m1 > n1 || (m1 == n1 && m0 > n0))
800004e0:	cce8fee3          	bgeu	a7,a4,800001bc <__udivdi3+0xf4>
		  q0--;
800004e4:	fff50513          	add	a0,a0,-1 # ffffff <__stack_size+0xffbfff>
		  sub_ddmmss (m1, m0, m1, m0, d1, d0);
800004e8:	cd1ff06f          	j	800001b8 <__udivdi3+0xf0>
	  q1 = 0;
800004ec:	00000593          	li	a1,0
	  q0 = 0;
800004f0:	00000513          	li	a0,0
800004f4:	00008067          	ret

800004f8 <__umoddi3>:
  d0 = dd.s.low;
800004f8:	00060813          	mv	a6,a2
  n0 = nn.s.low;
800004fc:	00050793          	mv	a5,a0
  n1 = nn.s.high;
80000500:	00058713          	mv	a4,a1
  if (d1 == 0)
80000504:	20069663          	bnez	a3,80000710 <__umoddi3+0x218>
      if (d0 > n1)
80000508:	a00008b7          	lui	a7,0xa0000
8000050c:	03c88893          	add	a7,a7,60 # a000003c <__clz_tab>
80000510:	0cc5fc63          	bgeu	a1,a2,800005e8 <__umoddi3+0xf0>
	  count_leading_zeros (bm, d0);
80000514:	000106b7          	lui	a3,0x10
80000518:	0ad67e63          	bgeu	a2,a3,800005d4 <__umoddi3+0xdc>
8000051c:	10063693          	sltiu	a3,a2,256
80000520:	0016b693          	seqz	a3,a3
80000524:	00369693          	sll	a3,a3,0x3
80000528:	00d65333          	srl	t1,a2,a3
8000052c:	006888b3          	add	a7,a7,t1
80000530:	0008c883          	lbu	a7,0(a7)
80000534:	02000313          	li	t1,32
80000538:	00d886b3          	add	a3,a7,a3
8000053c:	40d308b3          	sub	a7,t1,a3
	  if (bm != 0)
80000540:	00d30c63          	beq	t1,a3,80000558 <__umoddi3+0x60>
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
80000544:	01159733          	sll	a4,a1,a7
80000548:	00d556b3          	srl	a3,a0,a3
	      d0 = d0 << bm;
8000054c:	01161833          	sll	a6,a2,a7
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
80000550:	00e6e733          	or	a4,a3,a4
	      n0 = n0 << bm;
80000554:	011517b3          	sll	a5,a0,a7
	  udiv_qrnnd (q0, n0, n1, n0, d0);
80000558:	01085613          	srl	a2,a6,0x10
8000055c:	02c756b3          	divu	a3,a4,a2
80000560:	01081513          	sll	a0,a6,0x10
80000564:	01055513          	srl	a0,a0,0x10
80000568:	02c77733          	remu	a4,a4,a2
8000056c:	02a686b3          	mul	a3,a3,a0
80000570:	01071593          	sll	a1,a4,0x10
80000574:	0107d713          	srl	a4,a5,0x10
80000578:	00b76733          	or	a4,a4,a1
8000057c:	00d77a63          	bgeu	a4,a3,80000590 <__umoddi3+0x98>
80000580:	00e80733          	add	a4,a6,a4
80000584:	01076663          	bltu	a4,a6,80000590 <__umoddi3+0x98>
80000588:	00d77463          	bgeu	a4,a3,80000590 <__umoddi3+0x98>
8000058c:	01070733          	add	a4,a4,a6
80000590:	40d70733          	sub	a4,a4,a3
80000594:	02c756b3          	divu	a3,a4,a2
80000598:	02c77733          	remu	a4,a4,a2
8000059c:	02a686b3          	mul	a3,a3,a0
	  udiv_qrnnd (q0, n0, n1, n0, d0);
800005a0:	01079793          	sll	a5,a5,0x10
800005a4:	01071713          	sll	a4,a4,0x10
800005a8:	0107d793          	srl	a5,a5,0x10
800005ac:	00e7e7b3          	or	a5,a5,a4
800005b0:	00d7fa63          	bgeu	a5,a3,800005c4 <__umoddi3+0xcc>
800005b4:	00f807b3          	add	a5,a6,a5
800005b8:	0107e663          	bltu	a5,a6,800005c4 <__umoddi3+0xcc>
800005bc:	00d7f463          	bgeu	a5,a3,800005c4 <__umoddi3+0xcc>
800005c0:	010787b3          	add	a5,a5,a6
800005c4:	40d787b3          	sub	a5,a5,a3
	  rr.s.low = n0 >> bm;
800005c8:	0117d533          	srl	a0,a5,a7
	  *rp = rr.ll;
800005cc:	00000593          	li	a1,0
800005d0:	00008067          	ret
	  count_leading_zeros (bm, d0);
800005d4:	01000337          	lui	t1,0x1000
800005d8:	01800693          	li	a3,24
800005dc:	f46676e3          	bgeu	a2,t1,80000528 <__umoddi3+0x30>
800005e0:	01000693          	li	a3,16
800005e4:	f45ff06f          	j	80000528 <__umoddi3+0x30>
	  count_leading_zeros (bm, d0);
800005e8:	00000693          	li	a3,0
	  if (d0 == 0)
800005ec:	00060c63          	beqz	a2,80000604 <__umoddi3+0x10c>
	  count_leading_zeros (bm, d0);
800005f0:	00010737          	lui	a4,0x10
800005f4:	06e67e63          	bgeu	a2,a4,80000670 <__umoddi3+0x178>
800005f8:	10063693          	sltiu	a3,a2,256
800005fc:	0016b693          	seqz	a3,a3
80000600:	00369693          	sll	a3,a3,0x3
80000604:	00d65733          	srl	a4,a2,a3
80000608:	00e888b3          	add	a7,a7,a4
8000060c:	0008c703          	lbu	a4,0(a7)
80000610:	00d70733          	add	a4,a4,a3
80000614:	02000693          	li	a3,32
80000618:	40e688b3          	sub	a7,a3,a4
	  if (bm == 0)
8000061c:	06e69463          	bne	a3,a4,80000684 <__umoddi3+0x18c>
	      n1 -= d0;
80000620:	40c58733          	sub	a4,a1,a2
	  udiv_qrnnd (q0, n0, n1, n0, d0);
80000624:	01085593          	srl	a1,a6,0x10
80000628:	02b75633          	divu	a2,a4,a1
8000062c:	01081513          	sll	a0,a6,0x10
80000630:	01055513          	srl	a0,a0,0x10
80000634:	0107d693          	srl	a3,a5,0x10
80000638:	02b77733          	remu	a4,a4,a1
8000063c:	02a60633          	mul	a2,a2,a0
80000640:	01071713          	sll	a4,a4,0x10
80000644:	00e6e733          	or	a4,a3,a4
80000648:	00c77a63          	bgeu	a4,a2,8000065c <__umoddi3+0x164>
8000064c:	00e80733          	add	a4,a6,a4
80000650:	01076663          	bltu	a4,a6,8000065c <__umoddi3+0x164>
80000654:	00c77463          	bgeu	a4,a2,8000065c <__umoddi3+0x164>
80000658:	01070733          	add	a4,a4,a6
8000065c:	40c70733          	sub	a4,a4,a2
80000660:	02b756b3          	divu	a3,a4,a1
80000664:	02b77733          	remu	a4,a4,a1
80000668:	02a686b3          	mul	a3,a3,a0
8000066c:	f35ff06f          	j	800005a0 <__umoddi3+0xa8>
	  count_leading_zeros (bm, d0);
80000670:	01000737          	lui	a4,0x1000
80000674:	01800693          	li	a3,24
80000678:	f8e676e3          	bgeu	a2,a4,80000604 <__umoddi3+0x10c>
8000067c:	01000693          	li	a3,16
80000680:	f85ff06f          	j	80000604 <__umoddi3+0x10c>
	      d0 = d0 << bm;
80000684:	01161833          	sll	a6,a2,a7
	      n2 = n1 >> b;
80000688:	00e5d6b3          	srl	a3,a1,a4
	      n0 = n0 << bm;
8000068c:	011517b3          	sll	a5,a0,a7
	      n1 = (n1 << bm) | (n0 >> b);
80000690:	011595b3          	sll	a1,a1,a7
80000694:	00e55733          	srl	a4,a0,a4
	      udiv_qrnnd (q1, n1, n2, n1, d0);
80000698:	01085513          	srl	a0,a6,0x10
	      n1 = (n1 << bm) | (n0 >> b);
8000069c:	00b76733          	or	a4,a4,a1
	      udiv_qrnnd (q1, n1, n2, n1, d0);
800006a0:	02a6d5b3          	divu	a1,a3,a0
800006a4:	01081313          	sll	t1,a6,0x10
800006a8:	01035313          	srl	t1,t1,0x10
800006ac:	02a6f6b3          	remu	a3,a3,a0
800006b0:	026585b3          	mul	a1,a1,t1
800006b4:	01069613          	sll	a2,a3,0x10
800006b8:	01075693          	srl	a3,a4,0x10
800006bc:	00c6e6b3          	or	a3,a3,a2
800006c0:	00b6fa63          	bgeu	a3,a1,800006d4 <__umoddi3+0x1dc>
800006c4:	00d806b3          	add	a3,a6,a3
800006c8:	0106e663          	bltu	a3,a6,800006d4 <__umoddi3+0x1dc>
800006cc:	00b6f463          	bgeu	a3,a1,800006d4 <__umoddi3+0x1dc>
800006d0:	010686b3          	add	a3,a3,a6
800006d4:	40b686b3          	sub	a3,a3,a1
800006d8:	02a6d633          	divu	a2,a3,a0
800006dc:	01071713          	sll	a4,a4,0x10
800006e0:	01075713          	srl	a4,a4,0x10
800006e4:	02a6f6b3          	remu	a3,a3,a0
800006e8:	02660633          	mul	a2,a2,t1
800006ec:	01069693          	sll	a3,a3,0x10
800006f0:	00d76733          	or	a4,a4,a3
800006f4:	00c77a63          	bgeu	a4,a2,80000708 <__umoddi3+0x210>
800006f8:	00e80733          	add	a4,a6,a4
800006fc:	01076663          	bltu	a4,a6,80000708 <__umoddi3+0x210>
80000700:	00c77463          	bgeu	a4,a2,80000708 <__umoddi3+0x210>
80000704:	01070733          	add	a4,a4,a6
80000708:	40c70733          	sub	a4,a4,a2
8000070c:	f19ff06f          	j	80000624 <__umoddi3+0x12c>
      if (d1 > n1)
80000710:	1cd5e463          	bltu	a1,a3,800008d8 <__umoddi3+0x3e0>
	  count_leading_zeros (bm, d1);
80000714:	00010837          	lui	a6,0x10
80000718:	0506fe63          	bgeu	a3,a6,80000774 <__umoddi3+0x27c>
8000071c:	1006b813          	sltiu	a6,a3,256
80000720:	00183813          	seqz	a6,a6
80000724:	00381813          	sll	a6,a6,0x3
80000728:	a00008b7          	lui	a7,0xa0000
8000072c:	0106d333          	srl	t1,a3,a6
80000730:	03c88893          	add	a7,a7,60 # a000003c <__clz_tab>
80000734:	006888b3          	add	a7,a7,t1
80000738:	0008c883          	lbu	a7,0(a7)
8000073c:	02000313          	li	t1,32
80000740:	010888b3          	add	a7,a7,a6
80000744:	41130833          	sub	a6,t1,a7
	  if (bm == 0)
80000748:	05131063          	bne	t1,a7,80000788 <__umoddi3+0x290>
	      if (n1 > d1 || n0 >= d0)
8000074c:	00b6e463          	bltu	a3,a1,80000754 <__umoddi3+0x25c>
80000750:	00c56c63          	bltu	a0,a2,80000768 <__umoddi3+0x270>
		  sub_ddmmss (n1, n0, n1, n0, d1, d0);
80000754:	40c50633          	sub	a2,a0,a2
80000758:	40d586b3          	sub	a3,a1,a3
8000075c:	00c53733          	sltu	a4,a0,a2
80000760:	00060793          	mv	a5,a2
80000764:	40e68733          	sub	a4,a3,a4
		  *rp = rr.ll;
80000768:	00078513          	mv	a0,a5
8000076c:	00070593          	mv	a1,a4
80000770:	00008067          	ret
	  count_leading_zeros (bm, d1);
80000774:	010008b7          	lui	a7,0x1000
80000778:	01800813          	li	a6,24
8000077c:	fb16f6e3          	bgeu	a3,a7,80000728 <__umoddi3+0x230>
80000780:	01000813          	li	a6,16
80000784:	fa5ff06f          	j	80000728 <__umoddi3+0x230>
	      d1 = (d1 << bm) | (d0 >> b);
80000788:	011657b3          	srl	a5,a2,a7
8000078c:	010696b3          	sll	a3,a3,a6
80000790:	00d7e6b3          	or	a3,a5,a3
	      n2 = n1 >> b;
80000794:	0115d733          	srl	a4,a1,a7
	      udiv_qrnnd (q0, n1, n2, n1, d1);
80000798:	0106de13          	srl	t3,a3,0x10
8000079c:	03c75f33          	divu	t5,a4,t3
800007a0:	01069313          	sll	t1,a3,0x10
800007a4:	01035313          	srl	t1,t1,0x10
	      n1 = (n1 << bm) | (n0 >> b);
800007a8:	010597b3          	sll	a5,a1,a6
800007ac:	011555b3          	srl	a1,a0,a7
800007b0:	00f5e5b3          	or	a1,a1,a5
	      udiv_qrnnd (q0, n1, n2, n1, d1);
800007b4:	0105d793          	srl	a5,a1,0x10
	      d0 = d0 << bm;
800007b8:	01061633          	sll	a2,a2,a6
	      n0 = n0 << bm;
800007bc:	01051533          	sll	a0,a0,a6
	      udiv_qrnnd (q0, n1, n2, n1, d1);
800007c0:	03c77733          	remu	a4,a4,t3
800007c4:	03e30eb3          	mul	t4,t1,t5
800007c8:	01071713          	sll	a4,a4,0x10
800007cc:	00e7e7b3          	or	a5,a5,a4
800007d0:	000f0713          	mv	a4,t5
800007d4:	01d7fe63          	bgeu	a5,t4,800007f0 <__umoddi3+0x2f8>
800007d8:	00f687b3          	add	a5,a3,a5
800007dc:	ffff0713          	add	a4,t5,-1
800007e0:	00d7e863          	bltu	a5,a3,800007f0 <__umoddi3+0x2f8>
800007e4:	01d7f663          	bgeu	a5,t4,800007f0 <__umoddi3+0x2f8>
800007e8:	ffef0713          	add	a4,t5,-2
800007ec:	00d787b3          	add	a5,a5,a3
800007f0:	41d787b3          	sub	a5,a5,t4
800007f4:	03c7deb3          	divu	t4,a5,t3
800007f8:	01059593          	sll	a1,a1,0x10
800007fc:	0105d593          	srl	a1,a1,0x10
80000800:	03c7f7b3          	remu	a5,a5,t3
80000804:	000e8e13          	mv	t3,t4
80000808:	03d30333          	mul	t1,t1,t4
8000080c:	01079793          	sll	a5,a5,0x10
80000810:	00f5e5b3          	or	a1,a1,a5
80000814:	0065fe63          	bgeu	a1,t1,80000830 <__umoddi3+0x338>
80000818:	00b685b3          	add	a1,a3,a1
8000081c:	fffe8e13          	add	t3,t4,-1
80000820:	00d5e863          	bltu	a1,a3,80000830 <__umoddi3+0x338>
80000824:	0065f663          	bgeu	a1,t1,80000830 <__umoddi3+0x338>
80000828:	ffee8e13          	add	t3,t4,-2
8000082c:	00d585b3          	add	a1,a1,a3
80000830:	01071793          	sll	a5,a4,0x10
	      umul_ppmm (m1, m0, q0, d0);
80000834:	00010f37          	lui	t5,0x10
	      udiv_qrnnd (q0, n1, n2, n1, d1);
80000838:	01c7e7b3          	or	a5,a5,t3
8000083c:	406585b3          	sub	a1,a1,t1
	      umul_ppmm (m1, m0, q0, d0);
80000840:	ffff0313          	add	t1,t5,-1 # ffff <__stack_size+0xbfff>
80000844:	0067f733          	and	a4,a5,t1
80000848:	01065e13          	srl	t3,a2,0x10
8000084c:	0107d793          	srl	a5,a5,0x10
80000850:	00667333          	and	t1,a2,t1
80000854:	02670eb3          	mul	t4,a4,t1
80000858:	02678333          	mul	t1,a5,t1
8000085c:	03c70733          	mul	a4,a4,t3
80000860:	03c787b3          	mul	a5,a5,t3
80000864:	00670e33          	add	t3,a4,t1
80000868:	010ed713          	srl	a4,t4,0x10
8000086c:	01c70733          	add	a4,a4,t3
80000870:	00677463          	bgeu	a4,t1,80000878 <__umoddi3+0x380>
80000874:	01e787b3          	add	a5,a5,t5
80000878:	01075313          	srl	t1,a4,0x10
8000087c:	00f307b3          	add	a5,t1,a5
80000880:	00010337          	lui	t1,0x10
80000884:	fff30313          	add	t1,t1,-1 # ffff <__stack_size+0xbfff>
80000888:	00677733          	and	a4,a4,t1
8000088c:	01071713          	sll	a4,a4,0x10
80000890:	006efeb3          	and	t4,t4,t1
80000894:	01d70733          	add	a4,a4,t4
	      if (m1 > n1 || (m1 == n1 && m0 > n0))
80000898:	00f5e663          	bltu	a1,a5,800008a4 <__umoddi3+0x3ac>
8000089c:	00f59e63          	bne	a1,a5,800008b8 <__umoddi3+0x3c0>
800008a0:	00e57c63          	bgeu	a0,a4,800008b8 <__umoddi3+0x3c0>
		  sub_ddmmss (m1, m0, m1, m0, d1, d0);
800008a4:	40c70633          	sub	a2,a4,a2
800008a8:	00c73333          	sltu	t1,a4,a2
800008ac:	00d306b3          	add	a3,t1,a3
800008b0:	00060713          	mv	a4,a2
800008b4:	40d787b3          	sub	a5,a5,a3
		  sub_ddmmss (n1, n0, n1, n0, m1, m0);
800008b8:	40e50733          	sub	a4,a0,a4
800008bc:	00e53533          	sltu	a0,a0,a4
800008c0:	40f585b3          	sub	a1,a1,a5
800008c4:	40a585b3          	sub	a1,a1,a0
		  rr.s.low = (n1 << b) | (n0 >> bm);
800008c8:	011598b3          	sll	a7,a1,a7
800008cc:	01075733          	srl	a4,a4,a6
		  *rp = rr.ll;
800008d0:	00e8e533          	or	a0,a7,a4
800008d4:	0105d5b3          	srl	a1,a1,a6
}
800008d8:	00008067          	ret

800008dc <__adddf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
800008dc:	00100837          	lui	a6,0x100
800008e0:	fff80813          	add	a6,a6,-1 # fffff <__stack_size+0xfbfff>
{
800008e4:	fe010113          	add	sp,sp,-32
  FP_UNPACK_SEMIRAW_D (A, a);
800008e8:	00b878b3          	and	a7,a6,a1
800008ec:	0145d713          	srl	a4,a1,0x14
800008f0:	01d55793          	srl	a5,a0,0x1d
  FP_UNPACK_SEMIRAW_D (B, b);
800008f4:	00d87833          	and	a6,a6,a3
{
800008f8:	00912a23          	sw	s1,20(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
800008fc:	7ff77493          	and	s1,a4,2047
80000900:	00389713          	sll	a4,a7,0x3
  FP_UNPACK_SEMIRAW_D (B, b);
80000904:	0146d893          	srl	a7,a3,0x14
80000908:	00381813          	sll	a6,a6,0x3
{
8000090c:	01212823          	sw	s2,16(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
80000910:	00e7e7b3          	or	a5,a5,a4
  FP_UNPACK_SEMIRAW_D (B, b);
80000914:	7ff8f893          	and	a7,a7,2047
80000918:	01d65713          	srl	a4,a2,0x1d
{
8000091c:	00112e23          	sw	ra,28(sp)
80000920:	00812c23          	sw	s0,24(sp)
80000924:	01312623          	sw	s3,12(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
80000928:	01f5d913          	srl	s2,a1,0x1f
  FP_UNPACK_SEMIRAW_D (B, b);
8000092c:	01f6d693          	srl	a3,a3,0x1f
80000930:	01076733          	or	a4,a4,a6
  FP_UNPACK_SEMIRAW_D (A, a);
80000934:	00351513          	sll	a0,a0,0x3
  FP_UNPACK_SEMIRAW_D (B, b);
80000938:	00361613          	sll	a2,a2,0x3
  FP_ADD_D (R, A, B);
8000093c:	41148833          	sub	a6,s1,a7
80000940:	2ad91a63          	bne	s2,a3,80000bf4 <__adddf3+0x318>
80000944:	11005c63          	blez	a6,80000a5c <__adddf3+0x180>
80000948:	04089063          	bnez	a7,80000988 <__adddf3+0xac>
8000094c:	00c766b3          	or	a3,a4,a2
80000950:	66068063          	beqz	a3,80000fb0 <__adddf3+0x6d4>
80000954:	fff80593          	add	a1,a6,-1
80000958:	02059063          	bnez	a1,80000978 <__adddf3+0x9c>
8000095c:	00c50633          	add	a2,a0,a2
80000960:	00a636b3          	sltu	a3,a2,a0
80000964:	00e78733          	add	a4,a5,a4
80000968:	00060513          	mv	a0,a2
8000096c:	00d707b3          	add	a5,a4,a3
80000970:	00100493          	li	s1,1
80000974:	06c0006f          	j	800009e0 <__adddf3+0x104>
80000978:	7ff00693          	li	a3,2047
8000097c:	02d81063          	bne	a6,a3,8000099c <__adddf3+0xc0>
80000980:	7ff00493          	li	s1,2047
80000984:	1f80006f          	j	80000b7c <__adddf3+0x2a0>
80000988:	7ff00693          	li	a3,2047
8000098c:	1ed48863          	beq	s1,a3,80000b7c <__adddf3+0x2a0>
80000990:	008006b7          	lui	a3,0x800
80000994:	00d76733          	or	a4,a4,a3
80000998:	00080593          	mv	a1,a6
8000099c:	03800693          	li	a3,56
800009a0:	0ab6c863          	blt	a3,a1,80000a50 <__adddf3+0x174>
800009a4:	01f00693          	li	a3,31
800009a8:	06b6ca63          	blt	a3,a1,80000a1c <__adddf3+0x140>
800009ac:	02000813          	li	a6,32
800009b0:	40b80833          	sub	a6,a6,a1
800009b4:	010716b3          	sll	a3,a4,a6
800009b8:	00b658b3          	srl	a7,a2,a1
800009bc:	01061833          	sll	a6,a2,a6
800009c0:	0116e6b3          	or	a3,a3,a7
800009c4:	01003833          	snez	a6,a6
800009c8:	0106e6b3          	or	a3,a3,a6
800009cc:	00b755b3          	srl	a1,a4,a1
800009d0:	00a68533          	add	a0,a3,a0
800009d4:	00f585b3          	add	a1,a1,a5
800009d8:	00d536b3          	sltu	a3,a0,a3
800009dc:	00d587b3          	add	a5,a1,a3
800009e0:	00879713          	sll	a4,a5,0x8
800009e4:	18075c63          	bgez	a4,80000b7c <__adddf3+0x2a0>
800009e8:	00148493          	add	s1,s1,1
800009ec:	7ff00713          	li	a4,2047
800009f0:	5ae48a63          	beq	s1,a4,80000fa4 <__adddf3+0x6c8>
800009f4:	ff800737          	lui	a4,0xff800
800009f8:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
800009fc:	00e7f733          	and	a4,a5,a4
80000a00:	00155793          	srl	a5,a0,0x1
80000a04:	00157513          	and	a0,a0,1
80000a08:	00a7e7b3          	or	a5,a5,a0
80000a0c:	01f71513          	sll	a0,a4,0x1f
80000a10:	00f56533          	or	a0,a0,a5
80000a14:	00175793          	srl	a5,a4,0x1
80000a18:	1640006f          	j	80000b7c <__adddf3+0x2a0>
80000a1c:	fe058693          	add	a3,a1,-32
80000a20:	02000893          	li	a7,32
80000a24:	00d756b3          	srl	a3,a4,a3
80000a28:	00000813          	li	a6,0
80000a2c:	01158863          	beq	a1,a7,80000a3c <__adddf3+0x160>
80000a30:	04000813          	li	a6,64
80000a34:	40b80833          	sub	a6,a6,a1
80000a38:	01071833          	sll	a6,a4,a6
80000a3c:	00c86833          	or	a6,a6,a2
80000a40:	01003833          	snez	a6,a6
80000a44:	0106e6b3          	or	a3,a3,a6
80000a48:	00000593          	li	a1,0
80000a4c:	f85ff06f          	j	800009d0 <__adddf3+0xf4>
80000a50:	00c766b3          	or	a3,a4,a2
80000a54:	00d036b3          	snez	a3,a3
80000a58:	ff1ff06f          	j	80000a48 <__adddf3+0x16c>
80000a5c:	0c080a63          	beqz	a6,80000b30 <__adddf3+0x254>
80000a60:	409886b3          	sub	a3,a7,s1
80000a64:	02049463          	bnez	s1,80000a8c <__adddf3+0x1b0>
80000a68:	00a7e5b3          	or	a1,a5,a0
80000a6c:	50058e63          	beqz	a1,80000f88 <__adddf3+0x6ac>
80000a70:	fff68593          	add	a1,a3,-1 # 7fffff <__stack_size+0x7fbfff>
80000a74:	ee0584e3          	beqz	a1,8000095c <__adddf3+0x80>
80000a78:	7ff00813          	li	a6,2047
80000a7c:	03069263          	bne	a3,a6,80000aa0 <__adddf3+0x1c4>
80000a80:	00070793          	mv	a5,a4
80000a84:	00060513          	mv	a0,a2
80000a88:	ef9ff06f          	j	80000980 <__adddf3+0xa4>
80000a8c:	7ff00593          	li	a1,2047
80000a90:	feb888e3          	beq	a7,a1,80000a80 <__adddf3+0x1a4>
80000a94:	008005b7          	lui	a1,0x800
80000a98:	00b7e7b3          	or	a5,a5,a1
80000a9c:	00068593          	mv	a1,a3
80000aa0:	03800693          	li	a3,56
80000aa4:	08b6c063          	blt	a3,a1,80000b24 <__adddf3+0x248>
80000aa8:	01f00693          	li	a3,31
80000aac:	04b6c263          	blt	a3,a1,80000af0 <__adddf3+0x214>
80000ab0:	02000813          	li	a6,32
80000ab4:	40b80833          	sub	a6,a6,a1
80000ab8:	010796b3          	sll	a3,a5,a6
80000abc:	00b55333          	srl	t1,a0,a1
80000ac0:	01051833          	sll	a6,a0,a6
80000ac4:	0066e6b3          	or	a3,a3,t1
80000ac8:	01003833          	snez	a6,a6
80000acc:	0106e6b3          	or	a3,a3,a6
80000ad0:	00b7d5b3          	srl	a1,a5,a1
80000ad4:	00c68633          	add	a2,a3,a2
80000ad8:	00e585b3          	add	a1,a1,a4
80000adc:	00d636b3          	sltu	a3,a2,a3
80000ae0:	00060513          	mv	a0,a2
80000ae4:	00d587b3          	add	a5,a1,a3
80000ae8:	00088493          	mv	s1,a7
80000aec:	ef5ff06f          	j	800009e0 <__adddf3+0x104>
80000af0:	fe058693          	add	a3,a1,-32 # 7fffe0 <__stack_size+0x7fbfe0>
80000af4:	02000313          	li	t1,32
80000af8:	00d7d6b3          	srl	a3,a5,a3
80000afc:	00000813          	li	a6,0
80000b00:	00658863          	beq	a1,t1,80000b10 <__adddf3+0x234>
80000b04:	04000813          	li	a6,64
80000b08:	40b80833          	sub	a6,a6,a1
80000b0c:	01079833          	sll	a6,a5,a6
80000b10:	00a86833          	or	a6,a6,a0
80000b14:	01003833          	snez	a6,a6
80000b18:	0106e6b3          	or	a3,a3,a6
80000b1c:	00000593          	li	a1,0
80000b20:	fb5ff06f          	j	80000ad4 <__adddf3+0x1f8>
80000b24:	00a7e6b3          	or	a3,a5,a0
80000b28:	00d036b3          	snez	a3,a3
80000b2c:	ff1ff06f          	j	80000b1c <__adddf3+0x240>
80000b30:	00148693          	add	a3,s1,1
80000b34:	7fe6f593          	and	a1,a3,2046
80000b38:	08059663          	bnez	a1,80000bc4 <__adddf3+0x2e8>
80000b3c:	00a7e6b3          	or	a3,a5,a0
80000b40:	06049263          	bnez	s1,80000ba4 <__adddf3+0x2c8>
80000b44:	44068863          	beqz	a3,80000f94 <__adddf3+0x6b8>
80000b48:	00c766b3          	or	a3,a4,a2
80000b4c:	02068863          	beqz	a3,80000b7c <__adddf3+0x2a0>
80000b50:	00c50633          	add	a2,a0,a2
80000b54:	00a636b3          	sltu	a3,a2,a0
80000b58:	00e78733          	add	a4,a5,a4
80000b5c:	00d707b3          	add	a5,a4,a3
80000b60:	00879713          	sll	a4,a5,0x8
80000b64:	00060513          	mv	a0,a2
80000b68:	00075a63          	bgez	a4,80000b7c <__adddf3+0x2a0>
80000b6c:	ff800737          	lui	a4,0xff800
80000b70:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
80000b74:	00e7f7b3          	and	a5,a5,a4
80000b78:	00100493          	li	s1,1
  FP_PACK_SEMIRAW_D (r, R);
80000b7c:	00757713          	and	a4,a0,7
80000b80:	44070863          	beqz	a4,80000fd0 <__adddf3+0x6f4>
80000b84:	00f57713          	and	a4,a0,15
80000b88:	00400693          	li	a3,4
80000b8c:	44d70263          	beq	a4,a3,80000fd0 <__adddf3+0x6f4>
80000b90:	00450713          	add	a4,a0,4
80000b94:	00a736b3          	sltu	a3,a4,a0
80000b98:	00d787b3          	add	a5,a5,a3
80000b9c:	00070513          	mv	a0,a4
80000ba0:	4300006f          	j	80000fd0 <__adddf3+0x6f4>
  FP_ADD_D (R, A, B);
80000ba4:	ec068ee3          	beqz	a3,80000a80 <__adddf3+0x1a4>
80000ba8:	00c76633          	or	a2,a4,a2
80000bac:	dc060ae3          	beqz	a2,80000980 <__adddf3+0xa4>
80000bb0:	00000913          	li	s2,0
80000bb4:	004007b7          	lui	a5,0x400
80000bb8:	00000513          	li	a0,0
80000bbc:	7ff00493          	li	s1,2047
80000bc0:	4100006f          	j	80000fd0 <__adddf3+0x6f4>
80000bc4:	7ff00593          	li	a1,2047
80000bc8:	3cb68c63          	beq	a3,a1,80000fa0 <__adddf3+0x6c4>
80000bcc:	00c50633          	add	a2,a0,a2
80000bd0:	00a63533          	sltu	a0,a2,a0
80000bd4:	00e78733          	add	a4,a5,a4
80000bd8:	00a70733          	add	a4,a4,a0
80000bdc:	01f71513          	sll	a0,a4,0x1f
80000be0:	00165613          	srl	a2,a2,0x1
80000be4:	00c56533          	or	a0,a0,a2
80000be8:	00175793          	srl	a5,a4,0x1
80000bec:	00068493          	mv	s1,a3
80000bf0:	f8dff06f          	j	80000b7c <__adddf3+0x2a0>
80000bf4:	0f005c63          	blez	a6,80000cec <__adddf3+0x410>
80000bf8:	08089e63          	bnez	a7,80000c94 <__adddf3+0x3b8>
80000bfc:	00c766b3          	or	a3,a4,a2
80000c00:	3a068863          	beqz	a3,80000fb0 <__adddf3+0x6d4>
80000c04:	fff80693          	add	a3,a6,-1
80000c08:	02069063          	bnez	a3,80000c28 <__adddf3+0x34c>
80000c0c:	40c50633          	sub	a2,a0,a2
80000c10:	00c536b3          	sltu	a3,a0,a2
80000c14:	40e78733          	sub	a4,a5,a4
80000c18:	00060513          	mv	a0,a2
80000c1c:	40d707b3          	sub	a5,a4,a3
80000c20:	00100493          	li	s1,1
80000c24:	0540006f          	j	80000c78 <__adddf3+0x39c>
80000c28:	7ff00593          	li	a1,2047
80000c2c:	d4b80ae3          	beq	a6,a1,80000980 <__adddf3+0xa4>
80000c30:	03800593          	li	a1,56
80000c34:	0ad5c663          	blt	a1,a3,80000ce0 <__adddf3+0x404>
80000c38:	01f00593          	li	a1,31
80000c3c:	06d5c863          	blt	a1,a3,80000cac <__adddf3+0x3d0>
80000c40:	02000813          	li	a6,32
80000c44:	40d80833          	sub	a6,a6,a3
80000c48:	00d658b3          	srl	a7,a2,a3
80000c4c:	010715b3          	sll	a1,a4,a6
80000c50:	01061833          	sll	a6,a2,a6
80000c54:	0115e5b3          	or	a1,a1,a7
80000c58:	01003833          	snez	a6,a6
80000c5c:	0105e633          	or	a2,a1,a6
80000c60:	00d756b3          	srl	a3,a4,a3
80000c64:	40c50633          	sub	a2,a0,a2
80000c68:	00c53733          	sltu	a4,a0,a2
80000c6c:	40d786b3          	sub	a3,a5,a3
80000c70:	00060513          	mv	a0,a2
80000c74:	40e687b3          	sub	a5,a3,a4
80000c78:	00879713          	sll	a4,a5,0x8
80000c7c:	f00750e3          	bgez	a4,80000b7c <__adddf3+0x2a0>
80000c80:	00800437          	lui	s0,0x800
80000c84:	fff40413          	add	s0,s0,-1 # 7fffff <__stack_size+0x7fbfff>
80000c88:	0087f433          	and	s0,a5,s0
80000c8c:	00050993          	mv	s3,a0
80000c90:	2100006f          	j	80000ea0 <__adddf3+0x5c4>
80000c94:	7ff00693          	li	a3,2047
80000c98:	eed482e3          	beq	s1,a3,80000b7c <__adddf3+0x2a0>
80000c9c:	008006b7          	lui	a3,0x800
80000ca0:	00d76733          	or	a4,a4,a3
80000ca4:	00080693          	mv	a3,a6
80000ca8:	f89ff06f          	j	80000c30 <__adddf3+0x354>
80000cac:	fe068593          	add	a1,a3,-32 # 7fffe0 <__stack_size+0x7fbfe0>
80000cb0:	02000893          	li	a7,32
80000cb4:	00b755b3          	srl	a1,a4,a1
80000cb8:	00000813          	li	a6,0
80000cbc:	01168863          	beq	a3,a7,80000ccc <__adddf3+0x3f0>
80000cc0:	04000813          	li	a6,64
80000cc4:	40d80833          	sub	a6,a6,a3
80000cc8:	01071833          	sll	a6,a4,a6
80000ccc:	00c86833          	or	a6,a6,a2
80000cd0:	01003833          	snez	a6,a6
80000cd4:	0105e633          	or	a2,a1,a6
80000cd8:	00000693          	li	a3,0
80000cdc:	f89ff06f          	j	80000c64 <__adddf3+0x388>
80000ce0:	00c76633          	or	a2,a4,a2
80000ce4:	00c03633          	snez	a2,a2
80000ce8:	ff1ff06f          	j	80000cd8 <__adddf3+0x3fc>
80000cec:	0e080863          	beqz	a6,80000ddc <__adddf3+0x500>
80000cf0:	40988833          	sub	a6,a7,s1
80000cf4:	04049263          	bnez	s1,80000d38 <__adddf3+0x45c>
80000cf8:	00a7e5b3          	or	a1,a5,a0
80000cfc:	2a058e63          	beqz	a1,80000fb8 <__adddf3+0x6dc>
80000d00:	fff80593          	add	a1,a6,-1
80000d04:	00059e63          	bnez	a1,80000d20 <__adddf3+0x444>
80000d08:	40a60533          	sub	a0,a2,a0
80000d0c:	40f70733          	sub	a4,a4,a5
80000d10:	00a63633          	sltu	a2,a2,a0
80000d14:	40c707b3          	sub	a5,a4,a2
80000d18:	00068913          	mv	s2,a3
80000d1c:	f05ff06f          	j	80000c20 <__adddf3+0x344>
80000d20:	7ff00313          	li	t1,2047
80000d24:	02681463          	bne	a6,t1,80000d4c <__adddf3+0x470>
80000d28:	00070793          	mv	a5,a4
80000d2c:	00060513          	mv	a0,a2
80000d30:	7ff00493          	li	s1,2047
80000d34:	0d00006f          	j	80000e04 <__adddf3+0x528>
80000d38:	7ff00593          	li	a1,2047
80000d3c:	feb886e3          	beq	a7,a1,80000d28 <__adddf3+0x44c>
80000d40:	008005b7          	lui	a1,0x800
80000d44:	00b7e7b3          	or	a5,a5,a1
80000d48:	00080593          	mv	a1,a6
80000d4c:	03800813          	li	a6,56
80000d50:	08b84063          	blt	a6,a1,80000dd0 <__adddf3+0x4f4>
80000d54:	01f00813          	li	a6,31
80000d58:	04b84263          	blt	a6,a1,80000d9c <__adddf3+0x4c0>
80000d5c:	02000313          	li	t1,32
80000d60:	40b30333          	sub	t1,t1,a1
80000d64:	00b55e33          	srl	t3,a0,a1
80000d68:	00679833          	sll	a6,a5,t1
80000d6c:	00651333          	sll	t1,a0,t1
80000d70:	01c86833          	or	a6,a6,t3
80000d74:	00603333          	snez	t1,t1
80000d78:	00686533          	or	a0,a6,t1
80000d7c:	00b7d5b3          	srl	a1,a5,a1
80000d80:	40a60533          	sub	a0,a2,a0
80000d84:	40b705b3          	sub	a1,a4,a1
80000d88:	00a63633          	sltu	a2,a2,a0
80000d8c:	40c587b3          	sub	a5,a1,a2
80000d90:	00088493          	mv	s1,a7
80000d94:	00068913          	mv	s2,a3
80000d98:	ee1ff06f          	j	80000c78 <__adddf3+0x39c>
80000d9c:	fe058813          	add	a6,a1,-32 # 7fffe0 <__stack_size+0x7fbfe0>
80000da0:	02000e13          	li	t3,32
80000da4:	0107d833          	srl	a6,a5,a6
80000da8:	00000313          	li	t1,0
80000dac:	01c58863          	beq	a1,t3,80000dbc <__adddf3+0x4e0>
80000db0:	04000313          	li	t1,64
80000db4:	40b30333          	sub	t1,t1,a1
80000db8:	00679333          	sll	t1,a5,t1
80000dbc:	00a36333          	or	t1,t1,a0
80000dc0:	00603333          	snez	t1,t1
80000dc4:	00686533          	or	a0,a6,t1
80000dc8:	00000593          	li	a1,0
80000dcc:	fb5ff06f          	j	80000d80 <__adddf3+0x4a4>
80000dd0:	00a7e533          	or	a0,a5,a0
80000dd4:	00a03533          	snez	a0,a0
80000dd8:	ff1ff06f          	j	80000dc8 <__adddf3+0x4ec>
80000ddc:	00148593          	add	a1,s1,1
80000de0:	7fe5f593          	and	a1,a1,2046
80000de4:	08059663          	bnez	a1,80000e70 <__adddf3+0x594>
80000de8:	00a7e833          	or	a6,a5,a0
80000dec:	00c765b3          	or	a1,a4,a2
80000df0:	06049063          	bnez	s1,80000e50 <__adddf3+0x574>
80000df4:	00081c63          	bnez	a6,80000e0c <__adddf3+0x530>
80000df8:	10058e63          	beqz	a1,80000f14 <__adddf3+0x638>
80000dfc:	00070793          	mv	a5,a4
80000e00:	00060513          	mv	a0,a2
80000e04:	00068913          	mv	s2,a3
80000e08:	d75ff06f          	j	80000b7c <__adddf3+0x2a0>
80000e0c:	d60588e3          	beqz	a1,80000b7c <__adddf3+0x2a0>
80000e10:	40c50833          	sub	a6,a0,a2
80000e14:	010538b3          	sltu	a7,a0,a6
80000e18:	40e785b3          	sub	a1,a5,a4
80000e1c:	411585b3          	sub	a1,a1,a7
80000e20:	00859893          	sll	a7,a1,0x8
80000e24:	0008dc63          	bgez	a7,80000e3c <__adddf3+0x560>
80000e28:	40a60533          	sub	a0,a2,a0
80000e2c:	40f70733          	sub	a4,a4,a5
80000e30:	00a63633          	sltu	a2,a2,a0
80000e34:	40c707b3          	sub	a5,a4,a2
80000e38:	fcdff06f          	j	80000e04 <__adddf3+0x528>
80000e3c:	00b86533          	or	a0,a6,a1
80000e40:	18050463          	beqz	a0,80000fc8 <__adddf3+0x6ec>
80000e44:	00058793          	mv	a5,a1
80000e48:	00080513          	mv	a0,a6
80000e4c:	d31ff06f          	j	80000b7c <__adddf3+0x2a0>
80000e50:	00081c63          	bnez	a6,80000e68 <__adddf3+0x58c>
80000e54:	d4058ee3          	beqz	a1,80000bb0 <__adddf3+0x2d4>
80000e58:	00070793          	mv	a5,a4
80000e5c:	00060513          	mv	a0,a2
80000e60:	00068913          	mv	s2,a3
80000e64:	b1dff06f          	j	80000980 <__adddf3+0xa4>
80000e68:	b0058ce3          	beqz	a1,80000980 <__adddf3+0xa4>
80000e6c:	d45ff06f          	j	80000bb0 <__adddf3+0x2d4>
80000e70:	40c505b3          	sub	a1,a0,a2
80000e74:	00b53833          	sltu	a6,a0,a1
80000e78:	40e78433          	sub	s0,a5,a4
80000e7c:	41040433          	sub	s0,s0,a6
80000e80:	00841813          	sll	a6,s0,0x8
80000e84:	00058993          	mv	s3,a1
80000e88:	08085063          	bgez	a6,80000f08 <__adddf3+0x62c>
80000e8c:	40a609b3          	sub	s3,a2,a0
80000e90:	40f70433          	sub	s0,a4,a5
80000e94:	01363633          	sltu	a2,a2,s3
80000e98:	40c40433          	sub	s0,s0,a2
80000e9c:	00068913          	mv	s2,a3
80000ea0:	06040e63          	beqz	s0,80000f1c <__adddf3+0x640>
80000ea4:	00040513          	mv	a0,s0
80000ea8:	4c5010ef          	jal	80002b6c <__clzsi2>
80000eac:	ff850693          	add	a3,a0,-8
80000eb0:	02000793          	li	a5,32
80000eb4:	40d787b3          	sub	a5,a5,a3
80000eb8:	00d41433          	sll	s0,s0,a3
80000ebc:	00f9d7b3          	srl	a5,s3,a5
80000ec0:	0087e7b3          	or	a5,a5,s0
80000ec4:	00d99433          	sll	s0,s3,a3
80000ec8:	0a96c463          	blt	a3,s1,80000f70 <__adddf3+0x694>
80000ecc:	409686b3          	sub	a3,a3,s1
80000ed0:	00168613          	add	a2,a3,1
80000ed4:	01f00713          	li	a4,31
80000ed8:	06c74263          	blt	a4,a2,80000f3c <__adddf3+0x660>
80000edc:	02000713          	li	a4,32
80000ee0:	40c70733          	sub	a4,a4,a2
80000ee4:	00e79533          	sll	a0,a5,a4
80000ee8:	00c456b3          	srl	a3,s0,a2
80000eec:	00e41733          	sll	a4,s0,a4
80000ef0:	00d56533          	or	a0,a0,a3
80000ef4:	00e03733          	snez	a4,a4
80000ef8:	00e56533          	or	a0,a0,a4
80000efc:	00c7d7b3          	srl	a5,a5,a2
80000f00:	00000493          	li	s1,0
80000f04:	c79ff06f          	j	80000b7c <__adddf3+0x2a0>
80000f08:	0085e5b3          	or	a1,a1,s0
80000f0c:	f8059ae3          	bnez	a1,80000ea0 <__adddf3+0x5c4>
80000f10:	00000493          	li	s1,0
80000f14:	00000913          	li	s2,0
80000f18:	08c0006f          	j	80000fa4 <__adddf3+0x6c8>
80000f1c:	00098513          	mv	a0,s3
80000f20:	44d010ef          	jal	80002b6c <__clzsi2>
80000f24:	01850693          	add	a3,a0,24
80000f28:	01f00793          	li	a5,31
80000f2c:	f8d7d2e3          	bge	a5,a3,80000eb0 <__adddf3+0x5d4>
80000f30:	ff850793          	add	a5,a0,-8
80000f34:	00f997b3          	sll	a5,s3,a5
80000f38:	f91ff06f          	j	80000ec8 <__adddf3+0x5ec>
80000f3c:	fe168693          	add	a3,a3,-31
80000f40:	00d7d533          	srl	a0,a5,a3
80000f44:	02000693          	li	a3,32
80000f48:	00000713          	li	a4,0
80000f4c:	00d60863          	beq	a2,a3,80000f5c <__adddf3+0x680>
80000f50:	04000713          	li	a4,64
80000f54:	40c70733          	sub	a4,a4,a2
80000f58:	00e79733          	sll	a4,a5,a4
80000f5c:	00e46733          	or	a4,s0,a4
80000f60:	00e03733          	snez	a4,a4
80000f64:	00e56533          	or	a0,a0,a4
80000f68:	00000793          	li	a5,0
80000f6c:	f95ff06f          	j	80000f00 <__adddf3+0x624>
80000f70:	ff800737          	lui	a4,0xff800
80000f74:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
80000f78:	40d484b3          	sub	s1,s1,a3
80000f7c:	00e7f7b3          	and	a5,a5,a4
80000f80:	00040513          	mv	a0,s0
80000f84:	bf9ff06f          	j	80000b7c <__adddf3+0x2a0>
80000f88:	00070793          	mv	a5,a4
80000f8c:	00060513          	mv	a0,a2
80000f90:	c5dff06f          	j	80000bec <__adddf3+0x310>
80000f94:	00070793          	mv	a5,a4
80000f98:	00060513          	mv	a0,a2
80000f9c:	be1ff06f          	j	80000b7c <__adddf3+0x2a0>
80000fa0:	7ff00493          	li	s1,2047
80000fa4:	00000793          	li	a5,0
80000fa8:	00000513          	li	a0,0
80000fac:	0240006f          	j	80000fd0 <__adddf3+0x6f4>
80000fb0:	00080493          	mv	s1,a6
80000fb4:	bc9ff06f          	j	80000b7c <__adddf3+0x2a0>
80000fb8:	00070793          	mv	a5,a4
80000fbc:	00060513          	mv	a0,a2
80000fc0:	00080493          	mv	s1,a6
80000fc4:	e41ff06f          	j	80000e04 <__adddf3+0x528>
80000fc8:	00000793          	li	a5,0
80000fcc:	00000913          	li	s2,0
  FP_PACK_SEMIRAW_D (r, R);
80000fd0:	00879713          	sll	a4,a5,0x8
80000fd4:	00075e63          	bgez	a4,80000ff0 <__adddf3+0x714>
80000fd8:	00148493          	add	s1,s1,1
80000fdc:	7ff00713          	li	a4,2047
80000fe0:	08e48263          	beq	s1,a4,80001064 <__adddf3+0x788>
80000fe4:	ff800737          	lui	a4,0xff800
80000fe8:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
80000fec:	00e7f7b3          	and	a5,a5,a4
80000ff0:	01d79693          	sll	a3,a5,0x1d
80000ff4:	00355513          	srl	a0,a0,0x3
80000ff8:	7ff00713          	li	a4,2047
80000ffc:	00a6e6b3          	or	a3,a3,a0
80001000:	0037d793          	srl	a5,a5,0x3
80001004:	00e49e63          	bne	s1,a4,80001020 <__adddf3+0x744>
80001008:	00f6e6b3          	or	a3,a3,a5
8000100c:	00000793          	li	a5,0
80001010:	00068863          	beqz	a3,80001020 <__adddf3+0x744>
80001014:	000807b7          	lui	a5,0x80
80001018:	00000693          	li	a3,0
8000101c:	00000913          	li	s2,0
80001020:	01449713          	sll	a4,s1,0x14
80001024:	7ff00637          	lui	a2,0x7ff00
80001028:	00c79793          	sll	a5,a5,0xc
8000102c:	00c77733          	and	a4,a4,a2
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80001030:	01c12083          	lw	ra,28(sp)
80001034:	01812403          	lw	s0,24(sp)
  FP_PACK_SEMIRAW_D (r, R);
80001038:	00c7d793          	srl	a5,a5,0xc
8000103c:	00f767b3          	or	a5,a4,a5
80001040:	01f91713          	sll	a4,s2,0x1f
80001044:	00e7e633          	or	a2,a5,a4
}
80001048:	01412483          	lw	s1,20(sp)
8000104c:	01012903          	lw	s2,16(sp)
80001050:	00c12983          	lw	s3,12(sp)
80001054:	00068513          	mv	a0,a3
80001058:	00060593          	mv	a1,a2
8000105c:	02010113          	add	sp,sp,32
80001060:	00008067          	ret
80001064:	00000793          	li	a5,0
80001068:	00000513          	li	a0,0
8000106c:	f85ff06f          	j	80000ff0 <__adddf3+0x714>

80001070 <__divdf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__divdf3 (DFtype a, DFtype b)
{
80001070:	fd010113          	add	sp,sp,-48
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
80001074:	0145d813          	srl	a6,a1,0x14
{
80001078:	02912223          	sw	s1,36(sp)
8000107c:	03212023          	sw	s2,32(sp)
80001080:	01312e23          	sw	s3,28(sp)
80001084:	01612823          	sw	s6,16(sp)
80001088:	01712623          	sw	s7,12(sp)
  FP_UNPACK_D (A, a);
8000108c:	00c59493          	sll	s1,a1,0xc
{
80001090:	02112623          	sw	ra,44(sp)
80001094:	02812423          	sw	s0,40(sp)
80001098:	01412c23          	sw	s4,24(sp)
8000109c:	01512a23          	sw	s5,20(sp)
  FP_UNPACK_D (A, a);
800010a0:	7ff87813          	and	a6,a6,2047
{
800010a4:	00050b13          	mv	s6,a0
800010a8:	00060b93          	mv	s7,a2
800010ac:	00068913          	mv	s2,a3
  FP_UNPACK_D (A, a);
800010b0:	00c4d493          	srl	s1,s1,0xc
800010b4:	01f5d993          	srl	s3,a1,0x1f
800010b8:	0a080063          	beqz	a6,80001158 <__divdf3+0xe8>
800010bc:	7ff00793          	li	a5,2047
800010c0:	10f80063          	beq	a6,a5,800011c0 <__divdf3+0x150>
800010c4:	01d55a13          	srl	s4,a0,0x1d
800010c8:	00349493          	sll	s1,s1,0x3
800010cc:	009a6a33          	or	s4,s4,s1
800010d0:	008007b7          	lui	a5,0x800
800010d4:	00fa6a33          	or	s4,s4,a5
800010d8:	00351413          	sll	s0,a0,0x3
800010dc:	c0180a93          	add	s5,a6,-1023
800010e0:	00000b13          	li	s6,0
  FP_UNPACK_D (B, b);
800010e4:	01495713          	srl	a4,s2,0x14
800010e8:	00c91493          	sll	s1,s2,0xc
800010ec:	7ff77713          	and	a4,a4,2047
800010f0:	00c4d493          	srl	s1,s1,0xc
800010f4:	01f95913          	srl	s2,s2,0x1f
800010f8:	10070263          	beqz	a4,800011fc <__divdf3+0x18c>
800010fc:	7ff00793          	li	a5,2047
80001100:	16f70663          	beq	a4,a5,8000126c <__divdf3+0x1fc>
80001104:	00349493          	sll	s1,s1,0x3
80001108:	01dbd793          	srl	a5,s7,0x1d
8000110c:	0097e7b3          	or	a5,a5,s1
80001110:	008004b7          	lui	s1,0x800
80001114:	0097e4b3          	or	s1,a5,s1
80001118:	003b9f13          	sll	t5,s7,0x3
8000111c:	c0170713          	add	a4,a4,-1023
80001120:	00000793          	li	a5,0
  FP_DIV_D (R, A, B);
80001124:	40ea8833          	sub	a6,s5,a4
80001128:	002b1713          	sll	a4,s6,0x2
8000112c:	00f76733          	or	a4,a4,a5
80001130:	fff70713          	add	a4,a4,-1
80001134:	00e00693          	li	a3,14
80001138:	0129c633          	xor	a2,s3,s2
8000113c:	16e6e463          	bltu	a3,a4,800012a4 <__divdf3+0x234>
80001140:	a00006b7          	lui	a3,0xa0000
80001144:	00271713          	sll	a4,a4,0x2
80001148:	00068693          	mv	a3,a3
8000114c:	00d70733          	add	a4,a4,a3
80001150:	00072703          	lw	a4,0(a4)
80001154:	00070067          	jr	a4
  FP_UNPACK_D (A, a);
80001158:	00a4ea33          	or	s4,s1,a0
8000115c:	060a0e63          	beqz	s4,800011d8 <__divdf3+0x168>
80001160:	02048e63          	beqz	s1,8000119c <__divdf3+0x12c>
80001164:	00048513          	mv	a0,s1
80001168:	205010ef          	jal	80002b6c <__clzsi2>
8000116c:	ff550793          	add	a5,a0,-11
80001170:	01d00a13          	li	s4,29
80001174:	ff850713          	add	a4,a0,-8
80001178:	40fa0a33          	sub	s4,s4,a5
8000117c:	00e494b3          	sll	s1,s1,a4
80001180:	014b5a33          	srl	s4,s6,s4
80001184:	009a6a33          	or	s4,s4,s1
80001188:	00eb14b3          	sll	s1,s6,a4
8000118c:	c0d00813          	li	a6,-1011
80001190:	40a80ab3          	sub	s5,a6,a0
80001194:	00048413          	mv	s0,s1
80001198:	f49ff06f          	j	800010e0 <__divdf3+0x70>
8000119c:	1d1010ef          	jal	80002b6c <__clzsi2>
800011a0:	00050a13          	mv	s4,a0
800011a4:	015a0793          	add	a5,s4,21
800011a8:	01c00713          	li	a4,28
800011ac:	02050513          	add	a0,a0,32
800011b0:	fcf750e3          	bge	a4,a5,80001170 <__divdf3+0x100>
800011b4:	ff8a0a13          	add	s4,s4,-8
800011b8:	014b1a33          	sll	s4,s6,s4
800011bc:	fd1ff06f          	j	8000118c <__divdf3+0x11c>
800011c0:	00a4ea33          	or	s4,s1,a0
800011c4:	020a1263          	bnez	s4,800011e8 <__divdf3+0x178>
800011c8:	00000413          	li	s0,0
800011cc:	7ff00a93          	li	s5,2047
800011d0:	00200b13          	li	s6,2
800011d4:	f11ff06f          	j	800010e4 <__divdf3+0x74>
800011d8:	00000413          	li	s0,0
800011dc:	00000a93          	li	s5,0
800011e0:	00100b13          	li	s6,1
800011e4:	f01ff06f          	j	800010e4 <__divdf3+0x74>
800011e8:	00050413          	mv	s0,a0
800011ec:	00048a13          	mv	s4,s1
800011f0:	7ff00a93          	li	s5,2047
800011f4:	00300b13          	li	s6,3
800011f8:	eedff06f          	j	800010e4 <__divdf3+0x74>
  FP_UNPACK_D (B, b);
800011fc:	0174ef33          	or	t5,s1,s7
80001200:	080f0263          	beqz	t5,80001284 <__divdf3+0x214>
80001204:	04048063          	beqz	s1,80001244 <__divdf3+0x1d4>
80001208:	00048513          	mv	a0,s1
8000120c:	161010ef          	jal	80002b6c <__clzsi2>
80001210:	ff550713          	add	a4,a0,-11
80001214:	01d00793          	li	a5,29
80001218:	ff850693          	add	a3,a0,-8
8000121c:	40e787b3          	sub	a5,a5,a4
80001220:	00d494b3          	sll	s1,s1,a3
80001224:	00fbd7b3          	srl	a5,s7,a5
80001228:	0097e7b3          	or	a5,a5,s1
8000122c:	00db94b3          	sll	s1,s7,a3
80001230:	c0d00713          	li	a4,-1011
80001234:	00048f13          	mv	t5,s1
80001238:	40a70733          	sub	a4,a4,a0
8000123c:	00078493          	mv	s1,a5
80001240:	ee1ff06f          	j	80001120 <__divdf3+0xb0>
80001244:	000b8513          	mv	a0,s7
80001248:	125010ef          	jal	80002b6c <__clzsi2>
8000124c:	00050793          	mv	a5,a0
80001250:	01578713          	add	a4,a5,21 # 800015 <__stack_size+0x7fc015>
80001254:	01c00693          	li	a3,28
80001258:	02050513          	add	a0,a0,32
8000125c:	fae6dce3          	bge	a3,a4,80001214 <__divdf3+0x1a4>
80001260:	ff878793          	add	a5,a5,-8
80001264:	00fb97b3          	sll	a5,s7,a5
80001268:	fc9ff06f          	j	80001230 <__divdf3+0x1c0>
8000126c:	0174ef33          	or	t5,s1,s7
80001270:	020f1263          	bnez	t5,80001294 <__divdf3+0x224>
80001274:	00000493          	li	s1,0
80001278:	7ff00713          	li	a4,2047
8000127c:	00200793          	li	a5,2
80001280:	ea5ff06f          	j	80001124 <__divdf3+0xb4>
80001284:	00000493          	li	s1,0
80001288:	00000713          	li	a4,0
8000128c:	00100793          	li	a5,1
80001290:	e95ff06f          	j	80001124 <__divdf3+0xb4>
80001294:	000b8f13          	mv	t5,s7
80001298:	7ff00713          	li	a4,2047
8000129c:	00300793          	li	a5,3
800012a0:	e85ff06f          	j	80001124 <__divdf3+0xb4>
  FP_DIV_D (R, A, B);
800012a4:	0144e663          	bltu	s1,s4,800012b0 <__divdf3+0x240>
800012a8:	349a1c63          	bne	s4,s1,80001600 <__divdf3+0x590>
800012ac:	35e46a63          	bltu	s0,t5,80001600 <__divdf3+0x590>
800012b0:	01fa1693          	sll	a3,s4,0x1f
800012b4:	00145793          	srl	a5,s0,0x1
800012b8:	01f41713          	sll	a4,s0,0x1f
800012bc:	001a5a13          	srl	s4,s4,0x1
800012c0:	00f6e433          	or	s0,a3,a5
800012c4:	00849893          	sll	a7,s1,0x8
800012c8:	018f5593          	srl	a1,t5,0x18
800012cc:	0115e5b3          	or	a1,a1,a7
800012d0:	0108d893          	srl	a7,a7,0x10
800012d4:	031a5eb3          	divu	t4,s4,a7
800012d8:	01059313          	sll	t1,a1,0x10
800012dc:	01035313          	srl	t1,t1,0x10
800012e0:	01045793          	srl	a5,s0,0x10
800012e4:	008f1513          	sll	a0,t5,0x8
800012e8:	031a7a33          	remu	s4,s4,a7
800012ec:	000e8693          	mv	a3,t4
800012f0:	03d30e33          	mul	t3,t1,t4
800012f4:	010a1a13          	sll	s4,s4,0x10
800012f8:	0147e7b3          	or	a5,a5,s4
800012fc:	01c7fe63          	bgeu	a5,t3,80001318 <__divdf3+0x2a8>
80001300:	00f587b3          	add	a5,a1,a5
80001304:	fffe8693          	add	a3,t4,-1
80001308:	00b7e863          	bltu	a5,a1,80001318 <__divdf3+0x2a8>
8000130c:	01c7f663          	bgeu	a5,t3,80001318 <__divdf3+0x2a8>
80001310:	ffee8693          	add	a3,t4,-2
80001314:	00b787b3          	add	a5,a5,a1
80001318:	41c787b3          	sub	a5,a5,t3
8000131c:	0317df33          	divu	t5,a5,a7
80001320:	01041413          	sll	s0,s0,0x10
80001324:	01045413          	srl	s0,s0,0x10
80001328:	0317f7b3          	remu	a5,a5,a7
8000132c:	000f0e13          	mv	t3,t5
80001330:	03e30eb3          	mul	t4,t1,t5
80001334:	01079793          	sll	a5,a5,0x10
80001338:	00f467b3          	or	a5,s0,a5
8000133c:	01d7fe63          	bgeu	a5,t4,80001358 <__divdf3+0x2e8>
80001340:	00f587b3          	add	a5,a1,a5
80001344:	ffff0e13          	add	t3,t5,-1
80001348:	00b7e863          	bltu	a5,a1,80001358 <__divdf3+0x2e8>
8000134c:	01d7f663          	bgeu	a5,t4,80001358 <__divdf3+0x2e8>
80001350:	ffef0e13          	add	t3,t5,-2
80001354:	00b787b3          	add	a5,a5,a1
80001358:	01069693          	sll	a3,a3,0x10
8000135c:	00010437          	lui	s0,0x10
80001360:	01c6e2b3          	or	t0,a3,t3
80001364:	fff40e13          	add	t3,s0,-1 # ffff <__stack_size+0xbfff>
80001368:	01c2f6b3          	and	a3,t0,t3
8000136c:	0102df93          	srl	t6,t0,0x10
80001370:	01c57e33          	and	t3,a0,t3
80001374:	41d787b3          	sub	a5,a5,t4
80001378:	01055e93          	srl	t4,a0,0x10
8000137c:	02de03b3          	mul	t2,t3,a3
80001380:	03cf84b3          	mul	s1,t6,t3
80001384:	02de86b3          	mul	a3,t4,a3
80001388:	00968f33          	add	t5,a3,s1
8000138c:	0103d693          	srl	a3,t2,0x10
80001390:	01e686b3          	add	a3,a3,t5
80001394:	03df8fb3          	mul	t6,t6,t4
80001398:	0096f463          	bgeu	a3,s1,800013a0 <__divdf3+0x330>
8000139c:	008f8fb3          	add	t6,t6,s0
800013a0:	0106df13          	srl	t5,a3,0x10
800013a4:	01ff0f33          	add	t5,t5,t6
800013a8:	00010fb7          	lui	t6,0x10
800013ac:	ffff8f93          	add	t6,t6,-1 # ffff <__stack_size+0xbfff>
800013b0:	01f6f6b3          	and	a3,a3,t6
800013b4:	01069693          	sll	a3,a3,0x10
800013b8:	01f3f3b3          	and	t2,t2,t6
800013bc:	007686b3          	add	a3,a3,t2
800013c0:	01e7e863          	bltu	a5,t5,800013d0 <__divdf3+0x360>
800013c4:	00028493          	mv	s1,t0
800013c8:	05e79863          	bne	a5,t5,80001418 <__divdf3+0x3a8>
800013cc:	04d77663          	bgeu	a4,a3,80001418 <__divdf3+0x3a8>
800013d0:	00a70fb3          	add	t6,a4,a0
800013d4:	00efb3b3          	sltu	t2,t6,a4
800013d8:	00b38433          	add	s0,t2,a1
800013dc:	008787b3          	add	a5,a5,s0
800013e0:	fff28493          	add	s1,t0,-1
800013e4:	000f8713          	mv	a4,t6
800013e8:	00f5e663          	bltu	a1,a5,800013f4 <__divdf3+0x384>
800013ec:	02f59663          	bne	a1,a5,80001418 <__divdf3+0x3a8>
800013f0:	02039463          	bnez	t2,80001418 <__divdf3+0x3a8>
800013f4:	01e7e663          	bltu	a5,t5,80001400 <__divdf3+0x390>
800013f8:	02ff1063          	bne	t5,a5,80001418 <__divdf3+0x3a8>
800013fc:	00dffe63          	bgeu	t6,a3,80001418 <__divdf3+0x3a8>
80001400:	01f50fb3          	add	t6,a0,t6
80001404:	000f8713          	mv	a4,t6
80001408:	00afbfb3          	sltu	t6,t6,a0
8000140c:	00bf8fb3          	add	t6,t6,a1
80001410:	ffe28493          	add	s1,t0,-2
80001414:	01f787b3          	add	a5,a5,t6
80001418:	40d706b3          	sub	a3,a4,a3
8000141c:	41e787b3          	sub	a5,a5,t5
80001420:	00d73733          	sltu	a4,a4,a3
80001424:	40e787b3          	sub	a5,a5,a4
80001428:	fff00f13          	li	t5,-1
8000142c:	12f58663          	beq	a1,a5,80001558 <__divdf3+0x4e8>
80001430:	0317dfb3          	divu	t6,a5,a7
80001434:	0106d713          	srl	a4,a3,0x10
80001438:	0317f7b3          	remu	a5,a5,a7
8000143c:	03f30f33          	mul	t5,t1,t6
80001440:	01079793          	sll	a5,a5,0x10
80001444:	00f767b3          	or	a5,a4,a5
80001448:	000f8713          	mv	a4,t6
8000144c:	01e7fe63          	bgeu	a5,t5,80001468 <__divdf3+0x3f8>
80001450:	00f587b3          	add	a5,a1,a5
80001454:	ffff8713          	add	a4,t6,-1
80001458:	00b7e863          	bltu	a5,a1,80001468 <__divdf3+0x3f8>
8000145c:	01e7f663          	bgeu	a5,t5,80001468 <__divdf3+0x3f8>
80001460:	ffef8713          	add	a4,t6,-2
80001464:	00b787b3          	add	a5,a5,a1
80001468:	41e787b3          	sub	a5,a5,t5
8000146c:	0317df33          	divu	t5,a5,a7
80001470:	01069693          	sll	a3,a3,0x10
80001474:	0106d693          	srl	a3,a3,0x10
80001478:	0317f7b3          	remu	a5,a5,a7
8000147c:	000f0893          	mv	a7,t5
80001480:	03e30333          	mul	t1,t1,t5
80001484:	01079793          	sll	a5,a5,0x10
80001488:	00f6e7b3          	or	a5,a3,a5
8000148c:	0067fe63          	bgeu	a5,t1,800014a8 <__divdf3+0x438>
80001490:	00f587b3          	add	a5,a1,a5
80001494:	ffff0893          	add	a7,t5,-1
80001498:	00b7e863          	bltu	a5,a1,800014a8 <__divdf3+0x438>
8000149c:	0067f663          	bgeu	a5,t1,800014a8 <__divdf3+0x438>
800014a0:	ffef0893          	add	a7,t5,-2
800014a4:	00b787b3          	add	a5,a5,a1
800014a8:	01071693          	sll	a3,a4,0x10
800014ac:	0116e6b3          	or	a3,a3,a7
800014b0:	01069713          	sll	a4,a3,0x10
800014b4:	01075713          	srl	a4,a4,0x10
800014b8:	406787b3          	sub	a5,a5,t1
800014bc:	0106d313          	srl	t1,a3,0x10
800014c0:	03c70f33          	mul	t5,a4,t3
800014c4:	03c30e33          	mul	t3,t1,t3
800014c8:	026e8333          	mul	t1,t4,t1
800014cc:	02ee8eb3          	mul	t4,t4,a4
800014d0:	010f5713          	srl	a4,t5,0x10
800014d4:	01ce8eb3          	add	t4,t4,t3
800014d8:	01d70733          	add	a4,a4,t4
800014dc:	01c77663          	bgeu	a4,t3,800014e8 <__divdf3+0x478>
800014e0:	000108b7          	lui	a7,0x10
800014e4:	01130333          	add	t1,t1,a7
800014e8:	01075893          	srl	a7,a4,0x10
800014ec:	006888b3          	add	a7,a7,t1
800014f0:	00010337          	lui	t1,0x10
800014f4:	fff30313          	add	t1,t1,-1 # ffff <__stack_size+0xbfff>
800014f8:	00677733          	and	a4,a4,t1
800014fc:	01071713          	sll	a4,a4,0x10
80001500:	006f7f33          	and	t5,t5,t1
80001504:	01e70733          	add	a4,a4,t5
80001508:	0117e863          	bltu	a5,a7,80001518 <__divdf3+0x4a8>
8000150c:	23179c63          	bne	a5,a7,80001744 <__divdf3+0x6d4>
80001510:	00068f13          	mv	t5,a3
80001514:	04070263          	beqz	a4,80001558 <__divdf3+0x4e8>
80001518:	00f587b3          	add	a5,a1,a5
8000151c:	fff68f13          	add	t5,a3,-1 # 9fffffff <portable_fini+0x1fff933b>
80001520:	00078313          	mv	t1,a5
80001524:	02b7e463          	bltu	a5,a1,8000154c <__divdf3+0x4dc>
80001528:	0117e663          	bltu	a5,a7,80001534 <__divdf3+0x4c4>
8000152c:	21179a63          	bne	a5,a7,80001740 <__divdf3+0x6d0>
80001530:	02e57063          	bgeu	a0,a4,80001550 <__divdf3+0x4e0>
80001534:	ffe68f13          	add	t5,a3,-2
80001538:	00151693          	sll	a3,a0,0x1
8000153c:	00a6b333          	sltu	t1,a3,a0
80001540:	00b30333          	add	t1,t1,a1
80001544:	00678333          	add	t1,a5,t1
80001548:	00068513          	mv	a0,a3
8000154c:	01131463          	bne	t1,a7,80001554 <__divdf3+0x4e4>
80001550:	00a70463          	beq	a4,a0,80001558 <__divdf3+0x4e8>
80001554:	001f6f13          	or	t5,t5,1
  FP_PACK_D (r, R);
80001558:	3ff80713          	add	a4,a6,1023
8000155c:	10e05263          	blez	a4,80001660 <__divdf3+0x5f0>
80001560:	007f7793          	and	a5,t5,7
80001564:	02078063          	beqz	a5,80001584 <__divdf3+0x514>
80001568:	00ff7793          	and	a5,t5,15
8000156c:	00400693          	li	a3,4
80001570:	00d78a63          	beq	a5,a3,80001584 <__divdf3+0x514>
80001574:	004f0793          	add	a5,t5,4
80001578:	01e7b6b3          	sltu	a3,a5,t5
8000157c:	00d484b3          	add	s1,s1,a3
80001580:	00078f13          	mv	t5,a5
80001584:	00749793          	sll	a5,s1,0x7
80001588:	0007da63          	bgez	a5,8000159c <__divdf3+0x52c>
8000158c:	ff0007b7          	lui	a5,0xff000
80001590:	fff78793          	add	a5,a5,-1 # feffffff <__stack_base+0x3effffff>
80001594:	00f4f4b3          	and	s1,s1,a5
80001598:	40080713          	add	a4,a6,1024
8000159c:	7fe00793          	li	a5,2046
800015a0:	08e7ca63          	blt	a5,a4,80001634 <__divdf3+0x5c4>
800015a4:	003f5f13          	srl	t5,t5,0x3
800015a8:	01d49793          	sll	a5,s1,0x1d
800015ac:	01e7ef33          	or	t5,a5,t5
800015b0:	0034d513          	srl	a0,s1,0x3
800015b4:	00c51513          	sll	a0,a0,0xc
  FP_HANDLE_EXCEPTIONS;

  return r;
}
800015b8:	02c12083          	lw	ra,44(sp)
800015bc:	02812403          	lw	s0,40(sp)
  FP_PACK_D (r, R);
800015c0:	00c55513          	srl	a0,a0,0xc
800015c4:	01471713          	sll	a4,a4,0x14
800015c8:	00a76733          	or	a4,a4,a0
800015cc:	01f61613          	sll	a2,a2,0x1f
800015d0:	00c767b3          	or	a5,a4,a2
}
800015d4:	02412483          	lw	s1,36(sp)
800015d8:	02012903          	lw	s2,32(sp)
800015dc:	01c12983          	lw	s3,28(sp)
800015e0:	01812a03          	lw	s4,24(sp)
800015e4:	01412a83          	lw	s5,20(sp)
800015e8:	01012b03          	lw	s6,16(sp)
800015ec:	00c12b83          	lw	s7,12(sp)
800015f0:	000f0513          	mv	a0,t5
800015f4:	00078593          	mv	a1,a5
800015f8:	03010113          	add	sp,sp,48
800015fc:	00008067          	ret
  FP_DIV_D (R, A, B);
80001600:	fff80813          	add	a6,a6,-1
80001604:	00000713          	li	a4,0
80001608:	cbdff06f          	j	800012c4 <__divdf3+0x254>
  FP_UNPACK_D (A, a);
8000160c:	00098613          	mv	a2,s3
  FP_DIV_D (R, A, B);
80001610:	000a0493          	mv	s1,s4
80001614:	00040f13          	mv	t5,s0
80001618:	000b0793          	mv	a5,s6
  FP_PACK_D (r, R);
8000161c:	00300713          	li	a4,3
80001620:	0ee78863          	beq	a5,a4,80001710 <__divdf3+0x6a0>
80001624:	00100713          	li	a4,1
80001628:	0ee78e63          	beq	a5,a4,80001724 <__divdf3+0x6b4>
8000162c:	00200713          	li	a4,2
80001630:	f2e794e3          	bne	a5,a4,80001558 <__divdf3+0x4e8>
80001634:	00000513          	li	a0,0
80001638:	00000f13          	li	t5,0
8000163c:	7ff00713          	li	a4,2047
80001640:	f75ff06f          	j	800015b4 <__divdf3+0x544>
  FP_UNPACK_D (B, b);
80001644:	00090613          	mv	a2,s2
  FP_DIV_D (R, A, B);
80001648:	fd5ff06f          	j	8000161c <__divdf3+0x5ac>
8000164c:	000804b7          	lui	s1,0x80
80001650:	00000f13          	li	t5,0
80001654:	00000613          	li	a2,0
80001658:	00300793          	li	a5,3
8000165c:	fc1ff06f          	j	8000161c <__divdf3+0x5ac>
  FP_PACK_D (r, R);
80001660:	00100513          	li	a0,1
80001664:	40e50533          	sub	a0,a0,a4
80001668:	03800793          	li	a5,56
8000166c:	0aa7cc63          	blt	a5,a0,80001724 <__divdf3+0x6b4>
80001670:	01f00793          	li	a5,31
80001674:	06a7c463          	blt	a5,a0,800016dc <__divdf3+0x66c>
80001678:	41e80813          	add	a6,a6,1054
8000167c:	010497b3          	sll	a5,s1,a6
80001680:	00af5733          	srl	a4,t5,a0
80001684:	010f1833          	sll	a6,t5,a6
80001688:	00e7e7b3          	or	a5,a5,a4
8000168c:	01003833          	snez	a6,a6
80001690:	0107e7b3          	or	a5,a5,a6
80001694:	00a4d533          	srl	a0,s1,a0
80001698:	0077f713          	and	a4,a5,7
8000169c:	02070063          	beqz	a4,800016bc <__divdf3+0x64c>
800016a0:	00f7f713          	and	a4,a5,15
800016a4:	00400693          	li	a3,4
800016a8:	00d70a63          	beq	a4,a3,800016bc <__divdf3+0x64c>
800016ac:	00478713          	add	a4,a5,4
800016b0:	00f736b3          	sltu	a3,a4,a5
800016b4:	00d50533          	add	a0,a0,a3
800016b8:	00070793          	mv	a5,a4
800016bc:	00851713          	sll	a4,a0,0x8
800016c0:	06074863          	bltz	a4,80001730 <__divdf3+0x6c0>
800016c4:	01d51f13          	sll	t5,a0,0x1d
800016c8:	0037d793          	srl	a5,a5,0x3
800016cc:	00ff6f33          	or	t5,t5,a5
800016d0:	00355513          	srl	a0,a0,0x3
800016d4:	00000713          	li	a4,0
800016d8:	eddff06f          	j	800015b4 <__divdf3+0x544>
800016dc:	fe100793          	li	a5,-31
800016e0:	40e787b3          	sub	a5,a5,a4
800016e4:	02000693          	li	a3,32
800016e8:	00f4d7b3          	srl	a5,s1,a5
800016ec:	00000713          	li	a4,0
800016f0:	00d50663          	beq	a0,a3,800016fc <__divdf3+0x68c>
800016f4:	43e80713          	add	a4,a6,1086
800016f8:	00e49733          	sll	a4,s1,a4
800016fc:	01e76733          	or	a4,a4,t5
80001700:	00e03733          	snez	a4,a4
80001704:	00e7e7b3          	or	a5,a5,a4
80001708:	00000513          	li	a0,0
8000170c:	f8dff06f          	j	80001698 <__divdf3+0x628>
80001710:	00080537          	lui	a0,0x80
80001714:	00000f13          	li	t5,0
80001718:	7ff00713          	li	a4,2047
8000171c:	00000613          	li	a2,0
80001720:	e95ff06f          	j	800015b4 <__divdf3+0x544>
80001724:	00000513          	li	a0,0
80001728:	00000f13          	li	t5,0
8000172c:	fa9ff06f          	j	800016d4 <__divdf3+0x664>
80001730:	00000513          	li	a0,0
80001734:	00000f13          	li	t5,0
80001738:	00100713          	li	a4,1
8000173c:	e79ff06f          	j	800015b4 <__divdf3+0x544>
  FP_DIV_D (R, A, B);
80001740:	000f0693          	mv	a3,t5
80001744:	00068f13          	mv	t5,a3
80001748:	e0dff06f          	j	80001554 <__divdf3+0x4e4>

8000174c <__eqdf2>:
  FP_DECL_D (A);
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
8000174c:	0145d713          	srl	a4,a1,0x14
80001750:	001007b7          	lui	a5,0x100
80001754:	fff78793          	add	a5,a5,-1 # fffff <__stack_size+0xfbfff>
  FP_UNPACK_RAW_D (B, b);
80001758:	0146d813          	srl	a6,a3,0x14
{
8000175c:	00050313          	mv	t1,a0
80001760:	00050e93          	mv	t4,a0
  FP_UNPACK_RAW_D (A, a);
80001764:	7ff77713          	and	a4,a4,2047
  FP_CMP_EQ_D (r, A, B, 1);
80001768:	7ff00513          	li	a0,2047
  FP_UNPACK_RAW_D (A, a);
8000176c:	00b7f8b3          	and	a7,a5,a1
80001770:	00060f13          	mv	t5,a2
  FP_UNPACK_RAW_D (B, b);
80001774:	00d7f7b3          	and	a5,a5,a3
  FP_UNPACK_RAW_D (A, a);
80001778:	01f5d593          	srl	a1,a1,0x1f
  FP_UNPACK_RAW_D (B, b);
8000177c:	7ff87813          	and	a6,a6,2047
80001780:	01f6d693          	srl	a3,a3,0x1f
  FP_CMP_EQ_D (r, A, B, 1);
80001784:	00a71c63          	bne	a4,a0,8000179c <__eqdf2+0x50>
80001788:	0068ee33          	or	t3,a7,t1
8000178c:	00100513          	li	a0,1
80001790:	000e1463          	bnez	t3,80001798 <__eqdf2+0x4c>
80001794:	00e80663          	beq	a6,a4,800017a0 <__eqdf2+0x54>
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80001798:	00008067          	ret
  FP_CMP_EQ_D (r, A, B, 1);
8000179c:	00a81863          	bne	a6,a0,800017ac <__eqdf2+0x60>
800017a0:	00c7e633          	or	a2,a5,a2
800017a4:	00100513          	li	a0,1
800017a8:	fe0618e3          	bnez	a2,80001798 <__eqdf2+0x4c>
800017ac:	00100513          	li	a0,1
800017b0:	ff0714e3          	bne	a4,a6,80001798 <__eqdf2+0x4c>
800017b4:	fef892e3          	bne	a7,a5,80001798 <__eqdf2+0x4c>
800017b8:	ffee90e3          	bne	t4,t5,80001798 <__eqdf2+0x4c>
800017bc:	00d58a63          	beq	a1,a3,800017d0 <__eqdf2+0x84>
800017c0:	fc071ce3          	bnez	a4,80001798 <__eqdf2+0x4c>
800017c4:	0068e8b3          	or	a7,a7,t1
800017c8:	01103533          	snez	a0,a7
800017cc:	00008067          	ret
800017d0:	00000513          	li	a0,0
800017d4:	00008067          	ret

800017d8 <__gedf2>:
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
  FP_UNPACK_RAW_D (B, b);
800017d8:	0146d793          	srl	a5,a3,0x14
  FP_UNPACK_RAW_D (A, a);
800017dc:	0145d893          	srl	a7,a1,0x14
800017e0:	00100737          	lui	a4,0x100
800017e4:	fff70713          	add	a4,a4,-1 # fffff <__stack_size+0xfbfff>
{
800017e8:	00050813          	mv	a6,a0
800017ec:	00050e13          	mv	t3,a0
  FP_UNPACK_RAW_D (A, a);
800017f0:	7ff8f893          	and	a7,a7,2047
  FP_UNPACK_RAW_D (B, b);
800017f4:	7ff7f513          	and	a0,a5,2047
  FP_CMP_D (r, A, B, -2, 2);
800017f8:	7ff00793          	li	a5,2047
  FP_UNPACK_RAW_D (A, a);
800017fc:	00b77333          	and	t1,a4,a1
80001800:	00060e93          	mv	t4,a2
  FP_UNPACK_RAW_D (B, b);
80001804:	00d77733          	and	a4,a4,a3
  FP_UNPACK_RAW_D (A, a);
80001808:	01f5d593          	srl	a1,a1,0x1f
  FP_UNPACK_RAW_D (B, b);
8000180c:	01f6d693          	srl	a3,a3,0x1f
  FP_CMP_D (r, A, B, -2, 2);
80001810:	00f89663          	bne	a7,a5,8000181c <__gedf2+0x44>
80001814:	010367b3          	or	a5,t1,a6
80001818:	06079c63          	bnez	a5,80001890 <__gedf2+0xb8>
8000181c:	7ff00793          	li	a5,2047
80001820:	00f51663          	bne	a0,a5,8000182c <__gedf2+0x54>
80001824:	00c767b3          	or	a5,a4,a2
80001828:	06079463          	bnez	a5,80001890 <__gedf2+0xb8>
8000182c:	00000793          	li	a5,0
80001830:	00089663          	bnez	a7,8000183c <__gedf2+0x64>
80001834:	01036833          	or	a6,t1,a6
80001838:	00183793          	seqz	a5,a6
8000183c:	04051e63          	bnez	a0,80001898 <__gedf2+0xc0>
80001840:	00c76633          	or	a2,a4,a2
80001844:	00078c63          	beqz	a5,8000185c <__gedf2+0x84>
80001848:	02060063          	beqz	a2,80001868 <__gedf2+0x90>
8000184c:	00100513          	li	a0,1
80001850:	00069c63          	bnez	a3,80001868 <__gedf2+0x90>
80001854:	fff00513          	li	a0,-1
80001858:	00008067          	ret
8000185c:	04061063          	bnez	a2,8000189c <__gedf2+0xc4>
80001860:	fff00513          	li	a0,-1
80001864:	04058463          	beqz	a1,800018ac <__gedf2+0xd4>
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80001868:	00008067          	ret
  FP_CMP_D (r, A, B, -2, 2);
8000186c:	fea8c0e3          	blt	a7,a0,8000184c <__gedf2+0x74>
80001870:	fe6768e3          	bltu	a4,t1,80001860 <__gedf2+0x88>
80001874:	00e31863          	bne	t1,a4,80001884 <__gedf2+0xac>
80001878:	ffcee4e3          	bltu	t4,t3,80001860 <__gedf2+0x88>
8000187c:	00000513          	li	a0,0
80001880:	ffde74e3          	bgeu	t3,t4,80001868 <__gedf2+0x90>
80001884:	00100513          	li	a0,1
80001888:	fe0590e3          	bnez	a1,80001868 <__gedf2+0x90>
8000188c:	fc9ff06f          	j	80001854 <__gedf2+0x7c>
80001890:	ffe00513          	li	a0,-2
80001894:	00008067          	ret
80001898:	fa079ae3          	bnez	a5,8000184c <__gedf2+0x74>
8000189c:	fcb692e3          	bne	a3,a1,80001860 <__gedf2+0x88>
800018a0:	fd1556e3          	bge	a0,a7,8000186c <__gedf2+0x94>
800018a4:	fff00513          	li	a0,-1
800018a8:	fc0690e3          	bnez	a3,80001868 <__gedf2+0x90>
800018ac:	00100513          	li	a0,1
800018b0:	00008067          	ret

800018b4 <__ledf2>:
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
  FP_UNPACK_RAW_D (B, b);
800018b4:	0146d793          	srl	a5,a3,0x14
  FP_UNPACK_RAW_D (A, a);
800018b8:	0145d893          	srl	a7,a1,0x14
800018bc:	00100737          	lui	a4,0x100
800018c0:	fff70713          	add	a4,a4,-1 # fffff <__stack_size+0xfbfff>
{
800018c4:	00050813          	mv	a6,a0
800018c8:	00050e13          	mv	t3,a0
  FP_UNPACK_RAW_D (A, a);
800018cc:	7ff8f893          	and	a7,a7,2047
  FP_UNPACK_RAW_D (B, b);
800018d0:	7ff7f513          	and	a0,a5,2047
  FP_CMP_D (r, A, B, 2, 2);
800018d4:	7ff00793          	li	a5,2047
  FP_UNPACK_RAW_D (A, a);
800018d8:	00b77333          	and	t1,a4,a1
800018dc:	00060e93          	mv	t4,a2
  FP_UNPACK_RAW_D (B, b);
800018e0:	00d77733          	and	a4,a4,a3
  FP_UNPACK_RAW_D (A, a);
800018e4:	01f5d593          	srl	a1,a1,0x1f
  FP_UNPACK_RAW_D (B, b);
800018e8:	01f6d693          	srl	a3,a3,0x1f
  FP_CMP_D (r, A, B, 2, 2);
800018ec:	00f89663          	bne	a7,a5,800018f8 <__ledf2+0x44>
800018f0:	010367b3          	or	a5,t1,a6
800018f4:	06079c63          	bnez	a5,8000196c <__ledf2+0xb8>
800018f8:	7ff00793          	li	a5,2047
800018fc:	00f51663          	bne	a0,a5,80001908 <__ledf2+0x54>
80001900:	00c767b3          	or	a5,a4,a2
80001904:	06079463          	bnez	a5,8000196c <__ledf2+0xb8>
80001908:	00000793          	li	a5,0
8000190c:	00089663          	bnez	a7,80001918 <__ledf2+0x64>
80001910:	01036833          	or	a6,t1,a6
80001914:	00183793          	seqz	a5,a6
80001918:	04051e63          	bnez	a0,80001974 <__ledf2+0xc0>
8000191c:	00c76633          	or	a2,a4,a2
80001920:	00078c63          	beqz	a5,80001938 <__ledf2+0x84>
80001924:	02060063          	beqz	a2,80001944 <__ledf2+0x90>
80001928:	00100513          	li	a0,1
8000192c:	00069c63          	bnez	a3,80001944 <__ledf2+0x90>
80001930:	fff00513          	li	a0,-1
80001934:	00008067          	ret
80001938:	04061063          	bnez	a2,80001978 <__ledf2+0xc4>
8000193c:	fff00513          	li	a0,-1
80001940:	04058463          	beqz	a1,80001988 <__ledf2+0xd4>
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80001944:	00008067          	ret
  FP_CMP_D (r, A, B, 2, 2);
80001948:	fea8c0e3          	blt	a7,a0,80001928 <__ledf2+0x74>
8000194c:	fe6768e3          	bltu	a4,t1,8000193c <__ledf2+0x88>
80001950:	00e31863          	bne	t1,a4,80001960 <__ledf2+0xac>
80001954:	ffcee4e3          	bltu	t4,t3,8000193c <__ledf2+0x88>
80001958:	00000513          	li	a0,0
8000195c:	ffde74e3          	bgeu	t3,t4,80001944 <__ledf2+0x90>
80001960:	00100513          	li	a0,1
80001964:	fe0590e3          	bnez	a1,80001944 <__ledf2+0x90>
80001968:	fc9ff06f          	j	80001930 <__ledf2+0x7c>
8000196c:	00200513          	li	a0,2
80001970:	00008067          	ret
80001974:	fa079ae3          	bnez	a5,80001928 <__ledf2+0x74>
80001978:	fcb692e3          	bne	a3,a1,8000193c <__ledf2+0x88>
8000197c:	fd1556e3          	bge	a0,a7,80001948 <__ledf2+0x94>
80001980:	fff00513          	li	a0,-1
80001984:	fc0690e3          	bnez	a3,80001944 <__ledf2+0x90>
80001988:	00100513          	li	a0,1
8000198c:	00008067          	ret

80001990 <__muldf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__muldf3 (DFtype a, DFtype b)
{
80001990:	fd010113          	add	sp,sp,-48
80001994:	01512a23          	sw	s5,20(sp)
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
80001998:	0145da93          	srl	s5,a1,0x14
{
8000199c:	02812423          	sw	s0,40(sp)
800019a0:	02912223          	sw	s1,36(sp)
800019a4:	01312e23          	sw	s3,28(sp)
800019a8:	01412c23          	sw	s4,24(sp)
800019ac:	01612823          	sw	s6,16(sp)
  FP_UNPACK_D (A, a);
800019b0:	00c59493          	sll	s1,a1,0xc
{
800019b4:	02112623          	sw	ra,44(sp)
800019b8:	03212023          	sw	s2,32(sp)
800019bc:	01712623          	sw	s7,12(sp)
  FP_UNPACK_D (A, a);
800019c0:	7ffafa93          	and	s5,s5,2047
{
800019c4:	00050413          	mv	s0,a0
800019c8:	00060b13          	mv	s6,a2
800019cc:	00068993          	mv	s3,a3
  FP_UNPACK_D (A, a);
800019d0:	00c4d493          	srl	s1,s1,0xc
800019d4:	01f5da13          	srl	s4,a1,0x1f
800019d8:	240a8e63          	beqz	s5,80001c34 <__muldf3+0x2a4>
800019dc:	7ff00793          	li	a5,2047
800019e0:	2cfa8063          	beq	s5,a5,80001ca0 <__muldf3+0x310>
800019e4:	00349493          	sll	s1,s1,0x3
800019e8:	01d55793          	srl	a5,a0,0x1d
800019ec:	0097e7b3          	or	a5,a5,s1
800019f0:	008004b7          	lui	s1,0x800
800019f4:	0097e4b3          	or	s1,a5,s1
800019f8:	00351913          	sll	s2,a0,0x3
800019fc:	c01a8a93          	add	s5,s5,-1023
80001a00:	00000b93          	li	s7,0
  FP_UNPACK_D (B, b);
80001a04:	0149d713          	srl	a4,s3,0x14
80001a08:	00c99413          	sll	s0,s3,0xc
80001a0c:	7ff77713          	and	a4,a4,2047
80001a10:	00c45413          	srl	s0,s0,0xc
80001a14:	01f9d993          	srl	s3,s3,0x1f
80001a18:	2c070063          	beqz	a4,80001cd8 <__muldf3+0x348>
80001a1c:	7ff00793          	li	a5,2047
80001a20:	32f70463          	beq	a4,a5,80001d48 <__muldf3+0x3b8>
80001a24:	00341413          	sll	s0,s0,0x3
80001a28:	01db5793          	srl	a5,s6,0x1d
80001a2c:	0087e7b3          	or	a5,a5,s0
80001a30:	00800437          	lui	s0,0x800
80001a34:	0087e433          	or	s0,a5,s0
80001a38:	c0170693          	add	a3,a4,-1023
80001a3c:	003b1793          	sll	a5,s6,0x3
80001a40:	00000713          	li	a4,0
  FP_MUL_D (R, A, B);
80001a44:	00da8ab3          	add	s5,s5,a3
80001a48:	002b9693          	sll	a3,s7,0x2
80001a4c:	00e6e6b3          	or	a3,a3,a4
80001a50:	00a00613          	li	a2,10
80001a54:	001a8513          	add	a0,s5,1
80001a58:	40d64663          	blt	a2,a3,80001e64 <__muldf3+0x4d4>
80001a5c:	00200613          	li	a2,2
80001a60:	013a45b3          	xor	a1,s4,s3
80001a64:	30d64e63          	blt	a2,a3,80001d80 <__muldf3+0x3f0>
80001a68:	fff68693          	add	a3,a3,-1
80001a6c:	00100613          	li	a2,1
80001a70:	32d67a63          	bgeu	a2,a3,80001da4 <__muldf3+0x414>
80001a74:	00010337          	lui	t1,0x10
80001a78:	fff30e13          	add	t3,t1,-1 # ffff <__stack_size+0xbfff>
80001a7c:	01095713          	srl	a4,s2,0x10
80001a80:	0107d893          	srl	a7,a5,0x10
80001a84:	01c97933          	and	s2,s2,t3
80001a88:	01c7ff33          	and	t5,a5,t3
80001a8c:	03e907b3          	mul	a5,s2,t5
80001a90:	03e70eb3          	mul	t4,a4,t5
80001a94:	0107d813          	srl	a6,a5,0x10
80001a98:	03288633          	mul	a2,a7,s2
80001a9c:	01d60633          	add	a2,a2,t4
80001aa0:	00c80833          	add	a6,a6,a2
80001aa4:	031706b3          	mul	a3,a4,a7
80001aa8:	01d87463          	bgeu	a6,t4,80001ab0 <__muldf3+0x120>
80001aac:	006686b3          	add	a3,a3,t1
80001ab0:	01085293          	srl	t0,a6,0x10
80001ab4:	01c87833          	and	a6,a6,t3
80001ab8:	01c7f7b3          	and	a5,a5,t3
80001abc:	01045613          	srl	a2,s0,0x10
80001ac0:	01c47e33          	and	t3,s0,t3
80001ac4:	01081813          	sll	a6,a6,0x10
80001ac8:	00f80833          	add	a6,a6,a5
80001acc:	03c90eb3          	mul	t4,s2,t3
80001ad0:	03c707b3          	mul	a5,a4,t3
80001ad4:	03260933          	mul	s2,a2,s2
80001ad8:	02c70333          	mul	t1,a4,a2
80001adc:	00f90933          	add	s2,s2,a5
80001ae0:	010ed713          	srl	a4,t4,0x10
80001ae4:	01270733          	add	a4,a4,s2
80001ae8:	00f77663          	bgeu	a4,a5,80001af4 <__muldf3+0x164>
80001aec:	000107b7          	lui	a5,0x10
80001af0:	00f30333          	add	t1,t1,a5
80001af4:	00010437          	lui	s0,0x10
80001af8:	01075793          	srl	a5,a4,0x10
80001afc:	fff40f93          	add	t6,s0,-1 # ffff <__stack_size+0xbfff>
80001b00:	00678333          	add	t1,a5,t1
80001b04:	01f777b3          	and	a5,a4,t6
80001b08:	01fefeb3          	and	t4,t4,t6
80001b0c:	01079793          	sll	a5,a5,0x10
80001b10:	01f4ffb3          	and	t6,s1,t6
80001b14:	01d787b3          	add	a5,a5,t4
80001b18:	0104de93          	srl	t4,s1,0x10
80001b1c:	03ff03b3          	mul	t2,t5,t6
80001b20:	00f282b3          	add	t0,t0,a5
80001b24:	03ee8f33          	mul	t5,t4,t5
80001b28:	0103d713          	srl	a4,t2,0x10
80001b2c:	03d884b3          	mul	s1,a7,t4
80001b30:	03f888b3          	mul	a7,a7,t6
80001b34:	01e888b3          	add	a7,a7,t5
80001b38:	01170733          	add	a4,a4,a7
80001b3c:	01e77463          	bgeu	a4,t5,80001b44 <__muldf3+0x1b4>
80001b40:	008484b3          	add	s1,s1,s0
80001b44:	01075f13          	srl	t5,a4,0x10
80001b48:	009f0f33          	add	t5,t5,s1
80001b4c:	000104b7          	lui	s1,0x10
80001b50:	fff48413          	add	s0,s1,-1 # ffff <__stack_size+0xbfff>
80001b54:	00877733          	and	a4,a4,s0
80001b58:	0083f3b3          	and	t2,t2,s0
80001b5c:	01071713          	sll	a4,a4,0x10
80001b60:	007708b3          	add	a7,a4,t2
80001b64:	03fe03b3          	mul	t2,t3,t6
80001b68:	03ce8e33          	mul	t3,t4,t3
80001b6c:	03d60eb3          	mul	t4,a2,t4
80001b70:	03f60633          	mul	a2,a2,t6
80001b74:	0103df93          	srl	t6,t2,0x10
80001b78:	01c60633          	add	a2,a2,t3
80001b7c:	00cf8fb3          	add	t6,t6,a2
80001b80:	01cff463          	bgeu	t6,t3,80001b88 <__muldf3+0x1f8>
80001b84:	009e8eb3          	add	t4,t4,s1
80001b88:	008ff733          	and	a4,t6,s0
80001b8c:	0083f3b3          	and	t2,t2,s0
80001b90:	01071713          	sll	a4,a4,0x10
80001b94:	005686b3          	add	a3,a3,t0
80001b98:	00770733          	add	a4,a4,t2
80001b9c:	00670333          	add	t1,a4,t1
80001ba0:	00f6b7b3          	sltu	a5,a3,a5
80001ba4:	00f307b3          	add	a5,t1,a5
80001ba8:	00e33633          	sltu	a2,t1,a4
80001bac:	011688b3          	add	a7,a3,a7
80001bb0:	0067b333          	sltu	t1,a5,t1
80001bb4:	00666633          	or	a2,a2,t1
80001bb8:	00d8b6b3          	sltu	a3,a7,a3
80001bbc:	01e78333          	add	t1,a5,t5
80001bc0:	00d306b3          	add	a3,t1,a3
80001bc4:	00f33733          	sltu	a4,t1,a5
80001bc8:	010fdf93          	srl	t6,t6,0x10
80001bcc:	0066b333          	sltu	t1,a3,t1
80001bd0:	00989793          	sll	a5,a7,0x9
80001bd4:	01f60633          	add	a2,a2,t6
80001bd8:	00676733          	or	a4,a4,t1
80001bdc:	00c70733          	add	a4,a4,a2
80001be0:	0107e7b3          	or	a5,a5,a6
80001be4:	01d70733          	add	a4,a4,t4
80001be8:	00f037b3          	snez	a5,a5
80001bec:	0178d893          	srl	a7,a7,0x17
80001bf0:	00971713          	sll	a4,a4,0x9
80001bf4:	0176d413          	srl	s0,a3,0x17
80001bf8:	0117e7b3          	or	a5,a5,a7
80001bfc:	00969693          	sll	a3,a3,0x9
80001c00:	00d7e7b3          	or	a5,a5,a3
80001c04:	00771693          	sll	a3,a4,0x7
80001c08:	00876433          	or	s0,a4,s0
80001c0c:	0206d063          	bgez	a3,80001c2c <__muldf3+0x29c>
80001c10:	0017d713          	srl	a4,a5,0x1
80001c14:	0017f793          	and	a5,a5,1
80001c18:	00f76733          	or	a4,a4,a5
80001c1c:	01f41793          	sll	a5,s0,0x1f
80001c20:	00f767b3          	or	a5,a4,a5
80001c24:	00145413          	srl	s0,s0,0x1
80001c28:	00050a93          	mv	s5,a0
80001c2c:	000a8513          	mv	a0,s5
80001c30:	18c0006f          	j	80001dbc <__muldf3+0x42c>
  FP_UNPACK_D (A, a);
80001c34:	00a4e933          	or	s2,s1,a0
80001c38:	08090063          	beqz	s2,80001cb8 <__muldf3+0x328>
80001c3c:	04048063          	beqz	s1,80001c7c <__muldf3+0x2ec>
80001c40:	00048513          	mv	a0,s1
80001c44:	729000ef          	jal	80002b6c <__clzsi2>
80001c48:	ff550713          	add	a4,a0,-11 # 7fff5 <__stack_size+0x7bff5>
80001c4c:	01d00793          	li	a5,29
80001c50:	ff850693          	add	a3,a0,-8
80001c54:	40e787b3          	sub	a5,a5,a4
80001c58:	00d494b3          	sll	s1,s1,a3
80001c5c:	00f457b3          	srl	a5,s0,a5
80001c60:	0097e7b3          	or	a5,a5,s1
80001c64:	00d414b3          	sll	s1,s0,a3
80001c68:	c0d00a93          	li	s5,-1011
80001c6c:	00048913          	mv	s2,s1
80001c70:	40aa8ab3          	sub	s5,s5,a0
80001c74:	00078493          	mv	s1,a5
80001c78:	d89ff06f          	j	80001a00 <__muldf3+0x70>
80001c7c:	6f1000ef          	jal	80002b6c <__clzsi2>
80001c80:	00050793          	mv	a5,a0
80001c84:	01578713          	add	a4,a5,21 # 10015 <__stack_size+0xc015>
80001c88:	01c00693          	li	a3,28
80001c8c:	02050513          	add	a0,a0,32
80001c90:	fae6dee3          	bge	a3,a4,80001c4c <__muldf3+0x2bc>
80001c94:	ff878793          	add	a5,a5,-8
80001c98:	00f417b3          	sll	a5,s0,a5
80001c9c:	fcdff06f          	j	80001c68 <__muldf3+0x2d8>
80001ca0:	00a4e933          	or	s2,s1,a0
80001ca4:	02091263          	bnez	s2,80001cc8 <__muldf3+0x338>
80001ca8:	00000493          	li	s1,0
80001cac:	7ff00a93          	li	s5,2047
80001cb0:	00200b93          	li	s7,2
80001cb4:	d51ff06f          	j	80001a04 <__muldf3+0x74>
80001cb8:	00000493          	li	s1,0
80001cbc:	00000a93          	li	s5,0
80001cc0:	00100b93          	li	s7,1
80001cc4:	d41ff06f          	j	80001a04 <__muldf3+0x74>
80001cc8:	00050913          	mv	s2,a0
80001ccc:	7ff00a93          	li	s5,2047
80001cd0:	00300b93          	li	s7,3
80001cd4:	d31ff06f          	j	80001a04 <__muldf3+0x74>
  FP_UNPACK_D (B, b);
80001cd8:	016467b3          	or	a5,s0,s6
80001cdc:	08078263          	beqz	a5,80001d60 <__muldf3+0x3d0>
80001ce0:	04040063          	beqz	s0,80001d20 <__muldf3+0x390>
80001ce4:	00040513          	mv	a0,s0
80001ce8:	685000ef          	jal	80002b6c <__clzsi2>
80001cec:	ff550693          	add	a3,a0,-11
80001cf0:	01d00713          	li	a4,29
80001cf4:	ff850793          	add	a5,a0,-8
80001cf8:	40d70733          	sub	a4,a4,a3
80001cfc:	00f41433          	sll	s0,s0,a5
80001d00:	00eb5733          	srl	a4,s6,a4
80001d04:	00876733          	or	a4,a4,s0
80001d08:	00fb1433          	sll	s0,s6,a5
80001d0c:	c0d00693          	li	a3,-1011
80001d10:	00040793          	mv	a5,s0
80001d14:	40a686b3          	sub	a3,a3,a0
80001d18:	00070413          	mv	s0,a4
80001d1c:	d25ff06f          	j	80001a40 <__muldf3+0xb0>
80001d20:	000b0513          	mv	a0,s6
80001d24:	649000ef          	jal	80002b6c <__clzsi2>
80001d28:	00050793          	mv	a5,a0
80001d2c:	01578693          	add	a3,a5,21
80001d30:	01c00713          	li	a4,28
80001d34:	02050513          	add	a0,a0,32
80001d38:	fad75ce3          	bge	a4,a3,80001cf0 <__muldf3+0x360>
80001d3c:	ff878793          	add	a5,a5,-8
80001d40:	00fb1733          	sll	a4,s6,a5
80001d44:	fc9ff06f          	j	80001d0c <__muldf3+0x37c>
80001d48:	016467b3          	or	a5,s0,s6
80001d4c:	02079263          	bnez	a5,80001d70 <__muldf3+0x3e0>
80001d50:	00000413          	li	s0,0
80001d54:	7ff00693          	li	a3,2047
80001d58:	00200713          	li	a4,2
80001d5c:	ce9ff06f          	j	80001a44 <__muldf3+0xb4>
80001d60:	00000413          	li	s0,0
80001d64:	00000693          	li	a3,0
80001d68:	00100713          	li	a4,1
80001d6c:	cd9ff06f          	j	80001a44 <__muldf3+0xb4>
80001d70:	000b0793          	mv	a5,s6
80001d74:	7ff00693          	li	a3,2047
80001d78:	00300713          	li	a4,3
80001d7c:	cc9ff06f          	j	80001a44 <__muldf3+0xb4>
80001d80:	00100613          	li	a2,1
80001d84:	00d61633          	sll	a2,a2,a3
  FP_MUL_D (R, A, B);
80001d88:	53067693          	and	a3,a2,1328
80001d8c:	0e069663          	bnez	a3,80001e78 <__muldf3+0x4e8>
80001d90:	24067813          	and	a6,a2,576
80001d94:	1a081a63          	bnez	a6,80001f48 <__muldf3+0x5b8>
80001d98:	08867613          	and	a2,a2,136
80001d9c:	cc060ce3          	beqz	a2,80001a74 <__muldf3+0xe4>
  FP_UNPACK_D (B, b);
80001da0:	00098593          	mv	a1,s3
  FP_PACK_D (r, R);
80001da4:	00200693          	li	a3,2
80001da8:	18d70863          	beq	a4,a3,80001f38 <__muldf3+0x5a8>
80001dac:	00300693          	li	a3,3
80001db0:	1ad70463          	beq	a4,a3,80001f58 <__muldf3+0x5c8>
80001db4:	00100693          	li	a3,1
80001db8:	1ad70663          	beq	a4,a3,80001f64 <__muldf3+0x5d4>
80001dbc:	3ff50613          	add	a2,a0,1023
80001dc0:	0cc05463          	blez	a2,80001e88 <__muldf3+0x4f8>
80001dc4:	0077f713          	and	a4,a5,7
80001dc8:	02070063          	beqz	a4,80001de8 <__muldf3+0x458>
80001dcc:	00f7f713          	and	a4,a5,15
80001dd0:	00400693          	li	a3,4
80001dd4:	00d70a63          	beq	a4,a3,80001de8 <__muldf3+0x458>
80001dd8:	00478713          	add	a4,a5,4
80001ddc:	00f736b3          	sltu	a3,a4,a5
80001de0:	00d40433          	add	s0,s0,a3
80001de4:	00070793          	mv	a5,a4
80001de8:	00741713          	sll	a4,s0,0x7
80001dec:	00075a63          	bgez	a4,80001e00 <__muldf3+0x470>
80001df0:	ff000737          	lui	a4,0xff000
80001df4:	fff70713          	add	a4,a4,-1 # feffffff <__stack_base+0x3effffff>
80001df8:	00e47433          	and	s0,s0,a4
80001dfc:	40050613          	add	a2,a0,1024
80001e00:	7fe00713          	li	a4,2046
80001e04:	12c74a63          	blt	a4,a2,80001f38 <__muldf3+0x5a8>
80001e08:	0037d793          	srl	a5,a5,0x3
80001e0c:	01d41693          	sll	a3,s0,0x1d
80001e10:	00f6e6b3          	or	a3,a3,a5
80001e14:	00345713          	srl	a4,s0,0x3
80001e18:	00c71713          	sll	a4,a4,0xc
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80001e1c:	02c12083          	lw	ra,44(sp)
80001e20:	02812403          	lw	s0,40(sp)
  FP_PACK_D (r, R);
80001e24:	01461613          	sll	a2,a2,0x14
80001e28:	00c75713          	srl	a4,a4,0xc
80001e2c:	01f59593          	sll	a1,a1,0x1f
80001e30:	00e66633          	or	a2,a2,a4
80001e34:	00b667b3          	or	a5,a2,a1
}
80001e38:	02412483          	lw	s1,36(sp)
80001e3c:	02012903          	lw	s2,32(sp)
80001e40:	01c12983          	lw	s3,28(sp)
80001e44:	01812a03          	lw	s4,24(sp)
80001e48:	01412a83          	lw	s5,20(sp)
80001e4c:	01012b03          	lw	s6,16(sp)
80001e50:	00c12b83          	lw	s7,12(sp)
80001e54:	00068513          	mv	a0,a3
80001e58:	00078593          	mv	a1,a5
80001e5c:	03010113          	add	sp,sp,48
80001e60:	00008067          	ret
  FP_MUL_D (R, A, B);
80001e64:	00f00613          	li	a2,15
80001e68:	0ec68863          	beq	a3,a2,80001f58 <__muldf3+0x5c8>
80001e6c:	00b00613          	li	a2,11
  FP_UNPACK_D (A, a);
80001e70:	000a0593          	mv	a1,s4
  FP_MUL_D (R, A, B);
80001e74:	f2c686e3          	beq	a3,a2,80001da0 <__muldf3+0x410>
80001e78:	00048413          	mv	s0,s1
80001e7c:	00090793          	mv	a5,s2
80001e80:	000b8713          	mv	a4,s7
80001e84:	f21ff06f          	j	80001da4 <__muldf3+0x414>
  FP_PACK_D (r, R);
80001e88:	00100713          	li	a4,1
80001e8c:	40c70733          	sub	a4,a4,a2
80001e90:	03800693          	li	a3,56
80001e94:	0ce6c863          	blt	a3,a4,80001f64 <__muldf3+0x5d4>
80001e98:	01f00693          	li	a3,31
80001e9c:	06e6c463          	blt	a3,a4,80001f04 <__muldf3+0x574>
80001ea0:	41e50513          	add	a0,a0,1054
80001ea4:	00e7d633          	srl	a2,a5,a4
80001ea8:	00a416b3          	sll	a3,s0,a0
80001eac:	00a79533          	sll	a0,a5,a0
80001eb0:	00c6e6b3          	or	a3,a3,a2
80001eb4:	00a03533          	snez	a0,a0
80001eb8:	00a6e7b3          	or	a5,a3,a0
80001ebc:	00e45733          	srl	a4,s0,a4
80001ec0:	0077f693          	and	a3,a5,7
80001ec4:	02068063          	beqz	a3,80001ee4 <__muldf3+0x554>
80001ec8:	00f7f693          	and	a3,a5,15
80001ecc:	00400613          	li	a2,4
80001ed0:	00c68a63          	beq	a3,a2,80001ee4 <__muldf3+0x554>
80001ed4:	00478693          	add	a3,a5,4
80001ed8:	00f6b633          	sltu	a2,a3,a5
80001edc:	00c70733          	add	a4,a4,a2
80001ee0:	00068793          	mv	a5,a3
80001ee4:	00871693          	sll	a3,a4,0x8
80001ee8:	0806c463          	bltz	a3,80001f70 <__muldf3+0x5e0>
80001eec:	01d71693          	sll	a3,a4,0x1d
80001ef0:	0037d793          	srl	a5,a5,0x3
80001ef4:	00f6e6b3          	or	a3,a3,a5
80001ef8:	00375713          	srl	a4,a4,0x3
80001efc:	00000613          	li	a2,0
80001f00:	f19ff06f          	j	80001e18 <__muldf3+0x488>
80001f04:	fe100693          	li	a3,-31
80001f08:	40c686b3          	sub	a3,a3,a2
80001f0c:	02000813          	li	a6,32
80001f10:	00d456b3          	srl	a3,s0,a3
80001f14:	00000613          	li	a2,0
80001f18:	01070663          	beq	a4,a6,80001f24 <__muldf3+0x594>
80001f1c:	43e50613          	add	a2,a0,1086
80001f20:	00c41633          	sll	a2,s0,a2
80001f24:	00f66633          	or	a2,a2,a5
80001f28:	00c03633          	snez	a2,a2
80001f2c:	00c6e7b3          	or	a5,a3,a2
80001f30:	00000713          	li	a4,0
80001f34:	f8dff06f          	j	80001ec0 <__muldf3+0x530>
80001f38:	00000713          	li	a4,0
80001f3c:	00000693          	li	a3,0
80001f40:	7ff00613          	li	a2,2047
80001f44:	ed5ff06f          	j	80001e18 <__muldf3+0x488>
  FP_MUL_D (R, A, B);
80001f48:	00080737          	lui	a4,0x80
  FP_PACK_D (r, R);
80001f4c:	7ff00613          	li	a2,2047
80001f50:	00000593          	li	a1,0
80001f54:	ec5ff06f          	j	80001e18 <__muldf3+0x488>
80001f58:	00080737          	lui	a4,0x80
80001f5c:	00000693          	li	a3,0
80001f60:	fedff06f          	j	80001f4c <__muldf3+0x5bc>
80001f64:	00000713          	li	a4,0
80001f68:	00000693          	li	a3,0
80001f6c:	f91ff06f          	j	80001efc <__muldf3+0x56c>
80001f70:	00000713          	li	a4,0
80001f74:	00000693          	li	a3,0
80001f78:	00100613          	li	a2,1
80001f7c:	e9dff06f          	j	80001e18 <__muldf3+0x488>

80001f80 <__subdf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
80001f80:	00100837          	lui	a6,0x100
80001f84:	fff80813          	add	a6,a6,-1 # fffff <__stack_size+0xfbfff>
{
80001f88:	fe010113          	add	sp,sp,-32
  FP_UNPACK_SEMIRAW_D (A, a);
80001f8c:	00b878b3          	and	a7,a6,a1
80001f90:	0145d713          	srl	a4,a1,0x14
80001f94:	01d55793          	srl	a5,a0,0x1d
  FP_UNPACK_SEMIRAW_D (B, b);
80001f98:	00d87833          	and	a6,a6,a3
{
80001f9c:	01212823          	sw	s2,16(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
80001fa0:	7ff77913          	and	s2,a4,2047
80001fa4:	00389713          	sll	a4,a7,0x3
  FP_UNPACK_SEMIRAW_D (B, b);
80001fa8:	0146d893          	srl	a7,a3,0x14
{
80001fac:	00912a23          	sw	s1,20(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
80001fb0:	00e7e7b3          	or	a5,a5,a4
80001fb4:	01f5d493          	srl	s1,a1,0x1f
  FP_UNPACK_SEMIRAW_D (B, b);
80001fb8:	01d65713          	srl	a4,a2,0x1d
80001fbc:	00381813          	sll	a6,a6,0x3
{
80001fc0:	00112e23          	sw	ra,28(sp)
80001fc4:	00812c23          	sw	s0,24(sp)
80001fc8:	01312623          	sw	s3,12(sp)
  FP_UNPACK_SEMIRAW_D (B, b);
80001fcc:	7ff8f893          	and	a7,a7,2047
  FP_SUB_D (R, A, B);
80001fd0:	7ff00593          	li	a1,2047
  FP_UNPACK_SEMIRAW_D (A, a);
80001fd4:	00351513          	sll	a0,a0,0x3
  FP_UNPACK_SEMIRAW_D (B, b);
80001fd8:	01f6d693          	srl	a3,a3,0x1f
80001fdc:	01076733          	or	a4,a4,a6
80001fe0:	00361613          	sll	a2,a2,0x3
  FP_SUB_D (R, A, B);
80001fe4:	00b89663          	bne	a7,a1,80001ff0 <__subdf3+0x70>
80001fe8:	00c765b3          	or	a1,a4,a2
80001fec:	00059463          	bnez	a1,80001ff4 <__subdf3+0x74>
80001ff0:	0016c693          	xor	a3,a3,1
80001ff4:	41190833          	sub	a6,s2,a7
80001ff8:	2a969a63          	bne	a3,s1,800022ac <__subdf3+0x32c>
80001ffc:	11005c63          	blez	a6,80002114 <__subdf3+0x194>
80002000:	04089063          	bnez	a7,80002040 <__subdf3+0xc0>
80002004:	00c766b3          	or	a3,a4,a2
80002008:	66068063          	beqz	a3,80002668 <__subdf3+0x6e8>
8000200c:	fff80593          	add	a1,a6,-1
80002010:	02059063          	bnez	a1,80002030 <__subdf3+0xb0>
80002014:	00c50633          	add	a2,a0,a2
80002018:	00a636b3          	sltu	a3,a2,a0
8000201c:	00e78733          	add	a4,a5,a4
80002020:	00060513          	mv	a0,a2
80002024:	00d707b3          	add	a5,a4,a3
80002028:	00100913          	li	s2,1
8000202c:	06c0006f          	j	80002098 <__subdf3+0x118>
80002030:	7ff00693          	li	a3,2047
80002034:	02d81063          	bne	a6,a3,80002054 <__subdf3+0xd4>
80002038:	7ff00913          	li	s2,2047
8000203c:	1f80006f          	j	80002234 <__subdf3+0x2b4>
80002040:	7ff00693          	li	a3,2047
80002044:	1ed90863          	beq	s2,a3,80002234 <__subdf3+0x2b4>
80002048:	008006b7          	lui	a3,0x800
8000204c:	00d76733          	or	a4,a4,a3
80002050:	00080593          	mv	a1,a6
80002054:	03800693          	li	a3,56
80002058:	0ab6c863          	blt	a3,a1,80002108 <__subdf3+0x188>
8000205c:	01f00693          	li	a3,31
80002060:	06b6ca63          	blt	a3,a1,800020d4 <__subdf3+0x154>
80002064:	02000813          	li	a6,32
80002068:	40b80833          	sub	a6,a6,a1
8000206c:	010716b3          	sll	a3,a4,a6
80002070:	00b658b3          	srl	a7,a2,a1
80002074:	01061833          	sll	a6,a2,a6
80002078:	0116e6b3          	or	a3,a3,a7
8000207c:	01003833          	snez	a6,a6
80002080:	0106e6b3          	or	a3,a3,a6
80002084:	00b755b3          	srl	a1,a4,a1
80002088:	00a68533          	add	a0,a3,a0
8000208c:	00f585b3          	add	a1,a1,a5
80002090:	00d536b3          	sltu	a3,a0,a3
80002094:	00d587b3          	add	a5,a1,a3
80002098:	00879713          	sll	a4,a5,0x8
8000209c:	18075c63          	bgez	a4,80002234 <__subdf3+0x2b4>
800020a0:	00190913          	add	s2,s2,1
800020a4:	7ff00713          	li	a4,2047
800020a8:	5ae90a63          	beq	s2,a4,8000265c <__subdf3+0x6dc>
800020ac:	ff800737          	lui	a4,0xff800
800020b0:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
800020b4:	00e7f733          	and	a4,a5,a4
800020b8:	00155793          	srl	a5,a0,0x1
800020bc:	00157513          	and	a0,a0,1
800020c0:	00a7e7b3          	or	a5,a5,a0
800020c4:	01f71513          	sll	a0,a4,0x1f
800020c8:	00f56533          	or	a0,a0,a5
800020cc:	00175793          	srl	a5,a4,0x1
800020d0:	1640006f          	j	80002234 <__subdf3+0x2b4>
800020d4:	fe058693          	add	a3,a1,-32
800020d8:	02000893          	li	a7,32
800020dc:	00d756b3          	srl	a3,a4,a3
800020e0:	00000813          	li	a6,0
800020e4:	01158863          	beq	a1,a7,800020f4 <__subdf3+0x174>
800020e8:	04000813          	li	a6,64
800020ec:	40b80833          	sub	a6,a6,a1
800020f0:	01071833          	sll	a6,a4,a6
800020f4:	00c86833          	or	a6,a6,a2
800020f8:	01003833          	snez	a6,a6
800020fc:	0106e6b3          	or	a3,a3,a6
80002100:	00000593          	li	a1,0
80002104:	f85ff06f          	j	80002088 <__subdf3+0x108>
80002108:	00c766b3          	or	a3,a4,a2
8000210c:	00d036b3          	snez	a3,a3
80002110:	ff1ff06f          	j	80002100 <__subdf3+0x180>
80002114:	0c080a63          	beqz	a6,800021e8 <__subdf3+0x268>
80002118:	412886b3          	sub	a3,a7,s2
8000211c:	02091463          	bnez	s2,80002144 <__subdf3+0x1c4>
80002120:	00a7e5b3          	or	a1,a5,a0
80002124:	50058e63          	beqz	a1,80002640 <__subdf3+0x6c0>
80002128:	fff68593          	add	a1,a3,-1 # 7fffff <__stack_size+0x7fbfff>
8000212c:	ee0584e3          	beqz	a1,80002014 <__subdf3+0x94>
80002130:	7ff00813          	li	a6,2047
80002134:	03069263          	bne	a3,a6,80002158 <__subdf3+0x1d8>
80002138:	00070793          	mv	a5,a4
8000213c:	00060513          	mv	a0,a2
80002140:	ef9ff06f          	j	80002038 <__subdf3+0xb8>
80002144:	7ff00593          	li	a1,2047
80002148:	feb888e3          	beq	a7,a1,80002138 <__subdf3+0x1b8>
8000214c:	008005b7          	lui	a1,0x800
80002150:	00b7e7b3          	or	a5,a5,a1
80002154:	00068593          	mv	a1,a3
80002158:	03800693          	li	a3,56
8000215c:	08b6c063          	blt	a3,a1,800021dc <__subdf3+0x25c>
80002160:	01f00693          	li	a3,31
80002164:	04b6c263          	blt	a3,a1,800021a8 <__subdf3+0x228>
80002168:	02000813          	li	a6,32
8000216c:	40b80833          	sub	a6,a6,a1
80002170:	010796b3          	sll	a3,a5,a6
80002174:	00b55333          	srl	t1,a0,a1
80002178:	01051833          	sll	a6,a0,a6
8000217c:	0066e6b3          	or	a3,a3,t1
80002180:	01003833          	snez	a6,a6
80002184:	0106e6b3          	or	a3,a3,a6
80002188:	00b7d5b3          	srl	a1,a5,a1
8000218c:	00c68633          	add	a2,a3,a2
80002190:	00e585b3          	add	a1,a1,a4
80002194:	00d636b3          	sltu	a3,a2,a3
80002198:	00060513          	mv	a0,a2
8000219c:	00d587b3          	add	a5,a1,a3
800021a0:	00088913          	mv	s2,a7
800021a4:	ef5ff06f          	j	80002098 <__subdf3+0x118>
800021a8:	fe058693          	add	a3,a1,-32 # 7fffe0 <__stack_size+0x7fbfe0>
800021ac:	02000313          	li	t1,32
800021b0:	00d7d6b3          	srl	a3,a5,a3
800021b4:	00000813          	li	a6,0
800021b8:	00658863          	beq	a1,t1,800021c8 <__subdf3+0x248>
800021bc:	04000813          	li	a6,64
800021c0:	40b80833          	sub	a6,a6,a1
800021c4:	01079833          	sll	a6,a5,a6
800021c8:	00a86833          	or	a6,a6,a0
800021cc:	01003833          	snez	a6,a6
800021d0:	0106e6b3          	or	a3,a3,a6
800021d4:	00000593          	li	a1,0
800021d8:	fb5ff06f          	j	8000218c <__subdf3+0x20c>
800021dc:	00a7e6b3          	or	a3,a5,a0
800021e0:	00d036b3          	snez	a3,a3
800021e4:	ff1ff06f          	j	800021d4 <__subdf3+0x254>
800021e8:	00190693          	add	a3,s2,1
800021ec:	7fe6f593          	and	a1,a3,2046
800021f0:	08059663          	bnez	a1,8000227c <__subdf3+0x2fc>
800021f4:	00a7e6b3          	or	a3,a5,a0
800021f8:	06091263          	bnez	s2,8000225c <__subdf3+0x2dc>
800021fc:	44068863          	beqz	a3,8000264c <__subdf3+0x6cc>
80002200:	00c766b3          	or	a3,a4,a2
80002204:	02068863          	beqz	a3,80002234 <__subdf3+0x2b4>
80002208:	00c50633          	add	a2,a0,a2
8000220c:	00a636b3          	sltu	a3,a2,a0
80002210:	00e78733          	add	a4,a5,a4
80002214:	00d707b3          	add	a5,a4,a3
80002218:	00879713          	sll	a4,a5,0x8
8000221c:	00060513          	mv	a0,a2
80002220:	00075a63          	bgez	a4,80002234 <__subdf3+0x2b4>
80002224:	ff800737          	lui	a4,0xff800
80002228:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
8000222c:	00e7f7b3          	and	a5,a5,a4
80002230:	00100913          	li	s2,1
  FP_PACK_SEMIRAW_D (r, R);
80002234:	00757713          	and	a4,a0,7
80002238:	44070863          	beqz	a4,80002688 <__subdf3+0x708>
8000223c:	00f57713          	and	a4,a0,15
80002240:	00400693          	li	a3,4
80002244:	44d70263          	beq	a4,a3,80002688 <__subdf3+0x708>
80002248:	00450713          	add	a4,a0,4
8000224c:	00a736b3          	sltu	a3,a4,a0
80002250:	00d787b3          	add	a5,a5,a3
80002254:	00070513          	mv	a0,a4
80002258:	4300006f          	j	80002688 <__subdf3+0x708>
  FP_SUB_D (R, A, B);
8000225c:	ec068ee3          	beqz	a3,80002138 <__subdf3+0x1b8>
80002260:	00c76633          	or	a2,a4,a2
80002264:	dc060ae3          	beqz	a2,80002038 <__subdf3+0xb8>
80002268:	00000493          	li	s1,0
8000226c:	004007b7          	lui	a5,0x400
80002270:	00000513          	li	a0,0
80002274:	7ff00913          	li	s2,2047
80002278:	4100006f          	j	80002688 <__subdf3+0x708>
8000227c:	7ff00593          	li	a1,2047
80002280:	3cb68c63          	beq	a3,a1,80002658 <__subdf3+0x6d8>
80002284:	00c50633          	add	a2,a0,a2
80002288:	00a63533          	sltu	a0,a2,a0
8000228c:	00e78733          	add	a4,a5,a4
80002290:	00a70733          	add	a4,a4,a0
80002294:	01f71513          	sll	a0,a4,0x1f
80002298:	00165613          	srl	a2,a2,0x1
8000229c:	00c56533          	or	a0,a0,a2
800022a0:	00175793          	srl	a5,a4,0x1
800022a4:	00068913          	mv	s2,a3
800022a8:	f8dff06f          	j	80002234 <__subdf3+0x2b4>
800022ac:	0f005c63          	blez	a6,800023a4 <__subdf3+0x424>
800022b0:	08089e63          	bnez	a7,8000234c <__subdf3+0x3cc>
800022b4:	00c766b3          	or	a3,a4,a2
800022b8:	3a068863          	beqz	a3,80002668 <__subdf3+0x6e8>
800022bc:	fff80693          	add	a3,a6,-1
800022c0:	02069063          	bnez	a3,800022e0 <__subdf3+0x360>
800022c4:	40c50633          	sub	a2,a0,a2
800022c8:	00c536b3          	sltu	a3,a0,a2
800022cc:	40e78733          	sub	a4,a5,a4
800022d0:	00060513          	mv	a0,a2
800022d4:	40d707b3          	sub	a5,a4,a3
800022d8:	00100913          	li	s2,1
800022dc:	0540006f          	j	80002330 <__subdf3+0x3b0>
800022e0:	7ff00593          	li	a1,2047
800022e4:	d4b80ae3          	beq	a6,a1,80002038 <__subdf3+0xb8>
800022e8:	03800593          	li	a1,56
800022ec:	0ad5c663          	blt	a1,a3,80002398 <__subdf3+0x418>
800022f0:	01f00593          	li	a1,31
800022f4:	06d5c863          	blt	a1,a3,80002364 <__subdf3+0x3e4>
800022f8:	02000813          	li	a6,32
800022fc:	40d80833          	sub	a6,a6,a3
80002300:	00d658b3          	srl	a7,a2,a3
80002304:	010715b3          	sll	a1,a4,a6
80002308:	01061833          	sll	a6,a2,a6
8000230c:	0115e5b3          	or	a1,a1,a7
80002310:	01003833          	snez	a6,a6
80002314:	0105e633          	or	a2,a1,a6
80002318:	00d756b3          	srl	a3,a4,a3
8000231c:	40c50633          	sub	a2,a0,a2
80002320:	00c53733          	sltu	a4,a0,a2
80002324:	40d786b3          	sub	a3,a5,a3
80002328:	00060513          	mv	a0,a2
8000232c:	40e687b3          	sub	a5,a3,a4
80002330:	00879713          	sll	a4,a5,0x8
80002334:	f00750e3          	bgez	a4,80002234 <__subdf3+0x2b4>
80002338:	00800437          	lui	s0,0x800
8000233c:	fff40413          	add	s0,s0,-1 # 7fffff <__stack_size+0x7fbfff>
80002340:	0087f433          	and	s0,a5,s0
80002344:	00050993          	mv	s3,a0
80002348:	2100006f          	j	80002558 <__subdf3+0x5d8>
8000234c:	7ff00693          	li	a3,2047
80002350:	eed902e3          	beq	s2,a3,80002234 <__subdf3+0x2b4>
80002354:	008006b7          	lui	a3,0x800
80002358:	00d76733          	or	a4,a4,a3
8000235c:	00080693          	mv	a3,a6
80002360:	f89ff06f          	j	800022e8 <__subdf3+0x368>
80002364:	fe068593          	add	a1,a3,-32 # 7fffe0 <__stack_size+0x7fbfe0>
80002368:	02000893          	li	a7,32
8000236c:	00b755b3          	srl	a1,a4,a1
80002370:	00000813          	li	a6,0
80002374:	01168863          	beq	a3,a7,80002384 <__subdf3+0x404>
80002378:	04000813          	li	a6,64
8000237c:	40d80833          	sub	a6,a6,a3
80002380:	01071833          	sll	a6,a4,a6
80002384:	00c86833          	or	a6,a6,a2
80002388:	01003833          	snez	a6,a6
8000238c:	0105e633          	or	a2,a1,a6
80002390:	00000693          	li	a3,0
80002394:	f89ff06f          	j	8000231c <__subdf3+0x39c>
80002398:	00c76633          	or	a2,a4,a2
8000239c:	00c03633          	snez	a2,a2
800023a0:	ff1ff06f          	j	80002390 <__subdf3+0x410>
800023a4:	0e080863          	beqz	a6,80002494 <__subdf3+0x514>
800023a8:	41288833          	sub	a6,a7,s2
800023ac:	04091263          	bnez	s2,800023f0 <__subdf3+0x470>
800023b0:	00a7e5b3          	or	a1,a5,a0
800023b4:	2a058e63          	beqz	a1,80002670 <__subdf3+0x6f0>
800023b8:	fff80593          	add	a1,a6,-1
800023bc:	00059e63          	bnez	a1,800023d8 <__subdf3+0x458>
800023c0:	40a60533          	sub	a0,a2,a0
800023c4:	40f70733          	sub	a4,a4,a5
800023c8:	00a63633          	sltu	a2,a2,a0
800023cc:	40c707b3          	sub	a5,a4,a2
800023d0:	00068493          	mv	s1,a3
800023d4:	f05ff06f          	j	800022d8 <__subdf3+0x358>
800023d8:	7ff00313          	li	t1,2047
800023dc:	02681463          	bne	a6,t1,80002404 <__subdf3+0x484>
800023e0:	00070793          	mv	a5,a4
800023e4:	00060513          	mv	a0,a2
800023e8:	7ff00913          	li	s2,2047
800023ec:	0d00006f          	j	800024bc <__subdf3+0x53c>
800023f0:	7ff00593          	li	a1,2047
800023f4:	feb886e3          	beq	a7,a1,800023e0 <__subdf3+0x460>
800023f8:	008005b7          	lui	a1,0x800
800023fc:	00b7e7b3          	or	a5,a5,a1
80002400:	00080593          	mv	a1,a6
80002404:	03800813          	li	a6,56
80002408:	08b84063          	blt	a6,a1,80002488 <__subdf3+0x508>
8000240c:	01f00813          	li	a6,31
80002410:	04b84263          	blt	a6,a1,80002454 <__subdf3+0x4d4>
80002414:	02000313          	li	t1,32
80002418:	40b30333          	sub	t1,t1,a1
8000241c:	00b55e33          	srl	t3,a0,a1
80002420:	00679833          	sll	a6,a5,t1
80002424:	00651333          	sll	t1,a0,t1
80002428:	01c86833          	or	a6,a6,t3
8000242c:	00603333          	snez	t1,t1
80002430:	00686533          	or	a0,a6,t1
80002434:	00b7d5b3          	srl	a1,a5,a1
80002438:	40a60533          	sub	a0,a2,a0
8000243c:	40b705b3          	sub	a1,a4,a1
80002440:	00a63633          	sltu	a2,a2,a0
80002444:	40c587b3          	sub	a5,a1,a2
80002448:	00088913          	mv	s2,a7
8000244c:	00068493          	mv	s1,a3
80002450:	ee1ff06f          	j	80002330 <__subdf3+0x3b0>
80002454:	fe058813          	add	a6,a1,-32 # 7fffe0 <__stack_size+0x7fbfe0>
80002458:	02000e13          	li	t3,32
8000245c:	0107d833          	srl	a6,a5,a6
80002460:	00000313          	li	t1,0
80002464:	01c58863          	beq	a1,t3,80002474 <__subdf3+0x4f4>
80002468:	04000313          	li	t1,64
8000246c:	40b30333          	sub	t1,t1,a1
80002470:	00679333          	sll	t1,a5,t1
80002474:	00a36333          	or	t1,t1,a0
80002478:	00603333          	snez	t1,t1
8000247c:	00686533          	or	a0,a6,t1
80002480:	00000593          	li	a1,0
80002484:	fb5ff06f          	j	80002438 <__subdf3+0x4b8>
80002488:	00a7e533          	or	a0,a5,a0
8000248c:	00a03533          	snez	a0,a0
80002490:	ff1ff06f          	j	80002480 <__subdf3+0x500>
80002494:	00190593          	add	a1,s2,1
80002498:	7fe5f593          	and	a1,a1,2046
8000249c:	08059663          	bnez	a1,80002528 <__subdf3+0x5a8>
800024a0:	00c765b3          	or	a1,a4,a2
800024a4:	00a7e833          	or	a6,a5,a0
800024a8:	06091063          	bnez	s2,80002508 <__subdf3+0x588>
800024ac:	00081c63          	bnez	a6,800024c4 <__subdf3+0x544>
800024b0:	10058e63          	beqz	a1,800025cc <__subdf3+0x64c>
800024b4:	00070793          	mv	a5,a4
800024b8:	00060513          	mv	a0,a2
800024bc:	00068493          	mv	s1,a3
800024c0:	d75ff06f          	j	80002234 <__subdf3+0x2b4>
800024c4:	d60588e3          	beqz	a1,80002234 <__subdf3+0x2b4>
800024c8:	40c50833          	sub	a6,a0,a2
800024cc:	010538b3          	sltu	a7,a0,a6
800024d0:	40e785b3          	sub	a1,a5,a4
800024d4:	411585b3          	sub	a1,a1,a7
800024d8:	00859893          	sll	a7,a1,0x8
800024dc:	0008dc63          	bgez	a7,800024f4 <__subdf3+0x574>
800024e0:	40a60533          	sub	a0,a2,a0
800024e4:	40f70733          	sub	a4,a4,a5
800024e8:	00a63633          	sltu	a2,a2,a0
800024ec:	40c707b3          	sub	a5,a4,a2
800024f0:	fcdff06f          	j	800024bc <__subdf3+0x53c>
800024f4:	00b86533          	or	a0,a6,a1
800024f8:	18050463          	beqz	a0,80002680 <__subdf3+0x700>
800024fc:	00058793          	mv	a5,a1
80002500:	00080513          	mv	a0,a6
80002504:	d31ff06f          	j	80002234 <__subdf3+0x2b4>
80002508:	00081c63          	bnez	a6,80002520 <__subdf3+0x5a0>
8000250c:	d4058ee3          	beqz	a1,80002268 <__subdf3+0x2e8>
80002510:	00070793          	mv	a5,a4
80002514:	00060513          	mv	a0,a2
80002518:	00068493          	mv	s1,a3
8000251c:	b1dff06f          	j	80002038 <__subdf3+0xb8>
80002520:	b0058ce3          	beqz	a1,80002038 <__subdf3+0xb8>
80002524:	d45ff06f          	j	80002268 <__subdf3+0x2e8>
80002528:	40c505b3          	sub	a1,a0,a2
8000252c:	00b53833          	sltu	a6,a0,a1
80002530:	40e78433          	sub	s0,a5,a4
80002534:	41040433          	sub	s0,s0,a6
80002538:	00841813          	sll	a6,s0,0x8
8000253c:	00058993          	mv	s3,a1
80002540:	08085063          	bgez	a6,800025c0 <__subdf3+0x640>
80002544:	40a609b3          	sub	s3,a2,a0
80002548:	40f70433          	sub	s0,a4,a5
8000254c:	01363633          	sltu	a2,a2,s3
80002550:	40c40433          	sub	s0,s0,a2
80002554:	00068493          	mv	s1,a3
80002558:	06040e63          	beqz	s0,800025d4 <__subdf3+0x654>
8000255c:	00040513          	mv	a0,s0
80002560:	60c000ef          	jal	80002b6c <__clzsi2>
80002564:	ff850693          	add	a3,a0,-8
80002568:	02000793          	li	a5,32
8000256c:	40d787b3          	sub	a5,a5,a3
80002570:	00d41433          	sll	s0,s0,a3
80002574:	00f9d7b3          	srl	a5,s3,a5
80002578:	0087e7b3          	or	a5,a5,s0
8000257c:	00d99433          	sll	s0,s3,a3
80002580:	0b26c463          	blt	a3,s2,80002628 <__subdf3+0x6a8>
80002584:	412686b3          	sub	a3,a3,s2
80002588:	00168613          	add	a2,a3,1
8000258c:	01f00713          	li	a4,31
80002590:	06c74263          	blt	a4,a2,800025f4 <__subdf3+0x674>
80002594:	02000713          	li	a4,32
80002598:	40c70733          	sub	a4,a4,a2
8000259c:	00e79533          	sll	a0,a5,a4
800025a0:	00c456b3          	srl	a3,s0,a2
800025a4:	00e41733          	sll	a4,s0,a4
800025a8:	00d56533          	or	a0,a0,a3
800025ac:	00e03733          	snez	a4,a4
800025b0:	00e56533          	or	a0,a0,a4
800025b4:	00c7d7b3          	srl	a5,a5,a2
800025b8:	00000913          	li	s2,0
800025bc:	c79ff06f          	j	80002234 <__subdf3+0x2b4>
800025c0:	0085e5b3          	or	a1,a1,s0
800025c4:	f8059ae3          	bnez	a1,80002558 <__subdf3+0x5d8>
800025c8:	00000913          	li	s2,0
800025cc:	00000493          	li	s1,0
800025d0:	08c0006f          	j	8000265c <__subdf3+0x6dc>
800025d4:	00098513          	mv	a0,s3
800025d8:	594000ef          	jal	80002b6c <__clzsi2>
800025dc:	01850693          	add	a3,a0,24
800025e0:	01f00793          	li	a5,31
800025e4:	f8d7d2e3          	bge	a5,a3,80002568 <__subdf3+0x5e8>
800025e8:	ff850793          	add	a5,a0,-8
800025ec:	00f997b3          	sll	a5,s3,a5
800025f0:	f91ff06f          	j	80002580 <__subdf3+0x600>
800025f4:	fe168693          	add	a3,a3,-31
800025f8:	00d7d533          	srl	a0,a5,a3
800025fc:	02000693          	li	a3,32
80002600:	00000713          	li	a4,0
80002604:	00d60863          	beq	a2,a3,80002614 <__subdf3+0x694>
80002608:	04000713          	li	a4,64
8000260c:	40c70733          	sub	a4,a4,a2
80002610:	00e79733          	sll	a4,a5,a4
80002614:	00e46733          	or	a4,s0,a4
80002618:	00e03733          	snez	a4,a4
8000261c:	00e56533          	or	a0,a0,a4
80002620:	00000793          	li	a5,0
80002624:	f95ff06f          	j	800025b8 <__subdf3+0x638>
80002628:	ff800737          	lui	a4,0xff800
8000262c:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
80002630:	40d90933          	sub	s2,s2,a3
80002634:	00e7f7b3          	and	a5,a5,a4
80002638:	00040513          	mv	a0,s0
8000263c:	bf9ff06f          	j	80002234 <__subdf3+0x2b4>
80002640:	00070793          	mv	a5,a4
80002644:	00060513          	mv	a0,a2
80002648:	c5dff06f          	j	800022a4 <__subdf3+0x324>
8000264c:	00070793          	mv	a5,a4
80002650:	00060513          	mv	a0,a2
80002654:	be1ff06f          	j	80002234 <__subdf3+0x2b4>
80002658:	7ff00913          	li	s2,2047
8000265c:	00000793          	li	a5,0
80002660:	00000513          	li	a0,0
80002664:	0240006f          	j	80002688 <__subdf3+0x708>
80002668:	00080913          	mv	s2,a6
8000266c:	bc9ff06f          	j	80002234 <__subdf3+0x2b4>
80002670:	00070793          	mv	a5,a4
80002674:	00060513          	mv	a0,a2
80002678:	00080913          	mv	s2,a6
8000267c:	e41ff06f          	j	800024bc <__subdf3+0x53c>
80002680:	00000793          	li	a5,0
80002684:	00000493          	li	s1,0
  FP_PACK_SEMIRAW_D (r, R);
80002688:	00879713          	sll	a4,a5,0x8
8000268c:	00075e63          	bgez	a4,800026a8 <__subdf3+0x728>
80002690:	00190913          	add	s2,s2,1
80002694:	7ff00713          	li	a4,2047
80002698:	08e90263          	beq	s2,a4,8000271c <__subdf3+0x79c>
8000269c:	ff800737          	lui	a4,0xff800
800026a0:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
800026a4:	00e7f7b3          	and	a5,a5,a4
800026a8:	01d79693          	sll	a3,a5,0x1d
800026ac:	00355513          	srl	a0,a0,0x3
800026b0:	7ff00713          	li	a4,2047
800026b4:	00a6e6b3          	or	a3,a3,a0
800026b8:	0037d793          	srl	a5,a5,0x3
800026bc:	00e91e63          	bne	s2,a4,800026d8 <__subdf3+0x758>
800026c0:	00f6e6b3          	or	a3,a3,a5
800026c4:	00000793          	li	a5,0
800026c8:	00068863          	beqz	a3,800026d8 <__subdf3+0x758>
800026cc:	000807b7          	lui	a5,0x80
800026d0:	00000693          	li	a3,0
800026d4:	00000493          	li	s1,0
800026d8:	01491713          	sll	a4,s2,0x14
800026dc:	7ff00637          	lui	a2,0x7ff00
800026e0:	00c79793          	sll	a5,a5,0xc
800026e4:	00c77733          	and	a4,a4,a2
  FP_HANDLE_EXCEPTIONS;

  return r;
}
800026e8:	01c12083          	lw	ra,28(sp)
800026ec:	01812403          	lw	s0,24(sp)
  FP_PACK_SEMIRAW_D (r, R);
800026f0:	00c7d793          	srl	a5,a5,0xc
800026f4:	00f767b3          	or	a5,a4,a5
800026f8:	01f49713          	sll	a4,s1,0x1f
800026fc:	00e7e633          	or	a2,a5,a4
}
80002700:	01412483          	lw	s1,20(sp)
80002704:	01012903          	lw	s2,16(sp)
80002708:	00c12983          	lw	s3,12(sp)
8000270c:	00068513          	mv	a0,a3
80002710:	00060593          	mv	a1,a2
80002714:	02010113          	add	sp,sp,32
80002718:	00008067          	ret
8000271c:	00000793          	li	a5,0
80002720:	00000513          	li	a0,0
80002724:	f85ff06f          	j	800026a8 <__subdf3+0x728>

80002728 <__fixdfsi>:
  FP_DECL_EX;
  FP_DECL_D (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
80002728:	0145d713          	srl	a4,a1,0x14
8000272c:	001006b7          	lui	a3,0x100
80002730:	fff68793          	add	a5,a3,-1 # fffff <__stack_size+0xfbfff>
80002734:	7ff77713          	and	a4,a4,2047
  FP_TO_INT_D (r, A, SI_BITS, 1);
80002738:	3fe00613          	li	a2,1022
  FP_UNPACK_RAW_D (A, a);
8000273c:	00b7f7b3          	and	a5,a5,a1
80002740:	01f5d593          	srl	a1,a1,0x1f
  FP_TO_INT_D (r, A, SI_BITS, 1);
80002744:	04e65e63          	bge	a2,a4,800027a0 <__fixdfsi+0x78>
80002748:	41d00613          	li	a2,1053
8000274c:	00e65a63          	bge	a2,a4,80002760 <__fixdfsi+0x38>
80002750:	80000537          	lui	a0,0x80000
80002754:	fff50513          	add	a0,a0,-1 # 7fffffff <__stack_size+0x7fffbfff>
80002758:	00a58533          	add	a0,a1,a0
8000275c:	00008067          	ret
80002760:	00d7e7b3          	or	a5,a5,a3
80002764:	43300693          	li	a3,1075
80002768:	40e686b3          	sub	a3,a3,a4
8000276c:	01f00613          	li	a2,31
80002770:	02d64063          	blt	a2,a3,80002790 <__fixdfsi+0x68>
80002774:	bed70713          	add	a4,a4,-1043
80002778:	00e797b3          	sll	a5,a5,a4
8000277c:	00d55533          	srl	a0,a0,a3
80002780:	00a7e533          	or	a0,a5,a0
80002784:	02058063          	beqz	a1,800027a4 <__fixdfsi+0x7c>
80002788:	40a00533          	neg	a0,a0
8000278c:	00008067          	ret
80002790:	41300693          	li	a3,1043
80002794:	40e68733          	sub	a4,a3,a4
80002798:	00e7d533          	srl	a0,a5,a4
8000279c:	fe9ff06f          	j	80002784 <__fixdfsi+0x5c>
800027a0:	00000513          	li	a0,0
  FP_HANDLE_EXCEPTIONS;

  return r;
}
800027a4:	00008067          	ret

800027a8 <__fixunsdfsi>:
  FP_DECL_EX;
  FP_DECL_D (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
800027a8:	0145d713          	srl	a4,a1,0x14
800027ac:	00100837          	lui	a6,0x100
800027b0:	fff80793          	add	a5,a6,-1 # fffff <__stack_size+0xfbfff>
800027b4:	7ff77713          	and	a4,a4,2047
  FP_TO_INT_D (r, A, SI_BITS, 0);
800027b8:	3fe00613          	li	a2,1022
  FP_UNPACK_RAW_D (A, a);
800027bc:	00b7f7b3          	and	a5,a5,a1
{
800027c0:	00050693          	mv	a3,a0
  FP_UNPACK_RAW_D (A, a);
800027c4:	01f5d593          	srl	a1,a1,0x1f
  FP_TO_INT_D (r, A, SI_BITS, 0);
800027c8:	04e65a63          	bge	a2,a4,8000281c <__fixunsdfsi+0x74>
800027cc:	0015c613          	xor	a2,a1,1
800027d0:	41e60613          	add	a2,a2,1054 # 7ff0041e <__stack_size+0x7fefc41e>
800027d4:	fff58513          	add	a0,a1,-1
800027d8:	04c75463          	bge	a4,a2,80002820 <__fixunsdfsi+0x78>
800027dc:	00000513          	li	a0,0
800027e0:	04059063          	bnez	a1,80002820 <__fixunsdfsi+0x78>
800027e4:	43300613          	li	a2,1075
800027e8:	40e60633          	sub	a2,a2,a4
800027ec:	01f00593          	li	a1,31
800027f0:	0107e7b3          	or	a5,a5,a6
800027f4:	00c5cc63          	blt	a1,a2,8000280c <__fixunsdfsi+0x64>
800027f8:	bed70713          	add	a4,a4,-1043
800027fc:	00e797b3          	sll	a5,a5,a4
80002800:	00c6d533          	srl	a0,a3,a2
80002804:	00a7e533          	or	a0,a5,a0
80002808:	00008067          	ret
8000280c:	41300693          	li	a3,1043
80002810:	40e68733          	sub	a4,a3,a4
80002814:	00e7d533          	srl	a0,a5,a4
80002818:	00008067          	ret
8000281c:	00000513          	li	a0,0
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80002820:	00008067          	ret

80002824 <__floatsidf>:
#include "soft-fp.h"
#include "double.h"

DFtype
__floatsidf (SItype i)
{
80002824:	ff010113          	add	sp,sp,-16
80002828:	00112623          	sw	ra,12(sp)
8000282c:	00812423          	sw	s0,8(sp)
80002830:	00912223          	sw	s1,4(sp)
  FP_DECL_D (A);
  DFtype a;

  FP_FROM_INT_D (A, i, SI_BITS, USItype);
80002834:	08050663          	beqz	a0,800028c0 <__floatsidf+0x9c>
80002838:	41f55793          	sra	a5,a0,0x1f
8000283c:	00a7c433          	xor	s0,a5,a0
80002840:	40f40433          	sub	s0,s0,a5
80002844:	01f55493          	srl	s1,a0,0x1f
80002848:	00040513          	mv	a0,s0
8000284c:	320000ef          	jal	80002b6c <__clzsi2>
80002850:	41e00713          	li	a4,1054
80002854:	00a00793          	li	a5,10
80002858:	40a70733          	sub	a4,a4,a0
8000285c:	04a7c863          	blt	a5,a0,800028ac <__floatsidf+0x88>
80002860:	00b00793          	li	a5,11
80002864:	40a787b3          	sub	a5,a5,a0
80002868:	01550513          	add	a0,a0,21
8000286c:	00f457b3          	srl	a5,s0,a5
80002870:	00a41433          	sll	s0,s0,a0
80002874:	00048513          	mv	a0,s1
  FP_PACK_RAW_D (a, A);
80002878:	00c79793          	sll	a5,a5,0xc
8000287c:	00c7d793          	srl	a5,a5,0xc
80002880:	01471713          	sll	a4,a4,0x14
80002884:	01f51513          	sll	a0,a0,0x1f
80002888:	00f76733          	or	a4,a4,a5

  return a;
}
8000288c:	00c12083          	lw	ra,12(sp)
  FP_PACK_RAW_D (a, A);
80002890:	00a767b3          	or	a5,a4,a0
}
80002894:	00040513          	mv	a0,s0
80002898:	00812403          	lw	s0,8(sp)
8000289c:	00412483          	lw	s1,4(sp)
800028a0:	00078593          	mv	a1,a5
800028a4:	01010113          	add	sp,sp,16
800028a8:	00008067          	ret
  FP_FROM_INT_D (A, i, SI_BITS, USItype);
800028ac:	ff550513          	add	a0,a0,-11
800028b0:	00a417b3          	sll	a5,s0,a0
800028b4:	00048513          	mv	a0,s1
800028b8:	00000413          	li	s0,0
800028bc:	fbdff06f          	j	80002878 <__floatsidf+0x54>
800028c0:	00000713          	li	a4,0
800028c4:	00000793          	li	a5,0
800028c8:	ff1ff06f          	j	800028b8 <__floatsidf+0x94>

800028cc <__floatunsidf>:
#include "soft-fp.h"
#include "double.h"

DFtype
__floatunsidf (USItype i)
{
800028cc:	ff010113          	add	sp,sp,-16
800028d0:	00812423          	sw	s0,8(sp)
800028d4:	00112623          	sw	ra,12(sp)
800028d8:	00050413          	mv	s0,a0
  FP_DECL_D (A);
  DFtype a;

  FP_FROM_INT_D (A, i, SI_BITS, USItype);
800028dc:	06050263          	beqz	a0,80002940 <__floatunsidf+0x74>
800028e0:	28c000ef          	jal	80002b6c <__clzsi2>
800028e4:	41e00713          	li	a4,1054
800028e8:	00a00793          	li	a5,10
800028ec:	40a70733          	sub	a4,a4,a0
800028f0:	04a7c063          	blt	a5,a0,80002930 <__floatunsidf+0x64>
800028f4:	00b00793          	li	a5,11
800028f8:	40a787b3          	sub	a5,a5,a0
800028fc:	01550513          	add	a0,a0,21
80002900:	00f457b3          	srl	a5,s0,a5
80002904:	00a41433          	sll	s0,s0,a0
  FP_PACK_RAW_D (a, A);

  return a;
}
80002908:	00c12083          	lw	ra,12(sp)
8000290c:	00040513          	mv	a0,s0
  FP_PACK_RAW_D (a, A);
80002910:	00c79793          	sll	a5,a5,0xc
}
80002914:	00812403          	lw	s0,8(sp)
  FP_PACK_RAW_D (a, A);
80002918:	01471713          	sll	a4,a4,0x14
8000291c:	00c7d793          	srl	a5,a5,0xc
80002920:	00f766b3          	or	a3,a4,a5
}
80002924:	00068593          	mv	a1,a3
80002928:	01010113          	add	sp,sp,16
8000292c:	00008067          	ret
  FP_FROM_INT_D (A, i, SI_BITS, USItype);
80002930:	ff550513          	add	a0,a0,-11
80002934:	00a417b3          	sll	a5,s0,a0
80002938:	00000413          	li	s0,0
8000293c:	fcdff06f          	j	80002908 <__floatunsidf+0x3c>
80002940:	00000793          	li	a5,0
80002944:	00000713          	li	a4,0
80002948:	fc1ff06f          	j	80002908 <__floatunsidf+0x3c>

8000294c <__floatundidf>:
#include "soft-fp.h"
#include "double.h"

DFtype
__floatundidf (UDItype i)
{
8000294c:	fe010113          	add	sp,sp,-32
80002950:	00112e23          	sw	ra,28(sp)
80002954:	00812c23          	sw	s0,24(sp)
80002958:	00912a23          	sw	s1,20(sp)
8000295c:	01212823          	sw	s2,16(sp)
80002960:	01312623          	sw	s3,12(sp)
80002964:	01412423          	sw	s4,8(sp)
  FP_DECL_EX;
  FP_DECL_D (A);
  DFtype a;

  FP_INIT_ROUNDMODE;
  FP_FROM_INT_D (A, i, DI_BITS, UDItype);
80002968:	00b567b3          	or	a5,a0,a1
8000296c:	16078c63          	beqz	a5,80002ae4 <__floatundidf+0x198>
80002970:	00050493          	mv	s1,a0
80002974:	00058913          	mv	s2,a1
80002978:	00058413          	mv	s0,a1
8000297c:	08058463          	beqz	a1,80002a04 <__floatundidf+0xb8>
80002980:	00058513          	mv	a0,a1
80002984:	1e8000ef          	jal	80002b6c <__clzsi2>
80002988:	00050993          	mv	s3,a0
8000298c:	43e00a13          	li	s4,1086
80002990:	413a0a33          	sub	s4,s4,s3
80002994:	43300793          	li	a5,1075
80002998:	0947c463          	blt	a5,s4,80002a20 <__floatundidf+0xd4>
8000299c:	00b00793          	li	a5,11
800029a0:	00048713          	mv	a4,s1
800029a4:	14f98863          	beq	s3,a5,80002af4 <__floatundidf+0x1a8>
800029a8:	02a00793          	li	a5,42
800029ac:	0737c263          	blt	a5,s3,80002a10 <__floatundidf+0xc4>
800029b0:	02b00413          	li	s0,43
800029b4:	ff598793          	add	a5,s3,-11
800029b8:	41340433          	sub	s0,s0,s3
800029bc:	0084d433          	srl	s0,s1,s0
800029c0:	00f91933          	sll	s2,s2,a5
800029c4:	01246433          	or	s0,s0,s2
800029c8:	00f49733          	sll	a4,s1,a5
  FP_PACK_RAW_D (a, A);
  FP_HANDLE_EXCEPTIONS;

  return a;
}
800029cc:	01c12083          	lw	ra,28(sp)
  FP_PACK_RAW_D (a, A);
800029d0:	00c41593          	sll	a1,s0,0xc
}
800029d4:	01812403          	lw	s0,24(sp)
  FP_PACK_RAW_D (a, A);
800029d8:	014a1a13          	sll	s4,s4,0x14
800029dc:	00c5d593          	srl	a1,a1,0xc
800029e0:	00ba67b3          	or	a5,s4,a1
}
800029e4:	01412483          	lw	s1,20(sp)
800029e8:	01012903          	lw	s2,16(sp)
800029ec:	00c12983          	lw	s3,12(sp)
800029f0:	00812a03          	lw	s4,8(sp)
800029f4:	00070513          	mv	a0,a4
800029f8:	00078593          	mv	a1,a5
800029fc:	02010113          	add	sp,sp,32
80002a00:	00008067          	ret
  FP_FROM_INT_D (A, i, DI_BITS, UDItype);
80002a04:	168000ef          	jal	80002b6c <__clzsi2>
80002a08:	02050993          	add	s3,a0,32
80002a0c:	f81ff06f          	j	8000298c <__floatundidf+0x40>
80002a10:	fd598593          	add	a1,s3,-43
80002a14:	00b49433          	sll	s0,s1,a1
80002a18:	00000713          	li	a4,0
80002a1c:	fb1ff06f          	j	800029cc <__floatundidf+0x80>
80002a20:	43600793          	li	a5,1078
80002a24:	0347dc63          	bge	a5,s4,80002a5c <__floatundidf+0x110>
80002a28:	03898613          	add	a2,s3,56
80002a2c:	00048513          	mv	a0,s1
80002a30:	00090593          	mv	a1,s2
80002a34:	100000ef          	jal	80002b34 <__ashldi3>
80002a38:	00b56533          	or	a0,a0,a1
80002a3c:	00800613          	li	a2,8
80002a40:	00a03433          	snez	s0,a0
80002a44:	00090593          	mv	a1,s2
80002a48:	00048513          	mv	a0,s1
80002a4c:	41360633          	sub	a2,a2,s3
80002a50:	0ac000ef          	jal	80002afc <__lshrdi3>
80002a54:	00a464b3          	or	s1,s0,a0
80002a58:	00058913          	mv	s2,a1
80002a5c:	00800793          	li	a5,8
80002a60:	00048713          	mv	a4,s1
80002a64:	0337d063          	bge	a5,s3,80002a84 <__floatundidf+0x138>
80002a68:	02800793          	li	a5,40
80002a6c:	ff898693          	add	a3,s3,-8
80002a70:	413787b3          	sub	a5,a5,s3
80002a74:	00d91933          	sll	s2,s2,a3
80002a78:	00f4d7b3          	srl	a5,s1,a5
80002a7c:	0127e933          	or	s2,a5,s2
80002a80:	00d49733          	sll	a4,s1,a3
80002a84:	ff8007b7          	lui	a5,0xff800
80002a88:	fff78793          	add	a5,a5,-1 # ff7fffff <__stack_base+0x3f7fffff>
80002a8c:	00f975b3          	and	a1,s2,a5
80002a90:	00777793          	and	a5,a4,7
80002a94:	02078063          	beqz	a5,80002ab4 <__floatundidf+0x168>
80002a98:	00f77793          	and	a5,a4,15
80002a9c:	00400693          	li	a3,4
80002aa0:	00d78a63          	beq	a5,a3,80002ab4 <__floatundidf+0x168>
80002aa4:	00470793          	add	a5,a4,4
80002aa8:	00e7b6b3          	sltu	a3,a5,a4
80002aac:	00d585b3          	add	a1,a1,a3
80002ab0:	00078713          	mv	a4,a5
80002ab4:	00859793          	sll	a5,a1,0x8
80002ab8:	0007dc63          	bgez	a5,80002ad0 <__floatundidf+0x184>
80002abc:	ff8007b7          	lui	a5,0xff800
80002ac0:	fff78793          	add	a5,a5,-1 # ff7fffff <__stack_base+0x3f7fffff>
80002ac4:	43f00a13          	li	s4,1087
80002ac8:	00f5f5b3          	and	a1,a1,a5
80002acc:	413a0a33          	sub	s4,s4,s3
80002ad0:	00375713          	srl	a4,a4,0x3
80002ad4:	01d59793          	sll	a5,a1,0x1d
80002ad8:	00e7e733          	or	a4,a5,a4
80002adc:	0035d413          	srl	s0,a1,0x3
80002ae0:	eedff06f          	j	800029cc <__floatundidf+0x80>
80002ae4:	00000413          	li	s0,0
80002ae8:	00000713          	li	a4,0
80002aec:	00000a13          	li	s4,0
80002af0:	eddff06f          	j	800029cc <__floatundidf+0x80>
80002af4:	43300a13          	li	s4,1075
80002af8:	ed5ff06f          	j	800029cc <__floatundidf+0x80>

80002afc <__lshrdi3>:
  if (b == 0)
80002afc:	02060063          	beqz	a2,80002b1c <__lshrdi3+0x20>
  const shift_count_type bm = W_TYPE_SIZE - b;
80002b00:	02000793          	li	a5,32
80002b04:	40c787b3          	sub	a5,a5,a2
  if (bm <= 0)
80002b08:	00f04c63          	bgtz	a5,80002b20 <__lshrdi3+0x24>
      w.s.low = (UWtype) uu.s.high >> -bm;
80002b0c:	fe060613          	add	a2,a2,-32
80002b10:	00c5d533          	srl	a0,a1,a2
80002b14:	00000713          	li	a4,0
  return w.ll;
80002b18:	00070593          	mv	a1,a4
}
80002b1c:	00008067          	ret
      w.s.high = (UWtype) uu.s.high >> b;
80002b20:	00c5d733          	srl	a4,a1,a2
      w.s.low = ((UWtype) uu.s.low >> b) | carries;
80002b24:	00c55533          	srl	a0,a0,a2
      const UWtype carries = (UWtype) uu.s.high << bm;
80002b28:	00f595b3          	sll	a1,a1,a5
      w.s.low = ((UWtype) uu.s.low >> b) | carries;
80002b2c:	00b56533          	or	a0,a0,a1
80002b30:	fe9ff06f          	j	80002b18 <__lshrdi3+0x1c>

80002b34 <__ashldi3>:
  if (b == 0)
80002b34:	02060063          	beqz	a2,80002b54 <__ashldi3+0x20>
  const shift_count_type bm = W_TYPE_SIZE - b;
80002b38:	02000793          	li	a5,32
80002b3c:	40c787b3          	sub	a5,a5,a2
  if (bm <= 0)
80002b40:	00f04c63          	bgtz	a5,80002b58 <__ashldi3+0x24>
      w.s.high = (UWtype) uu.s.low << -bm;
80002b44:	fe060613          	add	a2,a2,-32
80002b48:	00c515b3          	sll	a1,a0,a2
80002b4c:	00000713          	li	a4,0
  return w.ll;
80002b50:	00070513          	mv	a0,a4
}
80002b54:	00008067          	ret
      w.s.low = (UWtype) uu.s.low << b;
80002b58:	00c51733          	sll	a4,a0,a2
      w.s.high = ((UWtype) uu.s.high << b) | carries;
80002b5c:	00c595b3          	sll	a1,a1,a2
      const UWtype carries = (UWtype) uu.s.low >> bm;
80002b60:	00f55533          	srl	a0,a0,a5
      w.s.high = ((UWtype) uu.s.high << b) | carries;
80002b64:	00a5e5b3          	or	a1,a1,a0
80002b68:	fe9ff06f          	j	80002b50 <__ashldi3+0x1c>

80002b6c <__clzsi2>:
  count_leading_zeros (ret, x);
80002b6c:	000107b7          	lui	a5,0x10
80002b70:	02f57a63          	bgeu	a0,a5,80002ba4 <__clzsi2+0x38>
80002b74:	10053793          	sltiu	a5,a0,256
80002b78:	0017b793          	seqz	a5,a5
80002b7c:	00379793          	sll	a5,a5,0x3
80002b80:	a0000737          	lui	a4,0xa0000
80002b84:	02000693          	li	a3,32
80002b88:	40f686b3          	sub	a3,a3,a5
80002b8c:	00f55533          	srl	a0,a0,a5
80002b90:	03c70793          	add	a5,a4,60 # a000003c <__clz_tab>
80002b94:	00a787b3          	add	a5,a5,a0
80002b98:	0007c503          	lbu	a0,0(a5) # 10000 <__stack_size+0xc000>
}
80002b9c:	40a68533          	sub	a0,a3,a0
80002ba0:	00008067          	ret
  count_leading_zeros (ret, x);
80002ba4:	01000737          	lui	a4,0x1000
80002ba8:	01800793          	li	a5,24
80002bac:	fce57ae3          	bgeu	a0,a4,80002b80 <__clzsi2+0x14>
80002bb0:	01000793          	li	a5,16
80002bb4:	fcdff06f          	j	80002b80 <__clzsi2+0x14>

80002bb8 <memset>:
80002bb8:	00f00313          	li	t1,15
80002bbc:	00050713          	mv	a4,a0
80002bc0:	02c37e63          	bgeu	t1,a2,80002bfc <memset+0x44>
80002bc4:	00f77793          	and	a5,a4,15
80002bc8:	0a079063          	bnez	a5,80002c68 <memset+0xb0>
80002bcc:	08059263          	bnez	a1,80002c50 <memset+0x98>
80002bd0:	ff067693          	and	a3,a2,-16
80002bd4:	00f67613          	and	a2,a2,15
80002bd8:	00e686b3          	add	a3,a3,a4
80002bdc:	00b72023          	sw	a1,0(a4) # 1000000 <__stack_size+0xffc000>
80002be0:	00b72223          	sw	a1,4(a4)
80002be4:	00b72423          	sw	a1,8(a4)
80002be8:	00b72623          	sw	a1,12(a4)
80002bec:	01070713          	add	a4,a4,16
80002bf0:	fed766e3          	bltu	a4,a3,80002bdc <memset+0x24>
80002bf4:	00061463          	bnez	a2,80002bfc <memset+0x44>
80002bf8:	00008067          	ret
80002bfc:	40c306b3          	sub	a3,t1,a2
80002c00:	00269693          	sll	a3,a3,0x2
80002c04:	00000297          	auipc	t0,0x0
80002c08:	005686b3          	add	a3,a3,t0
80002c0c:	00c68067          	jr	12(a3)
80002c10:	00b70723          	sb	a1,14(a4)
80002c14:	00b706a3          	sb	a1,13(a4)
80002c18:	00b70623          	sb	a1,12(a4)
80002c1c:	00b705a3          	sb	a1,11(a4)
80002c20:	00b70523          	sb	a1,10(a4)
80002c24:	00b704a3          	sb	a1,9(a4)
80002c28:	00b70423          	sb	a1,8(a4)
80002c2c:	00b703a3          	sb	a1,7(a4)
80002c30:	00b70323          	sb	a1,6(a4)
80002c34:	00b702a3          	sb	a1,5(a4)
80002c38:	00b70223          	sb	a1,4(a4)
80002c3c:	00b701a3          	sb	a1,3(a4)
80002c40:	00b70123          	sb	a1,2(a4)
80002c44:	00b700a3          	sb	a1,1(a4)
80002c48:	00b70023          	sb	a1,0(a4)
80002c4c:	00008067          	ret
80002c50:	0ff5f593          	zext.b	a1,a1
80002c54:	00859693          	sll	a3,a1,0x8
80002c58:	00d5e5b3          	or	a1,a1,a3
80002c5c:	01059693          	sll	a3,a1,0x10
80002c60:	00d5e5b3          	or	a1,a1,a3
80002c64:	f6dff06f          	j	80002bd0 <memset+0x18>
80002c68:	00279693          	sll	a3,a5,0x2
80002c6c:	00000297          	auipc	t0,0x0
80002c70:	005686b3          	add	a3,a3,t0
80002c74:	00008293          	mv	t0,ra
80002c78:	fa0680e7          	jalr	-96(a3)
80002c7c:	00028093          	mv	ra,t0
80002c80:	ff078793          	add	a5,a5,-16
80002c84:	40f70733          	sub	a4,a4,a5
80002c88:	00f60633          	add	a2,a2,a5
80002c8c:	f6c378e3          	bgeu	t1,a2,80002bfc <memset+0x44>
80002c90:	f3dff06f          	j	80002bcc <memset+0x14>

80002c94 <uart_init>:
80002c94:	00b52023          	sw	a1,0(a0)
80002c98:	00008067          	ret

80002c9c <uart_put_char>:
80002c9c:	00052783          	lw	a5,0(a0)
80002ca0:	00b7a023          	sw	a1,0(a5)
80002ca4:	00008067          	ret

80002ca8 <_out_null>:
80002ca8:	00008067          	ret

80002cac <_out_rev>:
80002cac:	fd010113          	add	sp,sp,-48
80002cb0:	02812423          	sw	s0,40(sp)
80002cb4:	01312e23          	sw	s3,28(sp)
80002cb8:	01412c23          	sw	s4,24(sp)
80002cbc:	01512a23          	sw	s5,20(sp)
80002cc0:	01612823          	sw	s6,16(sp)
80002cc4:	01712623          	sw	s7,12(sp)
80002cc8:	01812423          	sw	s8,8(sp)
80002ccc:	01912223          	sw	s9,4(sp)
80002cd0:	02112623          	sw	ra,44(sp)
80002cd4:	00088c93          	mv	s9,a7
80002cd8:	02912223          	sw	s1,36(sp)
80002cdc:	03212023          	sw	s2,32(sp)
80002ce0:	0038f893          	and	a7,a7,3
80002ce4:	00050993          	mv	s3,a0
80002ce8:	00058a13          	mv	s4,a1
80002cec:	00060b13          	mv	s6,a2
80002cf0:	00068a93          	mv	s5,a3
80002cf4:	00070b93          	mv	s7,a4
80002cf8:	00078413          	mv	s0,a5
80002cfc:	00080c13          	mv	s8,a6
80002d00:	0c089263          	bnez	a7,80002dc4 <_out_rev+0x118>
80002d04:	40f80933          	sub	s2,a6,a5
80002d08:	00c90933          	add	s2,s2,a2
80002d0c:	00060493          	mv	s1,a2
80002d10:	0d07f263          	bgeu	a5,a6,80002dd4 <_out_rev+0x128>
80002d14:	00048613          	mv	a2,s1
80002d18:	000a8693          	mv	a3,s5
80002d1c:	00148493          	add	s1,s1,1
80002d20:	000a0593          	mv	a1,s4
80002d24:	02000513          	li	a0,32
80002d28:	000980e7          	jalr	s3
80002d2c:	ff2494e3          	bne	s1,s2,80002d14 <_out_rev+0x68>
80002d30:	04040e63          	beqz	s0,80002d8c <_out_rev+0xe0>
80002d34:	00890933          	add	s2,s2,s0
80002d38:	40890633          	sub	a2,s2,s0
80002d3c:	fff40413          	add	s0,s0,-1
80002d40:	008b87b3          	add	a5,s7,s0
80002d44:	0007c503          	lbu	a0,0(a5)
80002d48:	000a8693          	mv	a3,s5
80002d4c:	000a0593          	mv	a1,s4
80002d50:	00090493          	mv	s1,s2
80002d54:	000980e7          	jalr	s3
80002d58:	fe0410e3          	bnez	s0,80002d38 <_out_rev+0x8c>
80002d5c:	002cfc93          	and	s9,s9,2
80002d60:	020c8663          	beqz	s9,80002d8c <_out_rev+0xe0>
80002d64:	41648b33          	sub	s6,s1,s6
80002d68:	038b7263          	bgeu	s6,s8,80002d8c <_out_rev+0xe0>
80002d6c:	00048613          	mv	a2,s1
80002d70:	000a8693          	mv	a3,s5
80002d74:	000a0593          	mv	a1,s4
80002d78:	02000513          	li	a0,32
80002d7c:	001b0b13          	add	s6,s6,1
80002d80:	00148493          	add	s1,s1,1
80002d84:	000980e7          	jalr	s3
80002d88:	ff8b62e3          	bltu	s6,s8,80002d6c <_out_rev+0xc0>
80002d8c:	02c12083          	lw	ra,44(sp)
80002d90:	02812403          	lw	s0,40(sp)
80002d94:	02012903          	lw	s2,32(sp)
80002d98:	01c12983          	lw	s3,28(sp)
80002d9c:	01812a03          	lw	s4,24(sp)
80002da0:	01412a83          	lw	s5,20(sp)
80002da4:	01012b03          	lw	s6,16(sp)
80002da8:	00c12b83          	lw	s7,12(sp)
80002dac:	00812c03          	lw	s8,8(sp)
80002db0:	00412c83          	lw	s9,4(sp)
80002db4:	00048513          	mv	a0,s1
80002db8:	02412483          	lw	s1,36(sp)
80002dbc:	03010113          	add	sp,sp,48
80002dc0:	00008067          	ret
80002dc4:	00060913          	mv	s2,a2
80002dc8:	00060493          	mv	s1,a2
80002dcc:	f60794e3          	bnez	a5,80002d34 <_out_rev+0x88>
80002dd0:	f8dff06f          	j	80002d5c <_out_rev+0xb0>
80002dd4:	00060913          	mv	s2,a2
80002dd8:	f4079ee3          	bnez	a5,80002d34 <_out_rev+0x88>
80002ddc:	fb1ff06f          	j	80002d8c <_out_rev+0xe0>

80002de0 <_ntoa_format>:
80002de0:	00812383          	lw	t2,8(sp)
80002de4:	00012283          	lw	t0,0(sp)
80002de8:	00412f83          	lw	t6,4(sp)
80002dec:	0023f313          	and	t1,t2,2
80002df0:	00080f13          	mv	t5,a6
80002df4:	06031463          	bnez	t1,80002e5c <_ntoa_format+0x7c>
80002df8:	100f9c63          	bnez	t6,80002f10 <_ntoa_format+0x130>
80002dfc:	0657f063          	bgeu	a5,t0,80002e5c <_ntoa_format+0x7c>
80002e00:	02000313          	li	t1,32
80002e04:	0013f813          	and	a6,t2,1
80002e08:	2e678063          	beq	a5,t1,800030e8 <_ntoa_format+0x308>
80002e0c:	03000e13          	li	t3,48
80002e10:	02000e93          	li	t4,32
80002e14:	0080006f          	j	80002e1c <_ntoa_format+0x3c>
80002e18:	15d78a63          	beq	a5,t4,80002f6c <_ntoa_format+0x18c>
80002e1c:	00178793          	add	a5,a5,1
80002e20:	00f70333          	add	t1,a4,a5
80002e24:	ffc30fa3          	sb	t3,-1(t1)
80002e28:	fe57e8e3          	bltu	a5,t0,80002e18 <_ntoa_format+0x38>
80002e2c:	02080863          	beqz	a6,80002e5c <_ntoa_format+0x7c>
80002e30:	03f7f663          	bgeu	a5,t6,80002e5c <_ntoa_format+0x7c>
80002e34:	02000813          	li	a6,32
80002e38:	03000e13          	li	t3,48
80002e3c:	02000e93          	li	t4,32
80002e40:	01079663          	bne	a5,a6,80002e4c <_ntoa_format+0x6c>
80002e44:	1300006f          	j	80002f74 <_ntoa_format+0x194>
80002e48:	07d78663          	beq	a5,t4,80002eb4 <_ntoa_format+0xd4>
80002e4c:	00178793          	add	a5,a5,1
80002e50:	00f70333          	add	t1,a4,a5
80002e54:	ffc30fa3          	sb	t3,-1(t1)
80002e58:	fff798e3          	bne	a5,t6,80002e48 <_ntoa_format+0x68>
80002e5c:	0103f813          	and	a6,t2,16
80002e60:	08080e63          	beqz	a6,80002efc <_ntoa_format+0x11c>
80002e64:	4003f813          	and	a6,t2,1024
80002e68:	06081463          	bnez	a6,80002ed0 <_ntoa_format+0xf0>
80002e6c:	04079e63          	bnez	a5,80002ec8 <_ntoa_format+0xe8>
80002e70:	01000793          	li	a5,16
80002e74:	22f88863          	beq	a7,a5,800030a4 <_ntoa_format+0x2c4>
80002e78:	00200793          	li	a5,2
80002e7c:	24f88663          	beq	a7,a5,800030c8 <_ntoa_format+0x2e8>
80002e80:	03000793          	li	a5,48
80002e84:	00f70023          	sb	a5,0(a4)
80002e88:	00100793          	li	a5,1
80002e8c:	100f1a63          	bnez	t5,80002fa0 <_ntoa_format+0x1c0>
80002e90:	0043f813          	and	a6,t2,4
80002e94:	1c080c63          	beqz	a6,8000306c <_ntoa_format+0x28c>
80002e98:	00f70833          	add	a6,a4,a5
80002e9c:	02b00893          	li	a7,43
80002ea0:	01180023          	sb	a7,0(a6)
80002ea4:	00178793          	add	a5,a5,1
80002ea8:	00038893          	mv	a7,t2
80002eac:	000f8813          	mv	a6,t6
80002eb0:	dfdff06f          	j	80002cac <_out_rev>
80002eb4:	0103f813          	and	a6,t2,16
80002eb8:	02000793          	li	a5,32
80002ebc:	fe0806e3          	beqz	a6,80002ea8 <_ntoa_format+0xc8>
80002ec0:	4003f813          	and	a6,t2,1024
80002ec4:	00081663          	bnez	a6,80002ed0 <_ntoa_format+0xf0>
80002ec8:	14f28263          	beq	t0,a5,8000300c <_ntoa_format+0x22c>
80002ecc:	15f78063          	beq	a5,t6,8000300c <_ntoa_format+0x22c>
80002ed0:	01000813          	li	a6,16
80002ed4:	17088a63          	beq	a7,a6,80003048 <_ntoa_format+0x268>
80002ed8:	00200813          	li	a6,2
80002edc:	11088a63          	beq	a7,a6,80002ff0 <_ntoa_format+0x210>
80002ee0:	02000813          	li	a6,32
80002ee4:	fd0782e3          	beq	a5,a6,80002ea8 <_ntoa_format+0xc8>
80002ee8:	00078813          	mv	a6,a5
80002eec:	00178793          	add	a5,a5,1
80002ef0:	01070833          	add	a6,a4,a6
80002ef4:	03000893          	li	a7,48
80002ef8:	01180023          	sb	a7,0(a6)
80002efc:	02000813          	li	a6,32
80002f00:	f90796e3          	bne	a5,a6,80002e8c <_ntoa_format+0xac>
80002f04:	00038893          	mv	a7,t2
80002f08:	000f8813          	mv	a6,t6
80002f0c:	da1ff06f          	j	80002cac <_out_rev>
80002f10:	0013f813          	and	a6,t2,1
80002f14:	0a080463          	beqz	a6,80002fbc <_ntoa_format+0x1dc>
80002f18:	120f1463          	bnez	t5,80003040 <_ntoa_format+0x260>
80002f1c:	00c3f313          	and	t1,t2,12
80002f20:	12031063          	bnez	t1,80003040 <_ntoa_format+0x260>
80002f24:	f057f6e3          	bgeu	a5,t0,80002e30 <_ntoa_format+0x50>
80002f28:	02000313          	li	t1,32
80002f2c:	ee6790e3          	bne	a5,t1,80002e0c <_ntoa_format+0x2c>
80002f30:	05f7e263          	bltu	a5,t6,80002f74 <_ntoa_format+0x194>
80002f34:	0103f813          	and	a6,t2,16
80002f38:	02000793          	li	a5,32
80002f3c:	f60806e3          	beqz	a6,80002ea8 <_ntoa_format+0xc8>
80002f40:	4003f813          	and	a6,t2,1024
80002f44:	04081663          	bnez	a6,80002f90 <_ntoa_format+0x1b0>
80002f48:	00f28463          	beq	t0,a5,80002f50 <_ntoa_format+0x170>
80002f4c:	f8ff92e3          	bne	t6,a5,80002ed0 <_ntoa_format+0xf0>
80002f50:	01f00813          	li	a6,31
80002f54:	01000313          	li	t1,16
80002f58:	18688c63          	beq	a7,t1,800030f0 <_ntoa_format+0x310>
80002f5c:	00200793          	li	a5,2
80002f60:	1af88863          	beq	a7,a5,80003110 <_ntoa_format+0x330>
80002f64:	00180793          	add	a5,a6,1
80002f68:	f89ff06f          	j	80002ef0 <_ntoa_format+0x110>
80002f6c:	1a080c63          	beqz	a6,80003124 <_ntoa_format+0x344>
80002f70:	f5f7f2e3          	bgeu	a5,t6,80002eb4 <_ntoa_format+0xd4>
80002f74:	0103f813          	and	a6,t2,16
80002f78:	02000793          	li	a5,32
80002f7c:	f20806e3          	beqz	a6,80002ea8 <_ntoa_format+0xc8>
80002f80:	4003f813          	and	a6,t2,1024
80002f84:	00081663          	bnez	a6,80002f90 <_ntoa_format+0x1b0>
80002f88:	fcf284e3          	beq	t0,a5,80002f50 <_ntoa_format+0x170>
80002f8c:	fcff82e3          	beq	t6,a5,80002f50 <_ntoa_format+0x170>
80002f90:	01000813          	li	a6,16
80002f94:	f1089ae3          	bne	a7,a6,80002ea8 <_ntoa_format+0xc8>
80002f98:	02000793          	li	a5,32
80002f9c:	f0dff06f          	j	80002ea8 <_ntoa_format+0xc8>
80002fa0:	00f70833          	add	a6,a4,a5
80002fa4:	02d00893          	li	a7,45
80002fa8:	01180023          	sb	a7,0(a6)
80002fac:	00178793          	add	a5,a5,1
80002fb0:	00038893          	mv	a7,t2
80002fb4:	000f8813          	mv	a6,t6
80002fb8:	cf5ff06f          	j	80002cac <_out_rev>
80002fbc:	ea57f0e3          	bgeu	a5,t0,80002e5c <_ntoa_format+0x7c>
80002fc0:	02000313          	li	t1,32
80002fc4:	e46794e3          	bne	a5,t1,80002e0c <_ntoa_format+0x2c>
80002fc8:	0103f793          	and	a5,t2,16
80002fcc:	fc0786e3          	beqz	a5,80002f98 <_ntoa_format+0x1b8>
80002fd0:	4003f793          	and	a5,t2,1024
80002fd4:	fc0792e3          	bnez	a5,80002f98 <_ntoa_format+0x1b8>
80002fd8:	02000793          	li	a5,32
80002fdc:	00f28463          	beq	t0,a5,80002fe4 <_ntoa_format+0x204>
80002fe0:	faff9ce3          	bne	t6,a5,80002f98 <_ntoa_format+0x1b8>
80002fe4:	02000793          	li	a5,32
80002fe8:	01f00813          	li	a6,31
80002fec:	f69ff06f          	j	80002f54 <_ntoa_format+0x174>
80002ff0:	02000813          	li	a6,32
80002ff4:	eb078ae3          	beq	a5,a6,80002ea8 <_ntoa_format+0xc8>
80002ff8:	00f70833          	add	a6,a4,a5
80002ffc:	06200893          	li	a7,98
80003000:	01180023          	sb	a7,0(a6)
80003004:	00178793          	add	a5,a5,1
80003008:	ed9ff06f          	j	80002ee0 <_ntoa_format+0x100>
8000300c:	fff78813          	add	a6,a5,-1
80003010:	f40812e3          	bnez	a6,80002f54 <_ntoa_format+0x174>
80003014:	01000793          	li	a5,16
80003018:	e6f890e3          	bne	a7,a5,80002e78 <_ntoa_format+0x98>
8000301c:	0203f793          	and	a5,t2,32
80003020:	0c078063          	beqz	a5,800030e0 <_ntoa_format+0x300>
80003024:	05800793          	li	a5,88
80003028:	00f70023          	sb	a5,0(a4)
8000302c:	03000793          	li	a5,48
80003030:	00f700a3          	sb	a5,1(a4)
80003034:	00200793          	li	a5,2
80003038:	e40f0ce3          	beqz	t5,80002e90 <_ntoa_format+0xb0>
8000303c:	f65ff06f          	j	80002fa0 <_ntoa_format+0x1c0>
80003040:	ffff8f93          	add	t6,t6,-1
80003044:	ee1ff06f          	j	80002f24 <_ntoa_format+0x144>
80003048:	0203f813          	and	a6,t2,32
8000304c:	02081e63          	bnez	a6,80003088 <_ntoa_format+0x2a8>
80003050:	02000813          	li	a6,32
80003054:	f50782e3          	beq	a5,a6,80002f98 <_ntoa_format+0x1b8>
80003058:	00f70833          	add	a6,a4,a5
8000305c:	07800893          	li	a7,120
80003060:	01180023          	sb	a7,0(a6)
80003064:	00178793          	add	a5,a5,1
80003068:	e79ff06f          	j	80002ee0 <_ntoa_format+0x100>
8000306c:	0083f813          	and	a6,t2,8
80003070:	e2080ce3          	beqz	a6,80002ea8 <_ntoa_format+0xc8>
80003074:	00f70833          	add	a6,a4,a5
80003078:	02000893          	li	a7,32
8000307c:	01180023          	sb	a7,0(a6)
80003080:	00178793          	add	a5,a5,1
80003084:	e25ff06f          	j	80002ea8 <_ntoa_format+0xc8>
80003088:	02000813          	li	a6,32
8000308c:	f10786e3          	beq	a5,a6,80002f98 <_ntoa_format+0x1b8>
80003090:	00f70833          	add	a6,a4,a5
80003094:	05800893          	li	a7,88
80003098:	01180023          	sb	a7,0(a6)
8000309c:	00178793          	add	a5,a5,1
800030a0:	e41ff06f          	j	80002ee0 <_ntoa_format+0x100>
800030a4:	0203f793          	and	a5,t2,32
800030a8:	02078c63          	beqz	a5,800030e0 <_ntoa_format+0x300>
800030ac:	05800793          	li	a5,88
800030b0:	00f70023          	sb	a5,0(a4)
800030b4:	03000793          	li	a5,48
800030b8:	00f700a3          	sb	a5,1(a4)
800030bc:	00200793          	li	a5,2
800030c0:	dc0f08e3          	beqz	t5,80002e90 <_ntoa_format+0xb0>
800030c4:	eddff06f          	j	80002fa0 <_ntoa_format+0x1c0>
800030c8:	06200793          	li	a5,98
800030cc:	00f70023          	sb	a5,0(a4)
800030d0:	03000793          	li	a5,48
800030d4:	00f700a3          	sb	a5,1(a4)
800030d8:	00200793          	li	a5,2
800030dc:	f5dff06f          	j	80003038 <_ntoa_format+0x258>
800030e0:	07800793          	li	a5,120
800030e4:	fe9ff06f          	j	800030cc <_ntoa_format+0x2ec>
800030e8:	e40816e3          	bnez	a6,80002f34 <_ntoa_format+0x154>
800030ec:	eddff06f          	j	80002fc8 <_ntoa_format+0x1e8>
800030f0:	ffe78813          	add	a6,a5,-2
800030f4:	0203f893          	and	a7,t2,32
800030f8:	01070833          	add	a6,a4,a6
800030fc:	fff78793          	add	a5,a5,-1
80003100:	00089c63          	bnez	a7,80003118 <_ntoa_format+0x338>
80003104:	07800893          	li	a7,120
80003108:	01180023          	sb	a7,0(a6)
8000310c:	dddff06f          	j	80002ee8 <_ntoa_format+0x108>
80003110:	00080793          	mv	a5,a6
80003114:	ee5ff06f          	j	80002ff8 <_ntoa_format+0x218>
80003118:	05800893          	li	a7,88
8000311c:	01180023          	sb	a7,0(a6)
80003120:	dc9ff06f          	j	80002ee8 <_ntoa_format+0x108>
80003124:	0103f813          	and	a6,t2,16
80003128:	d80800e3          	beqz	a6,80002ea8 <_ntoa_format+0xc8>
8000312c:	4003f813          	and	a6,t2,1024
80003130:	e60810e3          	bnez	a6,80002f90 <_ntoa_format+0x1b0>
80003134:	d9f79ee3          	bne	a5,t6,80002ed0 <_ntoa_format+0xf0>
80003138:	ed5ff06f          	j	8000300c <_ntoa_format+0x22c>

8000313c <_ntoa_long>:
8000313c:	fc010113          	add	sp,sp,-64
80003140:	02812c23          	sw	s0,56(sp)
80003144:	02112e23          	sw	ra,60(sp)
80003148:	00080e93          	mv	t4,a6
8000314c:	04412403          	lw	s0,68(sp)
80003150:	00070e13          	mv	t3,a4
80003154:	00078813          	mv	a6,a5
80003158:	00071863          	bnez	a4,80003168 <_ntoa_long+0x2c>
8000315c:	40047793          	and	a5,s0,1024
80003160:	fef47413          	and	s0,s0,-17
80003164:	08079a63          	bnez	a5,800031f8 <_ntoa_long+0xbc>
80003168:	00545713          	srl	a4,s0,0x5
8000316c:	00177713          	and	a4,a4,1
80003170:	06100293          	li	t0,97
80003174:	06071e63          	bnez	a4,800031f0 <_ntoa_long+0xb4>
80003178:	00000793          	li	a5,0
8000317c:	01010713          	add	a4,sp,16
80003180:	00900393          	li	t2,9
80003184:	ff628293          	add	t0,t0,-10 # 80002c62 <memset+0xaa>
80003188:	02000093          	li	ra,32
8000318c:	00c0006f          	j	80003198 <_ntoa_long+0x5c>
80003190:	02178c63          	beq	a5,ra,800031c8 <_ntoa_long+0x8c>
80003194:	00030e13          	mv	t3,t1
80003198:	03de7f33          	remu	t5,t3,t4
8000319c:	0fff7313          	zext.b	t1,t5
800031a0:	03030f93          	add	t6,t1,48
800031a4:	00530333          	add	t1,t1,t0
800031a8:	0ff37313          	zext.b	t1,t1
800031ac:	01e3e463          	bltu	t2,t5,800031b4 <_ntoa_long+0x78>
800031b0:	0ffff313          	zext.b	t1,t6
800031b4:	00178793          	add	a5,a5,1
800031b8:	00f70f33          	add	t5,a4,a5
800031bc:	fe6f0fa3          	sb	t1,-1(t5)
800031c0:	03de5333          	divu	t1,t3,t4
800031c4:	fdde76e3          	bgeu	t3,t4,80003190 <_ntoa_long+0x54>
800031c8:	04012303          	lw	t1,64(sp)
800031cc:	00812423          	sw	s0,8(sp)
800031d0:	01112023          	sw	a7,0(sp)
800031d4:	00612223          	sw	t1,4(sp)
800031d8:	000e8893          	mv	a7,t4
800031dc:	c05ff0ef          	jal	80002de0 <_ntoa_format>
800031e0:	03c12083          	lw	ra,60(sp)
800031e4:	03812403          	lw	s0,56(sp)
800031e8:	04010113          	add	sp,sp,64
800031ec:	00008067          	ret
800031f0:	04100293          	li	t0,65
800031f4:	f85ff06f          	j	80003178 <_ntoa_long+0x3c>
800031f8:	00000793          	li	a5,0
800031fc:	01010713          	add	a4,sp,16
80003200:	fc9ff06f          	j	800031c8 <_ntoa_long+0x8c>

80003204 <_ntoa_long_long>:
80003204:	f7010113          	add	sp,sp,-144
80003208:	06812c23          	sw	s0,120(sp)
8000320c:	06912a23          	sw	s1,116(sp)
80003210:	07612023          	sw	s6,96(sp)
80003214:	05812c23          	sw	s8,88(sp)
80003218:	05912a23          	sw	s9,84(sp)
8000321c:	05a12823          	sw	s10,80(sp)
80003220:	05b12623          	sw	s11,76(sp)
80003224:	00078c13          	mv	s8,a5
80003228:	06112e23          	sw	ra,124(sp)
8000322c:	07312623          	sw	s3,108(sp)
80003230:	05712e23          	sw	s7,92(sp)
80003234:	09112623          	sw	a7,140(sp)
80003238:	00f767b3          	or	a5,a4,a5
8000323c:	00a12a23          	sw	a0,20(sp)
80003240:	00b12c23          	sw	a1,24(sp)
80003244:	00c12e23          	sw	a2,28(sp)
80003248:	09012c83          	lw	s9,144(sp)
8000324c:	09c12b03          	lw	s6,156(sp)
80003250:	00070413          	mv	s0,a4
80003254:	00068d13          	mv	s10,a3
80003258:	00080d93          	mv	s11,a6
8000325c:	00088493          	mv	s1,a7
80003260:	00079863          	bnez	a5,80003270 <_ntoa_long_long+0x6c>
80003264:	400b7793          	and	a5,s6,1024
80003268:	fefb7b13          	and	s6,s6,-17
8000326c:	10079c63          	bnez	a5,80003384 <_ntoa_long_long+0x180>
80003270:	005b5793          	srl	a5,s6,0x5
80003274:	07212823          	sw	s2,112(sp)
80003278:	07412423          	sw	s4,104(sp)
8000327c:	07512223          	sw	s5,100(sp)
80003280:	0017f793          	and	a5,a5,1
80003284:	06100913          	li	s2,97
80003288:	0e079a63          	bnez	a5,8000337c <_ntoa_long_long+0x178>
8000328c:	00000b93          	li	s7,0
80003290:	02010993          	add	s3,sp,32
80003294:	00900a13          	li	s4,9
80003298:	ff690913          	add	s2,s2,-10
8000329c:	02000a93          	li	s5,32
800032a0:	000c8693          	mv	a3,s9
800032a4:	00048613          	mv	a2,s1
800032a8:	00040513          	mv	a0,s0
800032ac:	000c0593          	mv	a1,s8
800032b0:	a48fd0ef          	jal	800004f8 <__umoddi3>
800032b4:	0ff57513          	zext.b	a0,a0
800032b8:	01250833          	add	a6,a0,s2
800032bc:	03050693          	add	a3,a0,48
800032c0:	0ff87813          	zext.b	a6,a6
800032c4:	00aa6463          	bltu	s4,a0,800032cc <_ntoa_long_long+0xc8>
800032c8:	0ff6f813          	zext.b	a6,a3
800032cc:	001b8b93          	add	s7,s7,1
800032d0:	017988b3          	add	a7,s3,s7
800032d4:	00048613          	mv	a2,s1
800032d8:	000c8693          	mv	a3,s9
800032dc:	00040513          	mv	a0,s0
800032e0:	000c0593          	mv	a1,s8
800032e4:	ff088fa3          	sb	a6,-1(a7) # ffff <__stack_size+0xbfff>
800032e8:	de1fc0ef          	jal	800000c8 <__udivdi3>
800032ec:	019c6e63          	bltu	s8,s9,80003308 <_ntoa_long_long+0x104>
800032f0:	018c8a63          	beq	s9,s8,80003304 <_ntoa_long_long+0x100>
800032f4:	015b8a63          	beq	s7,s5,80003308 <_ntoa_long_long+0x104>
800032f8:	00050413          	mv	s0,a0
800032fc:	00058c13          	mv	s8,a1
80003300:	fa1ff06f          	j	800032a0 <_ntoa_long_long+0x9c>
80003304:	fe9478e3          	bgeu	s0,s1,800032f4 <_ntoa_long_long+0xf0>
80003308:	07012903          	lw	s2,112(sp)
8000330c:	06812a03          	lw	s4,104(sp)
80003310:	06412a83          	lw	s5,100(sp)
80003314:	09812703          	lw	a4,152(sp)
80003318:	01c12603          	lw	a2,28(sp)
8000331c:	01812583          	lw	a1,24(sp)
80003320:	00e12223          	sw	a4,4(sp)
80003324:	09412703          	lw	a4,148(sp)
80003328:	01412503          	lw	a0,20(sp)
8000332c:	01612423          	sw	s6,8(sp)
80003330:	00e12023          	sw	a4,0(sp)
80003334:	00048893          	mv	a7,s1
80003338:	000d8813          	mv	a6,s11
8000333c:	000b8793          	mv	a5,s7
80003340:	00098713          	mv	a4,s3
80003344:	000d0693          	mv	a3,s10
80003348:	a99ff0ef          	jal	80002de0 <_ntoa_format>
8000334c:	07c12083          	lw	ra,124(sp)
80003350:	07812403          	lw	s0,120(sp)
80003354:	07412483          	lw	s1,116(sp)
80003358:	06c12983          	lw	s3,108(sp)
8000335c:	06012b03          	lw	s6,96(sp)
80003360:	05c12b83          	lw	s7,92(sp)
80003364:	05812c03          	lw	s8,88(sp)
80003368:	05412c83          	lw	s9,84(sp)
8000336c:	05012d03          	lw	s10,80(sp)
80003370:	04c12d83          	lw	s11,76(sp)
80003374:	09010113          	add	sp,sp,144
80003378:	00008067          	ret
8000337c:	04100913          	li	s2,65
80003380:	f0dff06f          	j	8000328c <_ntoa_long_long+0x88>
80003384:	00000b93          	li	s7,0
80003388:	02010993          	add	s3,sp,32
8000338c:	f89ff06f          	j	80003314 <_ntoa_long_long+0x110>

80003390 <_etoa>:
80003390:	f8010113          	add	sp,sp,-128
80003394:	07212823          	sw	s2,112(sp)
80003398:	07312623          	sw	s3,108(sp)
8000339c:	07412423          	sw	s4,104(sp)
800033a0:	07512223          	sw	s5,100(sp)
800033a4:	00050993          	mv	s3,a0
800033a8:	00058a13          	mv	s4,a1
800033ac:	00060913          	mv	s2,a2
800033b0:	00068a93          	mv	s5,a3
800033b4:	00070613          	mv	a2,a4
800033b8:	00078693          	mv	a3,a5
800033bc:	00070513          	mv	a0,a4
800033c0:	00078593          	mv	a1,a5
800033c4:	06812c23          	sw	s0,120(sp)
800033c8:	06912a23          	sw	s1,116(sp)
800033cc:	07612023          	sw	s6,96(sp)
800033d0:	05812c23          	sw	s8,88(sp)
800033d4:	05912a23          	sw	s9,84(sp)
800033d8:	06112e23          	sw	ra,124(sp)
800033dc:	08012c83          	lw	s9,128(sp)
800033e0:	00070413          	mv	s0,a4
800033e4:	00078493          	mv	s1,a5
800033e8:	00080c13          	mv	s8,a6
800033ec:	00088b13          	mv	s6,a7
800033f0:	b5cfe0ef          	jal	8000174c <__eqdf2>
800033f4:	4e051c63          	bnez	a0,800038ec <_etoa+0x55c>
800033f8:	a00016b7          	lui	a3,0xa0001
800033fc:	8406a603          	lw	a2,-1984(a3) # a0000840 <intpat+0x2c>
80003400:	8446a683          	lw	a3,-1980(a3)
80003404:	00040513          	mv	a0,s0
80003408:	00048593          	mv	a1,s1
8000340c:	bccfe0ef          	jal	800017d8 <__gedf2>
80003410:	4ca04e63          	bgtz	a0,800038ec <_etoa+0x55c>
80003414:	a00016b7          	lui	a3,0xa0001
80003418:	8486a603          	lw	a2,-1976(a3) # a0000848 <intpat+0x34>
8000341c:	84c6a683          	lw	a3,-1972(a3)
80003420:	00040513          	mv	a0,s0
80003424:	00048593          	mv	a1,s1
80003428:	c8cfe0ef          	jal	800018b4 <__ledf2>
8000342c:	4c054063          	bltz	a0,800038ec <_etoa+0x55c>
80003430:	00040513          	mv	a0,s0
80003434:	00048593          	mv	a1,s1
80003438:	00000613          	li	a2,0
8000343c:	00000693          	li	a3,0
80003440:	05712e23          	sw	s7,92(sp)
80003444:	05a12823          	sw	s10,80(sp)
80003448:	05b12623          	sw	s11,76(sp)
8000344c:	80000bb7          	lui	s7,0x80000
80003450:	c64fe0ef          	jal	800018b4 <__ledf2>
80003454:	02812223          	sw	s0,36(sp)
80003458:	009bcbb3          	xor	s7,s7,s1
8000345c:	00054463          	bltz	a0,80003464 <_etoa+0xd4>
80003460:	00048b93          	mv	s7,s1
80003464:	400cf793          	and	a5,s9,1024
80003468:	02f12e23          	sw	a5,60(sp)
8000346c:	00079463          	bnez	a5,80003474 <_etoa+0xe4>
80003470:	00600c13          	li	s8,6
80003474:	014bd513          	srl	a0,s7,0x14
80003478:	7ff57513          	and	a0,a0,2047
8000347c:	c0150513          	add	a0,a0,-1023
80003480:	ba4ff0ef          	jal	80002824 <__floatsidf>
80003484:	a00017b7          	lui	a5,0xa0001
80003488:	8507a603          	lw	a2,-1968(a5) # a0000850 <intpat+0x3c>
8000348c:	8547a683          	lw	a3,-1964(a5)
80003490:	d00fe0ef          	jal	80001990 <__muldf3>
80003494:	a00017b7          	lui	a5,0xa0001
80003498:	8587a603          	lw	a2,-1960(a5) # a0000858 <intpat+0x44>
8000349c:	85c7a683          	lw	a3,-1956(a5)
800034a0:	c3cfd0ef          	jal	800008dc <__adddf3>
800034a4:	00cb9693          	sll	a3,s7,0xc
800034a8:	00c6d693          	srl	a3,a3,0xc
800034ac:	3ff007b7          	lui	a5,0x3ff00
800034b0:	00d7e7b3          	or	a5,a5,a3
800034b4:	a00016b7          	lui	a3,0xa0001
800034b8:	8606a603          	lw	a2,-1952(a3) # a0000860 <intpat+0x4c>
800034bc:	8646a683          	lw	a3,-1948(a3)
800034c0:	00050d93          	mv	s11,a0
800034c4:	00058d13          	mv	s10,a1
800034c8:	00040513          	mv	a0,s0
800034cc:	00078593          	mv	a1,a5
800034d0:	ab1fe0ef          	jal	80001f80 <__subdf3>
800034d4:	a00017b7          	lui	a5,0xa0001
800034d8:	8687a603          	lw	a2,-1944(a5) # a0000868 <intpat+0x54>
800034dc:	86c7a683          	lw	a3,-1940(a5)
800034e0:	cb0fe0ef          	jal	80001990 <__muldf3>
800034e4:	00050613          	mv	a2,a0
800034e8:	00058693          	mv	a3,a1
800034ec:	000d8513          	mv	a0,s11
800034f0:	000d0593          	mv	a1,s10
800034f4:	be8fd0ef          	jal	800008dc <__adddf3>
800034f8:	a30ff0ef          	jal	80002728 <__fixdfsi>
800034fc:	00050d13          	mv	s10,a0
80003500:	b24ff0ef          	jal	80002824 <__floatsidf>
80003504:	a00017b7          	lui	a5,0xa0001
80003508:	8707a603          	lw	a2,-1936(a5) # a0000870 <intpat+0x5c>
8000350c:	8747a683          	lw	a3,-1932(a5)
80003510:	00058d93          	mv	s11,a1
80003514:	00a12c23          	sw	a0,24(sp)
80003518:	c78fe0ef          	jal	80001990 <__muldf3>
8000351c:	a0001737          	lui	a4,0xa0001
80003520:	87872603          	lw	a2,-1928(a4) # a0000878 <intpat+0x64>
80003524:	87c72683          	lw	a3,-1924(a4)
80003528:	bb4fd0ef          	jal	800008dc <__adddf3>
8000352c:	9fcff0ef          	jal	80002728 <__fixdfsi>
80003530:	01812783          	lw	a5,24(sp)
80003534:	a00016b7          	lui	a3,0xa0001
80003538:	8806a603          	lw	a2,-1920(a3) # a0000880 <intpat+0x6c>
8000353c:	8846a683          	lw	a3,-1916(a3)
80003540:	00050713          	mv	a4,a0
80003544:	000d8593          	mv	a1,s11
80003548:	00078513          	mv	a0,a5
8000354c:	00070d93          	mv	s11,a4
80003550:	c40fe0ef          	jal	80001990 <__muldf3>
80003554:	00050793          	mv	a5,a0
80003558:	000d8513          	mv	a0,s11
8000355c:	00f12c23          	sw	a5,24(sp)
80003560:	03b12423          	sw	s11,40(sp)
80003564:	00058d93          	mv	s11,a1
80003568:	abcff0ef          	jal	80002824 <__floatsidf>
8000356c:	a0001737          	lui	a4,0xa0001
80003570:	88872603          	lw	a2,-1912(a4) # a0000888 <intpat+0x74>
80003574:	88c72683          	lw	a3,-1908(a4)
80003578:	c18fe0ef          	jal	80001990 <__muldf3>
8000357c:	01812783          	lw	a5,24(sp)
80003580:	00050613          	mv	a2,a0
80003584:	00058693          	mv	a3,a1
80003588:	00078513          	mv	a0,a5
8000358c:	000d8593          	mv	a1,s11
80003590:	9f1fe0ef          	jal	80001f80 <__subdf3>
80003594:	00050613          	mv	a2,a0
80003598:	00058693          	mv	a3,a1
8000359c:	02a12623          	sw	a0,44(sp)
800035a0:	00b12c23          	sw	a1,24(sp)
800035a4:	becfe0ef          	jal	80001990 <__muldf3>
800035a8:	01812783          	lw	a5,24(sp)
800035ac:	02c12703          	lw	a4,44(sp)
800035b0:	00050d93          	mv	s11,a0
800035b4:	00078693          	mv	a3,a5
800035b8:	00070613          	mv	a2,a4
800035bc:	00070513          	mv	a0,a4
800035c0:	00058813          	mv	a6,a1
800035c4:	00078593          	mv	a1,a5
800035c8:	02e12c23          	sw	a4,56(sp)
800035cc:	02f12a23          	sw	a5,52(sp)
800035d0:	01012c23          	sw	a6,24(sp)
800035d4:	b08fd0ef          	jal	800008dc <__adddf3>
800035d8:	a00016b7          	lui	a3,0xa0001
800035dc:	00058893          	mv	a7,a1
800035e0:	8906a603          	lw	a2,-1904(a3) # a0000890 <intpat+0x7c>
800035e4:	01812583          	lw	a1,24(sp)
800035e8:	8946a683          	lw	a3,-1900(a3)
800035ec:	00050313          	mv	t1,a0
800035f0:	000d8513          	mv	a0,s11
800035f4:	02612823          	sw	t1,48(sp)
800035f8:	03112623          	sw	a7,44(sp)
800035fc:	a75fd0ef          	jal	80001070 <__divdf3>
80003600:	a0001837          	lui	a6,0xa0001
80003604:	89882603          	lw	a2,-1896(a6) # a0000898 <intpat+0x84>
80003608:	89c82683          	lw	a3,-1892(a6)
8000360c:	ad0fd0ef          	jal	800008dc <__adddf3>
80003610:	00058693          	mv	a3,a1
80003614:	01812583          	lw	a1,24(sp)
80003618:	00050613          	mv	a2,a0
8000361c:	000d8513          	mv	a0,s11
80003620:	a51fd0ef          	jal	80001070 <__divdf3>
80003624:	a00016b7          	lui	a3,0xa0001
80003628:	8a06a603          	lw	a2,-1888(a3) # a00008a0 <intpat+0x8c>
8000362c:	8a46a683          	lw	a3,-1884(a3)
80003630:	aacfd0ef          	jal	800008dc <__adddf3>
80003634:	00058693          	mv	a3,a1
80003638:	01812583          	lw	a1,24(sp)
8000363c:	00050613          	mv	a2,a0
80003640:	000d8513          	mv	a0,s11
80003644:	a2dfd0ef          	jal	80001070 <__divdf3>
80003648:	03812703          	lw	a4,56(sp)
8000364c:	03412783          	lw	a5,52(sp)
80003650:	a00016b7          	lui	a3,0xa0001
80003654:	00050e13          	mv	t3,a0
80003658:	00058d93          	mv	s11,a1
8000365c:	8a86a503          	lw	a0,-1880(a3) # a00008a8 <intpat+0x94>
80003660:	8ac6a583          	lw	a1,-1876(a3)
80003664:	00070613          	mv	a2,a4
80003668:	00078693          	mv	a3,a5
8000366c:	01c12c23          	sw	t3,24(sp)
80003670:	911fe0ef          	jal	80001f80 <__subdf3>
80003674:	01812e03          	lw	t3,24(sp)
80003678:	00050613          	mv	a2,a0
8000367c:	00058693          	mv	a3,a1
80003680:	000e0513          	mv	a0,t3
80003684:	000d8593          	mv	a1,s11
80003688:	a54fd0ef          	jal	800008dc <__adddf3>
8000368c:	03012303          	lw	t1,48(sp)
80003690:	02c12883          	lw	a7,44(sp)
80003694:	00050613          	mv	a2,a0
80003698:	00058693          	mv	a3,a1
8000369c:	00030513          	mv	a0,t1
800036a0:	00088593          	mv	a1,a7
800036a4:	9cdfd0ef          	jal	80001070 <__divdf3>
800036a8:	a00017b7          	lui	a5,0xa0001
800036ac:	8b07a603          	lw	a2,-1872(a5) # a00008b0 <intpat+0x9c>
800036b0:	8b47a683          	lw	a3,-1868(a5)
800036b4:	a28fd0ef          	jal	800008dc <__adddf3>
800036b8:	02812783          	lw	a5,40(sp)
800036bc:	00000613          	li	a2,0
800036c0:	3ff78793          	add	a5,a5,1023
800036c4:	01479793          	sll	a5,a5,0x14
800036c8:	00078693          	mv	a3,a5
800036cc:	ac4fe0ef          	jal	80001990 <__muldf3>
800036d0:	00040613          	mv	a2,s0
800036d4:	000b8693          	mv	a3,s7
800036d8:	00050d93          	mv	s11,a0
800036dc:	00b12c23          	sw	a1,24(sp)
800036e0:	8f8fe0ef          	jal	800017d8 <__gedf2>
800036e4:	a0001837          	lui	a6,0xa0001
800036e8:	24a04c63          	bgtz	a0,80003940 <_etoa+0x5b0>
800036ec:	01812783          	lw	a5,24(sp)
800036f0:	000d8713          	mv	a4,s11
800036f4:	0c600693          	li	a3,198
800036f8:	063d0d93          	add	s11,s10,99
800036fc:	01b6bdb3          	sltu	s11,a3,s11
80003700:	014c9693          	sll	a3,s9,0x14
80003704:	004d8d93          	add	s11,s11,4
80003708:	0606d263          	bgez	a3,8000376c <_etoa+0x3dc>
8000370c:	a00016b7          	lui	a3,0xa0001
80003710:	8b86a603          	lw	a2,-1864(a3) # a00008b8 <intpat+0xa4>
80003714:	8bc6a683          	lw	a3,-1860(a3)
80003718:	00040513          	mv	a0,s0
8000371c:	000b8593          	mv	a1,s7
80003720:	00e12c23          	sw	a4,24(sp)
80003724:	00f12e23          	sw	a5,28(sp)
80003728:	8b0fe0ef          	jal	800017d8 <__gedf2>
8000372c:	01812703          	lw	a4,24(sp)
80003730:	01c12783          	lw	a5,28(sp)
80003734:	02054463          	bltz	a0,8000375c <_etoa+0x3cc>
80003738:	a00016b7          	lui	a3,0xa0001
8000373c:	8c06a603          	lw	a2,-1856(a3) # a00008c0 <intpat+0xac>
80003740:	8c46a683          	lw	a3,-1852(a3)
80003744:	00040513          	mv	a0,s0
80003748:	000b8593          	mv	a1,s7
8000374c:	968fe0ef          	jal	800018b4 <__ledf2>
80003750:	01812703          	lw	a4,24(sp)
80003754:	01c12783          	lw	a5,28(sp)
80003758:	20054663          	bltz	a0,80003964 <_etoa+0x5d4>
8000375c:	000c0863          	beqz	s8,8000376c <_etoa+0x3dc>
80003760:	03c12683          	lw	a3,60(sp)
80003764:	00d036b3          	snez	a3,a3
80003768:	40dc0c33          	sub	s8,s8,a3
8000376c:	00000893          	li	a7,0
80003770:	016df463          	bgeu	s11,s6,80003778 <_etoa+0x3e8>
80003774:	41bb08b3          	sub	a7,s6,s11
80003778:	002cf693          	and	a3,s9,2
8000377c:	02d12423          	sw	a3,40(sp)
80003780:	00068863          	beqz	a3,80003790 <_etoa+0x400>
80003784:	001db693          	seqz	a3,s11
80003788:	40d006b3          	neg	a3,a3
8000378c:	00d8f8b3          	and	a7,a7,a3
80003790:	020d0463          	beqz	s10,800037b8 <_etoa+0x428>
80003794:	000b8593          	mv	a1,s7
80003798:	00040513          	mv	a0,s0
8000379c:	00070613          	mv	a2,a4
800037a0:	00078693          	mv	a3,a5
800037a4:	01112c23          	sw	a7,24(sp)
800037a8:	8c9fd0ef          	jal	80001070 <__divdf3>
800037ac:	01812883          	lw	a7,24(sp)
800037b0:	02a12223          	sw	a0,36(sp)
800037b4:	00058b93          	mv	s7,a1
800037b8:	00040513          	mv	a0,s0
800037bc:	00048593          	mv	a1,s1
800037c0:	00000613          	li	a2,0
800037c4:	00000693          	li	a3,0
800037c8:	01112c23          	sw	a7,24(sp)
800037cc:	8e8fe0ef          	jal	800018b4 <__ledf2>
800037d0:	01812883          	lw	a7,24(sp)
800037d4:	00055663          	bgez	a0,800037e0 <_etoa+0x450>
800037d8:	800007b7          	lui	a5,0x80000
800037dc:	0177cbb3          	xor	s7,a5,s7
800037e0:	02412683          	lw	a3,36(sp)
800037e4:	fffff7b7          	lui	a5,0xfffff
800037e8:	7ff78793          	add	a5,a5,2047 # fffff7ff <__stack_base+0x3ffff7ff>
800037ec:	00fcf7b3          	and	a5,s9,a5
800037f0:	00f12023          	sw	a5,0(sp)
800037f4:	00068713          	mv	a4,a3
800037f8:	000c0813          	mv	a6,s8
800037fc:	000b8793          	mv	a5,s7
80003800:	000a8693          	mv	a3,s5
80003804:	00090613          	mv	a2,s2
80003808:	000a0593          	mv	a1,s4
8000380c:	00098513          	mv	a0,s3
80003810:	178000ef          	jal	80003988 <_ftoa>
80003814:	00050413          	mv	s0,a0
80003818:	080d8a63          	beqz	s11,800038ac <_etoa+0x51c>
8000381c:	fffcc513          	not	a0,s9
80003820:	02057513          	and	a0,a0,32
80003824:	00040613          	mv	a2,s0
80003828:	000a8693          	mv	a3,s5
8000382c:	000a0593          	mv	a1,s4
80003830:	04550513          	add	a0,a0,69
80003834:	000980e7          	jalr	s3
80003838:	41fd5713          	sra	a4,s10,0x1f
8000383c:	00140413          	add	s0,s0,1
80003840:	01a746b3          	xor	a3,a4,s10
80003844:	00500793          	li	a5,5
80003848:	fffd8d93          	add	s11,s11,-1
8000384c:	00f12223          	sw	a5,4(sp)
80003850:	40e68733          	sub	a4,a3,a4
80003854:	01fd5793          	srl	a5,s10,0x1f
80003858:	00040613          	mv	a2,s0
8000385c:	01b12023          	sw	s11,0(sp)
80003860:	00000893          	li	a7,0
80003864:	00a00813          	li	a6,10
80003868:	000a8693          	mv	a3,s5
8000386c:	000a0593          	mv	a1,s4
80003870:	00098513          	mv	a0,s3
80003874:	8c9ff0ef          	jal	8000313c <_ntoa_long>
80003878:	02812783          	lw	a5,40(sp)
8000387c:	00050413          	mv	s0,a0
80003880:	02078663          	beqz	a5,800038ac <_etoa+0x51c>
80003884:	41250933          	sub	s2,a0,s2
80003888:	03697263          	bgeu	s2,s6,800038ac <_etoa+0x51c>
8000388c:	00040613          	mv	a2,s0
80003890:	000a8693          	mv	a3,s5
80003894:	000a0593          	mv	a1,s4
80003898:	02000513          	li	a0,32
8000389c:	00190913          	add	s2,s2,1
800038a0:	00140413          	add	s0,s0,1
800038a4:	000980e7          	jalr	s3
800038a8:	ff6962e3          	bltu	s2,s6,8000388c <_etoa+0x4fc>
800038ac:	07c12083          	lw	ra,124(sp)
800038b0:	00040513          	mv	a0,s0
800038b4:	07812403          	lw	s0,120(sp)
800038b8:	05c12b83          	lw	s7,92(sp)
800038bc:	05012d03          	lw	s10,80(sp)
800038c0:	04c12d83          	lw	s11,76(sp)
800038c4:	07412483          	lw	s1,116(sp)
800038c8:	07012903          	lw	s2,112(sp)
800038cc:	06c12983          	lw	s3,108(sp)
800038d0:	06812a03          	lw	s4,104(sp)
800038d4:	06412a83          	lw	s5,100(sp)
800038d8:	06012b03          	lw	s6,96(sp)
800038dc:	05812c03          	lw	s8,88(sp)
800038e0:	05412c83          	lw	s9,84(sp)
800038e4:	08010113          	add	sp,sp,128
800038e8:	00008067          	ret
800038ec:	00040713          	mv	a4,s0
800038f0:	07812403          	lw	s0,120(sp)
800038f4:	09912023          	sw	s9,128(sp)
800038f8:	07c12083          	lw	ra,124(sp)
800038fc:	05412c83          	lw	s9,84(sp)
80003900:	00048793          	mv	a5,s1
80003904:	000b0893          	mv	a7,s6
80003908:	07412483          	lw	s1,116(sp)
8000390c:	06012b03          	lw	s6,96(sp)
80003910:	000c0813          	mv	a6,s8
80003914:	000a8693          	mv	a3,s5
80003918:	05812c03          	lw	s8,88(sp)
8000391c:	06412a83          	lw	s5,100(sp)
80003920:	00090613          	mv	a2,s2
80003924:	000a0593          	mv	a1,s4
80003928:	07012903          	lw	s2,112(sp)
8000392c:	06812a03          	lw	s4,104(sp)
80003930:	00098513          	mv	a0,s3
80003934:	06c12983          	lw	s3,108(sp)
80003938:	08010113          	add	sp,sp,128
8000393c:	04c0006f          	j	80003988 <_ftoa>
80003940:	89882603          	lw	a2,-1896(a6) # a0000898 <intpat+0x84>
80003944:	89c82683          	lw	a3,-1892(a6)
80003948:	01812583          	lw	a1,24(sp)
8000394c:	000d8513          	mv	a0,s11
80003950:	fffd0d13          	add	s10,s10,-1
80003954:	f1cfd0ef          	jal	80001070 <__divdf3>
80003958:	00050713          	mv	a4,a0
8000395c:	00058793          	mv	a5,a1
80003960:	d95ff06f          	j	800036f4 <_etoa+0x364>
80003964:	018d5e63          	bge	s10,s8,80003980 <_etoa+0x5f0>
80003968:	41ac0d33          	sub	s10,s8,s10
8000396c:	fffd0c13          	add	s8,s10,-1
80003970:	400cec93          	or	s9,s9,1024
80003974:	00000d93          	li	s11,0
80003978:	00000d13          	li	s10,0
8000397c:	df1ff06f          	j	8000376c <_etoa+0x3dc>
80003980:	00000c13          	li	s8,0
80003984:	fedff06f          	j	80003970 <_etoa+0x5e0>

80003988 <_ftoa>:
80003988:	f8010113          	add	sp,sp,-128
8000398c:	07312623          	sw	s3,108(sp)
80003990:	05812c23          	sw	s8,88(sp)
80003994:	05912a23          	sw	s9,84(sp)
80003998:	05a12823          	sw	s10,80(sp)
8000399c:	00050993          	mv	s3,a0
800039a0:	00058c13          	mv	s8,a1
800039a4:	00060c93          	mv	s9,a2
800039a8:	00068d13          	mv	s10,a3
800039ac:	00070613          	mv	a2,a4
800039b0:	00078693          	mv	a3,a5
800039b4:	00070513          	mv	a0,a4
800039b8:	00078593          	mv	a1,a5
800039bc:	06812c23          	sw	s0,120(sp)
800039c0:	06912a23          	sw	s1,116(sp)
800039c4:	07212823          	sw	s2,112(sp)
800039c8:	07612023          	sw	s6,96(sp)
800039cc:	05b12623          	sw	s11,76(sp)
800039d0:	06112e23          	sw	ra,124(sp)
800039d4:	08012d83          	lw	s11,128(sp)
800039d8:	00070493          	mv	s1,a4
800039dc:	00078413          	mv	s0,a5
800039e0:	00080b13          	mv	s6,a6
800039e4:	00088913          	mv	s2,a7
800039e8:	d65fd0ef          	jal	8000174c <__eqdf2>
800039ec:	20051063          	bnez	a0,80003bec <_ftoa+0x264>
800039f0:	a00017b7          	lui	a5,0xa0001
800039f4:	8487a603          	lw	a2,-1976(a5) # a0000848 <intpat+0x34>
800039f8:	84c7a683          	lw	a3,-1972(a5)
800039fc:	00048513          	mv	a0,s1
80003a00:	00040593          	mv	a1,s0
80003a04:	eb1fd0ef          	jal	800018b4 <__ledf2>
80003a08:	2c054463          	bltz	a0,80003cd0 <_ftoa+0x348>
80003a0c:	a00017b7          	lui	a5,0xa0001
80003a10:	8407a603          	lw	a2,-1984(a5) # a0000840 <intpat+0x2c>
80003a14:	8447a683          	lw	a3,-1980(a5)
80003a18:	00048513          	mv	a0,s1
80003a1c:	00040593          	mv	a1,s0
80003a20:	db9fd0ef          	jal	800017d8 <__gedf2>
80003a24:	1aa04463          	bgtz	a0,80003bcc <_ftoa+0x244>
80003a28:	07412423          	sw	s4,104(sp)
80003a2c:	a0001a37          	lui	s4,0xa0001
80003a30:	8c8a2603          	lw	a2,-1848(s4) # a00008c8 <intpat+0xb4>
80003a34:	8cca2683          	lw	a3,-1844(s4)
80003a38:	00048513          	mv	a0,s1
80003a3c:	00040593          	mv	a1,s0
80003a40:	d99fd0ef          	jal	800017d8 <__gedf2>
80003a44:	22a04a63          	bgtz	a0,80003c78 <_ftoa+0x2f0>
80003a48:	a00017b7          	lui	a5,0xa0001
80003a4c:	8d07a603          	lw	a2,-1840(a5) # a00008d0 <intpat+0xbc>
80003a50:	8d47a683          	lw	a3,-1836(a5)
80003a54:	00048513          	mv	a0,s1
80003a58:	00040593          	mv	a1,s0
80003a5c:	e59fd0ef          	jal	800018b4 <__ledf2>
80003a60:	20054c63          	bltz	a0,80003c78 <_ftoa+0x2f0>
80003a64:	00048513          	mv	a0,s1
80003a68:	00040593          	mv	a1,s0
80003a6c:	00000613          	li	a2,0
80003a70:	00000693          	li	a3,0
80003a74:	07512223          	sw	s5,100(sp)
80003a78:	05712e23          	sw	s7,92(sp)
80003a7c:	e39fd0ef          	jal	800018b4 <__ledf2>
80003a80:	1c054863          	bltz	a0,80003c50 <_ftoa+0x2c8>
80003a84:	00012c23          	sw	zero,24(sp)
80003a88:	400dfa93          	and	s5,s11,1024
80003a8c:	3c0a8a63          	beqz	s5,80003e60 <_ftoa+0x4d8>
80003a90:	00900793          	li	a5,9
80003a94:	4d67f063          	bgeu	a5,s6,80003f54 <_ftoa+0x5cc>
80003a98:	ff7b0a93          	add	s5,s6,-9
80003a9c:	00000693          	li	a3,0
80003aa0:	02010b93          	add	s7,sp,32
80003aa4:	03000513          	li	a0,48
80003aa8:	02000593          	li	a1,32
80003aac:	00168693          	add	a3,a3,1
80003ab0:	00db8633          	add	a2,s7,a3
80003ab4:	fea60fa3          	sb	a0,-1(a2)
80003ab8:	40db0333          	sub	t1,s6,a3
80003abc:	3eb68c63          	beq	a3,a1,80003eb4 <_ftoa+0x52c>
80003ac0:	ff5696e3          	bne	a3,s5,80003aac <_ftoa+0x124>
80003ac4:	8c8a2783          	lw	a5,-1848(s4)
80003ac8:	8cca2803          	lw	a6,-1844(s4)
80003acc:	00f12023          	sw	a5,0(sp)
80003ad0:	01012223          	sw	a6,4(sp)
80003ad4:	00040593          	mv	a1,s0
80003ad8:	00048513          	mv	a0,s1
80003adc:	00612a23          	sw	t1,20(sp)
80003ae0:	c49fe0ef          	jal	80002728 <__fixdfsi>
80003ae4:	00050a13          	mv	s4,a0
80003ae8:	d3dfe0ef          	jal	80002824 <__floatsidf>
80003aec:	00050613          	mv	a2,a0
80003af0:	00058693          	mv	a3,a1
80003af4:	00048513          	mv	a0,s1
80003af8:	00040593          	mv	a1,s0
80003afc:	c84fe0ef          	jal	80001f80 <__subdf3>
80003b00:	00012603          	lw	a2,0(sp)
80003b04:	00412683          	lw	a3,4(sp)
80003b08:	e89fd0ef          	jal	80001990 <__muldf3>
80003b0c:	00058b13          	mv	s6,a1
80003b10:	00a12823          	sw	a0,16(sp)
80003b14:	c95fe0ef          	jal	800027a8 <__fixunsdfsi>
80003b18:	00a12623          	sw	a0,12(sp)
80003b1c:	db1fe0ef          	jal	800028cc <__floatunsidf>
80003b20:	01012783          	lw	a5,16(sp)
80003b24:	00050613          	mv	a2,a0
80003b28:	00058693          	mv	a3,a1
80003b2c:	00078513          	mv	a0,a5
80003b30:	000b0593          	mv	a1,s6
80003b34:	c4cfe0ef          	jal	80001f80 <__subdf3>
80003b38:	a0001b37          	lui	s6,0xa0001
80003b3c:	878b2603          	lw	a2,-1928(s6) # a0000878 <intpat+0x64>
80003b40:	87cb2683          	lw	a3,-1924(s6)
80003b44:	00a12823          	sw	a0,16(sp)
80003b48:	00b12e23          	sw	a1,28(sp)
80003b4c:	c8dfd0ef          	jal	800017d8 <__gedf2>
80003b50:	00c12883          	lw	a7,12(sp)
80003b54:	01412303          	lw	t1,20(sp)
80003b58:	2ca05863          	blez	a0,80003e28 <_ftoa+0x4a0>
80003b5c:	00188893          	add	a7,a7,1
80003b60:	00088513          	mv	a0,a7
80003b64:	00612823          	sw	t1,16(sp)
80003b68:	01112623          	sw	a7,12(sp)
80003b6c:	d61fe0ef          	jal	800028cc <__floatunsidf>
80003b70:	00012603          	lw	a2,0(sp)
80003b74:	00412683          	lw	a3,4(sp)
80003b78:	c61fd0ef          	jal	800017d8 <__gedf2>
80003b7c:	00c12883          	lw	a7,12(sp)
80003b80:	01012303          	lw	t1,16(sp)
80003b84:	00054663          	bltz	a0,80003b90 <_ftoa+0x208>
80003b88:	001a0a13          	add	s4,s4,1
80003b8c:	00000893          	li	a7,0
80003b90:	14030c63          	beqz	t1,80003ce8 <_ftoa+0x360>
80003b94:	02000513          	li	a0,32
80003b98:	00a00613          	li	a2,10
80003b9c:	00900e13          	li	t3,9
80003ba0:	30aa8663          	beq	s5,a0,80003eac <_ftoa+0x524>
80003ba4:	02c8f6b3          	remu	a3,a7,a2
80003ba8:	001a8a93          	add	s5,s5,1
80003bac:	015b85b3          	add	a1,s7,s5
80003bb0:	fff30313          	add	t1,t1,-1
80003bb4:	03068693          	add	a3,a3,48
80003bb8:	fed58fa3          	sb	a3,-1(a1)
80003bbc:	02c8d6b3          	divu	a3,a7,a2
80003bc0:	2d1e7063          	bgeu	t3,a7,80003e80 <_ftoa+0x4f8>
80003bc4:	00068893          	mv	a7,a3
80003bc8:	fd9ff06f          	j	80003ba0 <_ftoa+0x218>
80003bcc:	004df793          	and	a5,s11,4
80003bd0:	06079863          	bnez	a5,80003c40 <_ftoa+0x2b8>
80003bd4:	a0000737          	lui	a4,0xa0000
80003bd8:	14470713          	add	a4,a4,324 # a0000144 <__clz_tab+0x108>
80003bdc:	00300793          	li	a5,3
80003be0:	000d8893          	mv	a7,s11
80003be4:	00090813          	mv	a6,s2
80003be8:	0180006f          	j	80003c00 <_ftoa+0x278>
80003bec:	a0000737          	lui	a4,0xa0000
80003bf0:	000d8893          	mv	a7,s11
80003bf4:	00090813          	mv	a6,s2
80003bf8:	00300793          	li	a5,3
80003bfc:	14870713          	add	a4,a4,328 # a0000148 <__clz_tab+0x10c>
80003c00:	07812403          	lw	s0,120(sp)
80003c04:	07c12083          	lw	ra,124(sp)
80003c08:	07412483          	lw	s1,116(sp)
80003c0c:	07012903          	lw	s2,112(sp)
80003c10:	06012b03          	lw	s6,96(sp)
80003c14:	04c12d83          	lw	s11,76(sp)
80003c18:	000d0693          	mv	a3,s10
80003c1c:	000c8613          	mv	a2,s9
80003c20:	05012d03          	lw	s10,80(sp)
80003c24:	05412c83          	lw	s9,84(sp)
80003c28:	000c0593          	mv	a1,s8
80003c2c:	00098513          	mv	a0,s3
80003c30:	05812c03          	lw	s8,88(sp)
80003c34:	06c12983          	lw	s3,108(sp)
80003c38:	08010113          	add	sp,sp,128
80003c3c:	870ff06f          	j	80002cac <_out_rev>
80003c40:	a0000737          	lui	a4,0xa0000
80003c44:	13c70713          	add	a4,a4,316 # a000013c <__clz_tab+0x100>
80003c48:	00400793          	li	a5,4
80003c4c:	f95ff06f          	j	80003be0 <_ftoa+0x258>
80003c50:	00048613          	mv	a2,s1
80003c54:	00040693          	mv	a3,s0
80003c58:	00000513          	li	a0,0
80003c5c:	00000593          	li	a1,0
80003c60:	b20fe0ef          	jal	80001f80 <__subdf3>
80003c64:	00100793          	li	a5,1
80003c68:	00050493          	mv	s1,a0
80003c6c:	00058413          	mv	s0,a1
80003c70:	00f12c23          	sw	a5,24(sp)
80003c74:	e15ff06f          	j	80003a88 <_ftoa+0x100>
80003c78:	00040793          	mv	a5,s0
80003c7c:	07812403          	lw	s0,120(sp)
80003c80:	09b12023          	sw	s11,128(sp)
80003c84:	06812a03          	lw	s4,104(sp)
80003c88:	07c12083          	lw	ra,124(sp)
80003c8c:	04c12d83          	lw	s11,76(sp)
80003c90:	00048713          	mv	a4,s1
80003c94:	00090893          	mv	a7,s2
80003c98:	07412483          	lw	s1,116(sp)
80003c9c:	07012903          	lw	s2,112(sp)
80003ca0:	000b0813          	mv	a6,s6
80003ca4:	000d0693          	mv	a3,s10
80003ca8:	06012b03          	lw	s6,96(sp)
80003cac:	05012d03          	lw	s10,80(sp)
80003cb0:	000c8613          	mv	a2,s9
80003cb4:	000c0593          	mv	a1,s8
80003cb8:	05412c83          	lw	s9,84(sp)
80003cbc:	05812c03          	lw	s8,88(sp)
80003cc0:	00098513          	mv	a0,s3
80003cc4:	06c12983          	lw	s3,108(sp)
80003cc8:	08010113          	add	sp,sp,128
80003ccc:	ec4ff06f          	j	80003390 <_etoa>
80003cd0:	a0000737          	lui	a4,0xa0000
80003cd4:	000d8893          	mv	a7,s11
80003cd8:	00090813          	mv	a6,s2
80003cdc:	00400793          	li	a5,4
80003ce0:	14c70713          	add	a4,a4,332 # a000014c <__clz_tab+0x110>
80003ce4:	f1dff06f          	j	80003c00 <_ftoa+0x278>
80003ce8:	000a0513          	mv	a0,s4
80003cec:	b39fe0ef          	jal	80002824 <__floatsidf>
80003cf0:	00050613          	mv	a2,a0
80003cf4:	00058693          	mv	a3,a1
80003cf8:	00048513          	mv	a0,s1
80003cfc:	00040593          	mv	a1,s0
80003d00:	a80fe0ef          	jal	80001f80 <__subdf3>
80003d04:	878b2603          	lw	a2,-1928(s6)
80003d08:	87cb2683          	lw	a3,-1924(s6)
80003d0c:	ba9fd0ef          	jal	800018b4 <__ledf2>
80003d10:	00054663          	bltz	a0,80003d1c <_ftoa+0x394>
80003d14:	001a7693          	and	a3,s4,1
80003d18:	00da0a33          	add	s4,s4,a3
80003d1c:	02000513          	li	a0,32
80003d20:	00a00613          	li	a2,10
80003d24:	0aaa8a63          	beq	s5,a0,80003dd8 <_ftoa+0x450>
80003d28:	02ca66b3          	rem	a3,s4,a2
80003d2c:	001a8a93          	add	s5,s5,1
80003d30:	015b85b3          	add	a1,s7,s5
80003d34:	02ca4a33          	div	s4,s4,a2
80003d38:	03068693          	add	a3,a3,48
80003d3c:	fed58fa3          	sb	a3,-1(a1)
80003d40:	fe0a12e3          	bnez	s4,80003d24 <_ftoa+0x39c>
80003d44:	003df693          	and	a3,s11,3
80003d48:	00100613          	li	a2,1
80003d4c:	22c68c63          	beq	a3,a2,80003f84 <_ftoa+0x5fc>
80003d50:	02000693          	li	a3,32
80003d54:	02da8263          	beq	s5,a3,80003d78 <_ftoa+0x3f0>
80003d58:	01812783          	lw	a5,24(sp)
80003d5c:	16078c63          	beqz	a5,80003ed4 <_ftoa+0x54c>
80003d60:	020a8793          	add	a5,s5,32
80003d64:	02010713          	add	a4,sp,32
80003d68:	00e786b3          	add	a3,a5,a4
80003d6c:	02d00613          	li	a2,45
80003d70:	fec68023          	sb	a2,-32(a3)
80003d74:	001a8a93          	add	s5,s5,1
80003d78:	000d8893          	mv	a7,s11
80003d7c:	00090813          	mv	a6,s2
80003d80:	000a8793          	mv	a5,s5
80003d84:	000b8713          	mv	a4,s7
80003d88:	000d0693          	mv	a3,s10
80003d8c:	000c8613          	mv	a2,s9
80003d90:	000c0593          	mv	a1,s8
80003d94:	00098513          	mv	a0,s3
80003d98:	f15fe0ef          	jal	80002cac <_out_rev>
80003d9c:	07c12083          	lw	ra,124(sp)
80003da0:	07812403          	lw	s0,120(sp)
80003da4:	06812a03          	lw	s4,104(sp)
80003da8:	06412a83          	lw	s5,100(sp)
80003dac:	05c12b83          	lw	s7,92(sp)
80003db0:	07412483          	lw	s1,116(sp)
80003db4:	07012903          	lw	s2,112(sp)
80003db8:	06c12983          	lw	s3,108(sp)
80003dbc:	06012b03          	lw	s6,96(sp)
80003dc0:	05812c03          	lw	s8,88(sp)
80003dc4:	05412c83          	lw	s9,84(sp)
80003dc8:	05012d03          	lw	s10,80(sp)
80003dcc:	04c12d83          	lw	s11,76(sp)
80003dd0:	08010113          	add	sp,sp,128
80003dd4:	00008067          	ret
80003dd8:	003df693          	and	a3,s11,3
80003ddc:	00100613          	li	a2,1
80003de0:	f8c69ce3          	bne	a3,a2,80003d78 <_ftoa+0x3f0>
80003de4:	f8090ae3          	beqz	s2,80003d78 <_ftoa+0x3f0>
80003de8:	01812783          	lw	a5,24(sp)
80003dec:	14079e63          	bnez	a5,80003f48 <_ftoa+0x5c0>
80003df0:	00cdf693          	and	a3,s11,12
80003df4:	14069a63          	bnez	a3,80003f48 <_ftoa+0x5c0>
80003df8:	0d2afa63          	bgeu	s5,s2,80003ecc <_ftoa+0x544>
80003dfc:	02000693          	li	a3,32
80003e00:	03000613          	li	a2,48
80003e04:	02000593          	li	a1,32
80003e08:	00da8c63          	beq	s5,a3,80003e20 <_ftoa+0x498>
80003e0c:	001a8a93          	add	s5,s5,1
80003e10:	015b86b3          	add	a3,s7,s5
80003e14:	fec68fa3          	sb	a2,-1(a3)
80003e18:	f3590ce3          	beq	s2,s5,80003d50 <_ftoa+0x3c8>
80003e1c:	feba98e3          	bne	s5,a1,80003e0c <_ftoa+0x484>
80003e20:	02000a93          	li	s5,32
80003e24:	f55ff06f          	j	80003d78 <_ftoa+0x3f0>
80003e28:	a00017b7          	lui	a5,0xa0001
80003e2c:	01012503          	lw	a0,16(sp)
80003e30:	01c12583          	lw	a1,28(sp)
80003e34:	8787a603          	lw	a2,-1928(a5) # a0000878 <intpat+0x64>
80003e38:	87c7a683          	lw	a3,-1924(a5)
80003e3c:	00612623          	sw	t1,12(sp)
80003e40:	01112023          	sw	a7,0(sp)
80003e44:	a71fd0ef          	jal	800018b4 <__ledf2>
80003e48:	00012883          	lw	a7,0(sp)
80003e4c:	00c12303          	lw	t1,12(sp)
80003e50:	d40540e3          	bltz	a0,80003b90 <_ftoa+0x208>
80003e54:	0e089263          	bnez	a7,80003f38 <_ftoa+0x5b0>
80003e58:	00188893          	add	a7,a7,1
80003e5c:	d35ff06f          	j	80003b90 <_ftoa+0x208>
80003e60:	a0001737          	lui	a4,0xa0001
80003e64:	8c072783          	lw	a5,-1856(a4) # a00008c0 <intpat+0xac>
80003e68:	8c472803          	lw	a6,-1852(a4)
80003e6c:	00600313          	li	t1,6
80003e70:	00f12023          	sw	a5,0(sp)
80003e74:	01012223          	sw	a6,4(sp)
80003e78:	02010b93          	add	s7,sp,32
80003e7c:	c59ff06f          	j	80003ad4 <_ftoa+0x14c>
80003e80:	02aa8663          	beq	s5,a0,80003eac <_ftoa+0x524>
80003e84:	01530533          	add	a0,t1,s5
80003e88:	03000593          	li	a1,48
80003e8c:	02000613          	li	a2,32
80003e90:	00031663          	bnez	t1,80003e9c <_ftoa+0x514>
80003e94:	06c0006f          	j	80003f00 <_ftoa+0x578>
80003e98:	06aa8463          	beq	s5,a0,80003f00 <_ftoa+0x578>
80003e9c:	001a8a93          	add	s5,s5,1
80003ea0:	015b86b3          	add	a3,s7,s5
80003ea4:	feb68fa3          	sb	a1,-1(a3)
80003ea8:	feca98e3          	bne	s5,a2,80003e98 <_ftoa+0x510>
80003eac:	02000a93          	li	s5,32
80003eb0:	e6dff06f          	j	80003d1c <_ftoa+0x394>
80003eb4:	8c8a2783          	lw	a5,-1848(s4)
80003eb8:	8cca2803          	lw	a6,-1844(s4)
80003ebc:	02000a93          	li	s5,32
80003ec0:	00f12023          	sw	a5,0(sp)
80003ec4:	01012223          	sw	a6,4(sp)
80003ec8:	c0dff06f          	j	80003ad4 <_ftoa+0x14c>
80003ecc:	02000693          	li	a3,32
80003ed0:	eada84e3          	beq	s5,a3,80003d78 <_ftoa+0x3f0>
80003ed4:	004df693          	and	a3,s11,4
80003ed8:	04069263          	bnez	a3,80003f1c <_ftoa+0x594>
80003edc:	008df693          	and	a3,s11,8
80003ee0:	e8068ce3          	beqz	a3,80003d78 <_ftoa+0x3f0>
80003ee4:	020a8793          	add	a5,s5,32
80003ee8:	02010713          	add	a4,sp,32
80003eec:	00e786b3          	add	a3,a5,a4
80003ef0:	02000613          	li	a2,32
80003ef4:	fec68023          	sb	a2,-32(a3)
80003ef8:	001a8a93          	add	s5,s5,1
80003efc:	e7dff06f          	j	80003d78 <_ftoa+0x3f0>
80003f00:	020a8793          	add	a5,s5,32
80003f04:	02010713          	add	a4,sp,32
80003f08:	00e786b3          	add	a3,a5,a4
80003f0c:	02e00613          	li	a2,46
80003f10:	fec68023          	sb	a2,-32(a3)
80003f14:	001a8a93          	add	s5,s5,1
80003f18:	e05ff06f          	j	80003d1c <_ftoa+0x394>
80003f1c:	020a8793          	add	a5,s5,32
80003f20:	02010713          	add	a4,sp,32
80003f24:	00e786b3          	add	a3,a5,a4
80003f28:	02b00613          	li	a2,43
80003f2c:	fec68023          	sb	a2,-32(a3)
80003f30:	001a8a93          	add	s5,s5,1
80003f34:	e45ff06f          	j	80003d78 <_ftoa+0x3f0>
80003f38:	0018f693          	and	a3,a7,1
80003f3c:	c4068ae3          	beqz	a3,80003b90 <_ftoa+0x208>
80003f40:	00188893          	add	a7,a7,1
80003f44:	c4dff06f          	j	80003b90 <_ftoa+0x208>
80003f48:	fff90913          	add	s2,s2,-1
80003f4c:	eb2ae8e3          	bltu	s5,s2,80003dfc <_ftoa+0x474>
80003f50:	e01ff06f          	j	80003d50 <_ftoa+0x3c8>
80003f54:	a00007b7          	lui	a5,0xa0000
80003f58:	003b1713          	sll	a4,s6,0x3
80003f5c:	77078793          	add	a5,a5,1904 # a0000770 <pow10.0>
80003f60:	00e787b3          	add	a5,a5,a4
80003f64:	0047a803          	lw	a6,4(a5)
80003f68:	0007a783          	lw	a5,0(a5)
80003f6c:	000b0313          	mv	t1,s6
80003f70:	01012223          	sw	a6,4(sp)
80003f74:	00f12023          	sw	a5,0(sp)
80003f78:	00000a93          	li	s5,0
80003f7c:	02010b93          	add	s7,sp,32
80003f80:	b55ff06f          	j	80003ad4 <_ftoa+0x14c>
80003f84:	dc0906e3          	beqz	s2,80003d50 <_ftoa+0x3c8>
80003f88:	e61ff06f          	j	80003de8 <_ftoa+0x460>

80003f8c <_out_char>:
80003f8c:	00051463          	bnez	a0,80003f94 <_out_char+0x8>
80003f90:	00008067          	ret
80003f94:	4e90206f          	j	80006c7c <_putchar>

80003f98 <_vsnprintf>:
80003f98:	f9010113          	add	sp,sp,-112
80003f9c:	07212023          	sw	s2,96(sp)
80003fa0:	05312e23          	sw	s3,92(sp)
80003fa4:	05412c23          	sw	s4,88(sp)
80003fa8:	05712623          	sw	s7,76(sp)
80003fac:	03b12e23          	sw	s11,60(sp)
80003fb0:	06112623          	sw	ra,108(sp)
80003fb4:	06812423          	sw	s0,104(sp)
80003fb8:	05a12023          	sw	s10,64(sp)
80003fbc:	00058993          	mv	s3,a1
80003fc0:	00060913          	mv	s2,a2
80003fc4:	00068b93          	mv	s7,a3
80003fc8:	00070d93          	mv	s11,a4
80003fcc:	00050a13          	mv	s4,a0
80003fd0:	4e058863          	beqz	a1,800044c0 <_vsnprintf+0x528>
80003fd4:	000bc503          	lbu	a0,0(s7) # 80000000 <__start>
80003fd8:	00000d13          	li	s10,0
80003fdc:	4e050c63          	beqz	a0,800044d4 <_vsnprintf+0x53c>
80003fe0:	a00007b7          	lui	a5,0xa0000
80003fe4:	05512a23          	sw	s5,84(sp)
80003fe8:	61878793          	add	a5,a5,1560 # a0000618 <__clz_tab+0x5dc>
80003fec:	a0000ab7          	lui	s5,0xa0000
80003ff0:	06912223          	sw	s1,100(sp)
80003ff4:	05612823          	sw	s6,80(sp)
80003ff8:	05812423          	sw	s8,72(sp)
80003ffc:	05912223          	sw	s9,68(sp)
80004000:	01000493          	li	s1,16
80004004:	5d4a8a93          	add	s5,s5,1492 # a00005d4 <__clz_tab+0x598>
80004008:	00900b13          	li	s6,9
8000400c:	02f12223          	sw	a5,36(sp)
80004010:	0200006f          	j	80004030 <_vsnprintf+0x98>
80004014:	000d0613          	mv	a2,s10
80004018:	00090693          	mv	a3,s2
8000401c:	00098593          	mv	a1,s3
80004020:	001d0d13          	add	s10,s10,1
80004024:	000a00e7          	jalr	s4
80004028:	000bc503          	lbu	a0,0(s7)
8000402c:	16050863          	beqz	a0,8000419c <_vsnprintf+0x204>
80004030:	02500793          	li	a5,37
80004034:	001b8b93          	add	s7,s7,1
80004038:	fcf51ee3          	bne	a0,a5,80004014 <_vsnprintf+0x7c>
8000403c:	00000413          	li	s0,0
80004040:	000bc503          	lbu	a0,0(s7)
80004044:	001b8713          	add	a4,s7,1
80004048:	fe050793          	add	a5,a0,-32
8000404c:	0ff7f793          	zext.b	a5,a5
80004050:	00f4ea63          	bltu	s1,a5,80004064 <_vsnprintf+0xcc>
80004054:	00279793          	sll	a5,a5,0x2
80004058:	015787b3          	add	a5,a5,s5
8000405c:	0007a783          	lw	a5,0(a5)
80004060:	00078067          	jr	a5
80004064:	fd050793          	add	a5,a0,-48
80004068:	0ff7f793          	zext.b	a5,a5
8000406c:	0cfb7263          	bgeu	s6,a5,80004130 <_vsnprintf+0x198>
80004070:	02a00793          	li	a5,42
80004074:	00000e93          	li	t4,0
80004078:	1ef50e63          	beq	a0,a5,80004274 <_vsnprintf+0x2dc>
8000407c:	02e00793          	li	a5,46
80004080:	00000c93          	li	s9,0
80004084:	0ef50463          	beq	a0,a5,8000416c <_vsnprintf+0x1d4>
80004088:	f9850793          	add	a5,a0,-104
8000408c:	0ff7f793          	zext.b	a5,a5
80004090:	01200693          	li	a3,18
80004094:	06f6e063          	bltu	a3,a5,800040f4 <_vsnprintf+0x15c>
80004098:	02412683          	lw	a3,36(sp)
8000409c:	00279793          	sll	a5,a5,0x2
800040a0:	00d787b3          	add	a5,a5,a3
800040a4:	0007a783          	lw	a5,0(a5)
800040a8:	00078067          	jr	a5
800040ac:	00146413          	or	s0,s0,1
800040b0:	00070b93          	mv	s7,a4
800040b4:	f8dff06f          	j	80004040 <_vsnprintf+0xa8>
800040b8:	00246413          	or	s0,s0,2
800040bc:	00070b93          	mv	s7,a4
800040c0:	f81ff06f          	j	80004040 <_vsnprintf+0xa8>
800040c4:	00446413          	or	s0,s0,4
800040c8:	00070b93          	mv	s7,a4
800040cc:	f75ff06f          	j	80004040 <_vsnprintf+0xa8>
800040d0:	01046413          	or	s0,s0,16
800040d4:	00070b93          	mv	s7,a4
800040d8:	f69ff06f          	j	80004040 <_vsnprintf+0xa8>
800040dc:	00846413          	or	s0,s0,8
800040e0:	00070b93          	mv	s7,a4
800040e4:	f5dff06f          	j	80004040 <_vsnprintf+0xa8>
800040e8:	001bc503          	lbu	a0,1(s7)
800040ec:	10046413          	or	s0,s0,256
800040f0:	00170713          	add	a4,a4,1
800040f4:	06700793          	li	a5,103
800040f8:	00070b93          	mv	s7,a4
800040fc:	10a7e063          	bltu	a5,a0,800041fc <_vsnprintf+0x264>
80004100:	02400793          	li	a5,36
80004104:	f0a7f8e3          	bgeu	a5,a0,80004014 <_vsnprintf+0x7c>
80004108:	fdb50793          	add	a5,a0,-37
8000410c:	0ff7f793          	zext.b	a5,a5
80004110:	04200713          	li	a4,66
80004114:	f0f760e3          	bltu	a4,a5,80004014 <_vsnprintf+0x7c>
80004118:	a0000737          	lui	a4,0xa0000
8000411c:	00279793          	sll	a5,a5,0x2
80004120:	66470713          	add	a4,a4,1636 # a0000664 <__clz_tab+0x628>
80004124:	00e787b3          	add	a5,a5,a4
80004128:	0007a783          	lw	a5,0(a5)
8000412c:	00078067          	jr	a5
80004130:	00000e93          	li	t4,0
80004134:	002e9793          	sll	a5,t4,0x2
80004138:	01d787b3          	add	a5,a5,t4
8000413c:	00179793          	sll	a5,a5,0x1
80004140:	00a787b3          	add	a5,a5,a0
80004144:	00074503          	lbu	a0,0(a4)
80004148:	fd078e93          	add	t4,a5,-48
8000414c:	00070b93          	mv	s7,a4
80004150:	fd050793          	add	a5,a0,-48
80004154:	0ff7f793          	zext.b	a5,a5
80004158:	00170713          	add	a4,a4,1
8000415c:	fcfb7ce3          	bgeu	s6,a5,80004134 <_vsnprintf+0x19c>
80004160:	02e00793          	li	a5,46
80004164:	00000c93          	li	s9,0
80004168:	f2f510e3          	bne	a0,a5,80004088 <_vsnprintf+0xf0>
8000416c:	001bc503          	lbu	a0,1(s7)
80004170:	00900613          	li	a2,9
80004174:	00070693          	mv	a3,a4
80004178:	fd050793          	add	a5,a0,-48
8000417c:	0ff7f793          	zext.b	a5,a5
80004180:	40046413          	or	s0,s0,1024
80004184:	34f67e63          	bgeu	a2,a5,800044e0 <_vsnprintf+0x548>
80004188:	02a00793          	li	a5,42
8000418c:	3af50863          	beq	a0,a5,8000453c <_vsnprintf+0x5a4>
80004190:	00070b93          	mv	s7,a4
80004194:	00170713          	add	a4,a4,1
80004198:	ef1ff06f          	j	80004088 <_vsnprintf+0xf0>
8000419c:	06412483          	lw	s1,100(sp)
800041a0:	05412a83          	lw	s5,84(sp)
800041a4:	05012b03          	lw	s6,80(sp)
800041a8:	04812c03          	lw	s8,72(sp)
800041ac:	04412c83          	lw	s9,68(sp)
800041b0:	000d0413          	mv	s0,s10
800041b4:	012d6463          	bltu	s10,s2,800041bc <_vsnprintf+0x224>
800041b8:	fff90d13          	add	s10,s2,-1
800041bc:	00090693          	mv	a3,s2
800041c0:	000d0613          	mv	a2,s10
800041c4:	00098593          	mv	a1,s3
800041c8:	00000513          	li	a0,0
800041cc:	000a00e7          	jalr	s4
800041d0:	06c12083          	lw	ra,108(sp)
800041d4:	00040513          	mv	a0,s0
800041d8:	06812403          	lw	s0,104(sp)
800041dc:	06012903          	lw	s2,96(sp)
800041e0:	05c12983          	lw	s3,92(sp)
800041e4:	05812a03          	lw	s4,88(sp)
800041e8:	04c12b83          	lw	s7,76(sp)
800041ec:	04012d03          	lw	s10,64(sp)
800041f0:	03c12d83          	lw	s11,60(sp)
800041f4:	07010113          	add	sp,sp,112
800041f8:	00008067          	ret
800041fc:	f9750793          	add	a5,a0,-105
80004200:	0ff7f793          	zext.b	a5,a5
80004204:	00f00713          	li	a4,15
80004208:	e0f766e3          	bltu	a4,a5,80004014 <_vsnprintf+0x7c>
8000420c:	00009737          	lui	a4,0x9
80004210:	00100c13          	li	s8,1
80004214:	00fc1c33          	sll	s8,s8,a5
80004218:	04170713          	add	a4,a4,65 # 9041 <__stack_size+0x5041>
8000421c:	00ec7c33          	and	s8,s8,a4
80004220:	2e0c1c63          	bnez	s8,80004518 <_vsnprintf+0x580>
80004224:	00a00713          	li	a4,10
80004228:	06e78463          	beq	a5,a4,80004290 <_vsnprintf+0x2f8>
8000422c:	00700713          	li	a4,7
80004230:	dee792e3          	bne	a5,a4,80004014 <_vsnprintf+0x7c>
80004234:	000da703          	lw	a4,0(s11)
80004238:	00800793          	li	a5,8
8000423c:	02146413          	or	s0,s0,33
80004240:	00f12023          	sw	a5,0(sp)
80004244:	000d0613          	mv	a2,s10
80004248:	00812223          	sw	s0,4(sp)
8000424c:	000c8893          	mv	a7,s9
80004250:	01000813          	li	a6,16
80004254:	00000793          	li	a5,0
80004258:	00090693          	mv	a3,s2
8000425c:	00098593          	mv	a1,s3
80004260:	000a0513          	mv	a0,s4
80004264:	ed9fe0ef          	jal	8000313c <_ntoa_long>
80004268:	004d8d93          	add	s11,s11,4
8000426c:	00050d13          	mv	s10,a0
80004270:	db9ff06f          	j	80004028 <_vsnprintf+0x90>
80004274:	000dae83          	lw	t4,0(s11)
80004278:	004d8d93          	add	s11,s11,4
8000427c:	0c0ecc63          	bltz	t4,80004354 <_vsnprintf+0x3bc>
80004280:	001bc503          	lbu	a0,1(s7)
80004284:	00070b93          	mv	s7,a4
80004288:	00170713          	add	a4,a4,1
8000428c:	df1ff06f          	j	8000407c <_vsnprintf+0xe4>
80004290:	000da783          	lw	a5,0(s11)
80004294:	004d8713          	add	a4,s11,4
80004298:	02e12623          	sw	a4,44(sp)
8000429c:	0007c683          	lbu	a3,0(a5)
800042a0:	02f12023          	sw	a5,32(sp)
800042a4:	00068513          	mv	a0,a3
800042a8:	2a0c9c63          	bnez	s9,80004560 <_vsnprintf+0x5c8>
800042ac:	02068863          	beqz	a3,800042dc <_vsnprintf+0x344>
800042b0:	ffe00c13          	li	s8,-2
800042b4:	02012783          	lw	a5,32(sp)
800042b8:	001c0c13          	add	s8,s8,1
800042bc:	01878c33          	add	s8,a5,s8
800042c0:	0080006f          	j	800042c8 <_vsnprintf+0x330>
800042c4:	3afc0463          	beq	s8,a5,8000466c <_vsnprintf+0x6d4>
800042c8:	0017c703          	lbu	a4,1(a5)
800042cc:	00178793          	add	a5,a5,1
800042d0:	fe071ae3          	bnez	a4,800042c4 <_vsnprintf+0x32c>
800042d4:	02012703          	lw	a4,32(sp)
800042d8:	40e78c33          	sub	s8,a5,a4
800042dc:	40047d93          	and	s11,s0,1024
800042e0:	000d8663          	beqz	s11,800042ec <_vsnprintf+0x354>
800042e4:	018cf463          	bgeu	s9,s8,800042ec <_vsnprintf+0x354>
800042e8:	000c8c13          	mv	s8,s9
800042ec:	00247793          	and	a5,s0,2
800042f0:	02f12423          	sw	a5,40(sp)
800042f4:	38078863          	beqz	a5,80004684 <_vsnprintf+0x6ec>
800042f8:	32068263          	beqz	a3,8000461c <_vsnprintf+0x684>
800042fc:	000d0413          	mv	s0,s10
80004300:	000d8863          	beqz	s11,80004310 <_vsnprintf+0x378>
80004304:	fffc8793          	add	a5,s9,-1
80004308:	020c8c63          	beqz	s9,80004340 <_vsnprintf+0x3a8>
8000430c:	00078c93          	mv	s9,a5
80004310:	01d12e23          	sw	t4,28(sp)
80004314:	00040613          	mv	a2,s0
80004318:	00090693          	mv	a3,s2
8000431c:	00098593          	mv	a1,s3
80004320:	000a00e7          	jalr	s4
80004324:	02012783          	lw	a5,32(sp)
80004328:	00140413          	add	s0,s0,1
8000432c:	41a40733          	sub	a4,s0,s10
80004330:	00e78733          	add	a4,a5,a4
80004334:	00074503          	lbu	a0,0(a4)
80004338:	01c12e83          	lw	t4,28(sp)
8000433c:	fc0512e3          	bnez	a0,80004300 <_vsnprintf+0x368>
80004340:	02812783          	lw	a5,40(sp)
80004344:	2c079a63          	bnez	a5,80004618 <_vsnprintf+0x680>
80004348:	02c12d83          	lw	s11,44(sp)
8000434c:	00040d13          	mv	s10,s0
80004350:	cd9ff06f          	j	80004028 <_vsnprintf+0x90>
80004354:	001bc503          	lbu	a0,1(s7)
80004358:	00246413          	or	s0,s0,2
8000435c:	00070b93          	mv	s7,a4
80004360:	41d00eb3          	neg	t4,t4
80004364:	00170713          	add	a4,a4,1
80004368:	d15ff06f          	j	8000407c <_vsnprintf+0xe4>
8000436c:	001bc503          	lbu	a0,1(s7)
80004370:	06c00793          	li	a5,108
80004374:	d6f51ce3          	bne	a0,a5,800040ec <_vsnprintf+0x154>
80004378:	002bc503          	lbu	a0,2(s7)
8000437c:	30046413          	or	s0,s0,768
80004380:	003b8713          	add	a4,s7,3
80004384:	d71ff06f          	j	800040f4 <_vsnprintf+0x15c>
80004388:	001bc503          	lbu	a0,1(s7)
8000438c:	20046413          	or	s0,s0,512
80004390:	00170713          	add	a4,a4,1
80004394:	d61ff06f          	j	800040f4 <_vsnprintf+0x15c>
80004398:	001bc503          	lbu	a0,1(s7)
8000439c:	06800793          	li	a5,104
800043a0:	2af50e63          	beq	a0,a5,8000465c <_vsnprintf+0x6c4>
800043a4:	08046413          	or	s0,s0,128
800043a8:	00170713          	add	a4,a4,1
800043ac:	d49ff06f          	j	800040f4 <_vsnprintf+0x15c>
800043b0:	06700793          	li	a5,103
800043b4:	1cf50063          	beq	a0,a5,80004574 <_vsnprintf+0x5dc>
800043b8:	04700793          	li	a5,71
800043bc:	28f50663          	beq	a0,a5,80004648 <_vsnprintf+0x6b0>
800043c0:	04500793          	li	a5,69
800043c4:	28f50863          	beq	a0,a5,80004654 <_vsnprintf+0x6bc>
800043c8:	007d8d93          	add	s11,s11,7
800043cc:	ff8dfd93          	and	s11,s11,-8
800043d0:	000da703          	lw	a4,0(s11)
800043d4:	004da783          	lw	a5,4(s11)
800043d8:	000d0613          	mv	a2,s10
800043dc:	000e8893          	mv	a7,t4
800043e0:	00812023          	sw	s0,0(sp)
800043e4:	000c8813          	mv	a6,s9
800043e8:	00090693          	mv	a3,s2
800043ec:	00098593          	mv	a1,s3
800043f0:	000a0513          	mv	a0,s4
800043f4:	f9dfe0ef          	jal	80003390 <_etoa>
800043f8:	008d8d93          	add	s11,s11,8
800043fc:	00050d13          	mv	s10,a0
80004400:	c29ff06f          	j	80004028 <_vsnprintf+0x90>
80004404:	04600793          	li	a5,70
80004408:	16f50263          	beq	a0,a5,8000456c <_vsnprintf+0x5d4>
8000440c:	007d8d93          	add	s11,s11,7
80004410:	ff8dfd93          	and	s11,s11,-8
80004414:	000da703          	lw	a4,0(s11)
80004418:	004da783          	lw	a5,4(s11)
8000441c:	000d0613          	mv	a2,s10
80004420:	000e8893          	mv	a7,t4
80004424:	00812023          	sw	s0,0(sp)
80004428:	000c8813          	mv	a6,s9
8000442c:	00090693          	mv	a3,s2
80004430:	00098593          	mv	a1,s3
80004434:	000a0513          	mv	a0,s4
80004438:	d50ff0ef          	jal	80003988 <_ftoa>
8000443c:	008d8d93          	add	s11,s11,8
80004440:	00050d13          	mv	s10,a0
80004444:	be5ff06f          	j	80004028 <_vsnprintf+0x90>
80004448:	000d0613          	mv	a2,s10
8000444c:	00090693          	mv	a3,s2
80004450:	00098593          	mv	a1,s3
80004454:	02500513          	li	a0,37
80004458:	001d0d13          	add	s10,s10,1
8000445c:	000a00e7          	jalr	s4
80004460:	bc9ff06f          	j	80004028 <_vsnprintf+0x90>
80004464:	00247413          	and	s0,s0,2
80004468:	001d0c93          	add	s9,s10,1
8000446c:	004d8c13          	add	s8,s11,4
80004470:	26040063          	beqz	s0,800046d0 <_vsnprintf+0x738>
80004474:	000dc503          	lbu	a0,0(s11)
80004478:	01d12e23          	sw	t4,28(sp)
8000447c:	000d0613          	mv	a2,s10
80004480:	00090693          	mv	a3,s2
80004484:	00098593          	mv	a1,s3
80004488:	000a00e7          	jalr	s4
8000448c:	01c12e83          	lw	t4,28(sp)
80004490:	00100793          	li	a5,1
80004494:	01dd0d33          	add	s10,s10,t4
80004498:	2bd7f663          	bgeu	a5,t4,80004744 <_vsnprintf+0x7ac>
8000449c:	000c8613          	mv	a2,s9
800044a0:	00090693          	mv	a3,s2
800044a4:	001c8c93          	add	s9,s9,1
800044a8:	00098593          	mv	a1,s3
800044ac:	02000513          	li	a0,32
800044b0:	000a00e7          	jalr	s4
800044b4:	ff9d14e3          	bne	s10,s9,8000449c <_vsnprintf+0x504>
800044b8:	000c0d93          	mv	s11,s8
800044bc:	b6dff06f          	j	80004028 <_vsnprintf+0x90>
800044c0:	000bc503          	lbu	a0,0(s7)
800044c4:	80003a37          	lui	s4,0x80003
800044c8:	ca8a0a13          	add	s4,s4,-856 # 80002ca8 <_out_null>
800044cc:	00000d13          	li	s10,0
800044d0:	b00518e3          	bnez	a0,80003fe0 <_vsnprintf+0x48>
800044d4:	00000413          	li	s0,0
800044d8:	cf2d62e3          	bltu	s10,s2,800041bc <_vsnprintf+0x224>
800044dc:	cddff06f          	j	800041b8 <_vsnprintf+0x220>
800044e0:	00900713          	li	a4,9
800044e4:	002c9793          	sll	a5,s9,0x2
800044e8:	019787b3          	add	a5,a5,s9
800044ec:	00168693          	add	a3,a3,1
800044f0:	00179793          	sll	a5,a5,0x1
800044f4:	00a787b3          	add	a5,a5,a0
800044f8:	0006c503          	lbu	a0,0(a3)
800044fc:	fd078c93          	add	s9,a5,-48
80004500:	fd050793          	add	a5,a0,-48
80004504:	0ff7f793          	zext.b	a5,a5
80004508:	fcf77ee3          	bgeu	a4,a5,800044e4 <_vsnprintf+0x54c>
8000450c:	00068b93          	mv	s7,a3
80004510:	00168713          	add	a4,a3,1
80004514:	b75ff06f          	j	80004088 <_vsnprintf+0xf0>
80004518:	06f00793          	li	a5,111
8000451c:	06f50463          	beq	a0,a5,80004584 <_vsnprintf+0x5ec>
80004520:	28a7f063          	bgeu	a5,a0,800047a0 <_vsnprintf+0x808>
80004524:	07800793          	li	a5,120
80004528:	01000813          	li	a6,16
8000452c:	04f50e63          	beq	a0,a5,80004588 <_vsnprintf+0x5f0>
80004530:	fef47413          	and	s0,s0,-17
80004534:	00a00813          	li	a6,10
80004538:	0500006f          	j	80004588 <_vsnprintf+0x5f0>
8000453c:	000dac83          	lw	s9,0(s11)
80004540:	002bc503          	lbu	a0,2(s7)
80004544:	002b8b93          	add	s7,s7,2
80004548:	fffcc793          	not	a5,s9
8000454c:	41f7d793          	sra	a5,a5,0x1f
80004550:	00fcfcb3          	and	s9,s9,a5
80004554:	004d8d93          	add	s11,s11,4
80004558:	001b8713          	add	a4,s7,1
8000455c:	b2dff06f          	j	80004088 <_vsnprintf+0xf0>
80004560:	d6068ee3          	beqz	a3,800042dc <_vsnprintf+0x344>
80004564:	fffc8c13          	add	s8,s9,-1
80004568:	d4dff06f          	j	800042b4 <_vsnprintf+0x31c>
8000456c:	02046413          	or	s0,s0,32
80004570:	e9dff06f          	j	8000440c <_vsnprintf+0x474>
80004574:	000017b7          	lui	a5,0x1
80004578:	80078793          	add	a5,a5,-2048 # 800 <__stack_size-0x3800>
8000457c:	00f46433          	or	s0,s0,a5
80004580:	e49ff06f          	j	800043c8 <_vsnprintf+0x430>
80004584:	00800813          	li	a6,8
80004588:	40047713          	and	a4,s0,1024
8000458c:	ff347793          	and	a5,s0,-13
80004590:	00070463          	beqz	a4,80004598 <_vsnprintf+0x600>
80004594:	ff247793          	and	a5,s0,-14
80004598:	2007f713          	and	a4,a5,512
8000459c:	1a071a63          	bnez	a4,80004750 <_vsnprintf+0x7b8>
800045a0:	1007f713          	and	a4,a5,256
800045a4:	004d8413          	add	s0,s11,4
800045a8:	2e071063          	bnez	a4,80004888 <_vsnprintf+0x8f0>
800045ac:	0407f713          	and	a4,a5,64
800045b0:	16071c63          	bnez	a4,80004728 <_vsnprintf+0x790>
800045b4:	0807f713          	and	a4,a5,128
800045b8:	2e070c63          	beqz	a4,800048b0 <_vsnprintf+0x918>
800045bc:	000dd703          	lhu	a4,0(s11)
800045c0:	00f12223          	sw	a5,4(sp)
800045c4:	01d12023          	sw	t4,0(sp)
800045c8:	000c8893          	mv	a7,s9
800045cc:	00000793          	li	a5,0
800045d0:	000d0613          	mv	a2,s10
800045d4:	00090693          	mv	a3,s2
800045d8:	00098593          	mv	a1,s3
800045dc:	000a0513          	mv	a0,s4
800045e0:	b5dfe0ef          	jal	8000313c <_ntoa_long>
800045e4:	00050d13          	mv	s10,a0
800045e8:	00040d93          	mv	s11,s0
800045ec:	a3dff06f          	j	80004028 <_vsnprintf+0x90>
800045f0:	05800793          	li	a5,88
800045f4:	08f50263          	beq	a0,a5,80004678 <_vsnprintf+0x6e0>
800045f8:	06200793          	li	a5,98
800045fc:	00200813          	li	a6,2
80004600:	f8f504e3          	beq	a0,a5,80004588 <_vsnprintf+0x5f0>
80004604:	40047793          	and	a5,s0,1024
80004608:	fee47693          	and	a3,s0,-18
8000460c:	1a079663          	bnez	a5,800047b8 <_vsnprintf+0x820>
80004610:	fef47693          	and	a3,s0,-17
80004614:	1a40006f          	j	800047b8 <_vsnprintf+0x820>
80004618:	00040d13          	mv	s10,s0
8000461c:	0bdc7663          	bgeu	s8,t4,800046c8 <_vsnprintf+0x730>
80004620:	01ae87b3          	add	a5,t4,s10
80004624:	41878433          	sub	s0,a5,s8
80004628:	000d0613          	mv	a2,s10
8000462c:	00090693          	mv	a3,s2
80004630:	001d0d13          	add	s10,s10,1
80004634:	00098593          	mv	a1,s3
80004638:	02000513          	li	a0,32
8000463c:	000a00e7          	jalr	s4
80004640:	ffa414e3          	bne	s0,s10,80004628 <_vsnprintf+0x690>
80004644:	d05ff06f          	j	80004348 <_vsnprintf+0x3b0>
80004648:	000017b7          	lui	a5,0x1
8000464c:	80078793          	add	a5,a5,-2048 # 800 <__stack_size-0x3800>
80004650:	00f46433          	or	s0,s0,a5
80004654:	02046413          	or	s0,s0,32
80004658:	d71ff06f          	j	800043c8 <_vsnprintf+0x430>
8000465c:	002bc503          	lbu	a0,2(s7)
80004660:	0c046413          	or	s0,s0,192
80004664:	003b8713          	add	a4,s7,3
80004668:	a8dff06f          	j	800040f4 <_vsnprintf+0x15c>
8000466c:	02012783          	lw	a5,32(sp)
80004670:	40fc0c33          	sub	s8,s8,a5
80004674:	c69ff06f          	j	800042dc <_vsnprintf+0x344>
80004678:	02046413          	or	s0,s0,32
8000467c:	01000813          	li	a6,16
80004680:	f09ff06f          	j	80004588 <_vsnprintf+0x5f0>
80004684:	23dc7a63          	bgeu	s8,t4,800048b8 <_vsnprintf+0x920>
80004688:	01ae87b3          	add	a5,t4,s10
8000468c:	41878c33          	sub	s8,a5,s8
80004690:	01d12e23          	sw	t4,28(sp)
80004694:	000d0613          	mv	a2,s10
80004698:	00090693          	mv	a3,s2
8000469c:	00098593          	mv	a1,s3
800046a0:	02000513          	li	a0,32
800046a4:	000a00e7          	jalr	s4
800046a8:	001d0d13          	add	s10,s10,1
800046ac:	01c12e83          	lw	t4,28(sp)
800046b0:	ffac10e3          	bne	s8,s10,80004690 <_vsnprintf+0x6f8>
800046b4:	02012783          	lw	a5,32(sp)
800046b8:	001e8c13          	add	s8,t4,1
800046bc:	0007c683          	lbu	a3,0(a5)
800046c0:	00068513          	mv	a0,a3
800046c4:	c2069ce3          	bnez	a3,800042fc <_vsnprintf+0x364>
800046c8:	000d0413          	mv	s0,s10
800046cc:	c7dff06f          	j	80004348 <_vsnprintf+0x3b0>
800046d0:	00100793          	li	a5,1
800046d4:	05d7fe63          	bgeu	a5,t4,80004730 <_vsnprintf+0x798>
800046d8:	fffd0413          	add	s0,s10,-1
800046dc:	01d40433          	add	s0,s0,t4
800046e0:	000d0c93          	mv	s9,s10
800046e4:	01d12e23          	sw	t4,28(sp)
800046e8:	000c8613          	mv	a2,s9
800046ec:	00090693          	mv	a3,s2
800046f0:	00098593          	mv	a1,s3
800046f4:	02000513          	li	a0,32
800046f8:	000a00e7          	jalr	s4
800046fc:	001c8c93          	add	s9,s9,1
80004700:	01c12e83          	lw	t4,28(sp)
80004704:	ff9410e3          	bne	s0,s9,800046e4 <_vsnprintf+0x74c>
80004708:	000dc503          	lbu	a0,0(s11)
8000470c:	00090693          	mv	a3,s2
80004710:	00040613          	mv	a2,s0
80004714:	00098593          	mv	a1,s3
80004718:	01dd0d33          	add	s10,s10,t4
8000471c:	000c0d93          	mv	s11,s8
80004720:	000a00e7          	jalr	s4
80004724:	905ff06f          	j	80004028 <_vsnprintf+0x90>
80004728:	000dc703          	lbu	a4,0(s11)
8000472c:	e95ff06f          	j	800045c0 <_vsnprintf+0x628>
80004730:	000dc503          	lbu	a0,0(s11)
80004734:	00090693          	mv	a3,s2
80004738:	000d0613          	mv	a2,s10
8000473c:	00098593          	mv	a1,s3
80004740:	000a00e7          	jalr	s4
80004744:	000c8d13          	mv	s10,s9
80004748:	000c0d93          	mv	s11,s8
8000474c:	8ddff06f          	j	80004028 <_vsnprintf+0x90>
80004750:	007d8d93          	add	s11,s11,7
80004754:	ff8dfd93          	and	s11,s11,-8
80004758:	000da603          	lw	a2,0(s11)
8000475c:	004da683          	lw	a3,4(s11)
80004760:	00080893          	mv	a7,a6
80004764:	00f12623          	sw	a5,12(sp)
80004768:	01d12423          	sw	t4,8(sp)
8000476c:	01912223          	sw	s9,4(sp)
80004770:	00012023          	sw	zero,0(sp)
80004774:	00000813          	li	a6,0
80004778:	00060713          	mv	a4,a2
8000477c:	00068793          	mv	a5,a3
80004780:	000d0613          	mv	a2,s10
80004784:	00090693          	mv	a3,s2
80004788:	00098593          	mv	a1,s3
8000478c:	000a0513          	mv	a0,s4
80004790:	a75fe0ef          	jal	80003204 <_ntoa_long_long>
80004794:	008d8d93          	add	s11,s11,8
80004798:	00050d13          	mv	s10,a0
8000479c:	88dff06f          	j	80004028 <_vsnprintf+0x90>
800047a0:	06900793          	li	a5,105
800047a4:	fef47693          	and	a3,s0,-17
800047a8:	10f51c63          	bne	a0,a5,800048c0 <_vsnprintf+0x928>
800047ac:	40047793          	and	a5,s0,1024
800047b0:	00078463          	beqz	a5,800047b8 <_vsnprintf+0x820>
800047b4:	fee47693          	and	a3,s0,-18
800047b8:	2006f793          	and	a5,a3,512
800047bc:	02079c63          	bnez	a5,800047f4 <_vsnprintf+0x85c>
800047c0:	1006f793          	and	a5,a3,256
800047c4:	004d8413          	add	s0,s11,4
800047c8:	08079c63          	bnez	a5,80004860 <_vsnprintf+0x8c8>
800047cc:	0406f793          	and	a5,a3,64
800047d0:	06078663          	beqz	a5,8000483c <_vsnprintf+0x8a4>
800047d4:	000dc783          	lbu	a5,0(s11)
800047d8:	00078713          	mv	a4,a5
800047dc:	00d12223          	sw	a3,4(sp)
800047e0:	01d12023          	sw	t4,0(sp)
800047e4:	000c8893          	mv	a7,s9
800047e8:	00a00813          	li	a6,10
800047ec:	01f7d793          	srl	a5,a5,0x1f
800047f0:	de1ff06f          	j	800045d0 <_vsnprintf+0x638>
800047f4:	007d8d93          	add	s11,s11,7
800047f8:	ff8dfd93          	and	s11,s11,-8
800047fc:	004da803          	lw	a6,4(s11)
80004800:	000da783          	lw	a5,0(s11)
80004804:	00a00893          	li	a7,10
80004808:	41f85613          	sra	a2,a6,0x1f
8000480c:	00f647b3          	xor	a5,a2,a5
80004810:	40c78733          	sub	a4,a5,a2
80004814:	010645b3          	xor	a1,a2,a6
80004818:	00e7b7b3          	sltu	a5,a5,a4
8000481c:	40c58633          	sub	a2,a1,a2
80004820:	00d12623          	sw	a3,12(sp)
80004824:	01d12423          	sw	t4,8(sp)
80004828:	01912223          	sw	s9,4(sp)
8000482c:	00012023          	sw	zero,0(sp)
80004830:	01f85813          	srl	a6,a6,0x1f
80004834:	40f607b3          	sub	a5,a2,a5
80004838:	f49ff06f          	j	80004780 <_vsnprintf+0x7e8>
8000483c:	0806f793          	and	a5,a3,128
80004840:	04078e63          	beqz	a5,8000489c <_vsnprintf+0x904>
80004844:	000d9783          	lh	a5,0(s11)
80004848:	40f7d613          	sra	a2,a5,0xf
8000484c:	00c7c733          	xor	a4,a5,a2
80004850:	40c70733          	sub	a4,a4,a2
80004854:	01071713          	sll	a4,a4,0x10
80004858:	01075713          	srl	a4,a4,0x10
8000485c:	f81ff06f          	j	800047dc <_vsnprintf+0x844>
80004860:	000da783          	lw	a5,0(s11)
80004864:	00d12223          	sw	a3,4(sp)
80004868:	000c8893          	mv	a7,s9
8000486c:	41f7d713          	sra	a4,a5,0x1f
80004870:	00f746b3          	xor	a3,a4,a5
80004874:	01d12023          	sw	t4,0(sp)
80004878:	00a00813          	li	a6,10
8000487c:	01f7d793          	srl	a5,a5,0x1f
80004880:	40e68733          	sub	a4,a3,a4
80004884:	d4dff06f          	j	800045d0 <_vsnprintf+0x638>
80004888:	000da703          	lw	a4,0(s11)
8000488c:	000c8893          	mv	a7,s9
80004890:	00f12223          	sw	a5,4(sp)
80004894:	01d12023          	sw	t4,0(sp)
80004898:	d35ff06f          	j	800045cc <_vsnprintf+0x634>
8000489c:	000da783          	lw	a5,0(s11)
800048a0:	41f7d613          	sra	a2,a5,0x1f
800048a4:	00f64733          	xor	a4,a2,a5
800048a8:	40c70733          	sub	a4,a4,a2
800048ac:	f31ff06f          	j	800047dc <_vsnprintf+0x844>
800048b0:	000da703          	lw	a4,0(s11)
800048b4:	d0dff06f          	j	800045c0 <_vsnprintf+0x628>
800048b8:	001c0c13          	add	s8,s8,1
800048bc:	e05ff06f          	j	800046c0 <_vsnprintf+0x728>
800048c0:	00068413          	mv	s0,a3
800048c4:	00a00813          	li	a6,10
800048c8:	cc1ff06f          	j	80004588 <_vsnprintf+0x5f0>

800048cc <printf_>:
800048cc:	fc010113          	add	sp,sp,-64
800048d0:	02410313          	add	t1,sp,36
800048d4:	02d12623          	sw	a3,44(sp)
800048d8:	00050693          	mv	a3,a0
800048dc:	80004537          	lui	a0,0x80004
800048e0:	02b12223          	sw	a1,36(sp)
800048e4:	02c12423          	sw	a2,40(sp)
800048e8:	02e12823          	sw	a4,48(sp)
800048ec:	00810593          	add	a1,sp,8
800048f0:	00030713          	mv	a4,t1
800048f4:	fff00613          	li	a2,-1
800048f8:	f8c50513          	add	a0,a0,-116 # 80003f8c <_out_char>
800048fc:	00112e23          	sw	ra,28(sp)
80004900:	02f12a23          	sw	a5,52(sp)
80004904:	03012c23          	sw	a6,56(sp)
80004908:	03112e23          	sw	a7,60(sp)
8000490c:	00612623          	sw	t1,12(sp)
80004910:	e88ff0ef          	jal	80003f98 <_vsnprintf>
80004914:	01c12083          	lw	ra,28(sp)
80004918:	04010113          	add	sp,sp,64
8000491c:	00008067          	ret

80004920 <to_host>:
80004920:	c00007b7          	lui	a5,0xc0000
80004924:	00100713          	li	a4,1
80004928:	00e7a023          	sw	a4,0(a5) # c0000000 <__stack_base>
8000492c:	00008067          	ret

80004930 <cmp_idx>:
80004930:	00060a63          	beqz	a2,80004944 <cmp_idx+0x14>
80004934:	00251503          	lh	a0,2(a0)
80004938:	00259783          	lh	a5,2(a1)
8000493c:	40f50533          	sub	a0,a0,a5
80004940:	00008067          	ret
80004944:	00051783          	lh	a5,0(a0)
80004948:	01079713          	sll	a4,a5,0x10
8000494c:	01075713          	srl	a4,a4,0x10
80004950:	00875713          	srl	a4,a4,0x8
80004954:	f007f793          	and	a5,a5,-256
80004958:	00e7e7b3          	or	a5,a5,a4
8000495c:	00f51023          	sh	a5,0(a0)
80004960:	00059783          	lh	a5,0(a1)
80004964:	00251503          	lh	a0,2(a0)
80004968:	01079713          	sll	a4,a5,0x10
8000496c:	01075713          	srl	a4,a4,0x10
80004970:	00875713          	srl	a4,a4,0x8
80004974:	f007f793          	and	a5,a5,-256
80004978:	00e7e7b3          	or	a5,a5,a4
8000497c:	00f59023          	sh	a5,0(a1)
80004980:	00259783          	lh	a5,2(a1)
80004984:	40f50533          	sub	a0,a0,a5
80004988:	00008067          	ret

8000498c <calc_func>:
8000498c:	fe010113          	add	sp,sp,-32
80004990:	00812c23          	sw	s0,24(sp)
80004994:	00051403          	lh	s0,0(a0)
80004998:	00112e23          	sw	ra,28(sp)
8000499c:	40745793          	sra	a5,s0,0x7
800049a0:	0017f793          	and	a5,a5,1
800049a4:	00078c63          	beqz	a5,800049bc <calc_func+0x30>
800049a8:	01c12083          	lw	ra,28(sp)
800049ac:	07f47513          	and	a0,s0,127
800049b0:	01812403          	lw	s0,24(sp)
800049b4:	02010113          	add	sp,sp,32
800049b8:	00008067          	ret
800049bc:	40345713          	sra	a4,s0,0x3
800049c0:	00f77713          	and	a4,a4,15
800049c4:	00471693          	sll	a3,a4,0x4
800049c8:	0385d783          	lhu	a5,56(a1)
800049cc:	00912a23          	sw	s1,20(sp)
800049d0:	01312623          	sw	s3,12(sp)
800049d4:	00058493          	mv	s1,a1
800049d8:	01212823          	sw	s2,16(sp)
800049dc:	00d705b3          	add	a1,a4,a3
800049e0:	00747613          	and	a2,s0,7
800049e4:	00050993          	mv	s3,a0
800049e8:	00058713          	mv	a4,a1
800049ec:	08060063          	beqz	a2,80004a6c <calc_func+0xe0>
800049f0:	00100693          	li	a3,1
800049f4:	06d61463          	bne	a2,a3,80004a5c <calc_func+0xd0>
800049f8:	00078613          	mv	a2,a5
800049fc:	02848513          	add	a0,s1,40
80004a00:	0dd010ef          	jal	800062dc <core_bench_matrix>
80004a04:	03c4d783          	lhu	a5,60(s1)
80004a08:	01051913          	sll	s2,a0,0x10
80004a0c:	41095913          	sra	s2,s2,0x10
80004a10:	08079c63          	bnez	a5,80004aa8 <calc_func+0x11c>
80004a14:	0384d783          	lhu	a5,56(s1)
80004a18:	02a49e23          	sh	a0,60(s1)
80004a1c:	00078593          	mv	a1,a5
80004a20:	795010ef          	jal	800069b4 <crcu16>
80004a24:	00050793          	mv	a5,a0
80004a28:	f0047413          	and	s0,s0,-256
80004a2c:	07f97513          	and	a0,s2,127
80004a30:	00856433          	or	s0,a0,s0
80004a34:	02f49c23          	sh	a5,56(s1)
80004a38:	08046413          	or	s0,s0,128
80004a3c:	00899023          	sh	s0,0(s3)
80004a40:	01c12083          	lw	ra,28(sp)
80004a44:	01812403          	lw	s0,24(sp)
80004a48:	01412483          	lw	s1,20(sp)
80004a4c:	01012903          	lw	s2,16(sp)
80004a50:	00c12983          	lw	s3,12(sp)
80004a54:	02010113          	add	sp,sp,32
80004a58:	00008067          	ret
80004a5c:	01041513          	sll	a0,s0,0x10
80004a60:	01055513          	srl	a0,a0,0x10
80004a64:	00040913          	mv	s2,s0
80004a68:	fb5ff06f          	j	80004a1c <calc_func+0x90>
80004a6c:	02100693          	li	a3,33
80004a70:	00b6e463          	bltu	a3,a1,80004a78 <calc_func+0xec>
80004a74:	02200713          	li	a4,34
80004a78:	00249683          	lh	a3,2(s1)
80004a7c:	00049603          	lh	a2,0(s1)
80004a80:	0144a583          	lw	a1,20(s1)
80004a84:	0184a503          	lw	a0,24(s1)
80004a88:	50d010ef          	jal	80006794 <core_bench_state>
80004a8c:	03e4d783          	lhu	a5,62(s1)
80004a90:	01051913          	sll	s2,a0,0x10
80004a94:	41095913          	sra	s2,s2,0x10
80004a98:	00079863          	bnez	a5,80004aa8 <calc_func+0x11c>
80004a9c:	0384d783          	lhu	a5,56(s1)
80004aa0:	02a49f23          	sh	a0,62(s1)
80004aa4:	f79ff06f          	j	80004a1c <calc_func+0x90>
80004aa8:	0384d783          	lhu	a5,56(s1)
80004aac:	f71ff06f          	j	80004a1c <calc_func+0x90>

80004ab0 <cmp_complex>:
80004ab0:	ff010113          	add	sp,sp,-16
80004ab4:	00912223          	sw	s1,4(sp)
80004ab8:	00058493          	mv	s1,a1
80004abc:	00060593          	mv	a1,a2
80004ac0:	00112623          	sw	ra,12(sp)
80004ac4:	00812423          	sw	s0,8(sp)
80004ac8:	00060413          	mv	s0,a2
80004acc:	ec1ff0ef          	jal	8000498c <calc_func>
80004ad0:	00050793          	mv	a5,a0
80004ad4:	00040593          	mv	a1,s0
80004ad8:	00048513          	mv	a0,s1
80004adc:	00078413          	mv	s0,a5
80004ae0:	eadff0ef          	jal	8000498c <calc_func>
80004ae4:	00c12083          	lw	ra,12(sp)
80004ae8:	40a40533          	sub	a0,s0,a0
80004aec:	00812403          	lw	s0,8(sp)
80004af0:	00412483          	lw	s1,4(sp)
80004af4:	01010113          	add	sp,sp,16
80004af8:	00008067          	ret

80004afc <core_list_mergesort>:
80004afc:	fd010113          	add	sp,sp,-48
80004b00:	01312e23          	sw	s3,28(sp)
80004b04:	01512a23          	sw	s5,20(sp)
80004b08:	01712623          	sw	s7,12(sp)
80004b0c:	01812423          	sw	s8,8(sp)
80004b10:	01a12023          	sw	s10,0(sp)
80004b14:	02112623          	sw	ra,44(sp)
80004b18:	02812423          	sw	s0,40(sp)
80004b1c:	02912223          	sw	s1,36(sp)
80004b20:	03212023          	sw	s2,32(sp)
80004b24:	01412c23          	sw	s4,24(sp)
80004b28:	01612823          	sw	s6,16(sp)
80004b2c:	01912223          	sw	s9,4(sp)
80004b30:	00050993          	mv	s3,a0
80004b34:	00058c13          	mv	s8,a1
80004b38:	00060b93          	mv	s7,a2
80004b3c:	00100a93          	li	s5,1
80004b40:	00100d13          	li	s10,1
80004b44:	0c098263          	beqz	s3,80004c08 <core_list_mergesort+0x10c>
80004b48:	00000c93          	li	s9,0
80004b4c:	00000493          	li	s1,0
80004b50:	00000b13          	li	s6,0
80004b54:	001c8c93          	add	s9,s9,1
80004b58:	00098793          	mv	a5,s3
80004b5c:	00000413          	li	s0,0
80004b60:	01545863          	bge	s0,s5,80004b70 <core_list_mergesort+0x74>
80004b64:	0007a783          	lw	a5,0(a5)
80004b68:	00140413          	add	s0,s0,1
80004b6c:	fe079ae3          	bnez	a5,80004b60 <core_list_mergesort+0x64>
80004b70:	00098913          	mv	s2,s3
80004b74:	000a8a13          	mv	s4,s5
80004b78:	00078993          	mv	s3,a5
80004b7c:	02805263          	blez	s0,80004ba0 <core_list_mergesort+0xa4>
80004b80:	040a1463          	bnez	s4,80004bc8 <core_list_mergesort+0xcc>
80004b84:	00090793          	mv	a5,s2
80004b88:	00092903          	lw	s2,0(s2)
80004b8c:	fff40413          	add	s0,s0,-1
80004b90:	02048663          	beqz	s1,80004bbc <core_list_mergesort+0xc0>
80004b94:	00f4a023          	sw	a5,0(s1)
80004b98:	00078493          	mv	s1,a5
80004b9c:	fe8042e3          	bgtz	s0,80004b80 <core_list_mergesort+0x84>
80004ba0:	05405863          	blez	s4,80004bf0 <core_list_mergesort+0xf4>
80004ba4:	04098863          	beqz	s3,80004bf4 <core_list_mergesort+0xf8>
80004ba8:	02041263          	bnez	s0,80004bcc <core_list_mergesort+0xd0>
80004bac:	00098793          	mv	a5,s3
80004bb0:	fffa0a13          	add	s4,s4,-1
80004bb4:	0009a983          	lw	s3,0(s3)
80004bb8:	fc049ee3          	bnez	s1,80004b94 <core_list_mergesort+0x98>
80004bbc:	00078b13          	mv	s6,a5
80004bc0:	00078493          	mv	s1,a5
80004bc4:	fd9ff06f          	j	80004b9c <core_list_mergesort+0xa0>
80004bc8:	fa098ee3          	beqz	s3,80004b84 <core_list_mergesort+0x88>
80004bcc:	0049a583          	lw	a1,4(s3)
80004bd0:	00492503          	lw	a0,4(s2)
80004bd4:	000b8613          	mv	a2,s7
80004bd8:	000c00e7          	jalr	s8
80004bdc:	faa054e3          	blez	a0,80004b84 <core_list_mergesort+0x88>
80004be0:	00098793          	mv	a5,s3
80004be4:	fffa0a13          	add	s4,s4,-1
80004be8:	0009a983          	lw	s3,0(s3)
80004bec:	fa5ff06f          	j	80004b90 <core_list_mergesort+0x94>
80004bf0:	f60992e3          	bnez	s3,80004b54 <core_list_mergesort+0x58>
80004bf4:	0004a023          	sw	zero,0(s1)
80004bf8:	01ac8c63          	beq	s9,s10,80004c10 <core_list_mergesort+0x114>
80004bfc:	000b0993          	mv	s3,s6
80004c00:	001a9a93          	sll	s5,s5,0x1
80004c04:	f40992e3          	bnez	s3,80004b48 <core_list_mergesort+0x4c>
80004c08:	00002023          	sw	zero,0(zero) # 0 <__stack_size-0x4000>
80004c0c:	00100073          	ebreak
80004c10:	02c12083          	lw	ra,44(sp)
80004c14:	02812403          	lw	s0,40(sp)
80004c18:	02412483          	lw	s1,36(sp)
80004c1c:	02012903          	lw	s2,32(sp)
80004c20:	01c12983          	lw	s3,28(sp)
80004c24:	01812a03          	lw	s4,24(sp)
80004c28:	01412a83          	lw	s5,20(sp)
80004c2c:	00c12b83          	lw	s7,12(sp)
80004c30:	00812c03          	lw	s8,8(sp)
80004c34:	00412c83          	lw	s9,4(sp)
80004c38:	00012d03          	lw	s10,0(sp)
80004c3c:	000b0513          	mv	a0,s6
80004c40:	01012b03          	lw	s6,16(sp)
80004c44:	03010113          	add	sp,sp,48
80004c48:	00008067          	ret

80004c4c <core_bench_list>:
80004c4c:	00050613          	mv	a2,a0
80004c50:	00451503          	lh	a0,4(a0)
80004c54:	fe010113          	add	sp,sp,-32
80004c58:	00812c23          	sw	s0,24(sp)
80004c5c:	00912a23          	sw	s1,20(sp)
80004c60:	00112e23          	sw	ra,28(sp)
80004c64:	01212823          	sw	s2,16(sp)
80004c68:	01312623          	sw	s3,12(sp)
80004c6c:	01412423          	sw	s4,8(sp)
80004c70:	01512223          	sw	s5,4(sp)
80004c74:	02462403          	lw	s0,36(a2)
80004c78:	00058493          	mv	s1,a1
80004c7c:	26a05463          	blez	a0,80004ee4 <core_bench_list+0x298>
80004c80:	00000893          	li	a7,0
80004c84:	00000e13          	li	t3,0
80004c88:	00000313          	li	t1,0
80004c8c:	00000813          	li	a6,0
80004c90:	0ff8fa13          	zext.b	s4,a7
80004c94:	1c04cc63          	bltz	s1,80004e6c <core_bench_list+0x220>
80004c98:	24040c63          	beqz	s0,80004ef0 <core_bench_list+0x2a4>
80004c9c:	00040793          	mv	a5,s0
80004ca0:	00c0006f          	j	80004cac <core_bench_list+0x60>
80004ca4:	0007a783          	lw	a5,0(a5)
80004ca8:	00078863          	beqz	a5,80004cb8 <core_bench_list+0x6c>
80004cac:	0047a703          	lw	a4,4(a5)
80004cb0:	00271703          	lh	a4,2(a4)
80004cb4:	fe9718e3          	bne	a4,s1,80004ca4 <core_bench_list+0x58>
80004cb8:	00000693          	li	a3,0
80004cbc:	0080006f          	j	80004cc4 <core_bench_list+0x78>
80004cc0:	00070413          	mv	s0,a4
80004cc4:	00042703          	lw	a4,0(s0)
80004cc8:	00d42023          	sw	a3,0(s0)
80004ccc:	00040693          	mv	a3,s0
80004cd0:	fe0718e3          	bnez	a4,80004cc0 <core_bench_list+0x74>
80004cd4:	1a078e63          	beqz	a5,80004e90 <core_bench_list+0x244>
80004cd8:	0047a703          	lw	a4,4(a5)
80004cdc:	00071703          	lh	a4,0(a4)
80004ce0:	00177693          	and	a3,a4,1
80004ce4:	00068c63          	beqz	a3,80004cfc <core_bench_list+0xb0>
80004ce8:	40975713          	sra	a4,a4,0x9
80004cec:	00177713          	and	a4,a4,1
80004cf0:	00e80733          	add	a4,a6,a4
80004cf4:	01071813          	sll	a6,a4,0x10
80004cf8:	01085813          	srl	a6,a6,0x10
80004cfc:	0007a703          	lw	a4,0(a5)
80004d00:	00070c63          	beqz	a4,80004d18 <core_bench_list+0xcc>
80004d04:	00072683          	lw	a3,0(a4)
80004d08:	00d7a023          	sw	a3,0(a5)
80004d0c:	00042783          	lw	a5,0(s0)
80004d10:	00f72023          	sw	a5,0(a4)
80004d14:	00e42023          	sw	a4,0(s0)
80004d18:	00130313          	add	t1,t1,1
80004d1c:	01031313          	sll	t1,t1,0x10
80004d20:	01035313          	srl	t1,t1,0x10
80004d24:	0004c863          	bltz	s1,80004d34 <core_bench_list+0xe8>
80004d28:	00148493          	add	s1,s1,1
80004d2c:	01049493          	sll	s1,s1,0x10
80004d30:	4104d493          	sra	s1,s1,0x10
80004d34:	00188793          	add	a5,a7,1
80004d38:	01079893          	sll	a7,a5,0x10
80004d3c:	4108d893          	sra	a7,a7,0x10
80004d40:	f51518e3          	bne	a0,a7,80004c90 <core_bench_list+0x44>
80004d44:	00231793          	sll	a5,t1,0x2
80004d48:	41c787b3          	sub	a5,a5,t3
80004d4c:	00f80833          	add	a6,a6,a5
80004d50:	01081913          	sll	s2,a6,0x10
80004d54:	01095913          	srl	s2,s2,0x10
80004d58:	00b05c63          	blez	a1,80004d70 <core_bench_list+0x124>
80004d5c:	800055b7          	lui	a1,0x80005
80004d60:	00040513          	mv	a0,s0
80004d64:	ab058593          	add	a1,a1,-1360 # 80004ab0 <cmp_complex>
80004d68:	d95ff0ef          	jal	80004afc <core_list_mergesort>
80004d6c:	00050413          	mv	s0,a0
80004d70:	00042783          	lw	a5,0(s0)
80004d74:	00040993          	mv	s3,s0
80004d78:	0007aa83          	lw	s5,0(a5)
80004d7c:	0047a703          	lw	a4,4(a5)
80004d80:	004aa603          	lw	a2,4(s5)
80004d84:	000aa683          	lw	a3,0(s5)
80004d88:	00c7a223          	sw	a2,4(a5)
80004d8c:	00eaa223          	sw	a4,4(s5)
80004d90:	00d7a023          	sw	a3,0(a5)
80004d94:	000aa023          	sw	zero,0(s5)
80004d98:	0004d863          	bgez	s1,80004da8 <core_bench_list+0x15c>
80004d9c:	0c00006f          	j	80004e5c <core_bench_list+0x210>
80004da0:	0009a983          	lw	s3,0(s3)
80004da4:	10098c63          	beqz	s3,80004ebc <core_bench_list+0x270>
80004da8:	0049a783          	lw	a5,4(s3)
80004dac:	00279783          	lh	a5,2(a5)
80004db0:	fe9798e3          	bne	a5,s1,80004da0 <core_bench_list+0x154>
80004db4:	00442783          	lw	a5,4(s0)
80004db8:	00090593          	mv	a1,s2
80004dbc:	00079503          	lh	a0,0(a5)
80004dc0:	59d010ef          	jal	80006b5c <crc16>
80004dc4:	0009a983          	lw	s3,0(s3)
80004dc8:	00050913          	mv	s2,a0
80004dcc:	fe0994e3          	bnez	s3,80004db4 <core_bench_list+0x168>
80004dd0:	00042983          	lw	s3,0(s0)
80004dd4:	004aa703          	lw	a4,4(s5)
80004dd8:	0049a683          	lw	a3,4(s3)
80004ddc:	0009a783          	lw	a5,0(s3)
80004de0:	800055b7          	lui	a1,0x80005
80004de4:	00daa223          	sw	a3,4(s5)
80004de8:	00e9a223          	sw	a4,4(s3)
80004dec:	00faa023          	sw	a5,0(s5)
80004df0:	00040513          	mv	a0,s0
80004df4:	0159a023          	sw	s5,0(s3)
80004df8:	00000613          	li	a2,0
80004dfc:	93058593          	add	a1,a1,-1744 # 80004930 <cmp_idx>
80004e00:	cfdff0ef          	jal	80004afc <core_list_mergesort>
80004e04:	00052403          	lw	s0,0(a0)
80004e08:	00050493          	mv	s1,a0
80004e0c:	02040063          	beqz	s0,80004e2c <core_bench_list+0x1e0>
80004e10:	0044a783          	lw	a5,4(s1)
80004e14:	00090593          	mv	a1,s2
80004e18:	00079503          	lh	a0,0(a5)
80004e1c:	541010ef          	jal	80006b5c <crc16>
80004e20:	00042403          	lw	s0,0(s0)
80004e24:	00050913          	mv	s2,a0
80004e28:	fe0414e3          	bnez	s0,80004e10 <core_bench_list+0x1c4>
80004e2c:	01c12083          	lw	ra,28(sp)
80004e30:	01812403          	lw	s0,24(sp)
80004e34:	01412483          	lw	s1,20(sp)
80004e38:	00c12983          	lw	s3,12(sp)
80004e3c:	00812a03          	lw	s4,8(sp)
80004e40:	00412a83          	lw	s5,4(sp)
80004e44:	00090513          	mv	a0,s2
80004e48:	01012903          	lw	s2,16(sp)
80004e4c:	02010113          	add	sp,sp,32
80004e50:	00008067          	ret
80004e54:	0009a983          	lw	s3,0(s3)
80004e58:	06098263          	beqz	s3,80004ebc <core_bench_list+0x270>
80004e5c:	0049a783          	lw	a5,4(s3)
80004e60:	0007c783          	lbu	a5,0(a5)
80004e64:	fefa18e3          	bne	s4,a5,80004e54 <core_bench_list+0x208>
80004e68:	f4dff06f          	j	80004db4 <core_bench_list+0x168>
80004e6c:	08040263          	beqz	s0,80004ef0 <core_bench_list+0x2a4>
80004e70:	00040793          	mv	a5,s0
80004e74:	00c0006f          	j	80004e80 <core_bench_list+0x234>
80004e78:	0007a783          	lw	a5,0(a5)
80004e7c:	e2078ee3          	beqz	a5,80004cb8 <core_bench_list+0x6c>
80004e80:	0047a703          	lw	a4,4(a5)
80004e84:	00074703          	lbu	a4,0(a4)
80004e88:	feea18e3          	bne	s4,a4,80004e78 <core_bench_list+0x22c>
80004e8c:	e2dff06f          	j	80004cb8 <core_bench_list+0x6c>
80004e90:	00042783          	lw	a5,0(s0)
80004e94:	001e0e13          	add	t3,t3,1
80004e98:	010e1e13          	sll	t3,t3,0x10
80004e9c:	0047a783          	lw	a5,4(a5)
80004ea0:	010e5e13          	srl	t3,t3,0x10
80004ea4:	00178783          	lb	a5,1(a5)
80004ea8:	0017f793          	and	a5,a5,1
80004eac:	00f807b3          	add	a5,a6,a5
80004eb0:	01079813          	sll	a6,a5,0x10
80004eb4:	01085813          	srl	a6,a6,0x10
80004eb8:	e6dff06f          	j	80004d24 <core_bench_list+0xd8>
80004ebc:	00042983          	lw	s3,0(s0)
80004ec0:	f0098ce3          	beqz	s3,80004dd8 <core_bench_list+0x18c>
80004ec4:	00442783          	lw	a5,4(s0)
80004ec8:	00090593          	mv	a1,s2
80004ecc:	00079503          	lh	a0,0(a5)
80004ed0:	48d010ef          	jal	80006b5c <crc16>
80004ed4:	0009a983          	lw	s3,0(s3)
80004ed8:	00050913          	mv	s2,a0
80004edc:	ec099ce3          	bnez	s3,80004db4 <core_bench_list+0x168>
80004ee0:	ef1ff06f          	j	80004dd0 <core_bench_list+0x184>
80004ee4:	00000913          	li	s2,0
80004ee8:	00000a13          	li	s4,0
80004eec:	e6dff06f          	j	80004d58 <core_bench_list+0x10c>
80004ef0:	00002783          	lw	a5,0(zero) # 0 <__stack_size-0x4000>
80004ef4:	00100073          	ebreak

80004ef8 <core_list_init>:
80004ef8:	01400793          	li	a5,20
80004efc:	02f55e33          	divu	t3,a0,a5
80004f00:	ffff87b7          	lui	a5,0xffff8
80004f04:	0005a023          	sw	zero,0(a1)
80004f08:	08078793          	add	a5,a5,128 # ffff8080 <__stack_base+0x3fff8080>
80004f0c:	01058693          	add	a3,a1,16
80004f10:	00058513          	mv	a0,a1
80004f14:	00858313          	add	t1,a1,8
80004f18:	ffee0e13          	add	t3,t3,-2
80004f1c:	003e1e93          	sll	t4,t3,0x3
80004f20:	01d58eb3          	add	t4,a1,t4
80004f24:	01d5a223          	sw	t4,4(a1)
80004f28:	002e1f93          	sll	t6,t3,0x2
80004f2c:	00fe9023          	sh	a5,0(t4)
80004f30:	000e9123          	sh	zero,2(t4)
80004f34:	01fe8fb3          	add	t6,t4,t6
80004f38:	004e8793          	add	a5,t4,4
80004f3c:	15d6f063          	bgeu	a3,t4,8000507c <core_list_init+0x184>
80004f40:	008e8893          	add	a7,t4,8
80004f44:	13f8fc63          	bgeu	a7,t6,8000507c <core_list_init+0x184>
80004f48:	00f5a623          	sw	a5,12(a1)
80004f4c:	ffff87b7          	lui	a5,0xffff8
80004f50:	0005a423          	sw	zero,8(a1)
80004f54:	0065a023          	sw	t1,0(a1)
80004f58:	fff00713          	li	a4,-1
80004f5c:	fff7c793          	not	a5,a5
80004f60:	00ee9223          	sh	a4,4(t4)
80004f64:	00fe9323          	sh	a5,6(t4)
80004f68:	060e0a63          	beqz	t3,80004fdc <core_list_init+0xe4>
80004f6c:	01061293          	sll	t0,a2,0x10
80004f70:	ffff83b7          	lui	t2,0xffff8
80004f74:	0102d293          	srl	t0,t0,0x10
80004f78:	00000813          	li	a6,0
80004f7c:	fff3c393          	not	t2,t2
80004f80:	01081713          	sll	a4,a6,0x10
80004f84:	01075713          	srl	a4,a4,0x10
80004f88:	00e2c7b3          	xor	a5,t0,a4
80004f8c:	00379793          	sll	a5,a5,0x3
80004f90:	00777713          	and	a4,a4,7
80004f94:	0787f793          	and	a5,a5,120
80004f98:	00e7e7b3          	or	a5,a5,a4
80004f9c:	00879f13          	sll	t5,a5,0x8
80004fa0:	00868713          	add	a4,a3,8
80004fa4:	00180813          	add	a6,a6,1
80004fa8:	00488593          	add	a1,a7,4
80004fac:	01e787b3          	add	a5,a5,t5
80004fb0:	03d77463          	bgeu	a4,t4,80004fd8 <core_list_init+0xe0>
80004fb4:	03f5f263          	bgeu	a1,t6,80004fd8 <core_list_init+0xe0>
80004fb8:	0066a023          	sw	t1,0(a3)
80004fbc:	00d52023          	sw	a3,0(a0)
80004fc0:	0116a223          	sw	a7,4(a3)
80004fc4:	00f89023          	sh	a5,0(a7)
80004fc8:	00789123          	sh	t2,2(a7)
80004fcc:	00068313          	mv	t1,a3
80004fd0:	00058893          	mv	a7,a1
80004fd4:	00070693          	mv	a3,a4
80004fd8:	fb0e14e3          	bne	t3,a6,80004f80 <core_list_init+0x88>
80004fdc:	00032803          	lw	a6,0(t1)
80004fe0:	08080663          	beqz	a6,8000506c <core_list_init+0x174>
80004fe4:	00500793          	li	a5,5
80004fe8:	00004eb7          	lui	t4,0x4
80004fec:	02fe5e33          	divu	t3,t3,a5
80004ff0:	20000713          	li	a4,512
80004ff4:	00100693          	li	a3,1
80004ff8:	fffe8e93          	add	t4,t4,-1 # 3fff <__stack_size-0x1>
80004ffc:	0300006f          	j	8000502c <core_list_init+0x134>
80005000:	01069793          	sll	a5,a3,0x10
80005004:	00082883          	lw	a7,0(a6)
80005008:	4107d793          	sra	a5,a5,0x10
8000500c:	10070713          	add	a4,a4,256
80005010:	01071713          	sll	a4,a4,0x10
80005014:	00f59123          	sh	a5,2(a1)
80005018:	00080313          	mv	t1,a6
8000501c:	00168693          	add	a3,a3,1
80005020:	01075713          	srl	a4,a4,0x10
80005024:	04088463          	beqz	a7,8000506c <core_list_init+0x174>
80005028:	00088813          	mv	a6,a7
8000502c:	00d645b3          	xor	a1,a2,a3
80005030:	70077793          	and	a5,a4,1792
80005034:	00b7e7b3          	or	a5,a5,a1
80005038:	01d7f7b3          	and	a5,a5,t4
8000503c:	00432583          	lw	a1,4(t1)
80005040:	fdc6e0e3          	bltu	a3,t3,80005000 <core_list_init+0x108>
80005044:	00082883          	lw	a7,0(a6)
80005048:	01079793          	sll	a5,a5,0x10
8000504c:	4107d793          	sra	a5,a5,0x10
80005050:	10070713          	add	a4,a4,256
80005054:	01071713          	sll	a4,a4,0x10
80005058:	00f59123          	sh	a5,2(a1)
8000505c:	00080313          	mv	t1,a6
80005060:	00168693          	add	a3,a3,1
80005064:	01075713          	srl	a4,a4,0x10
80005068:	fc0890e3          	bnez	a7,80005028 <core_list_init+0x130>
8000506c:	800055b7          	lui	a1,0x80005
80005070:	00000613          	li	a2,0
80005074:	93058593          	add	a1,a1,-1744 # 80004930 <cmp_idx>
80005078:	a85ff06f          	j	80004afc <core_list_mergesort>
8000507c:	00030693          	mv	a3,t1
80005080:	00078893          	mv	a7,a5
80005084:	00000313          	li	t1,0
80005088:	ee1ff06f          	j	80004f68 <core_list_init+0x70>

8000508c <iterate>:
8000508c:	ff010113          	add	sp,sp,-16
80005090:	01212023          	sw	s2,0(sp)
80005094:	01c52903          	lw	s2,28(a0)
80005098:	00112623          	sw	ra,12(sp)
8000509c:	02052c23          	sw	zero,56(a0)
800050a0:	02052e23          	sw	zero,60(a0)
800050a4:	04090e63          	beqz	s2,80005100 <iterate+0x74>
800050a8:	00812423          	sw	s0,8(sp)
800050ac:	00912223          	sw	s1,4(sp)
800050b0:	00050413          	mv	s0,a0
800050b4:	00000493          	li	s1,0
800050b8:	00100593          	li	a1,1
800050bc:	00040513          	mv	a0,s0
800050c0:	b8dff0ef          	jal	80004c4c <core_bench_list>
800050c4:	03845583          	lhu	a1,56(s0)
800050c8:	0ed010ef          	jal	800069b4 <crcu16>
800050cc:	02a41c23          	sh	a0,56(s0)
800050d0:	fff00593          	li	a1,-1
800050d4:	00040513          	mv	a0,s0
800050d8:	b75ff0ef          	jal	80004c4c <core_bench_list>
800050dc:	03845583          	lhu	a1,56(s0)
800050e0:	0d5010ef          	jal	800069b4 <crcu16>
800050e4:	02a41c23          	sh	a0,56(s0)
800050e8:	00049463          	bnez	s1,800050f0 <iterate+0x64>
800050ec:	02a41d23          	sh	a0,58(s0)
800050f0:	00148493          	add	s1,s1,1
800050f4:	fc9912e3          	bne	s2,s1,800050b8 <iterate+0x2c>
800050f8:	00812403          	lw	s0,8(sp)
800050fc:	00412483          	lw	s1,4(sp)
80005100:	00c12083          	lw	ra,12(sp)
80005104:	00012903          	lw	s2,0(sp)
80005108:	00000513          	li	a0,0
8000510c:	01010113          	add	sp,sp,16
80005110:	00008067          	ret

80005114 <main>:
80005114:	81010113          	add	sp,sp,-2032
80005118:	00001737          	lui	a4,0x1
8000511c:	7e112623          	sw	ra,2028(sp)
80005120:	7e812423          	sw	s0,2024(sp)
80005124:	7e912223          	sw	s1,2020(sp)
80005128:	7f212023          	sw	s2,2016(sp)
8000512c:	7d312e23          	sw	s3,2012(sp)
80005130:	7d412c23          	sw	s4,2008(sp)
80005134:	7d512a23          	sw	s5,2004(sp)
80005138:	7d612823          	sw	s6,2000(sp)
8000513c:	7d712623          	sw	s7,1996(sp)
80005140:	7d812423          	sw	s8,1992(sp)
80005144:	7d912223          	sw	s9,1988(sp)
80005148:	7da12023          	sw	s10,1984(sp)
8000514c:	7bb12e23          	sw	s11,1980(sp)
80005150:	82070693          	add	a3,a4,-2016 # 820 <__stack_size-0x37e0>
80005154:	f8010113          	add	sp,sp,-128
80005158:	fffff7b7          	lui	a5,0xfffff
8000515c:	00f686b3          	add	a3,a3,a5
80005160:	01010793          	add	a5,sp,16
80005164:	00f687b3          	add	a5,a3,a5
80005168:	fffff637          	lui	a2,0xfffff
8000516c:	00f12623          	sw	a5,12(sp)
80005170:	7e860613          	add	a2,a2,2024 # fffff7e8 <__stack_base+0x3ffff7e8>
80005174:	82070793          	add	a5,a4,-2016
80005178:	01010693          	add	a3,sp,16
8000517c:	00c787b3          	add	a5,a5,a2
80005180:	fffff5b7          	lui	a1,0xfffff
80005184:	00d78633          	add	a2,a5,a3
80005188:	7e458593          	add	a1,a1,2020 # fffff7e4 <__stack_base+0x3ffff7e4>
8000518c:	82070793          	add	a5,a4,-2016
80005190:	00b787b3          	add	a5,a5,a1
80005194:	00d785b3          	add	a1,a5,a3
80005198:	00c12783          	lw	a5,12(sp)
8000519c:	05e10513          	add	a0,sp,94
800051a0:	7e07a223          	sw	zero,2020(a5) # fffff7e4 <__stack_base+0x3ffff7e4>
800051a4:	2e9010ef          	jal	80006c8c <portable_init>
800051a8:	00100513          	li	a0,1
800051ac:	7a4010ef          	jal	80006950 <get_seed_32>
800051b0:	00c12703          	lw	a4,12(sp)
800051b4:	00050793          	mv	a5,a0
800051b8:	00200513          	li	a0,2
800051bc:	7ef71623          	sh	a5,2028(a4)
800051c0:	790010ef          	jal	80006950 <get_seed_32>
800051c4:	00c12703          	lw	a4,12(sp)
800051c8:	00050793          	mv	a5,a0
800051cc:	00300513          	li	a0,3
800051d0:	7ef71723          	sh	a5,2030(a4)
800051d4:	77c010ef          	jal	80006950 <get_seed_32>
800051d8:	00c12703          	lw	a4,12(sp)
800051dc:	00050793          	mv	a5,a0
800051e0:	00400513          	li	a0,4
800051e4:	7ef71823          	sh	a5,2032(a4)
800051e8:	768010ef          	jal	80006950 <get_seed_32>
800051ec:	00050793          	mv	a5,a0
800051f0:	00500513          	li	a0,5
800051f4:	02f12c23          	sw	a5,56(sp)
800051f8:	758010ef          	jal	80006950 <get_seed_32>
800051fc:	00051463          	bnez	a0,80005204 <main+0xf0>
80005200:	00700513          	li	a0,7
80005204:	00001737          	lui	a4,0x1
80005208:	fffff7b7          	lui	a5,0xfffff
8000520c:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
80005210:	00f70733          	add	a4,a4,a5
80005214:	01010793          	add	a5,sp,16
80005218:	00f707b3          	add	a5,a4,a5
8000521c:	00f12623          	sw	a5,12(sp)
80005220:	7ec7a783          	lw	a5,2028(a5) # fffff7ec <__stack_base+0x3ffff7ec>
80005224:	02a12e23          	sw	a0,60(sp)
80005228:	2e079e63          	bnez	a5,80005524 <main+0x410>
8000522c:	00c12783          	lw	a5,12(sp)
80005230:	7f079783          	lh	a5,2032(a5)
80005234:	4c078063          	beqz	a5,800056f4 <main+0x5e0>
80005238:	000015b7          	lui	a1,0x1
8000523c:	fffff6b7          	lui	a3,0xfffff
80005240:	82058593          	add	a1,a1,-2016 # 820 <__stack_size-0x37e0>
80005244:	00d585b3          	add	a1,a1,a3
80005248:	01010693          	add	a3,sp,16
8000524c:	00d586b3          	add	a3,a1,a3
80005250:	06010613          	add	a2,sp,96
80005254:	00257793          	and	a5,a0,2
80005258:	00157713          	and	a4,a0,1
8000525c:	00f037b3          	snez	a5,a5
80005260:	00d12623          	sw	a3,12(sp)
80005264:	7ec6aa23          	sw	a2,2036(a3) # fffff7f4 <__stack_base+0x3ffff7f4>
80005268:	04011e23          	sh	zero,92(sp)
8000526c:	00457693          	and	a3,a0,4
80005270:	00f70733          	add	a4,a4,a5
80005274:	00068863          	beqz	a3,80005284 <main+0x170>
80005278:	00170713          	add	a4,a4,1
8000527c:	01071713          	sll	a4,a4,0x10
80005280:	01075713          	srl	a4,a4,0x10
80005284:	7d000693          	li	a3,2000
80005288:	02e6d6b3          	divu	a3,a3,a4
8000528c:	fffff7b7          	lui	a5,0xfffff
80005290:	00001737          	lui	a4,0x1
80005294:	7ec78793          	add	a5,a5,2028 # fffff7ec <__stack_base+0x3ffff7ec>
80005298:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
8000529c:	00f70733          	add	a4,a4,a5
800052a0:	01010793          	add	a5,sp,16
800052a4:	00f707b3          	add	a5,a4,a5
800052a8:	00000813          	li	a6,0
800052ac:	00000713          	li	a4,0
800052b0:	00100313          	li	t1,1
800052b4:	00300893          	li	a7,3
800052b8:	02d12a23          	sw	a3,52(sp)
800052bc:	00e315b3          	sll	a1,t1,a4
800052c0:	00a5f5b3          	and	a1,a1,a0
800052c4:	00170713          	add	a4,a4,1
800052c8:	24059063          	bnez	a1,80005508 <main+0x3f4>
800052cc:	00478793          	add	a5,a5,4
800052d0:	ff1716e3          	bne	a4,a7,800052bc <main+0x1a8>
800052d4:	000016b7          	lui	a3,0x1
800052d8:	fffff737          	lui	a4,0xfffff
800052dc:	03c12783          	lw	a5,60(sp)
800052e0:	82068693          	add	a3,a3,-2016 # 820 <__stack_size-0x37e0>
800052e4:	00e686b3          	add	a3,a3,a4
800052e8:	01010713          	add	a4,sp,16
800052ec:	00e68733          	add	a4,a3,a4
800052f0:	00e12623          	sw	a4,12(sp)
800052f4:	0017f713          	and	a4,a5,1
800052f8:	02070063          	beqz	a4,80005318 <main+0x204>
800052fc:	00c12783          	lw	a5,12(sp)
80005300:	03412503          	lw	a0,52(sp)
80005304:	7ec79603          	lh	a2,2028(a5)
80005308:	7f87a583          	lw	a1,2040(a5)
8000530c:	bedff0ef          	jal	80004ef8 <core_list_init>
80005310:	03c12783          	lw	a5,60(sp)
80005314:	04a12023          	sw	a0,64(sp)
80005318:	0027f713          	and	a4,a5,2
8000531c:	1a071263          	bnez	a4,800054c0 <main+0x3ac>
80005320:	0047f793          	and	a5,a5,4
80005324:	02078863          	beqz	a5,80005354 <main+0x240>
80005328:	00001737          	lui	a4,0x1
8000532c:	fffff7b7          	lui	a5,0xfffff
80005330:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
80005334:	00f70733          	add	a4,a4,a5
80005338:	01010793          	add	a5,sp,16
8000533c:	00f707b3          	add	a5,a4,a5
80005340:	03012603          	lw	a2,48(sp)
80005344:	7ec79583          	lh	a1,2028(a5) # fffff7ec <__stack_base+0x3ffff7ec>
80005348:	03412503          	lw	a0,52(sp)
8000534c:	00f12623          	sw	a5,12(sp)
80005350:	7c9000ef          	jal	80006318 <core_init_state>
80005354:	03812783          	lw	a5,56(sp)
80005358:	0a079263          	bnez	a5,800053fc <main+0x2e8>
8000535c:	a0001737          	lui	a4,0xa0001
80005360:	8b072903          	lw	s2,-1872(a4) # a00008b0 <intpat+0x9c>
80005364:	8b472983          	lw	s3,-1868(a4)
80005368:	00100713          	li	a4,1
8000536c:	fffff7b7          	lui	a5,0xfffff
80005370:	02e12c23          	sw	a4,56(sp)
80005374:	00001737          	lui	a4,0x1
80005378:	7ec78793          	add	a5,a5,2028 # fffff7ec <__stack_base+0x3ffff7ec>
8000537c:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
80005380:	00f70733          	add	a4,a4,a5
80005384:	01010793          	add	a5,sp,16
80005388:	00f707b3          	add	a5,a4,a5
8000538c:	00f12623          	sw	a5,12(sp)
80005390:	03812703          	lw	a4,56(sp)
80005394:	00271793          	sll	a5,a4,0x2
80005398:	00e787b3          	add	a5,a5,a4
8000539c:	00179793          	sll	a5,a5,0x1
800053a0:	02f12c23          	sw	a5,56(sp)
800053a4:	055010ef          	jal	80006bf8 <start_time>
800053a8:	00c12503          	lw	a0,12(sp)
800053ac:	ce1ff0ef          	jal	8000508c <iterate>
800053b0:	061010ef          	jal	80006c10 <stop_time>
800053b4:	075010ef          	jal	80006c28 <get_time>
800053b8:	09d010ef          	jal	80006c54 <time_in_secs>
800053bc:	00090613          	mv	a2,s2
800053c0:	00098693          	mv	a3,s3
800053c4:	00050493          	mv	s1,a0
800053c8:	00058413          	mv	s0,a1
800053cc:	ce8fc0ef          	jal	800018b4 <__ledf2>
800053d0:	fc0540e3          	bltz	a0,80005390 <main+0x27c>
800053d4:	00048513          	mv	a0,s1
800053d8:	00040593          	mv	a1,s0
800053dc:	bccfd0ef          	jal	800027a8 <__fixunsdfsi>
800053e0:	30050663          	beqz	a0,800056ec <main+0x5d8>
800053e4:	00a00793          	li	a5,10
800053e8:	02a7d7b3          	divu	a5,a5,a0
800053ec:	03812703          	lw	a4,56(sp)
800053f0:	00178793          	add	a5,a5,1
800053f4:	02e787b3          	mul	a5,a5,a4
800053f8:	02f12c23          	sw	a5,56(sp)
800053fc:	7fc010ef          	jal	80006bf8 <start_time>
80005400:	00001437          	lui	s0,0x1
80005404:	fffff537          	lui	a0,0xfffff
80005408:	7ec50513          	add	a0,a0,2028 # fffff7ec <__stack_base+0x3ffff7ec>
8000540c:	82040793          	add	a5,s0,-2016 # 820 <__stack_size-0x37e0>
80005410:	00a787b3          	add	a5,a5,a0
80005414:	01010713          	add	a4,sp,16
80005418:	00e78533          	add	a0,a5,a4
8000541c:	c71ff0ef          	jal	8000508c <iterate>
80005420:	7f0010ef          	jal	80006c10 <stop_time>
80005424:	005010ef          	jal	80006c28 <get_time>
80005428:	fffff7b7          	lui	a5,0xfffff
8000542c:	82040713          	add	a4,s0,-2016
80005430:	00f70733          	add	a4,a4,a5
80005434:	01010793          	add	a5,sp,16
80005438:	00f707b3          	add	a5,a4,a5
8000543c:	00050a13          	mv	s4,a0
80005440:	7ec79503          	lh	a0,2028(a5) # fffff7ec <__stack_base+0x3ffff7ec>
80005444:	00058a93          	mv	s5,a1
80005448:	00000593          	li	a1,0
8000544c:	00f12623          	sw	a5,12(sp)
80005450:	70c010ef          	jal	80006b5c <crc16>
80005454:	00c12783          	lw	a5,12(sp)
80005458:	00050593          	mv	a1,a0
8000545c:	7ee79503          	lh	a0,2030(a5)
80005460:	6fc010ef          	jal	80006b5c <crc16>
80005464:	00c12783          	lw	a5,12(sp)
80005468:	00050593          	mv	a1,a0
8000546c:	7f079503          	lh	a0,2032(a5)
80005470:	6ec010ef          	jal	80006b5c <crc16>
80005474:	00050593          	mv	a1,a0
80005478:	03411503          	lh	a0,52(sp)
8000547c:	6e0010ef          	jal	80006b5c <crc16>
80005480:	000087b7          	lui	a5,0x8
80005484:	b0578793          	add	a5,a5,-1275 # 7b05 <__stack_size+0x3b05>
80005488:	00050493          	mv	s1,a0
8000548c:	6af50c63          	beq	a0,a5,80005b44 <main+0xa30>
80005490:	0ca7f263          	bgeu	a5,a0,80005554 <main+0x440>
80005494:	000097b7          	lui	a5,0x9
80005498:	a0278793          	add	a5,a5,-1534 # 8a02 <__stack_size+0x4a02>
8000549c:	68f50a63          	beq	a0,a5,80005b30 <main+0xa1c>
800054a0:	0000f7b7          	lui	a5,0xf
800054a4:	9f578793          	add	a5,a5,-1547 # e9f5 <__stack_size+0xa9f5>
800054a8:	24f51e63          	bne	a0,a5,80005704 <main+0x5f0>
800054ac:	a0000537          	lui	a0,0xa0000
800054b0:	1e450513          	add	a0,a0,484 # a00001e4 <__clz_tab+0x1a8>
800054b4:	c18ff0ef          	jal	800048cc <printf_>
800054b8:	00300c93          	li	s9,3
800054bc:	0c00006f          	j	8000557c <main+0x468>
800054c0:	00001737          	lui	a4,0x1
800054c4:	fffff7b7          	lui	a5,0xfffff
800054c8:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
800054cc:	00f70733          	add	a4,a4,a5
800054d0:	01010793          	add	a5,sp,16
800054d4:	00f707b3          	add	a5,a4,a5
800054d8:	00f12623          	sw	a5,12(sp)
800054dc:	00c12703          	lw	a4,12(sp)
800054e0:	7ee79783          	lh	a5,2030(a5) # fffff7ee <__stack_base+0x3ffff7ee>
800054e4:	03412503          	lw	a0,52(sp)
800054e8:	7ec71603          	lh	a2,2028(a4)
800054ec:	7fc72583          	lw	a1,2044(a4)
800054f0:	01079793          	sll	a5,a5,0x10
800054f4:	00c7e633          	or	a2,a5,a2
800054f8:	04410693          	add	a3,sp,68
800054fc:	670000ef          	jal	80005b6c <core_init_matrix>
80005500:	03c12783          	lw	a5,60(sp)
80005504:	e1dff06f          	j	80005320 <main+0x20c>
80005508:	02d805b3          	mul	a1,a6,a3
8000550c:	00180813          	add	a6,a6,1
80005510:	01081813          	sll	a6,a6,0x10
80005514:	01085813          	srl	a6,a6,0x10
80005518:	00b605b3          	add	a1,a2,a1
8000551c:	00b7a623          	sw	a1,12(a5)
80005520:	dadff06f          	j	800052cc <main+0x1b8>
80005524:	00100713          	li	a4,1
80005528:	d0e798e3          	bne	a5,a4,80005238 <main+0x124>
8000552c:	00c12783          	lw	a5,12(sp)
80005530:	7f079783          	lh	a5,2032(a5)
80005534:	d00792e3          	bnez	a5,80005238 <main+0x124>
80005538:	00c12703          	lw	a4,12(sp)
8000553c:	341537b7          	lui	a5,0x34153
80005540:	41578793          	add	a5,a5,1045 # 34153415 <__stack_size+0x3414f415>
80005544:	7ef72623          	sw	a5,2028(a4)
80005548:	06600793          	li	a5,102
8000554c:	7ef71823          	sh	a5,2032(a4)
80005550:	ce9ff06f          	j	80005238 <main+0x124>
80005554:	000027b7          	lui	a5,0x2
80005558:	8f278793          	add	a5,a5,-1806 # 18f2 <__stack_size-0x270e>
8000555c:	5cf50063          	beq	a0,a5,80005b1c <main+0xa08>
80005560:	000057b7          	lui	a5,0x5
80005564:	eaf78793          	add	a5,a5,-337 # 4eaf <__stack_size+0xeaf>
80005568:	18f51e63          	bne	a0,a5,80005704 <main+0x5f0>
8000556c:	a0000537          	lui	a0,0xa0000
80005570:	1b050513          	add	a0,a0,432 # a00001b0 <__clz_tab+0x174>
80005574:	b58ff0ef          	jal	800048cc <printf_>
80005578:	00200c93          	li	s9,2
8000557c:	a0001db7          	lui	s11,0xa0001
80005580:	8d8da783          	lw	a5,-1832(s11) # a00008d8 <default_num_contexts>
80005584:	5c078a63          	beqz	a5,80005b58 <main+0xa44>
80005588:	000016b7          	lui	a3,0x1
8000558c:	fffff737          	lui	a4,0xfffff
80005590:	82068693          	add	a3,a3,-2016 # 820 <__stack_size-0x37e0>
80005594:	00e686b3          	add	a3,a3,a4
80005598:	a0000b37          	lui	s6,0xa0000
8000559c:	a00009b7          	lui	s3,0xa0000
800055a0:	a0000937          	lui	s2,0xa0000
800055a4:	01010713          	add	a4,sp,16
800055a8:	001c9793          	sll	a5,s9,0x1
800055ac:	00e68733          	add	a4,a3,a4
800055b0:	7d8b0b13          	add	s6,s6,2008 # a00007d8 <list_known_crc>
800055b4:	7cc98993          	add	s3,s3,1996 # a00007cc <matrix_known_crc>
800055b8:	7c090913          	add	s2,s2,1984 # a00007c0 <state_known_crc>
800055bc:	00000d13          	li	s10,0
800055c0:	00000b93          	li	s7,0
800055c4:	00e12623          	sw	a4,12(sp)
800055c8:	00fb0b33          	add	s6,s6,a5
800055cc:	00f989b3          	add	s3,s3,a5
800055d0:	00f90933          	add	s2,s2,a5
800055d4:	0400006f          	j	80005614 <main+0x500>
800055d8:	00c12783          	lw	a5,12(sp)
800055dc:	00878433          	add	s0,a5,s0
800055e0:	000017b7          	lui	a5,0x1
800055e4:	008787b3          	add	a5,a5,s0
800055e8:	82c7d783          	lhu	a5,-2004(a5) # 82c <__stack_size-0x37d4>
800055ec:	001b8b93          	add	s7,s7,1
800055f0:	8d8da703          	lw	a4,-1832(s11)
800055f4:	01a787b3          	add	a5,a5,s10
800055f8:	010b9b93          	sll	s7,s7,0x10
800055fc:	01079413          	sll	s0,a5,0x10
80005600:	01079d13          	sll	s10,a5,0x10
80005604:	010bdb93          	srl	s7,s7,0x10
80005608:	01045413          	srl	s0,s0,0x10
8000560c:	410d5d13          	sra	s10,s10,0x10
80005610:	10ebf263          	bgeu	s7,a4,80005714 <main+0x600>
80005614:	00c12703          	lw	a4,12(sp)
80005618:	004b9413          	sll	s0,s7,0x4
8000561c:	017407b3          	add	a5,s0,s7
80005620:	00279793          	sll	a5,a5,0x2
80005624:	00f707b3          	add	a5,a4,a5
80005628:	00001c37          	lui	s8,0x1
8000562c:	00fc0c33          	add	s8,s8,a5
80005630:	80cc2783          	lw	a5,-2036(s8) # 80c <__stack_size-0x37f4>
80005634:	820c1623          	sh	zero,-2004(s8)
80005638:	0017f713          	and	a4,a5,1
8000563c:	02070863          	beqz	a4,8000566c <main+0x558>
80005640:	826c5603          	lhu	a2,-2010(s8)
80005644:	000b5683          	lhu	a3,0(s6)
80005648:	02d60263          	beq	a2,a3,8000566c <main+0x558>
8000564c:	a0000537          	lui	a0,0xa0000
80005650:	000b8593          	mv	a1,s7
80005654:	24050513          	add	a0,a0,576 # a0000240 <__clz_tab+0x204>
80005658:	a74ff0ef          	jal	800048cc <printf_>
8000565c:	82cc5703          	lhu	a4,-2004(s8)
80005660:	80cc2783          	lw	a5,-2036(s8)
80005664:	00170713          	add	a4,a4,1 # fffff001 <__stack_base+0x3ffff001>
80005668:	82ec1623          	sh	a4,-2004(s8)
8000566c:	0027f713          	and	a4,a5,2
80005670:	04070463          	beqz	a4,800056b8 <main+0x5a4>
80005674:	00c12683          	lw	a3,12(sp)
80005678:	01740733          	add	a4,s0,s7
8000567c:	00271713          	sll	a4,a4,0x2
80005680:	00e68733          	add	a4,a3,a4
80005684:	00001c37          	lui	s8,0x1
80005688:	00ec0c33          	add	s8,s8,a4
8000568c:	828c5603          	lhu	a2,-2008(s8) # 828 <__stack_size-0x37d8>
80005690:	0009d683          	lhu	a3,0(s3)
80005694:	02d60263          	beq	a2,a3,800056b8 <main+0x5a4>
80005698:	a0000537          	lui	a0,0xa0000
8000569c:	000b8593          	mv	a1,s7
800056a0:	27050513          	add	a0,a0,624 # a0000270 <__clz_tab+0x234>
800056a4:	a28ff0ef          	jal	800048cc <printf_>
800056a8:	82cc5703          	lhu	a4,-2004(s8)
800056ac:	80cc2783          	lw	a5,-2036(s8)
800056b0:	00170713          	add	a4,a4,1
800056b4:	82ec1623          	sh	a4,-2004(s8)
800056b8:	01740433          	add	s0,s0,s7
800056bc:	0047f793          	and	a5,a5,4
800056c0:	00241413          	sll	s0,s0,0x2
800056c4:	f0078ae3          	beqz	a5,800055d8 <main+0x4c4>
800056c8:	00c12783          	lw	a5,12(sp)
800056cc:	00095683          	lhu	a3,0(s2)
800056d0:	00878433          	add	s0,a5,s0
800056d4:	000017b7          	lui	a5,0x1
800056d8:	00878433          	add	s0,a5,s0
800056dc:	82a45603          	lhu	a2,-2006(s0)
800056e0:	36d61e63          	bne	a2,a3,80005a5c <main+0x948>
800056e4:	82c45783          	lhu	a5,-2004(s0)
800056e8:	f05ff06f          	j	800055ec <main+0x4d8>
800056ec:	00100513          	li	a0,1
800056f0:	cf5ff06f          	j	800053e4 <main+0x2d0>
800056f4:	00c12703          	lw	a4,12(sp)
800056f8:	06600793          	li	a5,102
800056fc:	7ef71823          	sh	a5,2032(a4)
80005700:	b39ff06f          	j	80005238 <main+0x124>
80005704:	00010437          	lui	s0,0x10
80005708:	fff40413          	add	s0,s0,-1 # ffff <__stack_size+0xbfff>
8000570c:	fff00c93          	li	s9,-1
80005710:	a0001db7          	lui	s11,0xa0001
80005714:	4dc010ef          	jal	80006bf0 <check_data_types>
80005718:	03412583          	lw	a1,52(sp)
8000571c:	008509b3          	add	s3,a0,s0
80005720:	a0000537          	lui	a0,0xa0000
80005724:	2d450513          	add	a0,a0,724 # a00002d4 <__clz_tab+0x298>
80005728:	9a4ff0ef          	jal	800048cc <printf_>
8000572c:	a0000537          	lui	a0,0xa0000
80005730:	000a0593          	mv	a1,s4
80005734:	2ec50513          	add	a0,a0,748 # a00002ec <__clz_tab+0x2b0>
80005738:	994ff0ef          	jal	800048cc <printf_>
8000573c:	000a0513          	mv	a0,s4
80005740:	000a8593          	mv	a1,s5
80005744:	510010ef          	jal	80006c54 <time_in_secs>
80005748:	00050613          	mv	a2,a0
8000574c:	a0000537          	lui	a0,0xa0000
80005750:	00058693          	mv	a3,a1
80005754:	30450513          	add	a0,a0,772 # a0000304 <__clz_tab+0x2c8>
80005758:	974ff0ef          	jal	800048cc <printf_>
8000575c:	000a0513          	mv	a0,s4
80005760:	000a8593          	mv	a1,s5
80005764:	4f0010ef          	jal	80006c54 <time_in_secs>
80005768:	01099993          	sll	s3,s3,0x10
8000576c:	00000613          	li	a2,0
80005770:	00000693          	li	a3,0
80005774:	4109d993          	sra	s3,s3,0x10
80005778:	860fc0ef          	jal	800017d8 <__gedf2>
8000577c:	04a05863          	blez	a0,800057cc <main+0x6b8>
80005780:	8d8da783          	lw	a5,-1832(s11) # a00008d8 <default_num_contexts>
80005784:	03812503          	lw	a0,56(sp)
80005788:	02f50533          	mul	a0,a0,a5
8000578c:	940fd0ef          	jal	800028cc <__floatunsidf>
80005790:	00050913          	mv	s2,a0
80005794:	00058413          	mv	s0,a1
80005798:	000a0513          	mv	a0,s4
8000579c:	000a8593          	mv	a1,s5
800057a0:	4b4010ef          	jal	80006c54 <time_in_secs>
800057a4:	00050613          	mv	a2,a0
800057a8:	00058693          	mv	a3,a1
800057ac:	00090513          	mv	a0,s2
800057b0:	00040593          	mv	a1,s0
800057b4:	8bdfb0ef          	jal	80001070 <__divdf3>
800057b8:	00050613          	mv	a2,a0
800057bc:	a0000537          	lui	a0,0xa0000
800057c0:	00058693          	mv	a3,a1
800057c4:	31c50513          	add	a0,a0,796 # a000031c <__clz_tab+0x2e0>
800057c8:	904ff0ef          	jal	800048cc <printf_>
800057cc:	8d8da783          	lw	a5,-1832(s11)
800057d0:	03812583          	lw	a1,56(sp)
800057d4:	a0000537          	lui	a0,0xa0000
800057d8:	33450513          	add	a0,a0,820 # a0000334 <__clz_tab+0x2f8>
800057dc:	02f585b3          	mul	a1,a1,a5
800057e0:	a0000b37          	lui	s6,0xa0000
800057e4:	a0000bb7          	lui	s7,0xa0000
800057e8:	a0000c37          	lui	s8,0xa0000
800057ec:	8e0ff0ef          	jal	800048cc <printf_>
800057f0:	a0000537          	lui	a0,0xa0000
800057f4:	34cb0593          	add	a1,s6,844 # a000034c <__clz_tab+0x310>
800057f8:	35850513          	add	a0,a0,856 # a0000358 <__clz_tab+0x31c>
800057fc:	8d0ff0ef          	jal	800048cc <printf_>
80005800:	a0000537          	lui	a0,0xa0000
80005804:	370b8593          	add	a1,s7,880 # a0000370 <__clz_tab+0x334>
80005808:	37450513          	add	a0,a0,884 # a0000374 <__clz_tab+0x338>
8000580c:	8c0ff0ef          	jal	800048cc <printf_>
80005810:	a0000537          	lui	a0,0xa0000
80005814:	38cc0593          	add	a1,s8,908 # a000038c <__clz_tab+0x350>
80005818:	39450513          	add	a0,a0,916 # a0000394 <__clz_tab+0x358>
8000581c:	8b0ff0ef          	jal	800048cc <printf_>
80005820:	a0000537          	lui	a0,0xa0000
80005824:	00048593          	mv	a1,s1
80005828:	3ac50513          	add	a0,a0,940 # a00003ac <__clz_tab+0x370>
8000582c:	8a0ff0ef          	jal	800048cc <printf_>
80005830:	03c12783          	lw	a5,60(sp)
80005834:	0017f713          	and	a4,a5,1
80005838:	06070a63          	beqz	a4,800058ac <main+0x798>
8000583c:	8d8da703          	lw	a4,-1832(s11)
80005840:	06070663          	beqz	a4,800058ac <main+0x798>
80005844:	00001737          	lui	a4,0x1
80005848:	fffff7b7          	lui	a5,0xfffff
8000584c:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
80005850:	00f70733          	add	a4,a4,a5
80005854:	01010793          	add	a5,sp,16
80005858:	00f707b3          	add	a5,a4,a5
8000585c:	00000913          	li	s2,0
80005860:	a00004b7          	lui	s1,0xa0000
80005864:	00f12623          	sw	a5,12(sp)
80005868:	00001437          	lui	s0,0x1
8000586c:	00c12703          	lw	a4,12(sp)
80005870:	00491793          	sll	a5,s2,0x4
80005874:	012787b3          	add	a5,a5,s2
80005878:	00279793          	sll	a5,a5,0x2
8000587c:	00f707b3          	add	a5,a4,a5
80005880:	00f407b3          	add	a5,s0,a5
80005884:	8267d603          	lhu	a2,-2010(a5) # ffffe826 <__stack_base+0x3fffe826>
80005888:	00090593          	mv	a1,s2
8000588c:	3c848513          	add	a0,s1,968 # a00003c8 <__clz_tab+0x38c>
80005890:	83cff0ef          	jal	800048cc <printf_>
80005894:	00190913          	add	s2,s2,1
80005898:	8d8da783          	lw	a5,-1832(s11)
8000589c:	01091913          	sll	s2,s2,0x10
800058a0:	01095913          	srl	s2,s2,0x10
800058a4:	fcf964e3          	bltu	s2,a5,8000586c <main+0x758>
800058a8:	03c12783          	lw	a5,60(sp)
800058ac:	0027f713          	and	a4,a5,2
800058b0:	06070a63          	beqz	a4,80005924 <main+0x810>
800058b4:	8d8da703          	lw	a4,-1832(s11)
800058b8:	2a070463          	beqz	a4,80005b60 <main+0xa4c>
800058bc:	00001737          	lui	a4,0x1
800058c0:	fffff7b7          	lui	a5,0xfffff
800058c4:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
800058c8:	00f70733          	add	a4,a4,a5
800058cc:	01010793          	add	a5,sp,16
800058d0:	00f707b3          	add	a5,a4,a5
800058d4:	00000913          	li	s2,0
800058d8:	a00004b7          	lui	s1,0xa0000
800058dc:	00f12623          	sw	a5,12(sp)
800058e0:	00001437          	lui	s0,0x1
800058e4:	00c12703          	lw	a4,12(sp)
800058e8:	00491793          	sll	a5,s2,0x4
800058ec:	012787b3          	add	a5,a5,s2
800058f0:	00279793          	sll	a5,a5,0x2
800058f4:	00f707b3          	add	a5,a4,a5
800058f8:	00f407b3          	add	a5,s0,a5
800058fc:	8287d603          	lhu	a2,-2008(a5) # ffffe828 <__stack_base+0x3fffe828>
80005900:	00090593          	mv	a1,s2
80005904:	3e448513          	add	a0,s1,996 # a00003e4 <__clz_tab+0x3a8>
80005908:	fc5fe0ef          	jal	800048cc <printf_>
8000590c:	00190913          	add	s2,s2,1
80005910:	8d8da783          	lw	a5,-1832(s11)
80005914:	01091913          	sll	s2,s2,0x10
80005918:	01095913          	srl	s2,s2,0x10
8000591c:	fcf964e3          	bltu	s2,a5,800058e4 <main+0x7d0>
80005920:	03c12783          	lw	a5,60(sp)
80005924:	0047f793          	and	a5,a5,4
80005928:	8d8da703          	lw	a4,-1832(s11)
8000592c:	06078663          	beqz	a5,80005998 <main+0x884>
80005930:	0c070663          	beqz	a4,800059fc <main+0x8e8>
80005934:	00001737          	lui	a4,0x1
80005938:	fffff7b7          	lui	a5,0xfffff
8000593c:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
80005940:	00f70733          	add	a4,a4,a5
80005944:	01010793          	add	a5,sp,16
80005948:	00f707b3          	add	a5,a4,a5
8000594c:	00000913          	li	s2,0
80005950:	a00004b7          	lui	s1,0xa0000
80005954:	00f12623          	sw	a5,12(sp)
80005958:	00001437          	lui	s0,0x1
8000595c:	00c12703          	lw	a4,12(sp)
80005960:	00491793          	sll	a5,s2,0x4
80005964:	012787b3          	add	a5,a5,s2
80005968:	00279793          	sll	a5,a5,0x2
8000596c:	00f707b3          	add	a5,a4,a5
80005970:	00f407b3          	add	a5,s0,a5
80005974:	82a7d603          	lhu	a2,-2006(a5) # ffffe82a <__stack_base+0x3fffe82a>
80005978:	00090593          	mv	a1,s2
8000597c:	40048513          	add	a0,s1,1024 # a0000400 <__clz_tab+0x3c4>
80005980:	f4dfe0ef          	jal	800048cc <printf_>
80005984:	00190913          	add	s2,s2,1
80005988:	8d8da783          	lw	a5,-1832(s11)
8000598c:	01091913          	sll	s2,s2,0x10
80005990:	01095913          	srl	s2,s2,0x10
80005994:	fcf964e3          	bltu	s2,a5,8000595c <main+0x848>
80005998:	00001737          	lui	a4,0x1
8000599c:	8d8da783          	lw	a5,-1832(s11)
800059a0:	fffff437          	lui	s0,0xfffff
800059a4:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
800059a8:	00870733          	add	a4,a4,s0
800059ac:	01010693          	add	a3,sp,16
800059b0:	00000d13          	li	s10,0
800059b4:	a0000937          	lui	s2,0xa0000
800059b8:	00d70433          	add	s0,a4,a3
800059bc:	000014b7          	lui	s1,0x1
800059c0:	02078e63          	beqz	a5,800059fc <main+0x8e8>
800059c4:	004d1793          	sll	a5,s10,0x4
800059c8:	01a787b3          	add	a5,a5,s10
800059cc:	00279793          	sll	a5,a5,0x2
800059d0:	00f407b3          	add	a5,s0,a5
800059d4:	00f487b3          	add	a5,s1,a5
800059d8:	8247d603          	lhu	a2,-2012(a5)
800059dc:	000d0593          	mv	a1,s10
800059e0:	41c90513          	add	a0,s2,1052 # a000041c <__clz_tab+0x3e0>
800059e4:	ee9fe0ef          	jal	800048cc <printf_>
800059e8:	001d0d13          	add	s10,s10,1
800059ec:	8d8da783          	lw	a5,-1832(s11)
800059f0:	010d1d13          	sll	s10,s10,0x10
800059f4:	010d5d13          	srl	s10,s10,0x10
800059f8:	fcfd66e3          	bltu	s10,a5,800059c4 <main+0x8b0>
800059fc:	08098c63          	beqz	s3,80005a94 <main+0x980>
80005a00:	09304263          	bgtz	s3,80005a84 <main+0x970>
80005a04:	a0000537          	lui	a0,0xa0000
80005a08:	4ac50513          	add	a0,a0,1196 # a00004ac <__clz_tab+0x470>
80005a0c:	ec1fe0ef          	jal	800048cc <printf_>
80005a10:	05e10513          	add	a0,sp,94
80005a14:	2b0010ef          	jal	80006cc4 <portable_fini>
80005a18:	08010113          	add	sp,sp,128
80005a1c:	7ec12083          	lw	ra,2028(sp)
80005a20:	7e812403          	lw	s0,2024(sp)
80005a24:	7e412483          	lw	s1,2020(sp)
80005a28:	7e012903          	lw	s2,2016(sp)
80005a2c:	7dc12983          	lw	s3,2012(sp)
80005a30:	7d812a03          	lw	s4,2008(sp)
80005a34:	7d412a83          	lw	s5,2004(sp)
80005a38:	7d012b03          	lw	s6,2000(sp)
80005a3c:	7cc12b83          	lw	s7,1996(sp)
80005a40:	7c812c03          	lw	s8,1992(sp)
80005a44:	7c412c83          	lw	s9,1988(sp)
80005a48:	7c012d03          	lw	s10,1984(sp)
80005a4c:	7bc12d83          	lw	s11,1980(sp)
80005a50:	00000513          	li	a0,0
80005a54:	7f010113          	add	sp,sp,2032
80005a58:	00008067          	ret
80005a5c:	a0000537          	lui	a0,0xa0000
80005a60:	000b8593          	mv	a1,s7
80005a64:	2a450513          	add	a0,a0,676 # a00002a4 <__clz_tab+0x268>
80005a68:	e65fe0ef          	jal	800048cc <printf_>
80005a6c:	82c45783          	lhu	a5,-2004(s0) # ffffe82c <__stack_base+0x3fffe82c>
80005a70:	00178793          	add	a5,a5,1
80005a74:	01079793          	sll	a5,a5,0x10
80005a78:	0107d793          	srl	a5,a5,0x10
80005a7c:	82f41623          	sh	a5,-2004(s0)
80005a80:	b6dff06f          	j	800055ec <main+0x4d8>
80005a84:	a0000537          	lui	a0,0xa0000
80005a88:	51050513          	add	a0,a0,1296 # a0000510 <__clz_tab+0x4d4>
80005a8c:	e41fe0ef          	jal	800048cc <printf_>
80005a90:	f81ff06f          	j	80005a10 <main+0x8fc>
80005a94:	a0000537          	lui	a0,0xa0000
80005a98:	43850513          	add	a0,a0,1080 # a0000438 <__clz_tab+0x3fc>
80005a9c:	e31fe0ef          	jal	800048cc <printf_>
80005aa0:	00300793          	li	a5,3
80005aa4:	f6fc96e3          	bne	s9,a5,80005a10 <main+0x8fc>
80005aa8:	8d8da783          	lw	a5,-1832(s11)
80005aac:	03812503          	lw	a0,56(sp)
80005ab0:	02f50533          	mul	a0,a0,a5
80005ab4:	e19fc0ef          	jal	800028cc <__floatunsidf>
80005ab8:	00050493          	mv	s1,a0
80005abc:	00058413          	mv	s0,a1
80005ac0:	000a0513          	mv	a0,s4
80005ac4:	000a8593          	mv	a1,s5
80005ac8:	18c010ef          	jal	80006c54 <time_in_secs>
80005acc:	00050613          	mv	a2,a0
80005ad0:	00058693          	mv	a3,a1
80005ad4:	00048513          	mv	a0,s1
80005ad8:	00040593          	mv	a1,s0
80005adc:	d94fb0ef          	jal	80001070 <__divdf3>
80005ae0:	00050613          	mv	a2,a0
80005ae4:	a0000537          	lui	a0,0xa0000
80005ae8:	00058693          	mv	a3,a1
80005aec:	370b8793          	add	a5,s7,880
80005af0:	34cb0713          	add	a4,s6,844
80005af4:	48450513          	add	a0,a0,1156 # a0000484 <__clz_tab+0x448>
80005af8:	dd5fe0ef          	jal	800048cc <printf_>
80005afc:	a0000537          	lui	a0,0xa0000
80005b00:	38cc0593          	add	a1,s8,908
80005b04:	4a050513          	add	a0,a0,1184 # a00004a0 <__clz_tab+0x464>
80005b08:	dc5fe0ef          	jal	800048cc <printf_>
80005b0c:	a0000537          	lui	a0,0xa0000
80005b10:	4a850513          	add	a0,a0,1192 # a00004a8 <__clz_tab+0x46c>
80005b14:	db9fe0ef          	jal	800048cc <printf_>
80005b18:	ef9ff06f          	j	80005a10 <main+0x8fc>
80005b1c:	a0000537          	lui	a0,0xa0000
80005b20:	21450513          	add	a0,a0,532 # a0000214 <__clz_tab+0x1d8>
80005b24:	da9fe0ef          	jal	800048cc <printf_>
80005b28:	00400c93          	li	s9,4
80005b2c:	a51ff06f          	j	8000557c <main+0x468>
80005b30:	a0000537          	lui	a0,0xa0000
80005b34:	15450513          	add	a0,a0,340 # a0000154 <__clz_tab+0x118>
80005b38:	d95fe0ef          	jal	800048cc <printf_>
80005b3c:	00000c93          	li	s9,0
80005b40:	a3dff06f          	j	8000557c <main+0x468>
80005b44:	a0000537          	lui	a0,0xa0000
80005b48:	18450513          	add	a0,a0,388 # a0000184 <__clz_tab+0x148>
80005b4c:	d81fe0ef          	jal	800048cc <printf_>
80005b50:	00100c93          	li	s9,1
80005b54:	a29ff06f          	j	8000557c <main+0x468>
80005b58:	00000413          	li	s0,0
80005b5c:	bb9ff06f          	j	80005714 <main+0x600>
80005b60:	0047f793          	and	a5,a5,4
80005b64:	e2078ae3          	beqz	a5,80005998 <main+0x884>
80005b68:	e95ff06f          	j	800059fc <main+0x8e8>

80005b6c <core_init_matrix>:
80005b6c:	ff010113          	add	sp,sp,-16
80005b70:	00912423          	sw	s1,8(sp)
80005b74:	01212223          	sw	s2,4(sp)
80005b78:	00050813          	mv	a6,a0
80005b7c:	00061463          	bnez	a2,80005b84 <core_init_matrix+0x18>
80005b80:	00100613          	li	a2,1
80005b84:	00000793          	li	a5,0
80005b88:	10080663          	beqz	a6,80005c94 <core_init_matrix+0x128>
80005b8c:	00078513          	mv	a0,a5
80005b90:	00178793          	add	a5,a5,1
80005b94:	02f78733          	mul	a4,a5,a5
80005b98:	00371713          	sll	a4,a4,0x3
80005b9c:	ff0768e3          	bltu	a4,a6,80005b8c <core_init_matrix+0x20>
80005ba0:	02a502b3          	mul	t0,a0,a0
80005ba4:	fff58593          	add	a1,a1,-1
80005ba8:	ffc5f793          	and	a5,a1,-4
80005bac:	00478493          	add	s1,a5,4
80005bb0:	00050913          	mv	s2,a0
80005bb4:	00048e13          	mv	t3,s1
80005bb8:	00129293          	sll	t0,t0,0x1
80005bbc:	005483b3          	add	t2,s1,t0
80005bc0:	0c050663          	beqz	a0,80005c8c <core_init_matrix+0x120>
80005bc4:	00812623          	sw	s0,12(sp)
80005bc8:	01312023          	sw	s3,0(sp)
80005bcc:	00010eb7          	lui	t4,0x10
80005bd0:	00150313          	add	t1,a0,1
80005bd4:	00151413          	sll	s0,a0,0x1
80005bd8:	00038f13          	mv	t5,t2
80005bdc:	00000f93          	li	t6,0
80005be0:	00100713          	li	a4,1
80005be4:	407e0e33          	sub	t3,t3,t2
80005be8:	fffe8e93          	add	t4,t4,-1 # ffff <__stack_size+0xbfff>
80005bec:	00070993          	mv	s3,a4
80005bf0:	000f0813          	mv	a6,t5
80005bf4:	02e60633          	mul	a2,a2,a4
80005bf8:	01071793          	sll	a5,a4,0x10
80005bfc:	0107d793          	srl	a5,a5,0x10
80005c00:	010e08b3          	add	a7,t3,a6
80005c04:	00280813          	add	a6,a6,2
80005c08:	00170713          	add	a4,a4,1
80005c0c:	41f65593          	sra	a1,a2,0x1f
80005c10:	0105d593          	srl	a1,a1,0x10
80005c14:	00b60633          	add	a2,a2,a1
80005c18:	01d67633          	and	a2,a2,t4
80005c1c:	40b60633          	sub	a2,a2,a1
80005c20:	00c785b3          	add	a1,a5,a2
80005c24:	01059593          	sll	a1,a1,0x10
80005c28:	0105d593          	srl	a1,a1,0x10
80005c2c:	00f587b3          	add	a5,a1,a5
80005c30:	feb81f23          	sh	a1,-2(a6)
80005c34:	0ff7f793          	zext.b	a5,a5
80005c38:	00f89023          	sh	a5,0(a7)
80005c3c:	fa671ce3          	bne	a4,t1,80005bf4 <core_init_matrix+0x88>
80005c40:	001f8f93          	add	t6,t6,1
80005c44:	01350733          	add	a4,a0,s3
80005c48:	00a30333          	add	t1,t1,a0
80005c4c:	008f0f33          	add	t5,t5,s0
80005c50:	f9f51ee3          	bne	a0,t6,80005bec <core_init_matrix+0x80>
80005c54:	00c12403          	lw	s0,12(sp)
80005c58:	00012983          	lw	s3,0(sp)
80005c5c:	005387b3          	add	a5,t2,t0
80005c60:	fff78793          	add	a5,a5,-1
80005c64:	ffc7f793          	and	a5,a5,-4
80005c68:	00478793          	add	a5,a5,4
80005c6c:	0096a223          	sw	s1,4(a3)
80005c70:	0126a023          	sw	s2,0(a3)
80005c74:	0076a423          	sw	t2,8(a3)
80005c78:	00f6a623          	sw	a5,12(a3)
80005c7c:	00812483          	lw	s1,8(sp)
80005c80:	00412903          	lw	s2,4(sp)
80005c84:	01010113          	add	sp,sp,16
80005c88:	00008067          	ret
80005c8c:	00000293          	li	t0,0
80005c90:	fcdff06f          	j	80005c5c <core_init_matrix+0xf0>
80005c94:	fff58593          	add	a1,a1,-1
80005c98:	ffc5f393          	and	t2,a1,-4
80005c9c:	00438e13          	add	t3,t2,4 # ffff8004 <__stack_base+0x3fff8004>
80005ca0:	00812623          	sw	s0,12(sp)
80005ca4:	01312023          	sw	s3,0(sp)
80005ca8:	000e0493          	mv	s1,t3
80005cac:	00638393          	add	t2,t2,6
80005cb0:	fff00913          	li	s2,-1
80005cb4:	00200293          	li	t0,2
80005cb8:	fff00513          	li	a0,-1
80005cbc:	f11ff06f          	j	80005bcc <core_init_matrix+0x60>

80005cc0 <matrix_mul_vect>:
80005cc0:	04050a63          	beqz	a0,80005d14 <matrix_mul_vect+0x54>
80005cc4:	00251f13          	sll	t5,a0,0x2
80005cc8:	00151e13          	sll	t3,a0,0x1
80005ccc:	01e58f33          	add	t5,a1,t5
80005cd0:	01c68e33          	add	t3,a3,t3
80005cd4:	00000e93          	li	t4,0
80005cd8:	001e9813          	sll	a6,t4,0x1
80005cdc:	01060833          	add	a6,a2,a6
80005ce0:	00068793          	mv	a5,a3
80005ce4:	00000893          	li	a7,0
80005ce8:	00081703          	lh	a4,0(a6)
80005cec:	00079303          	lh	t1,0(a5)
80005cf0:	00278793          	add	a5,a5,2
80005cf4:	00280813          	add	a6,a6,2
80005cf8:	02670733          	mul	a4,a4,t1
80005cfc:	00e888b3          	add	a7,a7,a4
80005d00:	fefe14e3          	bne	t3,a5,80005ce8 <matrix_mul_vect+0x28>
80005d04:	0115a023          	sw	a7,0(a1)
80005d08:	00458593          	add	a1,a1,4
80005d0c:	00ae8eb3          	add	t4,t4,a0
80005d10:	fcbf14e3          	bne	t5,a1,80005cd8 <matrix_mul_vect+0x18>
80005d14:	00008067          	ret

80005d18 <matrix_mul_matrix>:
80005d18:	0a050463          	beqz	a0,80005dc0 <matrix_mul_matrix+0xa8>
80005d1c:	ff010113          	add	sp,sp,-16
80005d20:	00050f13          	mv	t5,a0
80005d24:	00151513          	sll	a0,a0,0x1
80005d28:	00812623          	sw	s0,12(sp)
80005d2c:	00058393          	mv	t2,a1
80005d30:	00068413          	mv	s0,a3
80005d34:	00060e93          	mv	t4,a2
80005d38:	00a60833          	add	a6,a2,a0
80005d3c:	00000f93          	li	t6,0
80005d40:	00000293          	li	t0,0
80005d44:	002f9893          	sll	a7,t6,0x2
80005d48:	011388b3          	add	a7,t2,a7
80005d4c:	00040313          	mv	t1,s0
80005d50:	00000e13          	li	t3,0
80005d54:	00030693          	mv	a3,t1
80005d58:	000e8793          	mv	a5,t4
80005d5c:	00000613          	li	a2,0
80005d60:	00079703          	lh	a4,0(a5)
80005d64:	00069583          	lh	a1,0(a3)
80005d68:	00278793          	add	a5,a5,2
80005d6c:	00a686b3          	add	a3,a3,a0
80005d70:	02b70733          	mul	a4,a4,a1
80005d74:	00e60633          	add	a2,a2,a4
80005d78:	fef814e3          	bne	a6,a5,80005d60 <matrix_mul_matrix+0x48>
80005d7c:	00c8a023          	sw	a2,0(a7)
80005d80:	001e0793          	add	a5,t3,1
80005d84:	00488893          	add	a7,a7,4
80005d88:	00230313          	add	t1,t1,2
80005d8c:	00ff0663          	beq	t5,a5,80005d98 <matrix_mul_matrix+0x80>
80005d90:	00078e13          	mv	t3,a5
80005d94:	fc1ff06f          	j	80005d54 <matrix_mul_matrix+0x3c>
80005d98:	00128793          	add	a5,t0,1
80005d9c:	00ae8eb3          	add	t4,t4,a0
80005da0:	01ef8fb3          	add	t6,t6,t5
80005da4:	00a80833          	add	a6,a6,a0
80005da8:	01c28663          	beq	t0,t3,80005db4 <matrix_mul_matrix+0x9c>
80005dac:	00078293          	mv	t0,a5
80005db0:	f95ff06f          	j	80005d44 <matrix_mul_matrix+0x2c>
80005db4:	00c12403          	lw	s0,12(sp)
80005db8:	01010113          	add	sp,sp,16
80005dbc:	00008067          	ret
80005dc0:	00008067          	ret

80005dc4 <matrix_mul_matrix_bitextract>:
80005dc4:	0a050e63          	beqz	a0,80005e80 <matrix_mul_matrix_bitextract+0xbc>
80005dc8:	ff010113          	add	sp,sp,-16
80005dcc:	00050f13          	mv	t5,a0
80005dd0:	00151513          	sll	a0,a0,0x1
80005dd4:	00812623          	sw	s0,12(sp)
80005dd8:	00058393          	mv	t2,a1
80005ddc:	00068413          	mv	s0,a3
80005de0:	00060e93          	mv	t4,a2
80005de4:	00a60833          	add	a6,a2,a0
80005de8:	00000f93          	li	t6,0
80005dec:	00000293          	li	t0,0
80005df0:	002f9893          	sll	a7,t6,0x2
80005df4:	011388b3          	add	a7,t2,a7
80005df8:	00040313          	mv	t1,s0
80005dfc:	00000e13          	li	t3,0
80005e00:	00030613          	mv	a2,t1
80005e04:	000e8693          	mv	a3,t4
80005e08:	00000593          	li	a1,0
80005e0c:	00061703          	lh	a4,0(a2)
80005e10:	00069783          	lh	a5,0(a3)
80005e14:	00268693          	add	a3,a3,2
80005e18:	00a60633          	add	a2,a2,a0
80005e1c:	02e787b3          	mul	a5,a5,a4
80005e20:	4027d713          	sra	a4,a5,0x2
80005e24:	4057d793          	sra	a5,a5,0x5
80005e28:	00f77713          	and	a4,a4,15
80005e2c:	07f7f793          	and	a5,a5,127
80005e30:	02f707b3          	mul	a5,a4,a5
80005e34:	00f585b3          	add	a1,a1,a5
80005e38:	fcd81ae3          	bne	a6,a3,80005e0c <matrix_mul_matrix_bitextract+0x48>
80005e3c:	00b8a023          	sw	a1,0(a7)
80005e40:	001e0793          	add	a5,t3,1
80005e44:	00488893          	add	a7,a7,4
80005e48:	00230313          	add	t1,t1,2
80005e4c:	00ff0663          	beq	t5,a5,80005e58 <matrix_mul_matrix_bitextract+0x94>
80005e50:	00078e13          	mv	t3,a5
80005e54:	fadff06f          	j	80005e00 <matrix_mul_matrix_bitextract+0x3c>
80005e58:	00128793          	add	a5,t0,1
80005e5c:	00ae8eb3          	add	t4,t4,a0
80005e60:	01ef8fb3          	add	t6,t6,t5
80005e64:	00a80833          	add	a6,a6,a0
80005e68:	01c28663          	beq	t0,t3,80005e74 <matrix_mul_matrix_bitextract+0xb0>
80005e6c:	00078293          	mv	t0,a5
80005e70:	f81ff06f          	j	80005df0 <matrix_mul_matrix_bitextract+0x2c>
80005e74:	00c12403          	lw	s0,12(sp)
80005e78:	01010113          	add	sp,sp,16
80005e7c:	00008067          	ret
80005e80:	00008067          	ret

80005e84 <matrix_test>:
80005e84:	fc010113          	add	sp,sp,-64
80005e88:	02812c23          	sw	s0,56(sp)
80005e8c:	02912a23          	sw	s1,52(sp)
80005e90:	03612023          	sw	s6,32(sp)
80005e94:	02112e23          	sw	ra,60(sp)
80005e98:	03212823          	sw	s2,48(sp)
80005e9c:	00058b13          	mv	s6,a1
80005ea0:	00060413          	mv	s0,a2
80005ea4:	00068493          	mv	s1,a3
80005ea8:	3a050c63          	beqz	a0,80006260 <matrix_test+0x3dc>
80005eac:	00151f13          	sll	t5,a0,0x1
80005eb0:	03312623          	sw	s3,44(sp)
80005eb4:	01912a23          	sw	s9,20(sp)
80005eb8:	01e605b3          	add	a1,a2,t5
80005ebc:	40a00cb3          	neg	s9,a0
80005ec0:	01071993          	sll	s3,a4,0x10
80005ec4:	01b12623          	sw	s11,12(sp)
80005ec8:	03412423          	sw	s4,40(sp)
80005ecc:	03512223          	sw	s5,36(sp)
80005ed0:	01712e23          	sw	s7,28(sp)
80005ed4:	01812c23          	sw	s8,24(sp)
80005ed8:	01a12823          	sw	s10,16(sp)
80005edc:	00050d93          	mv	s11,a0
80005ee0:	0109d993          	srl	s3,s3,0x10
80005ee4:	00058613          	mv	a2,a1
80005ee8:	00000813          	li	a6,0
80005eec:	002c9893          	sll	a7,s9,0x2
80005ef0:	41e60333          	sub	t1,a2,t5
80005ef4:	00030793          	mv	a5,t1
80005ef8:	0007d683          	lhu	a3,0(a5)
80005efc:	00278793          	add	a5,a5,2
80005f00:	00d986b3          	add	a3,s3,a3
80005f04:	fed79f23          	sh	a3,-2(a5)
80005f08:	fec798e3          	bne	a5,a2,80005ef8 <matrix_test+0x74>
80005f0c:	00180513          	add	a0,a6,1
80005f10:	41130633          	sub	a2,t1,a7
80005f14:	00ad8663          	beq	s11,a0,80005f20 <matrix_test+0x9c>
80005f18:	00050813          	mv	a6,a0
80005f1c:	fd5ff06f          	j	80005ef0 <matrix_test+0x6c>
80005f20:	00000e13          	li	t3,0
80005f24:	00000e93          	li	t4,0
80005f28:	41e58333          	sub	t1,a1,t5
80005f2c:	002e1613          	sll	a2,t3,0x2
80005f30:	01660633          	add	a2,a2,s6
80005f34:	00030793          	mv	a5,t1
80005f38:	00079683          	lh	a3,0(a5)
80005f3c:	00460613          	add	a2,a2,4
80005f40:	00278793          	add	a5,a5,2
80005f44:	02e686b3          	mul	a3,a3,a4
80005f48:	fed62e23          	sw	a3,-4(a2)
80005f4c:	feb796e3          	bne	a5,a1,80005f38 <matrix_test+0xb4>
80005f50:	001e8793          	add	a5,t4,1
80005f54:	00ae0e33          	add	t3,t3,a0
80005f58:	411305b3          	sub	a1,t1,a7
80005f5c:	010e8663          	beq	t4,a6,80005f68 <matrix_test+0xe4>
80005f60:	00078e93          	mv	t4,a5
80005f64:	fc5ff06f          	j	80005f28 <matrix_test+0xa4>
80005f68:	40a00e33          	neg	t3,a0
80005f6c:	fffff7b7          	lui	a5,0xfffff
80005f70:	00f76933          	or	s2,a4,a5
80005f74:	411b0333          	sub	t1,s6,a7
80005f78:	00000513          	li	a0,0
80005f7c:	00000713          	li	a4,0
80005f80:	00000613          	li	a2,0
80005f84:	00000f13          	li	t5,0
80005f88:	003e1e13          	sll	t3,t3,0x3
80005f8c:	01130eb3          	add	t4,t1,a7
80005f90:	000e8793          	mv	a5,t4
80005f94:	0140006f          	j	80005fa8 <matrix_test+0x124>
80005f98:	01051513          	sll	a0,a0,0x10
80005f9c:	00478793          	add	a5,a5,4 # fffff004 <__stack_base+0x3ffff004>
80005fa0:	41055513          	sra	a0,a0,0x10
80005fa4:	02678e63          	beq	a5,t1,80005fe0 <matrix_test+0x15c>
80005fa8:	00070693          	mv	a3,a4
80005fac:	0007a703          	lw	a4,0(a5)
80005fb0:	01051513          	sll	a0,a0,0x10
80005fb4:	01055513          	srl	a0,a0,0x10
80005fb8:	00e6a6b3          	slt	a3,a3,a4
80005fbc:	00e60633          	add	a2,a2,a4
80005fc0:	00a50593          	add	a1,a0,10
80005fc4:	00d50533          	add	a0,a0,a3
80005fc8:	fcc958e3          	bge	s2,a2,80005f98 <matrix_test+0x114>
80005fcc:	01059513          	sll	a0,a1,0x10
80005fd0:	00478793          	add	a5,a5,4
80005fd4:	41055513          	sra	a0,a0,0x10
80005fd8:	00000613          	li	a2,0
80005fdc:	fc6796e3          	bne	a5,t1,80005fa8 <matrix_test+0x124>
80005fe0:	001f0793          	add	a5,t5,1
80005fe4:	41ce8333          	sub	t1,t4,t3
80005fe8:	01e80663          	beq	a6,t5,80005ff4 <matrix_test+0x170>
80005fec:	00078f13          	mv	t5,a5
80005ff0:	f9dff06f          	j	80005f8c <matrix_test+0x108>
80005ff4:	00000593          	li	a1,0
80005ff8:	365000ef          	jal	80006b5c <crc16>
80005ffc:	00040613          	mv	a2,s0
80006000:	00050b93          	mv	s7,a0
80006004:	00048693          	mv	a3,s1
80006008:	000d8513          	mv	a0,s11
8000600c:	000b0593          	mv	a1,s6
80006010:	002d9a13          	sll	s4,s11,0x2
80006014:	cadff0ef          	jal	80005cc0 <matrix_mul_vect>
80006018:	014b0a33          	add	s4,s6,s4
8000601c:	002c9c13          	sll	s8,s9,0x2
80006020:	000a0813          	mv	a6,s4
80006024:	00000513          	li	a0,0
80006028:	00000713          	li	a4,0
8000602c:	00000613          	li	a2,0
80006030:	00000a93          	li	s5,0
80006034:	003c9c93          	sll	s9,s9,0x3
80006038:	010c08b3          	add	a7,s8,a6
8000603c:	00088793          	mv	a5,a7
80006040:	0140006f          	j	80006054 <matrix_test+0x1d0>
80006044:	01051513          	sll	a0,a0,0x10
80006048:	00478793          	add	a5,a5,4
8000604c:	41055513          	sra	a0,a0,0x10
80006050:	03078e63          	beq	a5,a6,8000608c <matrix_test+0x208>
80006054:	00070693          	mv	a3,a4
80006058:	0007a703          	lw	a4,0(a5)
8000605c:	01051513          	sll	a0,a0,0x10
80006060:	01055513          	srl	a0,a0,0x10
80006064:	00e6a6b3          	slt	a3,a3,a4
80006068:	00e60633          	add	a2,a2,a4
8000606c:	00a50593          	add	a1,a0,10
80006070:	00d50533          	add	a0,a0,a3
80006074:	fcc958e3          	bge	s2,a2,80006044 <matrix_test+0x1c0>
80006078:	01059513          	sll	a0,a1,0x10
8000607c:	00478793          	add	a5,a5,4
80006080:	41055513          	sra	a0,a0,0x10
80006084:	00000613          	li	a2,0
80006088:	fd0796e3          	bne	a5,a6,80006054 <matrix_test+0x1d0>
8000608c:	001a8d13          	add	s10,s5,1
80006090:	41988833          	sub	a6,a7,s9
80006094:	01ad8663          	beq	s11,s10,800060a0 <matrix_test+0x21c>
80006098:	000d0a93          	mv	s5,s10
8000609c:	f9dff06f          	j	80006038 <matrix_test+0x1b4>
800060a0:	000b8593          	mv	a1,s7
800060a4:	2b9000ef          	jal	80006b5c <crc16>
800060a8:	00040613          	mv	a2,s0
800060ac:	00050b93          	mv	s7,a0
800060b0:	00048693          	mv	a3,s1
800060b4:	000d0513          	mv	a0,s10
800060b8:	000b0593          	mv	a1,s6
800060bc:	c5dff0ef          	jal	80005d18 <matrix_mul_matrix>
800060c0:	000a0813          	mv	a6,s4
800060c4:	00000513          	li	a0,0
800060c8:	00000713          	li	a4,0
800060cc:	00000613          	li	a2,0
800060d0:	00000313          	li	t1,0
800060d4:	018808b3          	add	a7,a6,s8
800060d8:	00088793          	mv	a5,a7
800060dc:	0140006f          	j	800060f0 <matrix_test+0x26c>
800060e0:	01051513          	sll	a0,a0,0x10
800060e4:	00478793          	add	a5,a5,4
800060e8:	41055513          	sra	a0,a0,0x10
800060ec:	02f80e63          	beq	a6,a5,80006128 <matrix_test+0x2a4>
800060f0:	00070693          	mv	a3,a4
800060f4:	0007a703          	lw	a4,0(a5)
800060f8:	01051513          	sll	a0,a0,0x10
800060fc:	01055513          	srl	a0,a0,0x10
80006100:	00e6a6b3          	slt	a3,a3,a4
80006104:	00e60633          	add	a2,a2,a4
80006108:	00a50593          	add	a1,a0,10
8000610c:	00d50533          	add	a0,a0,a3
80006110:	fcc958e3          	bge	s2,a2,800060e0 <matrix_test+0x25c>
80006114:	01059513          	sll	a0,a1,0x10
80006118:	00478793          	add	a5,a5,4
8000611c:	41055513          	sra	a0,a0,0x10
80006120:	00000613          	li	a2,0
80006124:	fcf816e3          	bne	a6,a5,800060f0 <matrix_test+0x26c>
80006128:	00130793          	add	a5,t1,1
8000612c:	41988833          	sub	a6,a7,s9
80006130:	01530663          	beq	t1,s5,8000613c <matrix_test+0x2b8>
80006134:	00078313          	mv	t1,a5
80006138:	f9dff06f          	j	800060d4 <matrix_test+0x250>
8000613c:	000b8593          	mv	a1,s7
80006140:	21d000ef          	jal	80006b5c <crc16>
80006144:	00050793          	mv	a5,a0
80006148:	00048693          	mv	a3,s1
8000614c:	00040613          	mv	a2,s0
80006150:	000d0513          	mv	a0,s10
80006154:	000b0593          	mv	a1,s6
80006158:	00078493          	mv	s1,a5
8000615c:	c69ff0ef          	jal	80005dc4 <matrix_mul_matrix_bitextract>
80006160:	00000513          	li	a0,0
80006164:	00000713          	li	a4,0
80006168:	00000613          	li	a2,0
8000616c:	00000893          	li	a7,0
80006170:	014c0833          	add	a6,s8,s4
80006174:	00080793          	mv	a5,a6
80006178:	0140006f          	j	8000618c <matrix_test+0x308>
8000617c:	01051513          	sll	a0,a0,0x10
80006180:	00478793          	add	a5,a5,4
80006184:	41055513          	sra	a0,a0,0x10
80006188:	02fa0e63          	beq	s4,a5,800061c4 <matrix_test+0x340>
8000618c:	00070693          	mv	a3,a4
80006190:	0007a703          	lw	a4,0(a5)
80006194:	01051513          	sll	a0,a0,0x10
80006198:	01055513          	srl	a0,a0,0x10
8000619c:	00e6a6b3          	slt	a3,a3,a4
800061a0:	00e60633          	add	a2,a2,a4
800061a4:	00a50593          	add	a1,a0,10
800061a8:	00d50533          	add	a0,a0,a3
800061ac:	fcc958e3          	bge	s2,a2,8000617c <matrix_test+0x2f8>
800061b0:	01059513          	sll	a0,a1,0x10
800061b4:	00478793          	add	a5,a5,4
800061b8:	41055513          	sra	a0,a0,0x10
800061bc:	00000613          	li	a2,0
800061c0:	fcfa16e3          	bne	s4,a5,8000618c <matrix_test+0x308>
800061c4:	00188793          	add	a5,a7,1
800061c8:	41980a33          	sub	s4,a6,s9
800061cc:	01588663          	beq	a7,s5,800061d8 <matrix_test+0x354>
800061d0:	00078893          	mv	a7,a5
800061d4:	f9dff06f          	j	80006170 <matrix_test+0x2ec>
800061d8:	00048593          	mv	a1,s1
800061dc:	181000ef          	jal	80006b5c <crc16>
800061e0:	001d1d13          	sll	s10,s10,0x1
800061e4:	01a40433          	add	s0,s0,s10
800061e8:	00000613          	li	a2,0
800061ec:	41a406b3          	sub	a3,s0,s10
800061f0:	00068793          	mv	a5,a3
800061f4:	0007d703          	lhu	a4,0(a5)
800061f8:	00278793          	add	a5,a5,2
800061fc:	41370733          	sub	a4,a4,s3
80006200:	fee79f23          	sh	a4,-2(a5)
80006204:	fe8798e3          	bne	a5,s0,800061f4 <matrix_test+0x370>
80006208:	00160793          	add	a5,a2,1
8000620c:	41868433          	sub	s0,a3,s8
80006210:	01560663          	beq	a2,s5,8000621c <matrix_test+0x398>
80006214:	00078613          	mv	a2,a5
80006218:	fd5ff06f          	j	800061ec <matrix_test+0x368>
8000621c:	02c12983          	lw	s3,44(sp)
80006220:	02812a03          	lw	s4,40(sp)
80006224:	02412a83          	lw	s5,36(sp)
80006228:	01c12b83          	lw	s7,28(sp)
8000622c:	01812c03          	lw	s8,24(sp)
80006230:	01412c83          	lw	s9,20(sp)
80006234:	01012d03          	lw	s10,16(sp)
80006238:	00c12d83          	lw	s11,12(sp)
8000623c:	03c12083          	lw	ra,60(sp)
80006240:	03812403          	lw	s0,56(sp)
80006244:	01051513          	sll	a0,a0,0x10
80006248:	03412483          	lw	s1,52(sp)
8000624c:	03012903          	lw	s2,48(sp)
80006250:	02012b03          	lw	s6,32(sp)
80006254:	41055513          	sra	a0,a0,0x10
80006258:	04010113          	add	sp,sp,64
8000625c:	00008067          	ret
80006260:	00000593          	li	a1,0
80006264:	0f9000ef          	jal	80006b5c <crc16>
80006268:	00048693          	mv	a3,s1
8000626c:	00040613          	mv	a2,s0
80006270:	00050913          	mv	s2,a0
80006274:	000b0593          	mv	a1,s6
80006278:	00000513          	li	a0,0
8000627c:	a45ff0ef          	jal	80005cc0 <matrix_mul_vect>
80006280:	00090593          	mv	a1,s2
80006284:	00000513          	li	a0,0
80006288:	0d5000ef          	jal	80006b5c <crc16>
8000628c:	00048693          	mv	a3,s1
80006290:	00040613          	mv	a2,s0
80006294:	00050913          	mv	s2,a0
80006298:	000b0593          	mv	a1,s6
8000629c:	00000513          	li	a0,0
800062a0:	a79ff0ef          	jal	80005d18 <matrix_mul_matrix>
800062a4:	00090593          	mv	a1,s2
800062a8:	00000513          	li	a0,0
800062ac:	0b1000ef          	jal	80006b5c <crc16>
800062b0:	00050793          	mv	a5,a0
800062b4:	00040613          	mv	a2,s0
800062b8:	000b0593          	mv	a1,s6
800062bc:	00048693          	mv	a3,s1
800062c0:	00000513          	li	a0,0
800062c4:	00078413          	mv	s0,a5
800062c8:	afdff0ef          	jal	80005dc4 <matrix_mul_matrix_bitextract>
800062cc:	00040593          	mv	a1,s0
800062d0:	00000513          	li	a0,0
800062d4:	089000ef          	jal	80006b5c <crc16>
800062d8:	f65ff06f          	j	8000623c <matrix_test+0x3b8>

800062dc <core_bench_matrix>:
800062dc:	ff010113          	add	sp,sp,-16
800062e0:	00812423          	sw	s0,8(sp)
800062e4:	00852683          	lw	a3,8(a0)
800062e8:	00060413          	mv	s0,a2
800062ec:	00058713          	mv	a4,a1
800062f0:	00452603          	lw	a2,4(a0)
800062f4:	00c52583          	lw	a1,12(a0)
800062f8:	00052503          	lw	a0,0(a0)
800062fc:	00112623          	sw	ra,12(sp)
80006300:	b85ff0ef          	jal	80005e84 <matrix_test>
80006304:	00040593          	mv	a1,s0
80006308:	00812403          	lw	s0,8(sp)
8000630c:	00c12083          	lw	ra,12(sp)
80006310:	01010113          	add	sp,sp,16
80006314:	0490006f          	j	80006b5c <crc16>

80006318 <core_init_state>:
80006318:	ff010113          	add	sp,sp,-16
8000631c:	01212223          	sw	s2,4(sp)
80006320:	fff50893          	add	a7,a0,-1
80006324:	00100793          	li	a5,1
80006328:	00060813          	mv	a6,a2
8000632c:	1717fa63          	bgeu	a5,a7,800064a0 <core_init_state+0x188>
80006330:	00158593          	add	a1,a1,1
80006334:	01059693          	sll	a3,a1,0x10
80006338:	0106d693          	srl	a3,a3,0x10
8000633c:	a0000f37          	lui	t5,0xa0000
80006340:	a0000eb7          	lui	t4,0xa0000
80006344:	a0001e37          	lui	t3,0xa0001
80006348:	a0001337          	lui	t1,0xa0001
8000634c:	0036d793          	srl	a5,a3,0x3
80006350:	00812623          	sw	s0,12(sp)
80006354:	00912423          	sw	s1,8(sp)
80006358:	01312023          	sw	s3,0(sp)
8000635c:	00700613          	li	a2,7
80006360:	0076f393          	and	t2,a3,7
80006364:	00000913          	li	s2,0
80006368:	7e4f0f13          	add	t5,t5,2020 # a00007e4 <errpat>
8000636c:	00400593          	li	a1,4
80006370:	7f4e8e93          	add	t4,t4,2036 # a00007f4 <scipat>
80006374:	00100f93          	li	t6,1
80006378:	804e0e13          	add	t3,t3,-2044 # a0000804 <floatpat>
8000637c:	81430313          	add	t1,t1,-2028 # a0000814 <intpat>
80006380:	02c00293          	li	t0,44
80006384:	0037f793          	and	a5,a5,3
80006388:	06c38e63          	beq	t2,a2,80006404 <core_init_state+0xec>
8000638c:	0c75e863          	bltu	a1,t2,8000645c <core_init_state+0x144>
80006390:	ffd38393          	add	t2,t2,-3
80006394:	01039393          	sll	t2,t2,0x10
80006398:	0103d393          	srl	t2,t2,0x10
8000639c:	00279793          	sll	a5,a5,0x2
800063a0:	0a7fe663          	bltu	t6,t2,8000644c <core_init_state+0x134>
800063a4:	00fe07b3          	add	a5,t3,a5
800063a8:	0007a783          	lw	a5,0(a5)
800063ac:	00800413          	li	s0,8
800063b0:	00190393          	add	t2,s2,1
800063b4:	008389b3          	add	s3,t2,s0
800063b8:	0719f463          	bgeu	s3,a7,80006420 <core_init_state+0x108>
800063bc:	01280933          	add	s2,a6,s2
800063c0:	00090713          	mv	a4,s2
800063c4:	008784b3          	add	s1,a5,s0
800063c8:	0007c383          	lbu	t2,0(a5)
800063cc:	00178793          	add	a5,a5,1
800063d0:	00170713          	add	a4,a4,1
800063d4:	fe770fa3          	sb	t2,-1(a4)
800063d8:	fef498e3          	bne	s1,a5,800063c8 <core_init_state+0xb0>
800063dc:	00168693          	add	a3,a3,1
800063e0:	01069693          	sll	a3,a3,0x10
800063e4:	00890733          	add	a4,s2,s0
800063e8:	0106d693          	srl	a3,a3,0x10
800063ec:	0036d793          	srl	a5,a3,0x3
800063f0:	00570023          	sb	t0,0(a4)
800063f4:	0076f393          	and	t2,a3,7
800063f8:	00098913          	mv	s2,s3
800063fc:	0037f793          	and	a5,a5,3
80006400:	f8c396e3          	bne	t2,a2,8000638c <core_init_state+0x74>
80006404:	00279793          	sll	a5,a5,0x2
80006408:	00800413          	li	s0,8
8000640c:	00190393          	add	t2,s2,1
80006410:	00ff07b3          	add	a5,t5,a5
80006414:	008389b3          	add	s3,t2,s0
80006418:	0007a783          	lw	a5,0(a5)
8000641c:	fb19e0e3          	bltu	s3,a7,800063bc <core_init_state+0xa4>
80006420:	06a97463          	bgeu	s2,a0,80006488 <core_init_state+0x170>
80006424:	00c12403          	lw	s0,12(sp)
80006428:	00812483          	lw	s1,8(sp)
8000642c:	00012983          	lw	s3,0(sp)
80006430:	00100613          	li	a2,1
80006434:	02757e63          	bgeu	a0,t2,80006470 <core_init_state+0x158>
80006438:	01280533          	add	a0,a6,s2
8000643c:	00412903          	lw	s2,4(sp)
80006440:	00000593          	li	a1,0
80006444:	01010113          	add	sp,sp,16
80006448:	f70fc06f          	j	80002bb8 <memset>
8000644c:	00f307b3          	add	a5,t1,a5
80006450:	0007a783          	lw	a5,0(a5)
80006454:	00400413          	li	s0,4
80006458:	f59ff06f          	j	800063b0 <core_init_state+0x98>
8000645c:	00279793          	sll	a5,a5,0x2
80006460:	00fe87b3          	add	a5,t4,a5
80006464:	0007a783          	lw	a5,0(a5)
80006468:	00800413          	li	s0,8
8000646c:	f45ff06f          	j	800063b0 <core_init_state+0x98>
80006470:	41250633          	sub	a2,a0,s2
80006474:	01280533          	add	a0,a6,s2
80006478:	00412903          	lw	s2,4(sp)
8000647c:	00000593          	li	a1,0
80006480:	01010113          	add	sp,sp,16
80006484:	f34fc06f          	j	80002bb8 <memset>
80006488:	00c12403          	lw	s0,12(sp)
8000648c:	00812483          	lw	s1,8(sp)
80006490:	00012983          	lw	s3,0(sp)
80006494:	00412903          	lw	s2,4(sp)
80006498:	01010113          	add	sp,sp,16
8000649c:	00008067          	ret
800064a0:	00000913          	li	s2,0
800064a4:	00100393          	li	t2,1
800064a8:	f89ff06f          	j	80006430 <core_init_state+0x118>

800064ac <core_state_transition>:
800064ac:	00052783          	lw	a5,0(a0)
800064b0:	00050813          	mv	a6,a0
800064b4:	0007c703          	lbu	a4,0(a5)
800064b8:	28070263          	beqz	a4,8000673c <core_state_transition+0x290>
800064bc:	02c00693          	li	a3,44
800064c0:	00000513          	li	a0,0
800064c4:	20d70a63          	beq	a4,a3,800066d8 <core_state_transition+0x22c>
800064c8:	02e00513          	li	a0,46
800064cc:	22a70663          	beq	a4,a0,800066f8 <core_state_transition+0x24c>
800064d0:	1ce56a63          	bltu	a0,a4,800066a4 <core_state_transition+0x1f8>
800064d4:	fd570713          	add	a4,a4,-43
800064d8:	0fd77713          	and	a4,a4,253
800064dc:	02070663          	beqz	a4,80006508 <core_state_transition+0x5c>
800064e0:	0045a683          	lw	a3,4(a1)
800064e4:	0005a703          	lw	a4,0(a1)
800064e8:	00178793          	add	a5,a5,1
800064ec:	00168693          	add	a3,a3,1
800064f0:	00170713          	add	a4,a4,1
800064f4:	00d5a223          	sw	a3,4(a1)
800064f8:	00e5a023          	sw	a4,0(a1)
800064fc:	00100513          	li	a0,1
80006500:	00f82023          	sw	a5,0(a6)
80006504:	00008067          	ret
80006508:	0005a703          	lw	a4,0(a1)
8000650c:	00178613          	add	a2,a5,1
80006510:	00170713          	add	a4,a4,1
80006514:	00e5a023          	sw	a4,0(a1)
80006518:	0017c883          	lbu	a7,1(a5)
8000651c:	26088663          	beqz	a7,80006788 <core_state_transition+0x2dc>
80006520:	20d88663          	beq	a7,a3,8000672c <core_state_transition+0x280>
80006524:	0085a683          	lw	a3,8(a1)
80006528:	fd088713          	add	a4,a7,-48
8000652c:	0ff77713          	zext.b	a4,a4
80006530:	00900313          	li	t1,9
80006534:	00168693          	add	a3,a3,1
80006538:	00e37e63          	bgeu	t1,a4,80006554 <core_state_transition+0xa8>
8000653c:	1ea88463          	beq	a7,a0,80006724 <core_state_transition+0x278>
80006540:	00d5a423          	sw	a3,8(a1)
80006544:	00278793          	add	a5,a5,2
80006548:	00100513          	li	a0,1
8000654c:	00f82023          	sw	a5,0(a6)
80006550:	00008067          	ret
80006554:	00d5a423          	sw	a3,8(a1)
80006558:	00164783          	lbu	a5,1(a2)
8000655c:	00160613          	add	a2,a2,1
80006560:	1e078263          	beqz	a5,80006744 <core_state_transition+0x298>
80006564:	02c00713          	li	a4,44
80006568:	16e78463          	beq	a5,a4,800066d0 <core_state_transition+0x224>
8000656c:	02e00713          	li	a4,46
80006570:	02e78863          	beq	a5,a4,800065a0 <core_state_transition+0xf4>
80006574:	fd078793          	add	a5,a5,-48
80006578:	0ff7f793          	zext.b	a5,a5
8000657c:	00900713          	li	a4,9
80006580:	fcf77ce3          	bgeu	a4,a5,80006558 <core_state_transition+0xac>
80006584:	0105a703          	lw	a4,16(a1)
80006588:	00160793          	add	a5,a2,1
8000658c:	00100513          	li	a0,1
80006590:	00170713          	add	a4,a4,1
80006594:	00e5a823          	sw	a4,16(a1)
80006598:	00f82023          	sw	a5,0(a6)
8000659c:	00008067          	ret
800065a0:	0105a783          	lw	a5,16(a1)
800065a4:	00178793          	add	a5,a5,1
800065a8:	00f5a823          	sw	a5,16(a1)
800065ac:	0140006f          	j	800065c0 <core_state_transition+0x114>
800065b0:	fd078793          	add	a5,a5,-48
800065b4:	0ff7f793          	zext.b	a5,a5
800065b8:	00900713          	li	a4,9
800065bc:	12f76263          	bltu	a4,a5,800066e0 <core_state_transition+0x234>
800065c0:	00164783          	lbu	a5,1(a2)
800065c4:	00160613          	add	a2,a2,1
800065c8:	1a078a63          	beqz	a5,8000677c <core_state_transition+0x2d0>
800065cc:	02c00713          	li	a4,44
800065d0:	14e78263          	beq	a5,a4,80006714 <core_state_transition+0x268>
800065d4:	0df7f713          	and	a4,a5,223
800065d8:	04500693          	li	a3,69
800065dc:	fcd71ae3          	bne	a4,a3,800065b0 <core_state_transition+0x104>
800065e0:	0145a703          	lw	a4,20(a1)
800065e4:	00160793          	add	a5,a2,1
800065e8:	00300513          	li	a0,3
800065ec:	00170713          	add	a4,a4,1
800065f0:	00e5aa23          	sw	a4,20(a1)
800065f4:	00164703          	lbu	a4,1(a2)
800065f8:	f00704e3          	beqz	a4,80006500 <core_state_transition+0x54>
800065fc:	02c00693          	li	a3,44
80006600:	14d70863          	beq	a4,a3,80006750 <core_state_transition+0x2a4>
80006604:	00c5a783          	lw	a5,12(a1)
80006608:	fd570713          	add	a4,a4,-43
8000660c:	0fd77713          	and	a4,a4,253
80006610:	00178793          	add	a5,a5,1
80006614:	00f5a623          	sw	a5,12(a1)
80006618:	00100513          	li	a0,1
8000661c:	00260793          	add	a5,a2,2
80006620:	ee0710e3          	bnez	a4,80006500 <core_state_transition+0x54>
80006624:	00264703          	lbu	a4,2(a2)
80006628:	00260793          	add	a5,a2,2
8000662c:	00600513          	li	a0,6
80006630:	ec0708e3          	beqz	a4,80006500 <core_state_transition+0x54>
80006634:	12d70463          	beq	a4,a3,8000675c <core_state_transition+0x2b0>
80006638:	0185a683          	lw	a3,24(a1)
8000663c:	fd070713          	add	a4,a4,-48
80006640:	0ff77713          	zext.b	a4,a4
80006644:	00168693          	add	a3,a3,1
80006648:	00900513          	li	a0,9
8000664c:	00d5ac23          	sw	a3,24(a1)
80006650:	00e57a63          	bgeu	a0,a4,80006664 <core_state_transition+0x1b8>
80006654:	00360793          	add	a5,a2,3
80006658:	00100513          	li	a0,1
8000665c:	00f82023          	sw	a5,0(a6)
80006660:	00008067          	ret
80006664:	00900613          	li	a2,9
80006668:	0017c683          	lbu	a3,1(a5)
8000666c:	00078513          	mv	a0,a5
80006670:	02c00893          	li	a7,44
80006674:	fd068713          	add	a4,a3,-48
80006678:	00178793          	add	a5,a5,1
8000667c:	0ff77713          	zext.b	a4,a4
80006680:	0e068463          	beqz	a3,80006768 <core_state_transition+0x2bc>
80006684:	0f168663          	beq	a3,a7,80006770 <core_state_transition+0x2c4>
80006688:	fee670e3          	bgeu	a2,a4,80006668 <core_state_transition+0x1bc>
8000668c:	0045a703          	lw	a4,4(a1)
80006690:	00250793          	add	a5,a0,2
80006694:	00100513          	li	a0,1
80006698:	00170713          	add	a4,a4,1
8000669c:	00e5a223          	sw	a4,4(a1)
800066a0:	e61ff06f          	j	80006500 <core_state_transition+0x54>
800066a4:	fd070713          	add	a4,a4,-48
800066a8:	0ff77713          	zext.b	a4,a4
800066ac:	00900613          	li	a2,9
800066b0:	e2e668e3          	bltu	a2,a4,800064e0 <core_state_transition+0x34>
800066b4:	0005a703          	lw	a4,0(a1)
800066b8:	00178613          	add	a2,a5,1
800066bc:	00170713          	add	a4,a4,1
800066c0:	00e5a023          	sw	a4,0(a1)
800066c4:	0017c783          	lbu	a5,1(a5)
800066c8:	06078e63          	beqz	a5,80006744 <core_state_transition+0x298>
800066cc:	ead790e3          	bne	a5,a3,8000656c <core_state_transition+0xc0>
800066d0:	00060793          	mv	a5,a2
800066d4:	00400513          	li	a0,4
800066d8:	00178793          	add	a5,a5,1
800066dc:	e25ff06f          	j	80006500 <core_state_transition+0x54>
800066e0:	0145a703          	lw	a4,20(a1)
800066e4:	00160793          	add	a5,a2,1
800066e8:	00100513          	li	a0,1
800066ec:	00170713          	add	a4,a4,1
800066f0:	00e5aa23          	sw	a4,20(a1)
800066f4:	e0dff06f          	j	80006500 <core_state_transition+0x54>
800066f8:	0005a703          	lw	a4,0(a1)
800066fc:	00178613          	add	a2,a5,1
80006700:	00170713          	add	a4,a4,1
80006704:	00e5a023          	sw	a4,0(a1)
80006708:	0017c783          	lbu	a5,1(a5)
8000670c:	06078863          	beqz	a5,8000677c <core_state_transition+0x2d0>
80006710:	ecd792e3          	bne	a5,a3,800065d4 <core_state_transition+0x128>
80006714:	00060793          	mv	a5,a2
80006718:	00500513          	li	a0,5
8000671c:	00178793          	add	a5,a5,1
80006720:	de1ff06f          	j	80006500 <core_state_transition+0x54>
80006724:	00d5a423          	sw	a3,8(a1)
80006728:	e99ff06f          	j	800065c0 <core_state_transition+0x114>
8000672c:	00060793          	mv	a5,a2
80006730:	00200513          	li	a0,2
80006734:	00178793          	add	a5,a5,1
80006738:	dc9ff06f          	j	80006500 <core_state_transition+0x54>
8000673c:	00000513          	li	a0,0
80006740:	dc1ff06f          	j	80006500 <core_state_transition+0x54>
80006744:	00060793          	mv	a5,a2
80006748:	00400513          	li	a0,4
8000674c:	db5ff06f          	j	80006500 <core_state_transition+0x54>
80006750:	00300513          	li	a0,3
80006754:	00178793          	add	a5,a5,1
80006758:	da9ff06f          	j	80006500 <core_state_transition+0x54>
8000675c:	00600513          	li	a0,6
80006760:	00178793          	add	a5,a5,1
80006764:	d9dff06f          	j	80006500 <core_state_transition+0x54>
80006768:	00700513          	li	a0,7
8000676c:	d95ff06f          	j	80006500 <core_state_transition+0x54>
80006770:	00700513          	li	a0,7
80006774:	00178793          	add	a5,a5,1
80006778:	d89ff06f          	j	80006500 <core_state_transition+0x54>
8000677c:	00060793          	mv	a5,a2
80006780:	00500513          	li	a0,5
80006784:	d7dff06f          	j	80006500 <core_state_transition+0x54>
80006788:	00060793          	mv	a5,a2
8000678c:	00200513          	li	a0,2
80006790:	d71ff06f          	j	80006500 <core_state_transition+0x54>

80006794 <core_bench_state>:
80006794:	f8010113          	add	sp,sp,-128
80006798:	06812c23          	sw	s0,120(sp)
8000679c:	06912a23          	sw	s1,116(sp)
800067a0:	07212823          	sw	s2,112(sp)
800067a4:	07312623          	sw	s3,108(sp)
800067a8:	07412423          	sw	s4,104(sp)
800067ac:	07512223          	sw	s5,100(sp)
800067b0:	07612023          	sw	s6,96(sp)
800067b4:	05712e23          	sw	s7,92(sp)
800067b8:	06112e23          	sw	ra,124(sp)
800067bc:	00058413          	mv	s0,a1
800067c0:	0005c583          	lbu	a1,0(a1)
800067c4:	00812623          	sw	s0,12(sp)
800067c8:	02012823          	sw	zero,48(sp)
800067cc:	00012823          	sw	zero,16(sp)
800067d0:	02012a23          	sw	zero,52(sp)
800067d4:	02012c23          	sw	zero,56(sp)
800067d8:	02012e23          	sw	zero,60(sp)
800067dc:	04012023          	sw	zero,64(sp)
800067e0:	04012223          	sw	zero,68(sp)
800067e4:	04012423          	sw	zero,72(sp)
800067e8:	04012623          	sw	zero,76(sp)
800067ec:	00012a23          	sw	zero,20(sp)
800067f0:	00012c23          	sw	zero,24(sp)
800067f4:	00012e23          	sw	zero,28(sp)
800067f8:	02012023          	sw	zero,32(sp)
800067fc:	02012223          	sw	zero,36(sp)
80006800:	02012423          	sw	zero,40(sp)
80006804:	02012623          	sw	zero,44(sp)
80006808:	03010913          	add	s2,sp,48
8000680c:	00050b93          	mv	s7,a0
80006810:	00060b13          	mv	s6,a2
80006814:	00068a13          	mv	s4,a3
80006818:	00070993          	mv	s3,a4
8000681c:	00078493          	mv	s1,a5
80006820:	00c10a93          	add	s5,sp,12
80006824:	12058063          	beqz	a1,80006944 <core_bench_state+0x1b0>
80006828:	00090593          	mv	a1,s2
8000682c:	000a8513          	mv	a0,s5
80006830:	c7dff0ef          	jal	800064ac <core_state_transition>
80006834:	00251813          	sll	a6,a0,0x2
80006838:	05080793          	add	a5,a6,80
8000683c:	00278833          	add	a6,a5,sp
80006840:	00c12703          	lw	a4,12(sp)
80006844:	fc082783          	lw	a5,-64(a6)
80006848:	00074703          	lbu	a4,0(a4)
8000684c:	00178793          	add	a5,a5,1
80006850:	fcf82023          	sw	a5,-64(a6)
80006854:	fc071ae3          	bnez	a4,80006828 <core_bench_state+0x94>
80006858:	00812623          	sw	s0,12(sp)
8000685c:	01740bb3          	add	s7,s0,s7
80006860:	03747863          	bgeu	s0,s7,80006890 <core_bench_state+0xfc>
80006864:	00040793          	mv	a5,s0
80006868:	02c00613          	li	a2,44
8000686c:	0007c703          	lbu	a4,0(a5)
80006870:	016746b3          	xor	a3,a4,s6
80006874:	00c70463          	beq	a4,a2,8000687c <core_bench_state+0xe8>
80006878:	00d78023          	sb	a3,0(a5)
8000687c:	013787b3          	add	a5,a5,s3
80006880:	ff77e6e3          	bltu	a5,s7,8000686c <core_bench_state+0xd8>
80006884:	00044783          	lbu	a5,0(s0)
80006888:	00c10a93          	add	s5,sp,12
8000688c:	02078a63          	beqz	a5,800068c0 <core_bench_state+0x12c>
80006890:	00090593          	mv	a1,s2
80006894:	000a8513          	mv	a0,s5
80006898:	c15ff0ef          	jal	800064ac <core_state_transition>
8000689c:	00251613          	sll	a2,a0,0x2
800068a0:	05060793          	add	a5,a2,80
800068a4:	00278633          	add	a2,a5,sp
800068a8:	00c12703          	lw	a4,12(sp)
800068ac:	fc062783          	lw	a5,-64(a2)
800068b0:	00074703          	lbu	a4,0(a4)
800068b4:	00178793          	add	a5,a5,1
800068b8:	fcf62023          	sw	a5,-64(a2)
800068bc:	fc071ae3          	bnez	a4,80006890 <core_bench_state+0xfc>
800068c0:	00812623          	sw	s0,12(sp)
800068c4:	00040613          	mv	a2,s0
800068c8:	02c00693          	li	a3,44
800068cc:	01747e63          	bgeu	s0,s7,800068e8 <core_bench_state+0x154>
800068d0:	00064783          	lbu	a5,0(a2)
800068d4:	0147c733          	xor	a4,a5,s4
800068d8:	00d78463          	beq	a5,a3,800068e0 <core_bench_state+0x14c>
800068dc:	00e60023          	sb	a4,0(a2)
800068e0:	01360633          	add	a2,a2,s3
800068e4:	ff7666e3          	bltu	a2,s7,800068d0 <core_bench_state+0x13c>
800068e8:	01010413          	add	s0,sp,16
800068ec:	00090993          	mv	s3,s2
800068f0:	00042503          	lw	a0,0(s0)
800068f4:	00048593          	mv	a1,s1
800068f8:	00440413          	add	s0,s0,4
800068fc:	144000ef          	jal	80006a40 <crcu32>
80006900:	00050593          	mv	a1,a0
80006904:	0009a503          	lw	a0,0(s3)
80006908:	00498993          	add	s3,s3,4
8000690c:	134000ef          	jal	80006a40 <crcu32>
80006910:	00050493          	mv	s1,a0
80006914:	fc891ee3          	bne	s2,s0,800068f0 <core_bench_state+0x15c>
80006918:	07c12083          	lw	ra,124(sp)
8000691c:	07812403          	lw	s0,120(sp)
80006920:	07412483          	lw	s1,116(sp)
80006924:	07012903          	lw	s2,112(sp)
80006928:	06c12983          	lw	s3,108(sp)
8000692c:	06812a03          	lw	s4,104(sp)
80006930:	06412a83          	lw	s5,100(sp)
80006934:	06012b03          	lw	s6,96(sp)
80006938:	05c12b83          	lw	s7,92(sp)
8000693c:	08010113          	add	sp,sp,128
80006940:	00008067          	ret
80006944:	00a40bb3          	add	s7,s0,a0
80006948:	f1746ee3          	bltu	s0,s7,80006864 <core_bench_state+0xd0>
8000694c:	f9dff06f          	j	800068e8 <core_bench_state+0x154>

80006950 <get_seed_32>:
80006950:	00500793          	li	a5,5
80006954:	04a7ec63          	bltu	a5,a0,800069ac <get_seed_32+0x5c>
80006958:	a00017b7          	lui	a5,0xa0001
8000695c:	82478793          	add	a5,a5,-2012 # a0000824 <intpat+0x10>
80006960:	00251513          	sll	a0,a0,0x2
80006964:	00f50533          	add	a0,a0,a5
80006968:	00052783          	lw	a5,0(a0)
8000696c:	00078067          	jr	a5
80006970:	a00017b7          	lui	a5,0xa0001
80006974:	9007a503          	lw	a0,-1792(a5) # a0000900 <seed5_volatile>
80006978:	00008067          	ret
8000697c:	a00017b7          	lui	a5,0xa0001
80006980:	9087a503          	lw	a0,-1784(a5) # a0000908 <seed1_volatile>
80006984:	00008067          	ret
80006988:	a00017b7          	lui	a5,0xa0001
8000698c:	9047a503          	lw	a0,-1788(a5) # a0000904 <seed2_volatile>
80006990:	00008067          	ret
80006994:	a00017b7          	lui	a5,0xa0001
80006998:	8e07a503          	lw	a0,-1824(a5) # a00008e0 <seed3_volatile>
8000699c:	00008067          	ret
800069a0:	a00017b7          	lui	a5,0xa0001
800069a4:	8dc7a503          	lw	a0,-1828(a5) # a00008dc <seed4_volatile>
800069a8:	00008067          	ret
800069ac:	00000513          	li	a0,0
800069b0:	00008067          	ret

800069b4 <crcu16>:
800069b4:	00050693          	mv	a3,a0
800069b8:	ffffa837          	lui	a6,0xffffa
800069bc:	00058513          	mv	a0,a1
800069c0:	0ff6f613          	zext.b	a2,a3
800069c4:	00800713          	li	a4,8
800069c8:	00180813          	add	a6,a6,1 # ffffa001 <__stack_base+0x3fffa001>
800069cc:	00a647b3          	xor	a5,a2,a0
800069d0:	0017f793          	and	a5,a5,1
800069d4:	40f007b3          	neg	a5,a5
800069d8:	00155513          	srl	a0,a0,0x1
800069dc:	0107f7b3          	and	a5,a5,a6
800069e0:	fff70713          	add	a4,a4,-1
800069e4:	00a7c7b3          	xor	a5,a5,a0
800069e8:	01079513          	sll	a0,a5,0x10
800069ec:	0ff77713          	zext.b	a4,a4
800069f0:	00165613          	srl	a2,a2,0x1
800069f4:	01055513          	srl	a0,a0,0x10
800069f8:	fc071ae3          	bnez	a4,800069cc <crcu16+0x18>
800069fc:	ffffa637          	lui	a2,0xffffa
80006a00:	0086d693          	srl	a3,a3,0x8
80006a04:	00800713          	li	a4,8
80006a08:	00160613          	add	a2,a2,1 # ffffa001 <__stack_base+0x3fffa001>
80006a0c:	00a6c7b3          	xor	a5,a3,a0
80006a10:	0017f793          	and	a5,a5,1
80006a14:	40f007b3          	neg	a5,a5
80006a18:	00155513          	srl	a0,a0,0x1
80006a1c:	00c7f7b3          	and	a5,a5,a2
80006a20:	fff70713          	add	a4,a4,-1
80006a24:	00a7c7b3          	xor	a5,a5,a0
80006a28:	01079513          	sll	a0,a5,0x10
80006a2c:	0ff77713          	zext.b	a4,a4
80006a30:	0016d693          	srl	a3,a3,0x1
80006a34:	01055513          	srl	a0,a0,0x10
80006a38:	fc071ae3          	bnez	a4,80006a0c <crcu16+0x58>
80006a3c:	00008067          	ret

80006a40 <crcu32>:
80006a40:	00050693          	mv	a3,a0
80006a44:	ffffa837          	lui	a6,0xffffa
80006a48:	01069613          	sll	a2,a3,0x10
80006a4c:	00058513          	mv	a0,a1
80006a50:	01065613          	srl	a2,a2,0x10
80006a54:	0ff6f593          	zext.b	a1,a3
80006a58:	00800713          	li	a4,8
80006a5c:	00180813          	add	a6,a6,1 # ffffa001 <__stack_base+0x3fffa001>
80006a60:	00a5c7b3          	xor	a5,a1,a0
80006a64:	0017f793          	and	a5,a5,1
80006a68:	40f007b3          	neg	a5,a5
80006a6c:	00155513          	srl	a0,a0,0x1
80006a70:	0107f7b3          	and	a5,a5,a6
80006a74:	fff70713          	add	a4,a4,-1
80006a78:	00a7c7b3          	xor	a5,a5,a0
80006a7c:	01079513          	sll	a0,a5,0x10
80006a80:	0ff77713          	zext.b	a4,a4
80006a84:	0015d593          	srl	a1,a1,0x1
80006a88:	01055513          	srl	a0,a0,0x10
80006a8c:	fc071ae3          	bnez	a4,80006a60 <crcu32+0x20>
80006a90:	ffffa5b7          	lui	a1,0xffffa
80006a94:	00865613          	srl	a2,a2,0x8
80006a98:	00800713          	li	a4,8
80006a9c:	00158593          	add	a1,a1,1 # ffffa001 <__stack_base+0x3fffa001>
80006aa0:	00a647b3          	xor	a5,a2,a0
80006aa4:	0017f793          	and	a5,a5,1
80006aa8:	40f007b3          	neg	a5,a5
80006aac:	00155513          	srl	a0,a0,0x1
80006ab0:	00b7f7b3          	and	a5,a5,a1
80006ab4:	fff70713          	add	a4,a4,-1
80006ab8:	00a7c7b3          	xor	a5,a5,a0
80006abc:	01079513          	sll	a0,a5,0x10
80006ac0:	0ff77713          	zext.b	a4,a4
80006ac4:	00165613          	srl	a2,a2,0x1
80006ac8:	01055513          	srl	a0,a0,0x10
80006acc:	fc071ae3          	bnez	a4,80006aa0 <crcu32+0x60>
80006ad0:	0106d613          	srl	a2,a3,0x10
80006ad4:	ffffa5b7          	lui	a1,0xffffa
80006ad8:	00060693          	mv	a3,a2
80006adc:	00800713          	li	a4,8
80006ae0:	0ff67613          	zext.b	a2,a2
80006ae4:	00158593          	add	a1,a1,1 # ffffa001 <__stack_base+0x3fffa001>
80006ae8:	00a647b3          	xor	a5,a2,a0
80006aec:	0017f793          	and	a5,a5,1
80006af0:	40f007b3          	neg	a5,a5
80006af4:	00155513          	srl	a0,a0,0x1
80006af8:	00b7f7b3          	and	a5,a5,a1
80006afc:	fff70713          	add	a4,a4,-1
80006b00:	00a7c7b3          	xor	a5,a5,a0
80006b04:	01079513          	sll	a0,a5,0x10
80006b08:	0ff77713          	zext.b	a4,a4
80006b0c:	00165613          	srl	a2,a2,0x1
80006b10:	01055513          	srl	a0,a0,0x10
80006b14:	fc071ae3          	bnez	a4,80006ae8 <crcu32+0xa8>
80006b18:	ffffa637          	lui	a2,0xffffa
80006b1c:	0086d693          	srl	a3,a3,0x8
80006b20:	00800713          	li	a4,8
80006b24:	00160613          	add	a2,a2,1 # ffffa001 <__stack_base+0x3fffa001>
80006b28:	00a6c7b3          	xor	a5,a3,a0
80006b2c:	0017f793          	and	a5,a5,1
80006b30:	40f007b3          	neg	a5,a5
80006b34:	00155513          	srl	a0,a0,0x1
80006b38:	00c7f7b3          	and	a5,a5,a2
80006b3c:	fff70713          	add	a4,a4,-1
80006b40:	00a7c7b3          	xor	a5,a5,a0
80006b44:	01079513          	sll	a0,a5,0x10
80006b48:	0ff77713          	zext.b	a4,a4
80006b4c:	0016d693          	srl	a3,a3,0x1
80006b50:	01055513          	srl	a0,a0,0x10
80006b54:	fc071ae3          	bnez	a4,80006b28 <crcu32+0xe8>
80006b58:	00008067          	ret

80006b5c <crc16>:
80006b5c:	00050693          	mv	a3,a0
80006b60:	01069613          	sll	a2,a3,0x10
80006b64:	ffffa837          	lui	a6,0xffffa
80006b68:	00058513          	mv	a0,a1
80006b6c:	01065613          	srl	a2,a2,0x10
80006b70:	0ff6f693          	zext.b	a3,a3
80006b74:	00800713          	li	a4,8
80006b78:	00180813          	add	a6,a6,1 # ffffa001 <__stack_base+0x3fffa001>
80006b7c:	00a6c7b3          	xor	a5,a3,a0
80006b80:	0017f793          	and	a5,a5,1
80006b84:	40f007b3          	neg	a5,a5
80006b88:	00155513          	srl	a0,a0,0x1
80006b8c:	0107f7b3          	and	a5,a5,a6
80006b90:	fff70713          	add	a4,a4,-1
80006b94:	00a7c7b3          	xor	a5,a5,a0
80006b98:	01079513          	sll	a0,a5,0x10
80006b9c:	0ff77713          	zext.b	a4,a4
80006ba0:	0016d693          	srl	a3,a3,0x1
80006ba4:	01055513          	srl	a0,a0,0x10
80006ba8:	fc071ae3          	bnez	a4,80006b7c <crc16+0x20>
80006bac:	ffffa5b7          	lui	a1,0xffffa
80006bb0:	00865693          	srl	a3,a2,0x8
80006bb4:	00800713          	li	a4,8
80006bb8:	00158593          	add	a1,a1,1 # ffffa001 <__stack_base+0x3fffa001>
80006bbc:	00a6c7b3          	xor	a5,a3,a0
80006bc0:	0017f793          	and	a5,a5,1
80006bc4:	40f007b3          	neg	a5,a5
80006bc8:	00155513          	srl	a0,a0,0x1
80006bcc:	00b7f7b3          	and	a5,a5,a1
80006bd0:	fff70713          	add	a4,a4,-1
80006bd4:	00a7c7b3          	xor	a5,a5,a0
80006bd8:	01079513          	sll	a0,a5,0x10
80006bdc:	0ff77713          	zext.b	a4,a4
80006be0:	0016d693          	srl	a3,a3,0x1
80006be4:	01055513          	srl	a0,a0,0x10
80006be8:	fc071ae3          	bnez	a4,80006bbc <crc16+0x60>
80006bec:	00008067          	ret

80006bf0 <check_data_types>:
80006bf0:	00000513          	li	a0,0
80006bf4:	00008067          	ret

80006bf8 <start_time>:
80006bf8:	b00026f3          	csrr	a3,mcycle
80006bfc:	b8002773          	csrr	a4,mcycleh
80006c00:	a00017b7          	lui	a5,0xa0001
80006c04:	8ed7ac23          	sw	a3,-1800(a5) # a00008f8 <start_time_val>
80006c08:	8ee7ae23          	sw	a4,-1796(a5)
80006c0c:	00008067          	ret

80006c10 <stop_time>:
80006c10:	b00026f3          	csrr	a3,mcycle
80006c14:	b8002773          	csrr	a4,mcycleh
80006c18:	a00017b7          	lui	a5,0xa0001
80006c1c:	8ed7a823          	sw	a3,-1808(a5) # a00008f0 <stop_time_val>
80006c20:	8ee7aa23          	sw	a4,-1804(a5)
80006c24:	00008067          	ret

80006c28 <get_time>:
80006c28:	a00016b7          	lui	a3,0xa0001
80006c2c:	a0001737          	lui	a4,0xa0001
80006c30:	8f06a783          	lw	a5,-1808(a3) # a00008f0 <stop_time_val>
80006c34:	8f872503          	lw	a0,-1800(a4) # a00008f8 <start_time_val>
80006c38:	8f46a583          	lw	a1,-1804(a3)
80006c3c:	8fc72703          	lw	a4,-1796(a4)
80006c40:	40a78533          	sub	a0,a5,a0
80006c44:	00a7b7b3          	sltu	a5,a5,a0
80006c48:	40e585b3          	sub	a1,a1,a4
80006c4c:	40f585b3          	sub	a1,a1,a5
80006c50:	00008067          	ret

80006c54 <time_in_secs>:
80006c54:	ff010113          	add	sp,sp,-16
80006c58:	00112623          	sw	ra,12(sp)
80006c5c:	cf1fb0ef          	jal	8000294c <__floatundidf>
80006c60:	a00017b7          	lui	a5,0xa0001
80006c64:	8c87a603          	lw	a2,-1848(a5) # a00008c8 <intpat+0xb4>
80006c68:	8cc7a683          	lw	a3,-1844(a5)
80006c6c:	c04fa0ef          	jal	80001070 <__divdf3>
80006c70:	00c12083          	lw	ra,12(sp)
80006c74:	01010113          	add	sp,sp,16
80006c78:	00008067          	ret

80006c7c <_putchar>:
80006c7c:	00050593          	mv	a1,a0
80006c80:	a0001537          	lui	a0,0xa0001
80006c84:	8e850513          	add	a0,a0,-1816 # a00008e8 <uart_element>
80006c88:	814fc06f          	j	80002c9c <uart_put_char>

80006c8c <portable_init>:
80006c8c:	ff010113          	add	sp,sp,-16
80006c90:	00812423          	sw	s0,8(sp)
80006c94:	00050413          	mv	s0,a0
80006c98:	a0001537          	lui	a0,0xa0001
80006c9c:	c00015b7          	lui	a1,0xc0001
80006ca0:	8e850513          	add	a0,a0,-1816 # a00008e8 <uart_element>
80006ca4:	00112623          	sw	ra,12(sp)
80006ca8:	fedfb0ef          	jal	80002c94 <uart_init>
80006cac:	00100793          	li	a5,1
80006cb0:	00f40023          	sb	a5,0(s0)
80006cb4:	00c12083          	lw	ra,12(sp)
80006cb8:	00812403          	lw	s0,8(sp)
80006cbc:	01010113          	add	sp,sp,16
80006cc0:	00008067          	ret

80006cc4 <portable_fini>:
80006cc4:	00050023          	sb	zero,0(a0)
80006cc8:	00008067          	ret
