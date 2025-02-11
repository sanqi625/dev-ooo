
/tools/hurj/riscv-proj/hello_world_backup/build/coremark.elf:     file format elf32-littleriscv


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
80000088:	90828293          	add	t0,t0,-1784 # a000098c <__bss_end>
8000008c:	20001317          	auipc	t1,0x20001
80000090:	90030313          	add	t1,t1,-1792 # a000098c <__bss_end>

80000094 <clear_bss_loop>:
80000094:	0002a023          	sw	zero,0(t0)
80000098:	00428293          	add	t0,t0,4
8000009c:	fe62cce3          	blt	t0,t1,80000094 <clear_bss_loop>
800000a0:	20001297          	auipc	t0,0x20001
800000a4:	8c428293          	add	t0,t0,-1852 # a0000964 <__sbss_start>
800000a8:	20001317          	auipc	t1,0x20001
800000ac:	8e430313          	add	t1,t1,-1820 # a000098c <__bss_end>

800000b0 <clear_sbss_loop>:
800000b0:	0002a023          	sw	zero,0(t0)
800000b4:	00428293          	add	t0,t0,4
800000b8:	fe62cce3          	blt	t0,t1,800000b0 <clear_sbss_loop>
800000bc:	674050ef          	jal	80005730 <main>
800000c0:	67d040ef          	jal	80004f3c <to_host>
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
800000e4:	07858593          	add	a1,a1,120 # a0000078 <__clz_tab>
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
80000380:	07878793          	add	a5,a5,120 # a0000078 <__clz_tab>
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
8000050c:	07888893          	add	a7,a7,120 # a0000078 <__clz_tab>
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
80000730:	07888893          	add	a7,a7,120 # a0000078 <__clz_tab>
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
80000ea8:	2e0020ef          	jal	80003188 <__clzsi2>
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
80000f20:	268020ef          	jal	80003188 <__clzsi2>
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
80001168:	020020ef          	jal	80003188 <__clzsi2>
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
8000119c:	7ed010ef          	jal	80003188 <__clzsi2>
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
8000120c:	77d010ef          	jal	80003188 <__clzsi2>
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
80001248:	741010ef          	jal	80003188 <__clzsi2>
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
8000151c:	fff68f13          	add	t5,a3,-1 # 9fffffff <portable_fini+0x1fff8c9f>
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
80001c44:	544010ef          	jal	80003188 <__clzsi2>
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
80001c7c:	50c010ef          	jal	80003188 <__clzsi2>
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
80001ce8:	4a0010ef          	jal	80003188 <__clzsi2>
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
80001d24:	464010ef          	jal	80003188 <__clzsi2>
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
80002560:	429000ef          	jal	80003188 <__clzsi2>
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
800025d8:	3b1000ef          	jal	80003188 <__clzsi2>
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
8000284c:	13d000ef          	jal	80003188 <__clzsi2>
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
800028e0:	0a9000ef          	jal	80003188 <__clzsi2>
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
80002984:	005000ef          	jal	80003188 <__clzsi2>
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
80002a04:	784000ef          	jal	80003188 <__clzsi2>
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
80002a34:	71c000ef          	jal	80003150 <__ashldi3>
80002a38:	00b56533          	or	a0,a0,a1
80002a3c:	00800613          	li	a2,8
80002a40:	00a03433          	snez	s0,a0
80002a44:	00090593          	mv	a1,s2
80002a48:	00048513          	mv	a0,s1
80002a4c:	41360633          	sub	a2,a2,s3
80002a50:	6c8000ef          	jal	80003118 <__lshrdi3>
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

80002afc <__divsf3>:
#include "soft-fp.h"
#include "single.h"

SFtype
__divsf3 (SFtype a, SFtype b)
{
80002afc:	fe010113          	add	sp,sp,-32
80002b00:	00912a23          	sw	s1,20(sp)
80002b04:	01755493          	srl	s1,a0,0x17
80002b08:	01212823          	sw	s2,16(sp)
80002b0c:	01312623          	sw	s3,12(sp)
80002b10:	01412423          	sw	s4,8(sp)
  FP_DECL_S (B);
  FP_DECL_S (R);
  SFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_S (A, a);
80002b14:	00951993          	sll	s3,a0,0x9
{
80002b18:	00112e23          	sw	ra,28(sp)
80002b1c:	00812c23          	sw	s0,24(sp)
80002b20:	01512223          	sw	s5,4(sp)
80002b24:	0ff4f493          	zext.b	s1,s1
80002b28:	00058a13          	mv	s4,a1
  FP_UNPACK_S (A, a);
80002b2c:	0099d993          	srl	s3,s3,0x9
80002b30:	01f55913          	srl	s2,a0,0x1f
80002b34:	08048463          	beqz	s1,80002bbc <__divsf3+0xc0>
80002b38:	0ff00793          	li	a5,255
80002b3c:	0af48063          	beq	s1,a5,80002bdc <__divsf3+0xe0>
80002b40:	00399993          	sll	s3,s3,0x3
80002b44:	040007b7          	lui	a5,0x4000
80002b48:	00f9e9b3          	or	s3,s3,a5
80002b4c:	f8148493          	add	s1,s1,-127
80002b50:	00000a93          	li	s5,0
  FP_UNPACK_S (B, b);
80002b54:	017a5793          	srl	a5,s4,0x17
80002b58:	009a1413          	sll	s0,s4,0x9
80002b5c:	0ff7f793          	zext.b	a5,a5
80002b60:	00945413          	srl	s0,s0,0x9
80002b64:	01fa5a13          	srl	s4,s4,0x1f
80002b68:	08078a63          	beqz	a5,80002bfc <__divsf3+0x100>
80002b6c:	0ff00713          	li	a4,255
80002b70:	0ae78663          	beq	a5,a4,80002c1c <__divsf3+0x120>
80002b74:	00341413          	sll	s0,s0,0x3
80002b78:	04000737          	lui	a4,0x4000
80002b7c:	00e46433          	or	s0,s0,a4
80002b80:	f8178793          	add	a5,a5,-127 # 3ffff81 <__stack_size+0x3ffbf81>
80002b84:	00000713          	li	a4,0
  FP_DIV_S (R, A, B);
80002b88:	40f484b3          	sub	s1,s1,a5
80002b8c:	002a9793          	sll	a5,s5,0x2
80002b90:	00e7e7b3          	or	a5,a5,a4
80002b94:	fff78793          	add	a5,a5,-1
80002b98:	00e00613          	li	a2,14
80002b9c:	014946b3          	xor	a3,s2,s4
80002ba0:	08f66e63          	bltu	a2,a5,80002c3c <__divsf3+0x140>
80002ba4:	a0000637          	lui	a2,0xa0000
80002ba8:	00279793          	sll	a5,a5,0x2
80002bac:	03c60613          	add	a2,a2,60 # a000003c <portable_fini+0x1fff8cdc>
80002bb0:	00c787b3          	add	a5,a5,a2
80002bb4:	0007a783          	lw	a5,0(a5)
80002bb8:	00078067          	jr	a5
  FP_UNPACK_S (A, a);
80002bbc:	02098a63          	beqz	s3,80002bf0 <__divsf3+0xf4>
80002bc0:	00098513          	mv	a0,s3
80002bc4:	5c4000ef          	jal	80003188 <__clzsi2>
80002bc8:	ffb50793          	add	a5,a0,-5
80002bcc:	f8a00493          	li	s1,-118
80002bd0:	00f999b3          	sll	s3,s3,a5
80002bd4:	40a484b3          	sub	s1,s1,a0
80002bd8:	f79ff06f          	j	80002b50 <__divsf3+0x54>
80002bdc:	0ff00493          	li	s1,255
80002be0:	00200a93          	li	s5,2
80002be4:	f60988e3          	beqz	s3,80002b54 <__divsf3+0x58>
80002be8:	00300a93          	li	s5,3
80002bec:	f69ff06f          	j	80002b54 <__divsf3+0x58>
80002bf0:	00000493          	li	s1,0
80002bf4:	00100a93          	li	s5,1
80002bf8:	f5dff06f          	j	80002b54 <__divsf3+0x58>
  FP_UNPACK_S (B, b);
80002bfc:	02040a63          	beqz	s0,80002c30 <__divsf3+0x134>
80002c00:	00040513          	mv	a0,s0
80002c04:	584000ef          	jal	80003188 <__clzsi2>
80002c08:	ffb50793          	add	a5,a0,-5
80002c0c:	00f41433          	sll	s0,s0,a5
80002c10:	f8a00793          	li	a5,-118
80002c14:	40a787b3          	sub	a5,a5,a0
80002c18:	f6dff06f          	j	80002b84 <__divsf3+0x88>
80002c1c:	0ff00793          	li	a5,255
80002c20:	00200713          	li	a4,2
80002c24:	f60402e3          	beqz	s0,80002b88 <__divsf3+0x8c>
80002c28:	00300713          	li	a4,3
80002c2c:	f5dff06f          	j	80002b88 <__divsf3+0x8c>
80002c30:	00000793          	li	a5,0
80002c34:	00100713          	li	a4,1
80002c38:	f51ff06f          	j	80002b88 <__divsf3+0x8c>
  FP_DIV_S (R, A, B);
80002c3c:	00541613          	sll	a2,s0,0x5
80002c40:	1289f263          	bgeu	s3,s0,80002d64 <__divsf3+0x268>
80002c44:	fff48493          	add	s1,s1,-1
80002c48:	00000793          	li	a5,0
80002c4c:	01065593          	srl	a1,a2,0x10
80002c50:	02b9d833          	divu	a6,s3,a1
80002c54:	00010737          	lui	a4,0x10
80002c58:	fe070713          	add	a4,a4,-32 # ffe0 <__stack_size+0xbfe0>
80002c5c:	00e67733          	and	a4,a2,a4
80002c60:	0107d793          	srl	a5,a5,0x10
80002c64:	02b9f9b3          	remu	s3,s3,a1
80002c68:	00080413          	mv	s0,a6
80002c6c:	03070533          	mul	a0,a4,a6
80002c70:	01099993          	sll	s3,s3,0x10
80002c74:	0137e7b3          	or	a5,a5,s3
80002c78:	00a7fe63          	bgeu	a5,a0,80002c94 <__divsf3+0x198>
80002c7c:	00f607b3          	add	a5,a2,a5
80002c80:	fff80413          	add	s0,a6,-1
80002c84:	00c7e863          	bltu	a5,a2,80002c94 <__divsf3+0x198>
80002c88:	00a7f663          	bgeu	a5,a0,80002c94 <__divsf3+0x198>
80002c8c:	ffe80413          	add	s0,a6,-2
80002c90:	00c787b3          	add	a5,a5,a2
80002c94:	40a787b3          	sub	a5,a5,a0
80002c98:	02b7d533          	divu	a0,a5,a1
80002c9c:	02b7f7b3          	remu	a5,a5,a1
80002ca0:	00050593          	mv	a1,a0
80002ca4:	02a70733          	mul	a4,a4,a0
80002ca8:	01079793          	sll	a5,a5,0x10
80002cac:	02e7f263          	bgeu	a5,a4,80002cd0 <__divsf3+0x1d4>
80002cb0:	00c78833          	add	a6,a5,a2
80002cb4:	00f838b3          	sltu	a7,a6,a5
80002cb8:	fff50593          	add	a1,a0,-1
80002cbc:	00080793          	mv	a5,a6
80002cc0:	00089863          	bnez	a7,80002cd0 <__divsf3+0x1d4>
80002cc4:	00e87663          	bgeu	a6,a4,80002cd0 <__divsf3+0x1d4>
80002cc8:	ffe50593          	add	a1,a0,-2
80002ccc:	00c807b3          	add	a5,a6,a2
80002cd0:	01041413          	sll	s0,s0,0x10
80002cd4:	40e787b3          	sub	a5,a5,a4
80002cd8:	00b46433          	or	s0,s0,a1
80002cdc:	00f037b3          	snez	a5,a5
80002ce0:	00f46433          	or	s0,s0,a5
  FP_PACK_S (r, R);
80002ce4:	07f48713          	add	a4,s1,127
80002ce8:	0ce05863          	blez	a4,80002db8 <__divsf3+0x2bc>
80002cec:	00747793          	and	a5,s0,7
80002cf0:	00078a63          	beqz	a5,80002d04 <__divsf3+0x208>
80002cf4:	00f47793          	and	a5,s0,15
80002cf8:	00400613          	li	a2,4
80002cfc:	00c78463          	beq	a5,a2,80002d04 <__divsf3+0x208>
80002d00:	00440413          	add	s0,s0,4
80002d04:	00441793          	sll	a5,s0,0x4
80002d08:	0007da63          	bgez	a5,80002d1c <__divsf3+0x220>
80002d0c:	f80007b7          	lui	a5,0xf8000
80002d10:	fff78793          	add	a5,a5,-1 # f7ffffff <__stack_base+0x37ffffff>
80002d14:	00f47433          	and	s0,s0,a5
80002d18:	08048713          	add	a4,s1,128
80002d1c:	0fe00793          	li	a5,254
80002d20:	06e7ca63          	blt	a5,a4,80002d94 <__divsf3+0x298>
80002d24:	00345793          	srl	a5,s0,0x3
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80002d28:	01c12083          	lw	ra,28(sp)
80002d2c:	01812403          	lw	s0,24(sp)
  FP_PACK_S (r, R);
80002d30:	00979793          	sll	a5,a5,0x9
80002d34:	01771713          	sll	a4,a4,0x17
80002d38:	0097d793          	srl	a5,a5,0x9
80002d3c:	00f76733          	or	a4,a4,a5
80002d40:	01f69513          	sll	a0,a3,0x1f
}
80002d44:	01412483          	lw	s1,20(sp)
80002d48:	01012903          	lw	s2,16(sp)
80002d4c:	00c12983          	lw	s3,12(sp)
80002d50:	00812a03          	lw	s4,8(sp)
80002d54:	00412a83          	lw	s5,4(sp)
80002d58:	00a76533          	or	a0,a4,a0
80002d5c:	02010113          	add	sp,sp,32
80002d60:	00008067          	ret
  FP_DIV_S (R, A, B);
80002d64:	01f99793          	sll	a5,s3,0x1f
80002d68:	0019d993          	srl	s3,s3,0x1
80002d6c:	ee1ff06f          	j	80002c4c <__divsf3+0x150>
  FP_UNPACK_S (A, a);
80002d70:	00090693          	mv	a3,s2
  FP_DIV_S (R, A, B);
80002d74:	00098413          	mv	s0,s3
80002d78:	000a8713          	mv	a4,s5
  FP_PACK_S (r, R);
80002d7c:	00300793          	li	a5,3
80002d80:	08f70663          	beq	a4,a5,80002e0c <__divsf3+0x310>
80002d84:	00100793          	li	a5,1
80002d88:	08f70a63          	beq	a4,a5,80002e1c <__divsf3+0x320>
80002d8c:	00200793          	li	a5,2
80002d90:	f4f71ae3          	bne	a4,a5,80002ce4 <__divsf3+0x1e8>
80002d94:	00000793          	li	a5,0
80002d98:	0ff00713          	li	a4,255
80002d9c:	f8dff06f          	j	80002d28 <__divsf3+0x22c>
  FP_UNPACK_S (B, b);
80002da0:	000a0693          	mv	a3,s4
  FP_DIV_S (R, A, B);
80002da4:	fd9ff06f          	j	80002d7c <__divsf3+0x280>
80002da8:	00400437          	lui	s0,0x400
80002dac:	00000693          	li	a3,0
80002db0:	00300713          	li	a4,3
80002db4:	fc9ff06f          	j	80002d7c <__divsf3+0x280>
  FP_PACK_S (r, R);
80002db8:	00100793          	li	a5,1
80002dbc:	40e787b3          	sub	a5,a5,a4
80002dc0:	01b00713          	li	a4,27
80002dc4:	04f74c63          	blt	a4,a5,80002e1c <__divsf3+0x320>
80002dc8:	09e48493          	add	s1,s1,158
80002dcc:	00f457b3          	srl	a5,s0,a5
80002dd0:	00941433          	sll	s0,s0,s1
80002dd4:	00803433          	snez	s0,s0
80002dd8:	0087e7b3          	or	a5,a5,s0
80002ddc:	0077f713          	and	a4,a5,7
80002de0:	00070a63          	beqz	a4,80002df4 <__divsf3+0x2f8>
80002de4:	00f7f713          	and	a4,a5,15
80002de8:	00400613          	li	a2,4
80002dec:	00c70463          	beq	a4,a2,80002df4 <__divsf3+0x2f8>
80002df0:	00478793          	add	a5,a5,4
80002df4:	00579713          	sll	a4,a5,0x5
80002df8:	0037d793          	srl	a5,a5,0x3
80002dfc:	02075263          	bgez	a4,80002e20 <__divsf3+0x324>
80002e00:	00000793          	li	a5,0
80002e04:	00100713          	li	a4,1
80002e08:	f21ff06f          	j	80002d28 <__divsf3+0x22c>
80002e0c:	004007b7          	lui	a5,0x400
80002e10:	0ff00713          	li	a4,255
80002e14:	00000693          	li	a3,0
80002e18:	f11ff06f          	j	80002d28 <__divsf3+0x22c>
80002e1c:	00000793          	li	a5,0
80002e20:	00000713          	li	a4,0
80002e24:	f05ff06f          	j	80002d28 <__divsf3+0x22c>

80002e28 <__floatunsisf>:
#include "soft-fp.h"
#include "single.h"

SFtype
__floatunsisf (USItype i)
{
80002e28:	ff010113          	add	sp,sp,-16
80002e2c:	00812423          	sw	s0,8(sp)
80002e30:	00112623          	sw	ra,12(sp)
80002e34:	00050413          	mv	s0,a0
  FP_DECL_EX;
  FP_DECL_S (A);
  SFtype a;

  FP_INIT_ROUNDMODE;
  FP_FROM_INT_S (A, i, SI_BITS, USItype);
80002e38:	00000713          	li	a4,0
80002e3c:	02050463          	beqz	a0,80002e64 <__floatunsisf+0x3c>
80002e40:	348000ef          	jal	80003188 <__clzsi2>
80002e44:	09e00713          	li	a4,158
80002e48:	40a70733          	sub	a4,a4,a0
80002e4c:	09600793          	li	a5,150
80002e50:	02e7ca63          	blt	a5,a4,80002e84 <__floatunsisf+0x5c>
80002e54:	00800793          	li	a5,8
80002e58:	0af50263          	beq	a0,a5,80002efc <__floatunsisf+0xd4>
80002e5c:	ff850513          	add	a0,a0,-8
80002e60:	00a41433          	sll	s0,s0,a0
  FP_PACK_RAW_S (a, A);
80002e64:	00941413          	sll	s0,s0,0x9
80002e68:	00945413          	srl	s0,s0,0x9
80002e6c:	01771513          	sll	a0,a4,0x17
  FP_HANDLE_EXCEPTIONS;

  return a;
}
80002e70:	00c12083          	lw	ra,12(sp)
80002e74:	00856533          	or	a0,a0,s0
80002e78:	00812403          	lw	s0,8(sp)
80002e7c:	01010113          	add	sp,sp,16
80002e80:	00008067          	ret
  FP_FROM_INT_S (A, i, SI_BITS, USItype);
80002e84:	09900793          	li	a5,153
80002e88:	06e7d463          	bge	a5,a4,80002ef0 <__floatunsisf+0xc8>
80002e8c:	01b50793          	add	a5,a0,27
80002e90:	00500693          	li	a3,5
80002e94:	00f417b3          	sll	a5,s0,a5
80002e98:	40a686b3          	sub	a3,a3,a0
80002e9c:	00f037b3          	snez	a5,a5
80002ea0:	00d45433          	srl	s0,s0,a3
80002ea4:	0087e7b3          	or	a5,a5,s0
80002ea8:	fc000437          	lui	s0,0xfc000
80002eac:	fff40413          	add	s0,s0,-1 # fbffffff <__stack_base+0x3bffffff>
80002eb0:	0077f693          	and	a3,a5,7
80002eb4:	0087f433          	and	s0,a5,s0
80002eb8:	00068a63          	beqz	a3,80002ecc <__floatunsisf+0xa4>
80002ebc:	00f7f793          	and	a5,a5,15
80002ec0:	00400693          	li	a3,4
80002ec4:	00d78463          	beq	a5,a3,80002ecc <__floatunsisf+0xa4>
80002ec8:	00440413          	add	s0,s0,4
80002ecc:	00541793          	sll	a5,s0,0x5
80002ed0:	0007dc63          	bgez	a5,80002ee8 <__floatunsisf+0xc0>
80002ed4:	fc0007b7          	lui	a5,0xfc000
80002ed8:	fff78793          	add	a5,a5,-1 # fbffffff <__stack_base+0x3bffffff>
80002edc:	09f00713          	li	a4,159
80002ee0:	00f47433          	and	s0,s0,a5
80002ee4:	40a70733          	sub	a4,a4,a0
80002ee8:	00345413          	srl	s0,s0,0x3
80002eec:	f79ff06f          	j	80002e64 <__floatunsisf+0x3c>
80002ef0:	ffb50793          	add	a5,a0,-5
80002ef4:	00f417b3          	sll	a5,s0,a5
80002ef8:	fb1ff06f          	j	80002ea8 <__floatunsisf+0x80>
80002efc:	09600713          	li	a4,150
80002f00:	f65ff06f          	j	80002e64 <__floatunsisf+0x3c>

80002f04 <__floatundisf>:
#include "soft-fp.h"
#include "single.h"

SFtype
__floatundisf (UDItype i)
{
80002f04:	fe010113          	add	sp,sp,-32
80002f08:	00112e23          	sw	ra,28(sp)
80002f0c:	00812c23          	sw	s0,24(sp)
80002f10:	00912a23          	sw	s1,20(sp)
80002f14:	01212823          	sw	s2,16(sp)
80002f18:	01312623          	sw	s3,12(sp)
80002f1c:	01412423          	sw	s4,8(sp)
  FP_DECL_EX;
  FP_DECL_S (A);
  SFtype a;

  FP_INIT_ROUNDMODE;
  FP_FROM_INT_S (A, i, DI_BITS, UDItype);
80002f20:	00b567b3          	or	a5,a0,a1
80002f24:	10078263          	beqz	a5,80003028 <__floatundisf+0x124>
80002f28:	00050413          	mv	s0,a0
80002f2c:	00058a13          	mv	s4,a1
80002f30:	06058063          	beqz	a1,80002f90 <__floatundisf+0x8c>
80002f34:	00058513          	mv	a0,a1
80002f38:	250000ef          	jal	80003188 <__clzsi2>
80002f3c:	00050493          	mv	s1,a0
80002f40:	0be00993          	li	s3,190
80002f44:	409989b3          	sub	s3,s3,s1
80002f48:	09600793          	li	a5,150
80002f4c:	0537c863          	blt	a5,s3,80002f9c <__floatundisf+0x98>
80002f50:	02800793          	li	a5,40
80002f54:	0ef48063          	beq	s1,a5,80003034 <__floatundisf+0x130>
80002f58:	fd848493          	add	s1,s1,-40
80002f5c:	00941433          	sll	s0,s0,s1
  FP_PACK_RAW_S (a, A);
80002f60:	00941413          	sll	s0,s0,0x9
80002f64:	01799513          	sll	a0,s3,0x17
80002f68:	00945413          	srl	s0,s0,0x9
  FP_HANDLE_EXCEPTIONS;

  return a;
}
80002f6c:	01c12083          	lw	ra,28(sp)
80002f70:	00856533          	or	a0,a0,s0
80002f74:	01812403          	lw	s0,24(sp)
80002f78:	01412483          	lw	s1,20(sp)
80002f7c:	01012903          	lw	s2,16(sp)
80002f80:	00c12983          	lw	s3,12(sp)
80002f84:	00812a03          	lw	s4,8(sp)
80002f88:	02010113          	add	sp,sp,32
80002f8c:	00008067          	ret
  FP_FROM_INT_S (A, i, DI_BITS, UDItype);
80002f90:	1f8000ef          	jal	80003188 <__clzsi2>
80002f94:	02050493          	add	s1,a0,32
80002f98:	fa9ff06f          	j	80002f40 <__floatundisf+0x3c>
80002f9c:	09900793          	li	a5,153
80002fa0:	0737de63          	bge	a5,s3,8000301c <__floatundisf+0x118>
80002fa4:	01b48613          	add	a2,s1,27
80002fa8:	00040513          	mv	a0,s0
80002fac:	000a0593          	mv	a1,s4
80002fb0:	1a0000ef          	jal	80003150 <__ashldi3>
80002fb4:	00b56533          	or	a0,a0,a1
80002fb8:	02500613          	li	a2,37
80002fbc:	00a03933          	snez	s2,a0
80002fc0:	40960633          	sub	a2,a2,s1
80002fc4:	00040513          	mv	a0,s0
80002fc8:	000a0593          	mv	a1,s4
80002fcc:	14c000ef          	jal	80003118 <__lshrdi3>
80002fd0:	00a96533          	or	a0,s2,a0
80002fd4:	fc0007b7          	lui	a5,0xfc000
80002fd8:	fff78793          	add	a5,a5,-1 # fbffffff <__stack_base+0x3bffffff>
80002fdc:	00757713          	and	a4,a0,7
80002fe0:	00f577b3          	and	a5,a0,a5
80002fe4:	00070a63          	beqz	a4,80002ff8 <__floatundisf+0xf4>
80002fe8:	00f57513          	and	a0,a0,15
80002fec:	00400713          	li	a4,4
80002ff0:	00e50463          	beq	a0,a4,80002ff8 <__floatundisf+0xf4>
80002ff4:	00478793          	add	a5,a5,4
80002ff8:	00579713          	sll	a4,a5,0x5
80002ffc:	00075c63          	bgez	a4,80003014 <__floatundisf+0x110>
80003000:	fc000737          	lui	a4,0xfc000
80003004:	fff70713          	add	a4,a4,-1 # fbffffff <__stack_base+0x3bffffff>
80003008:	0bf00993          	li	s3,191
8000300c:	00e7f7b3          	and	a5,a5,a4
80003010:	409989b3          	sub	s3,s3,s1
80003014:	0037d413          	srl	s0,a5,0x3
80003018:	f49ff06f          	j	80002f60 <__floatundisf+0x5c>
8000301c:	fdb48513          	add	a0,s1,-37
80003020:	00a41533          	sll	a0,s0,a0
80003024:	fb1ff06f          	j	80002fd4 <__floatundisf+0xd0>
80003028:	00000413          	li	s0,0
8000302c:	00000993          	li	s3,0
80003030:	f31ff06f          	j	80002f60 <__floatundisf+0x5c>
80003034:	09600993          	li	s3,150
80003038:	f29ff06f          	j	80002f60 <__floatundisf+0x5c>

8000303c <__extendsfdf2>:
  FP_DECL_S (A);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_S (A, a);
8000303c:	01755713          	srl	a4,a0,0x17
80003040:	0ff77713          	zext.b	a4,a4
{
80003044:	ff010113          	add	sp,sp,-16
#if _FP_W_TYPE_SIZE < _FP_FRACBITS_D
  FP_EXTEND (D, S, 2, 1, R, A);
80003048:	00170793          	add	a5,a4,1
{
8000304c:	00812423          	sw	s0,8(sp)
80003050:	00912223          	sw	s1,4(sp)
  FP_UNPACK_RAW_S (A, a);
80003054:	00951413          	sll	s0,a0,0x9
{
80003058:	00112623          	sw	ra,12(sp)
  FP_EXTEND (D, S, 2, 1, R, A);
8000305c:	0fe7f793          	and	a5,a5,254
  FP_UNPACK_RAW_S (A, a);
80003060:	00945413          	srl	s0,s0,0x9
80003064:	01f55493          	srl	s1,a0,0x1f
  FP_EXTEND (D, S, 2, 1, R, A);
80003068:	04078263          	beqz	a5,800030ac <__extendsfdf2+0x70>
8000306c:	00345793          	srl	a5,s0,0x3
80003070:	38070713          	add	a4,a4,896
80003074:	01d41413          	sll	s0,s0,0x1d
#else
  FP_EXTEND (D, S, 1, 1, R, A);
#endif
  FP_PACK_RAW_D (r, R);
80003078:	00c79793          	sll	a5,a5,0xc
8000307c:	00c7d793          	srl	a5,a5,0xc
80003080:	01471713          	sll	a4,a4,0x14
80003084:	01f49513          	sll	a0,s1,0x1f
80003088:	00f76733          	or	a4,a4,a5
  FP_HANDLE_EXCEPTIONS;

  return r;
}
8000308c:	00c12083          	lw	ra,12(sp)
  FP_PACK_RAW_D (r, R);
80003090:	00a767b3          	or	a5,a4,a0
}
80003094:	00040513          	mv	a0,s0
80003098:	00812403          	lw	s0,8(sp)
8000309c:	00412483          	lw	s1,4(sp)
800030a0:	00078593          	mv	a1,a5
800030a4:	01010113          	add	sp,sp,16
800030a8:	00008067          	ret
  FP_EXTEND (D, S, 2, 1, R, A);
800030ac:	04071663          	bnez	a4,800030f8 <__extendsfdf2+0xbc>
800030b0:	00000793          	li	a5,0
800030b4:	fc0402e3          	beqz	s0,80003078 <__extendsfdf2+0x3c>
800030b8:	00040513          	mv	a0,s0
800030bc:	0cc000ef          	jal	80003188 <__clzsi2>
800030c0:	00a00793          	li	a5,10
800030c4:	02a7c263          	blt	a5,a0,800030e8 <__extendsfdf2+0xac>
800030c8:	00b00793          	li	a5,11
800030cc:	40a787b3          	sub	a5,a5,a0
800030d0:	01550713          	add	a4,a0,21
800030d4:	00f457b3          	srl	a5,s0,a5
800030d8:	00e41433          	sll	s0,s0,a4
800030dc:	38900713          	li	a4,905
800030e0:	40a70733          	sub	a4,a4,a0
800030e4:	f95ff06f          	j	80003078 <__extendsfdf2+0x3c>
800030e8:	ff550793          	add	a5,a0,-11
800030ec:	00f417b3          	sll	a5,s0,a5
800030f0:	00000413          	li	s0,0
800030f4:	fe9ff06f          	j	800030dc <__extendsfdf2+0xa0>
800030f8:	00000793          	li	a5,0
800030fc:	00040a63          	beqz	s0,80003110 <__extendsfdf2+0xd4>
80003100:	00345793          	srl	a5,s0,0x3
80003104:	00080737          	lui	a4,0x80
80003108:	01d41413          	sll	s0,s0,0x1d
8000310c:	00e7e7b3          	or	a5,a5,a4
80003110:	7ff00713          	li	a4,2047
80003114:	f65ff06f          	j	80003078 <__extendsfdf2+0x3c>

80003118 <__lshrdi3>:
  if (b == 0)
80003118:	02060063          	beqz	a2,80003138 <__lshrdi3+0x20>
  const shift_count_type bm = W_TYPE_SIZE - b;
8000311c:	02000793          	li	a5,32
80003120:	40c787b3          	sub	a5,a5,a2
  if (bm <= 0)
80003124:	00f04c63          	bgtz	a5,8000313c <__lshrdi3+0x24>
      w.s.low = (UWtype) uu.s.high >> -bm;
80003128:	fe060613          	add	a2,a2,-32
8000312c:	00c5d533          	srl	a0,a1,a2
80003130:	00000713          	li	a4,0
  return w.ll;
80003134:	00070593          	mv	a1,a4
}
80003138:	00008067          	ret
      w.s.high = (UWtype) uu.s.high >> b;
8000313c:	00c5d733          	srl	a4,a1,a2
      w.s.low = ((UWtype) uu.s.low >> b) | carries;
80003140:	00c55533          	srl	a0,a0,a2
      const UWtype carries = (UWtype) uu.s.high << bm;
80003144:	00f595b3          	sll	a1,a1,a5
      w.s.low = ((UWtype) uu.s.low >> b) | carries;
80003148:	00b56533          	or	a0,a0,a1
8000314c:	fe9ff06f          	j	80003134 <__lshrdi3+0x1c>

80003150 <__ashldi3>:
  if (b == 0)
80003150:	02060063          	beqz	a2,80003170 <__ashldi3+0x20>
  const shift_count_type bm = W_TYPE_SIZE - b;
80003154:	02000793          	li	a5,32
80003158:	40c787b3          	sub	a5,a5,a2
  if (bm <= 0)
8000315c:	00f04c63          	bgtz	a5,80003174 <__ashldi3+0x24>
      w.s.high = (UWtype) uu.s.low << -bm;
80003160:	fe060613          	add	a2,a2,-32
80003164:	00c515b3          	sll	a1,a0,a2
80003168:	00000713          	li	a4,0
  return w.ll;
8000316c:	00070513          	mv	a0,a4
}
80003170:	00008067          	ret
      w.s.low = (UWtype) uu.s.low << b;
80003174:	00c51733          	sll	a4,a0,a2
      w.s.high = ((UWtype) uu.s.high << b) | carries;
80003178:	00c595b3          	sll	a1,a1,a2
      const UWtype carries = (UWtype) uu.s.low >> bm;
8000317c:	00f55533          	srl	a0,a0,a5
      w.s.high = ((UWtype) uu.s.high << b) | carries;
80003180:	00a5e5b3          	or	a1,a1,a0
80003184:	fe9ff06f          	j	8000316c <__ashldi3+0x1c>

80003188 <__clzsi2>:
  count_leading_zeros (ret, x);
80003188:	000107b7          	lui	a5,0x10
8000318c:	02f57a63          	bgeu	a0,a5,800031c0 <__clzsi2+0x38>
80003190:	10053793          	sltiu	a5,a0,256
80003194:	0017b793          	seqz	a5,a5
80003198:	00379793          	sll	a5,a5,0x3
8000319c:	a0000737          	lui	a4,0xa0000
800031a0:	02000693          	li	a3,32
800031a4:	40f686b3          	sub	a3,a3,a5
800031a8:	00f55533          	srl	a0,a0,a5
800031ac:	07870793          	add	a5,a4,120 # a0000078 <__clz_tab>
800031b0:	00a787b3          	add	a5,a5,a0
800031b4:	0007c503          	lbu	a0,0(a5) # 10000 <__stack_size+0xc000>
}
800031b8:	40a68533          	sub	a0,a3,a0
800031bc:	00008067          	ret
  count_leading_zeros (ret, x);
800031c0:	01000737          	lui	a4,0x1000
800031c4:	01800793          	li	a5,24
800031c8:	fce57ae3          	bgeu	a0,a4,8000319c <__clzsi2+0x14>
800031cc:	01000793          	li	a5,16
800031d0:	fcdff06f          	j	8000319c <__clzsi2+0x14>

800031d4 <memset>:
800031d4:	00f00313          	li	t1,15
800031d8:	00050713          	mv	a4,a0
800031dc:	02c37e63          	bgeu	t1,a2,80003218 <memset+0x44>
800031e0:	00f77793          	and	a5,a4,15
800031e4:	0a079063          	bnez	a5,80003284 <memset+0xb0>
800031e8:	08059263          	bnez	a1,8000326c <memset+0x98>
800031ec:	ff067693          	and	a3,a2,-16
800031f0:	00f67613          	and	a2,a2,15
800031f4:	00e686b3          	add	a3,a3,a4
800031f8:	00b72023          	sw	a1,0(a4) # 1000000 <__stack_size+0xffc000>
800031fc:	00b72223          	sw	a1,4(a4)
80003200:	00b72423          	sw	a1,8(a4)
80003204:	00b72623          	sw	a1,12(a4)
80003208:	01070713          	add	a4,a4,16
8000320c:	fed766e3          	bltu	a4,a3,800031f8 <memset+0x24>
80003210:	00061463          	bnez	a2,80003218 <memset+0x44>
80003214:	00008067          	ret
80003218:	40c306b3          	sub	a3,t1,a2
8000321c:	00269693          	sll	a3,a3,0x2
80003220:	00000297          	auipc	t0,0x0
80003224:	005686b3          	add	a3,a3,t0
80003228:	00c68067          	jr	12(a3)
8000322c:	00b70723          	sb	a1,14(a4)
80003230:	00b706a3          	sb	a1,13(a4)
80003234:	00b70623          	sb	a1,12(a4)
80003238:	00b705a3          	sb	a1,11(a4)
8000323c:	00b70523          	sb	a1,10(a4)
80003240:	00b704a3          	sb	a1,9(a4)
80003244:	00b70423          	sb	a1,8(a4)
80003248:	00b703a3          	sb	a1,7(a4)
8000324c:	00b70323          	sb	a1,6(a4)
80003250:	00b702a3          	sb	a1,5(a4)
80003254:	00b70223          	sb	a1,4(a4)
80003258:	00b701a3          	sb	a1,3(a4)
8000325c:	00b70123          	sb	a1,2(a4)
80003260:	00b700a3          	sb	a1,1(a4)
80003264:	00b70023          	sb	a1,0(a4)
80003268:	00008067          	ret
8000326c:	0ff5f593          	zext.b	a1,a1
80003270:	00859693          	sll	a3,a1,0x8
80003274:	00d5e5b3          	or	a1,a1,a3
80003278:	01059693          	sll	a3,a1,0x10
8000327c:	00d5e5b3          	or	a1,a1,a3
80003280:	f6dff06f          	j	800031ec <memset+0x18>
80003284:	00279693          	sll	a3,a5,0x2
80003288:	00000297          	auipc	t0,0x0
8000328c:	005686b3          	add	a3,a3,t0
80003290:	00008293          	mv	t0,ra
80003294:	fa0680e7          	jalr	-96(a3)
80003298:	00028093          	mv	ra,t0
8000329c:	ff078793          	add	a5,a5,-16
800032a0:	40f70733          	sub	a4,a4,a5
800032a4:	00f60633          	add	a2,a2,a5
800032a8:	f6c378e3          	bgeu	t1,a2,80003218 <memset+0x44>
800032ac:	f3dff06f          	j	800031e8 <memset+0x14>

800032b0 <uart_init>:
800032b0:	00b52023          	sw	a1,0(a0)
800032b4:	00008067          	ret

800032b8 <uart_put_char>:
800032b8:	00052783          	lw	a5,0(a0)
800032bc:	00b7a023          	sw	a1,0(a5)
800032c0:	00008067          	ret

800032c4 <_out_null>:
800032c4:	00008067          	ret

800032c8 <_out_rev>:
800032c8:	fd010113          	add	sp,sp,-48
800032cc:	02812423          	sw	s0,40(sp)
800032d0:	01312e23          	sw	s3,28(sp)
800032d4:	01412c23          	sw	s4,24(sp)
800032d8:	01512a23          	sw	s5,20(sp)
800032dc:	01612823          	sw	s6,16(sp)
800032e0:	01712623          	sw	s7,12(sp)
800032e4:	01812423          	sw	s8,8(sp)
800032e8:	01912223          	sw	s9,4(sp)
800032ec:	02112623          	sw	ra,44(sp)
800032f0:	00088c93          	mv	s9,a7
800032f4:	02912223          	sw	s1,36(sp)
800032f8:	03212023          	sw	s2,32(sp)
800032fc:	0038f893          	and	a7,a7,3
80003300:	00050993          	mv	s3,a0
80003304:	00058a13          	mv	s4,a1
80003308:	00060b13          	mv	s6,a2
8000330c:	00068a93          	mv	s5,a3
80003310:	00070b93          	mv	s7,a4
80003314:	00078413          	mv	s0,a5
80003318:	00080c13          	mv	s8,a6
8000331c:	0c089263          	bnez	a7,800033e0 <_out_rev+0x118>
80003320:	40f80933          	sub	s2,a6,a5
80003324:	00c90933          	add	s2,s2,a2
80003328:	00060493          	mv	s1,a2
8000332c:	0d07f263          	bgeu	a5,a6,800033f0 <_out_rev+0x128>
80003330:	00048613          	mv	a2,s1
80003334:	000a8693          	mv	a3,s5
80003338:	00148493          	add	s1,s1,1
8000333c:	000a0593          	mv	a1,s4
80003340:	02000513          	li	a0,32
80003344:	000980e7          	jalr	s3
80003348:	ff2494e3          	bne	s1,s2,80003330 <_out_rev+0x68>
8000334c:	04040e63          	beqz	s0,800033a8 <_out_rev+0xe0>
80003350:	00890933          	add	s2,s2,s0
80003354:	40890633          	sub	a2,s2,s0
80003358:	fff40413          	add	s0,s0,-1
8000335c:	008b87b3          	add	a5,s7,s0
80003360:	0007c503          	lbu	a0,0(a5)
80003364:	000a8693          	mv	a3,s5
80003368:	000a0593          	mv	a1,s4
8000336c:	00090493          	mv	s1,s2
80003370:	000980e7          	jalr	s3
80003374:	fe0410e3          	bnez	s0,80003354 <_out_rev+0x8c>
80003378:	002cfc93          	and	s9,s9,2
8000337c:	020c8663          	beqz	s9,800033a8 <_out_rev+0xe0>
80003380:	41648b33          	sub	s6,s1,s6
80003384:	038b7263          	bgeu	s6,s8,800033a8 <_out_rev+0xe0>
80003388:	00048613          	mv	a2,s1
8000338c:	000a8693          	mv	a3,s5
80003390:	000a0593          	mv	a1,s4
80003394:	02000513          	li	a0,32
80003398:	001b0b13          	add	s6,s6,1
8000339c:	00148493          	add	s1,s1,1
800033a0:	000980e7          	jalr	s3
800033a4:	ff8b62e3          	bltu	s6,s8,80003388 <_out_rev+0xc0>
800033a8:	02c12083          	lw	ra,44(sp)
800033ac:	02812403          	lw	s0,40(sp)
800033b0:	02012903          	lw	s2,32(sp)
800033b4:	01c12983          	lw	s3,28(sp)
800033b8:	01812a03          	lw	s4,24(sp)
800033bc:	01412a83          	lw	s5,20(sp)
800033c0:	01012b03          	lw	s6,16(sp)
800033c4:	00c12b83          	lw	s7,12(sp)
800033c8:	00812c03          	lw	s8,8(sp)
800033cc:	00412c83          	lw	s9,4(sp)
800033d0:	00048513          	mv	a0,s1
800033d4:	02412483          	lw	s1,36(sp)
800033d8:	03010113          	add	sp,sp,48
800033dc:	00008067          	ret
800033e0:	00060913          	mv	s2,a2
800033e4:	00060493          	mv	s1,a2
800033e8:	f60794e3          	bnez	a5,80003350 <_out_rev+0x88>
800033ec:	f8dff06f          	j	80003378 <_out_rev+0xb0>
800033f0:	00060913          	mv	s2,a2
800033f4:	f4079ee3          	bnez	a5,80003350 <_out_rev+0x88>
800033f8:	fb1ff06f          	j	800033a8 <_out_rev+0xe0>

800033fc <_ntoa_format>:
800033fc:	00812383          	lw	t2,8(sp)
80003400:	00012283          	lw	t0,0(sp)
80003404:	00412f83          	lw	t6,4(sp)
80003408:	0023f313          	and	t1,t2,2
8000340c:	00080f13          	mv	t5,a6
80003410:	06031463          	bnez	t1,80003478 <_ntoa_format+0x7c>
80003414:	100f9c63          	bnez	t6,8000352c <_ntoa_format+0x130>
80003418:	0657f063          	bgeu	a5,t0,80003478 <_ntoa_format+0x7c>
8000341c:	02000313          	li	t1,32
80003420:	0013f813          	and	a6,t2,1
80003424:	2e678063          	beq	a5,t1,80003704 <_ntoa_format+0x308>
80003428:	03000e13          	li	t3,48
8000342c:	02000e93          	li	t4,32
80003430:	0080006f          	j	80003438 <_ntoa_format+0x3c>
80003434:	15d78a63          	beq	a5,t4,80003588 <_ntoa_format+0x18c>
80003438:	00178793          	add	a5,a5,1
8000343c:	00f70333          	add	t1,a4,a5
80003440:	ffc30fa3          	sb	t3,-1(t1)
80003444:	fe57e8e3          	bltu	a5,t0,80003434 <_ntoa_format+0x38>
80003448:	02080863          	beqz	a6,80003478 <_ntoa_format+0x7c>
8000344c:	03f7f663          	bgeu	a5,t6,80003478 <_ntoa_format+0x7c>
80003450:	02000813          	li	a6,32
80003454:	03000e13          	li	t3,48
80003458:	02000e93          	li	t4,32
8000345c:	01079663          	bne	a5,a6,80003468 <_ntoa_format+0x6c>
80003460:	1300006f          	j	80003590 <_ntoa_format+0x194>
80003464:	07d78663          	beq	a5,t4,800034d0 <_ntoa_format+0xd4>
80003468:	00178793          	add	a5,a5,1
8000346c:	00f70333          	add	t1,a4,a5
80003470:	ffc30fa3          	sb	t3,-1(t1)
80003474:	fff798e3          	bne	a5,t6,80003464 <_ntoa_format+0x68>
80003478:	0103f813          	and	a6,t2,16
8000347c:	08080e63          	beqz	a6,80003518 <_ntoa_format+0x11c>
80003480:	4003f813          	and	a6,t2,1024
80003484:	06081463          	bnez	a6,800034ec <_ntoa_format+0xf0>
80003488:	04079e63          	bnez	a5,800034e4 <_ntoa_format+0xe8>
8000348c:	01000793          	li	a5,16
80003490:	22f88863          	beq	a7,a5,800036c0 <_ntoa_format+0x2c4>
80003494:	00200793          	li	a5,2
80003498:	24f88663          	beq	a7,a5,800036e4 <_ntoa_format+0x2e8>
8000349c:	03000793          	li	a5,48
800034a0:	00f70023          	sb	a5,0(a4)
800034a4:	00100793          	li	a5,1
800034a8:	100f1a63          	bnez	t5,800035bc <_ntoa_format+0x1c0>
800034ac:	0043f813          	and	a6,t2,4
800034b0:	1c080c63          	beqz	a6,80003688 <_ntoa_format+0x28c>
800034b4:	00f70833          	add	a6,a4,a5
800034b8:	02b00893          	li	a7,43
800034bc:	01180023          	sb	a7,0(a6)
800034c0:	00178793          	add	a5,a5,1
800034c4:	00038893          	mv	a7,t2
800034c8:	000f8813          	mv	a6,t6
800034cc:	dfdff06f          	j	800032c8 <_out_rev>
800034d0:	0103f813          	and	a6,t2,16
800034d4:	02000793          	li	a5,32
800034d8:	fe0806e3          	beqz	a6,800034c4 <_ntoa_format+0xc8>
800034dc:	4003f813          	and	a6,t2,1024
800034e0:	00081663          	bnez	a6,800034ec <_ntoa_format+0xf0>
800034e4:	14f28263          	beq	t0,a5,80003628 <_ntoa_format+0x22c>
800034e8:	15f78063          	beq	a5,t6,80003628 <_ntoa_format+0x22c>
800034ec:	01000813          	li	a6,16
800034f0:	17088a63          	beq	a7,a6,80003664 <_ntoa_format+0x268>
800034f4:	00200813          	li	a6,2
800034f8:	11088a63          	beq	a7,a6,8000360c <_ntoa_format+0x210>
800034fc:	02000813          	li	a6,32
80003500:	fd0782e3          	beq	a5,a6,800034c4 <_ntoa_format+0xc8>
80003504:	00078813          	mv	a6,a5
80003508:	00178793          	add	a5,a5,1
8000350c:	01070833          	add	a6,a4,a6
80003510:	03000893          	li	a7,48
80003514:	01180023          	sb	a7,0(a6)
80003518:	02000813          	li	a6,32
8000351c:	f90796e3          	bne	a5,a6,800034a8 <_ntoa_format+0xac>
80003520:	00038893          	mv	a7,t2
80003524:	000f8813          	mv	a6,t6
80003528:	da1ff06f          	j	800032c8 <_out_rev>
8000352c:	0013f813          	and	a6,t2,1
80003530:	0a080463          	beqz	a6,800035d8 <_ntoa_format+0x1dc>
80003534:	120f1463          	bnez	t5,8000365c <_ntoa_format+0x260>
80003538:	00c3f313          	and	t1,t2,12
8000353c:	12031063          	bnez	t1,8000365c <_ntoa_format+0x260>
80003540:	f057f6e3          	bgeu	a5,t0,8000344c <_ntoa_format+0x50>
80003544:	02000313          	li	t1,32
80003548:	ee6790e3          	bne	a5,t1,80003428 <_ntoa_format+0x2c>
8000354c:	05f7e263          	bltu	a5,t6,80003590 <_ntoa_format+0x194>
80003550:	0103f813          	and	a6,t2,16
80003554:	02000793          	li	a5,32
80003558:	f60806e3          	beqz	a6,800034c4 <_ntoa_format+0xc8>
8000355c:	4003f813          	and	a6,t2,1024
80003560:	04081663          	bnez	a6,800035ac <_ntoa_format+0x1b0>
80003564:	00f28463          	beq	t0,a5,8000356c <_ntoa_format+0x170>
80003568:	f8ff92e3          	bne	t6,a5,800034ec <_ntoa_format+0xf0>
8000356c:	01f00813          	li	a6,31
80003570:	01000313          	li	t1,16
80003574:	18688c63          	beq	a7,t1,8000370c <_ntoa_format+0x310>
80003578:	00200793          	li	a5,2
8000357c:	1af88863          	beq	a7,a5,8000372c <_ntoa_format+0x330>
80003580:	00180793          	add	a5,a6,1
80003584:	f89ff06f          	j	8000350c <_ntoa_format+0x110>
80003588:	1a080c63          	beqz	a6,80003740 <_ntoa_format+0x344>
8000358c:	f5f7f2e3          	bgeu	a5,t6,800034d0 <_ntoa_format+0xd4>
80003590:	0103f813          	and	a6,t2,16
80003594:	02000793          	li	a5,32
80003598:	f20806e3          	beqz	a6,800034c4 <_ntoa_format+0xc8>
8000359c:	4003f813          	and	a6,t2,1024
800035a0:	00081663          	bnez	a6,800035ac <_ntoa_format+0x1b0>
800035a4:	fcf284e3          	beq	t0,a5,8000356c <_ntoa_format+0x170>
800035a8:	fcff82e3          	beq	t6,a5,8000356c <_ntoa_format+0x170>
800035ac:	01000813          	li	a6,16
800035b0:	f1089ae3          	bne	a7,a6,800034c4 <_ntoa_format+0xc8>
800035b4:	02000793          	li	a5,32
800035b8:	f0dff06f          	j	800034c4 <_ntoa_format+0xc8>
800035bc:	00f70833          	add	a6,a4,a5
800035c0:	02d00893          	li	a7,45
800035c4:	01180023          	sb	a7,0(a6)
800035c8:	00178793          	add	a5,a5,1
800035cc:	00038893          	mv	a7,t2
800035d0:	000f8813          	mv	a6,t6
800035d4:	cf5ff06f          	j	800032c8 <_out_rev>
800035d8:	ea57f0e3          	bgeu	a5,t0,80003478 <_ntoa_format+0x7c>
800035dc:	02000313          	li	t1,32
800035e0:	e46794e3          	bne	a5,t1,80003428 <_ntoa_format+0x2c>
800035e4:	0103f793          	and	a5,t2,16
800035e8:	fc0786e3          	beqz	a5,800035b4 <_ntoa_format+0x1b8>
800035ec:	4003f793          	and	a5,t2,1024
800035f0:	fc0792e3          	bnez	a5,800035b4 <_ntoa_format+0x1b8>
800035f4:	02000793          	li	a5,32
800035f8:	00f28463          	beq	t0,a5,80003600 <_ntoa_format+0x204>
800035fc:	faff9ce3          	bne	t6,a5,800035b4 <_ntoa_format+0x1b8>
80003600:	02000793          	li	a5,32
80003604:	01f00813          	li	a6,31
80003608:	f69ff06f          	j	80003570 <_ntoa_format+0x174>
8000360c:	02000813          	li	a6,32
80003610:	eb078ae3          	beq	a5,a6,800034c4 <_ntoa_format+0xc8>
80003614:	00f70833          	add	a6,a4,a5
80003618:	06200893          	li	a7,98
8000361c:	01180023          	sb	a7,0(a6)
80003620:	00178793          	add	a5,a5,1
80003624:	ed9ff06f          	j	800034fc <_ntoa_format+0x100>
80003628:	fff78813          	add	a6,a5,-1
8000362c:	f40812e3          	bnez	a6,80003570 <_ntoa_format+0x174>
80003630:	01000793          	li	a5,16
80003634:	e6f890e3          	bne	a7,a5,80003494 <_ntoa_format+0x98>
80003638:	0203f793          	and	a5,t2,32
8000363c:	0c078063          	beqz	a5,800036fc <_ntoa_format+0x300>
80003640:	05800793          	li	a5,88
80003644:	00f70023          	sb	a5,0(a4)
80003648:	03000793          	li	a5,48
8000364c:	00f700a3          	sb	a5,1(a4)
80003650:	00200793          	li	a5,2
80003654:	e40f0ce3          	beqz	t5,800034ac <_ntoa_format+0xb0>
80003658:	f65ff06f          	j	800035bc <_ntoa_format+0x1c0>
8000365c:	ffff8f93          	add	t6,t6,-1
80003660:	ee1ff06f          	j	80003540 <_ntoa_format+0x144>
80003664:	0203f813          	and	a6,t2,32
80003668:	02081e63          	bnez	a6,800036a4 <_ntoa_format+0x2a8>
8000366c:	02000813          	li	a6,32
80003670:	f50782e3          	beq	a5,a6,800035b4 <_ntoa_format+0x1b8>
80003674:	00f70833          	add	a6,a4,a5
80003678:	07800893          	li	a7,120
8000367c:	01180023          	sb	a7,0(a6)
80003680:	00178793          	add	a5,a5,1
80003684:	e79ff06f          	j	800034fc <_ntoa_format+0x100>
80003688:	0083f813          	and	a6,t2,8
8000368c:	e2080ce3          	beqz	a6,800034c4 <_ntoa_format+0xc8>
80003690:	00f70833          	add	a6,a4,a5
80003694:	02000893          	li	a7,32
80003698:	01180023          	sb	a7,0(a6)
8000369c:	00178793          	add	a5,a5,1
800036a0:	e25ff06f          	j	800034c4 <_ntoa_format+0xc8>
800036a4:	02000813          	li	a6,32
800036a8:	f10786e3          	beq	a5,a6,800035b4 <_ntoa_format+0x1b8>
800036ac:	00f70833          	add	a6,a4,a5
800036b0:	05800893          	li	a7,88
800036b4:	01180023          	sb	a7,0(a6)
800036b8:	00178793          	add	a5,a5,1
800036bc:	e41ff06f          	j	800034fc <_ntoa_format+0x100>
800036c0:	0203f793          	and	a5,t2,32
800036c4:	02078c63          	beqz	a5,800036fc <_ntoa_format+0x300>
800036c8:	05800793          	li	a5,88
800036cc:	00f70023          	sb	a5,0(a4)
800036d0:	03000793          	li	a5,48
800036d4:	00f700a3          	sb	a5,1(a4)
800036d8:	00200793          	li	a5,2
800036dc:	dc0f08e3          	beqz	t5,800034ac <_ntoa_format+0xb0>
800036e0:	eddff06f          	j	800035bc <_ntoa_format+0x1c0>
800036e4:	06200793          	li	a5,98
800036e8:	00f70023          	sb	a5,0(a4)
800036ec:	03000793          	li	a5,48
800036f0:	00f700a3          	sb	a5,1(a4)
800036f4:	00200793          	li	a5,2
800036f8:	f5dff06f          	j	80003654 <_ntoa_format+0x258>
800036fc:	07800793          	li	a5,120
80003700:	fe9ff06f          	j	800036e8 <_ntoa_format+0x2ec>
80003704:	e40816e3          	bnez	a6,80003550 <_ntoa_format+0x154>
80003708:	eddff06f          	j	800035e4 <_ntoa_format+0x1e8>
8000370c:	ffe78813          	add	a6,a5,-2
80003710:	0203f893          	and	a7,t2,32
80003714:	01070833          	add	a6,a4,a6
80003718:	fff78793          	add	a5,a5,-1
8000371c:	00089c63          	bnez	a7,80003734 <_ntoa_format+0x338>
80003720:	07800893          	li	a7,120
80003724:	01180023          	sb	a7,0(a6)
80003728:	dddff06f          	j	80003504 <_ntoa_format+0x108>
8000372c:	00080793          	mv	a5,a6
80003730:	ee5ff06f          	j	80003614 <_ntoa_format+0x218>
80003734:	05800893          	li	a7,88
80003738:	01180023          	sb	a7,0(a6)
8000373c:	dc9ff06f          	j	80003504 <_ntoa_format+0x108>
80003740:	0103f813          	and	a6,t2,16
80003744:	d80800e3          	beqz	a6,800034c4 <_ntoa_format+0xc8>
80003748:	4003f813          	and	a6,t2,1024
8000374c:	e60810e3          	bnez	a6,800035ac <_ntoa_format+0x1b0>
80003750:	d9f79ee3          	bne	a5,t6,800034ec <_ntoa_format+0xf0>
80003754:	ed5ff06f          	j	80003628 <_ntoa_format+0x22c>

80003758 <_ntoa_long>:
80003758:	fc010113          	add	sp,sp,-64
8000375c:	02812c23          	sw	s0,56(sp)
80003760:	02112e23          	sw	ra,60(sp)
80003764:	00080e93          	mv	t4,a6
80003768:	04412403          	lw	s0,68(sp)
8000376c:	00070e13          	mv	t3,a4
80003770:	00078813          	mv	a6,a5
80003774:	00071863          	bnez	a4,80003784 <_ntoa_long+0x2c>
80003778:	40047793          	and	a5,s0,1024
8000377c:	fef47413          	and	s0,s0,-17
80003780:	08079a63          	bnez	a5,80003814 <_ntoa_long+0xbc>
80003784:	00545713          	srl	a4,s0,0x5
80003788:	00177713          	and	a4,a4,1
8000378c:	06100293          	li	t0,97
80003790:	06071e63          	bnez	a4,8000380c <_ntoa_long+0xb4>
80003794:	00000793          	li	a5,0
80003798:	01010713          	add	a4,sp,16
8000379c:	00900393          	li	t2,9
800037a0:	ff628293          	add	t0,t0,-10 # 8000327e <memset+0xaa>
800037a4:	02000093          	li	ra,32
800037a8:	00c0006f          	j	800037b4 <_ntoa_long+0x5c>
800037ac:	02178c63          	beq	a5,ra,800037e4 <_ntoa_long+0x8c>
800037b0:	00030e13          	mv	t3,t1
800037b4:	03de7f33          	remu	t5,t3,t4
800037b8:	0fff7313          	zext.b	t1,t5
800037bc:	03030f93          	add	t6,t1,48
800037c0:	00530333          	add	t1,t1,t0
800037c4:	0ff37313          	zext.b	t1,t1
800037c8:	01e3e463          	bltu	t2,t5,800037d0 <_ntoa_long+0x78>
800037cc:	0ffff313          	zext.b	t1,t6
800037d0:	00178793          	add	a5,a5,1
800037d4:	00f70f33          	add	t5,a4,a5
800037d8:	fe6f0fa3          	sb	t1,-1(t5)
800037dc:	03de5333          	divu	t1,t3,t4
800037e0:	fdde76e3          	bgeu	t3,t4,800037ac <_ntoa_long+0x54>
800037e4:	04012303          	lw	t1,64(sp)
800037e8:	00812423          	sw	s0,8(sp)
800037ec:	01112023          	sw	a7,0(sp)
800037f0:	00612223          	sw	t1,4(sp)
800037f4:	000e8893          	mv	a7,t4
800037f8:	c05ff0ef          	jal	800033fc <_ntoa_format>
800037fc:	03c12083          	lw	ra,60(sp)
80003800:	03812403          	lw	s0,56(sp)
80003804:	04010113          	add	sp,sp,64
80003808:	00008067          	ret
8000380c:	04100293          	li	t0,65
80003810:	f85ff06f          	j	80003794 <_ntoa_long+0x3c>
80003814:	00000793          	li	a5,0
80003818:	01010713          	add	a4,sp,16
8000381c:	fc9ff06f          	j	800037e4 <_ntoa_long+0x8c>

80003820 <_ntoa_long_long>:
80003820:	f7010113          	add	sp,sp,-144
80003824:	06812c23          	sw	s0,120(sp)
80003828:	06912a23          	sw	s1,116(sp)
8000382c:	07612023          	sw	s6,96(sp)
80003830:	05812c23          	sw	s8,88(sp)
80003834:	05912a23          	sw	s9,84(sp)
80003838:	05a12823          	sw	s10,80(sp)
8000383c:	05b12623          	sw	s11,76(sp)
80003840:	00078c13          	mv	s8,a5
80003844:	06112e23          	sw	ra,124(sp)
80003848:	07312623          	sw	s3,108(sp)
8000384c:	05712e23          	sw	s7,92(sp)
80003850:	09112623          	sw	a7,140(sp)
80003854:	00f767b3          	or	a5,a4,a5
80003858:	00a12a23          	sw	a0,20(sp)
8000385c:	00b12c23          	sw	a1,24(sp)
80003860:	00c12e23          	sw	a2,28(sp)
80003864:	09012c83          	lw	s9,144(sp)
80003868:	09c12b03          	lw	s6,156(sp)
8000386c:	00070413          	mv	s0,a4
80003870:	00068d13          	mv	s10,a3
80003874:	00080d93          	mv	s11,a6
80003878:	00088493          	mv	s1,a7
8000387c:	00079863          	bnez	a5,8000388c <_ntoa_long_long+0x6c>
80003880:	400b7793          	and	a5,s6,1024
80003884:	fefb7b13          	and	s6,s6,-17
80003888:	10079c63          	bnez	a5,800039a0 <_ntoa_long_long+0x180>
8000388c:	005b5793          	srl	a5,s6,0x5
80003890:	07212823          	sw	s2,112(sp)
80003894:	07412423          	sw	s4,104(sp)
80003898:	07512223          	sw	s5,100(sp)
8000389c:	0017f793          	and	a5,a5,1
800038a0:	06100913          	li	s2,97
800038a4:	0e079a63          	bnez	a5,80003998 <_ntoa_long_long+0x178>
800038a8:	00000b93          	li	s7,0
800038ac:	02010993          	add	s3,sp,32
800038b0:	00900a13          	li	s4,9
800038b4:	ff690913          	add	s2,s2,-10
800038b8:	02000a93          	li	s5,32
800038bc:	000c8693          	mv	a3,s9
800038c0:	00048613          	mv	a2,s1
800038c4:	00040513          	mv	a0,s0
800038c8:	000c0593          	mv	a1,s8
800038cc:	c2dfc0ef          	jal	800004f8 <__umoddi3>
800038d0:	0ff57513          	zext.b	a0,a0
800038d4:	01250833          	add	a6,a0,s2
800038d8:	03050693          	add	a3,a0,48
800038dc:	0ff87813          	zext.b	a6,a6
800038e0:	00aa6463          	bltu	s4,a0,800038e8 <_ntoa_long_long+0xc8>
800038e4:	0ff6f813          	zext.b	a6,a3
800038e8:	001b8b93          	add	s7,s7,1
800038ec:	017988b3          	add	a7,s3,s7
800038f0:	00048613          	mv	a2,s1
800038f4:	000c8693          	mv	a3,s9
800038f8:	00040513          	mv	a0,s0
800038fc:	000c0593          	mv	a1,s8
80003900:	ff088fa3          	sb	a6,-1(a7) # ffff <__stack_size+0xbfff>
80003904:	fc4fc0ef          	jal	800000c8 <__udivdi3>
80003908:	019c6e63          	bltu	s8,s9,80003924 <_ntoa_long_long+0x104>
8000390c:	018c8a63          	beq	s9,s8,80003920 <_ntoa_long_long+0x100>
80003910:	015b8a63          	beq	s7,s5,80003924 <_ntoa_long_long+0x104>
80003914:	00050413          	mv	s0,a0
80003918:	00058c13          	mv	s8,a1
8000391c:	fa1ff06f          	j	800038bc <_ntoa_long_long+0x9c>
80003920:	fe9478e3          	bgeu	s0,s1,80003910 <_ntoa_long_long+0xf0>
80003924:	07012903          	lw	s2,112(sp)
80003928:	06812a03          	lw	s4,104(sp)
8000392c:	06412a83          	lw	s5,100(sp)
80003930:	09812703          	lw	a4,152(sp)
80003934:	01c12603          	lw	a2,28(sp)
80003938:	01812583          	lw	a1,24(sp)
8000393c:	00e12223          	sw	a4,4(sp)
80003940:	09412703          	lw	a4,148(sp)
80003944:	01412503          	lw	a0,20(sp)
80003948:	01612423          	sw	s6,8(sp)
8000394c:	00e12023          	sw	a4,0(sp)
80003950:	00048893          	mv	a7,s1
80003954:	000d8813          	mv	a6,s11
80003958:	000b8793          	mv	a5,s7
8000395c:	00098713          	mv	a4,s3
80003960:	000d0693          	mv	a3,s10
80003964:	a99ff0ef          	jal	800033fc <_ntoa_format>
80003968:	07c12083          	lw	ra,124(sp)
8000396c:	07812403          	lw	s0,120(sp)
80003970:	07412483          	lw	s1,116(sp)
80003974:	06c12983          	lw	s3,108(sp)
80003978:	06012b03          	lw	s6,96(sp)
8000397c:	05c12b83          	lw	s7,92(sp)
80003980:	05812c03          	lw	s8,88(sp)
80003984:	05412c83          	lw	s9,84(sp)
80003988:	05012d03          	lw	s10,80(sp)
8000398c:	04c12d83          	lw	s11,76(sp)
80003990:	09010113          	add	sp,sp,144
80003994:	00008067          	ret
80003998:	04100913          	li	s2,65
8000399c:	f0dff06f          	j	800038a8 <_ntoa_long_long+0x88>
800039a0:	00000b93          	li	s7,0
800039a4:	02010993          	add	s3,sp,32
800039a8:	f89ff06f          	j	80003930 <_ntoa_long_long+0x110>

800039ac <_etoa>:
800039ac:	f8010113          	add	sp,sp,-128
800039b0:	07212823          	sw	s2,112(sp)
800039b4:	07312623          	sw	s3,108(sp)
800039b8:	07412423          	sw	s4,104(sp)
800039bc:	07512223          	sw	s5,100(sp)
800039c0:	00050993          	mv	s3,a0
800039c4:	00058a13          	mv	s4,a1
800039c8:	00060913          	mv	s2,a2
800039cc:	00068a93          	mv	s5,a3
800039d0:	00070613          	mv	a2,a4
800039d4:	00078693          	mv	a3,a5
800039d8:	00070513          	mv	a0,a4
800039dc:	00078593          	mv	a1,a5
800039e0:	06812c23          	sw	s0,120(sp)
800039e4:	06912a23          	sw	s1,116(sp)
800039e8:	07612023          	sw	s6,96(sp)
800039ec:	05812c23          	sw	s8,88(sp)
800039f0:	05912a23          	sw	s9,84(sp)
800039f4:	06112e23          	sw	ra,124(sp)
800039f8:	08012c83          	lw	s9,128(sp)
800039fc:	00070413          	mv	s0,a4
80003a00:	00078493          	mv	s1,a5
80003a04:	00080c13          	mv	s8,a6
80003a08:	00088b13          	mv	s6,a7
80003a0c:	d41fd0ef          	jal	8000174c <__eqdf2>
80003a10:	4e051c63          	bnez	a0,80003f08 <_etoa+0x55c>
80003a14:	a00016b7          	lui	a3,0xa0001
80003a18:	8b86a603          	lw	a2,-1864(a3) # a00008b8 <intpat+0x2c>
80003a1c:	8bc6a683          	lw	a3,-1860(a3)
80003a20:	00040513          	mv	a0,s0
80003a24:	00048593          	mv	a1,s1
80003a28:	db1fd0ef          	jal	800017d8 <__gedf2>
80003a2c:	4ca04e63          	bgtz	a0,80003f08 <_etoa+0x55c>
80003a30:	a00016b7          	lui	a3,0xa0001
80003a34:	8c06a603          	lw	a2,-1856(a3) # a00008c0 <intpat+0x34>
80003a38:	8c46a683          	lw	a3,-1852(a3)
80003a3c:	00040513          	mv	a0,s0
80003a40:	00048593          	mv	a1,s1
80003a44:	e71fd0ef          	jal	800018b4 <__ledf2>
80003a48:	4c054063          	bltz	a0,80003f08 <_etoa+0x55c>
80003a4c:	00040513          	mv	a0,s0
80003a50:	00048593          	mv	a1,s1
80003a54:	00000613          	li	a2,0
80003a58:	00000693          	li	a3,0
80003a5c:	05712e23          	sw	s7,92(sp)
80003a60:	05a12823          	sw	s10,80(sp)
80003a64:	05b12623          	sw	s11,76(sp)
80003a68:	80000bb7          	lui	s7,0x80000
80003a6c:	e49fd0ef          	jal	800018b4 <__ledf2>
80003a70:	02812223          	sw	s0,36(sp)
80003a74:	009bcbb3          	xor	s7,s7,s1
80003a78:	00054463          	bltz	a0,80003a80 <_etoa+0xd4>
80003a7c:	00048b93          	mv	s7,s1
80003a80:	400cf793          	and	a5,s9,1024
80003a84:	02f12e23          	sw	a5,60(sp)
80003a88:	00079463          	bnez	a5,80003a90 <_etoa+0xe4>
80003a8c:	00600c13          	li	s8,6
80003a90:	014bd513          	srl	a0,s7,0x14
80003a94:	7ff57513          	and	a0,a0,2047
80003a98:	c0150513          	add	a0,a0,-1023
80003a9c:	d89fe0ef          	jal	80002824 <__floatsidf>
80003aa0:	a00017b7          	lui	a5,0xa0001
80003aa4:	8c87a603          	lw	a2,-1848(a5) # a00008c8 <intpat+0x3c>
80003aa8:	8cc7a683          	lw	a3,-1844(a5)
80003aac:	ee5fd0ef          	jal	80001990 <__muldf3>
80003ab0:	a00017b7          	lui	a5,0xa0001
80003ab4:	8d07a603          	lw	a2,-1840(a5) # a00008d0 <intpat+0x44>
80003ab8:	8d47a683          	lw	a3,-1836(a5)
80003abc:	e21fc0ef          	jal	800008dc <__adddf3>
80003ac0:	00cb9693          	sll	a3,s7,0xc
80003ac4:	00c6d693          	srl	a3,a3,0xc
80003ac8:	3ff007b7          	lui	a5,0x3ff00
80003acc:	00d7e7b3          	or	a5,a5,a3
80003ad0:	a00016b7          	lui	a3,0xa0001
80003ad4:	8d86a603          	lw	a2,-1832(a3) # a00008d8 <intpat+0x4c>
80003ad8:	8dc6a683          	lw	a3,-1828(a3)
80003adc:	00050d93          	mv	s11,a0
80003ae0:	00058d13          	mv	s10,a1
80003ae4:	00040513          	mv	a0,s0
80003ae8:	00078593          	mv	a1,a5
80003aec:	c94fe0ef          	jal	80001f80 <__subdf3>
80003af0:	a00017b7          	lui	a5,0xa0001
80003af4:	8e07a603          	lw	a2,-1824(a5) # a00008e0 <intpat+0x54>
80003af8:	8e47a683          	lw	a3,-1820(a5)
80003afc:	e95fd0ef          	jal	80001990 <__muldf3>
80003b00:	00050613          	mv	a2,a0
80003b04:	00058693          	mv	a3,a1
80003b08:	000d8513          	mv	a0,s11
80003b0c:	000d0593          	mv	a1,s10
80003b10:	dcdfc0ef          	jal	800008dc <__adddf3>
80003b14:	c15fe0ef          	jal	80002728 <__fixdfsi>
80003b18:	00050d13          	mv	s10,a0
80003b1c:	d09fe0ef          	jal	80002824 <__floatsidf>
80003b20:	a00017b7          	lui	a5,0xa0001
80003b24:	8e87a603          	lw	a2,-1816(a5) # a00008e8 <intpat+0x5c>
80003b28:	8ec7a683          	lw	a3,-1812(a5)
80003b2c:	00058d93          	mv	s11,a1
80003b30:	00a12c23          	sw	a0,24(sp)
80003b34:	e5dfd0ef          	jal	80001990 <__muldf3>
80003b38:	a0001737          	lui	a4,0xa0001
80003b3c:	8f072603          	lw	a2,-1808(a4) # a00008f0 <intpat+0x64>
80003b40:	8f472683          	lw	a3,-1804(a4)
80003b44:	d99fc0ef          	jal	800008dc <__adddf3>
80003b48:	be1fe0ef          	jal	80002728 <__fixdfsi>
80003b4c:	01812783          	lw	a5,24(sp)
80003b50:	a00016b7          	lui	a3,0xa0001
80003b54:	8f86a603          	lw	a2,-1800(a3) # a00008f8 <intpat+0x6c>
80003b58:	8fc6a683          	lw	a3,-1796(a3)
80003b5c:	00050713          	mv	a4,a0
80003b60:	000d8593          	mv	a1,s11
80003b64:	00078513          	mv	a0,a5
80003b68:	00070d93          	mv	s11,a4
80003b6c:	e25fd0ef          	jal	80001990 <__muldf3>
80003b70:	00050793          	mv	a5,a0
80003b74:	000d8513          	mv	a0,s11
80003b78:	00f12c23          	sw	a5,24(sp)
80003b7c:	03b12423          	sw	s11,40(sp)
80003b80:	00058d93          	mv	s11,a1
80003b84:	ca1fe0ef          	jal	80002824 <__floatsidf>
80003b88:	a0001737          	lui	a4,0xa0001
80003b8c:	90072603          	lw	a2,-1792(a4) # a0000900 <intpat+0x74>
80003b90:	90472683          	lw	a3,-1788(a4)
80003b94:	dfdfd0ef          	jal	80001990 <__muldf3>
80003b98:	01812783          	lw	a5,24(sp)
80003b9c:	00050613          	mv	a2,a0
80003ba0:	00058693          	mv	a3,a1
80003ba4:	00078513          	mv	a0,a5
80003ba8:	000d8593          	mv	a1,s11
80003bac:	bd4fe0ef          	jal	80001f80 <__subdf3>
80003bb0:	00050613          	mv	a2,a0
80003bb4:	00058693          	mv	a3,a1
80003bb8:	02a12623          	sw	a0,44(sp)
80003bbc:	00b12c23          	sw	a1,24(sp)
80003bc0:	dd1fd0ef          	jal	80001990 <__muldf3>
80003bc4:	01812783          	lw	a5,24(sp)
80003bc8:	02c12703          	lw	a4,44(sp)
80003bcc:	00050d93          	mv	s11,a0
80003bd0:	00078693          	mv	a3,a5
80003bd4:	00070613          	mv	a2,a4
80003bd8:	00070513          	mv	a0,a4
80003bdc:	00058813          	mv	a6,a1
80003be0:	00078593          	mv	a1,a5
80003be4:	02e12c23          	sw	a4,56(sp)
80003be8:	02f12a23          	sw	a5,52(sp)
80003bec:	01012c23          	sw	a6,24(sp)
80003bf0:	cedfc0ef          	jal	800008dc <__adddf3>
80003bf4:	a00016b7          	lui	a3,0xa0001
80003bf8:	00058893          	mv	a7,a1
80003bfc:	9086a603          	lw	a2,-1784(a3) # a0000908 <intpat+0x7c>
80003c00:	01812583          	lw	a1,24(sp)
80003c04:	90c6a683          	lw	a3,-1780(a3)
80003c08:	00050313          	mv	t1,a0
80003c0c:	000d8513          	mv	a0,s11
80003c10:	02612823          	sw	t1,48(sp)
80003c14:	03112623          	sw	a7,44(sp)
80003c18:	c58fd0ef          	jal	80001070 <__divdf3>
80003c1c:	a0001837          	lui	a6,0xa0001
80003c20:	91082603          	lw	a2,-1776(a6) # a0000910 <intpat+0x84>
80003c24:	91482683          	lw	a3,-1772(a6)
80003c28:	cb5fc0ef          	jal	800008dc <__adddf3>
80003c2c:	00058693          	mv	a3,a1
80003c30:	01812583          	lw	a1,24(sp)
80003c34:	00050613          	mv	a2,a0
80003c38:	000d8513          	mv	a0,s11
80003c3c:	c34fd0ef          	jal	80001070 <__divdf3>
80003c40:	a00016b7          	lui	a3,0xa0001
80003c44:	9186a603          	lw	a2,-1768(a3) # a0000918 <intpat+0x8c>
80003c48:	91c6a683          	lw	a3,-1764(a3)
80003c4c:	c91fc0ef          	jal	800008dc <__adddf3>
80003c50:	00058693          	mv	a3,a1
80003c54:	01812583          	lw	a1,24(sp)
80003c58:	00050613          	mv	a2,a0
80003c5c:	000d8513          	mv	a0,s11
80003c60:	c10fd0ef          	jal	80001070 <__divdf3>
80003c64:	03812703          	lw	a4,56(sp)
80003c68:	03412783          	lw	a5,52(sp)
80003c6c:	a00016b7          	lui	a3,0xa0001
80003c70:	00050e13          	mv	t3,a0
80003c74:	00058d93          	mv	s11,a1
80003c78:	9206a503          	lw	a0,-1760(a3) # a0000920 <intpat+0x94>
80003c7c:	9246a583          	lw	a1,-1756(a3)
80003c80:	00070613          	mv	a2,a4
80003c84:	00078693          	mv	a3,a5
80003c88:	01c12c23          	sw	t3,24(sp)
80003c8c:	af4fe0ef          	jal	80001f80 <__subdf3>
80003c90:	01812e03          	lw	t3,24(sp)
80003c94:	00050613          	mv	a2,a0
80003c98:	00058693          	mv	a3,a1
80003c9c:	000e0513          	mv	a0,t3
80003ca0:	000d8593          	mv	a1,s11
80003ca4:	c39fc0ef          	jal	800008dc <__adddf3>
80003ca8:	03012303          	lw	t1,48(sp)
80003cac:	02c12883          	lw	a7,44(sp)
80003cb0:	00050613          	mv	a2,a0
80003cb4:	00058693          	mv	a3,a1
80003cb8:	00030513          	mv	a0,t1
80003cbc:	00088593          	mv	a1,a7
80003cc0:	bb0fd0ef          	jal	80001070 <__divdf3>
80003cc4:	a00017b7          	lui	a5,0xa0001
80003cc8:	9287a603          	lw	a2,-1752(a5) # a0000928 <intpat+0x9c>
80003ccc:	92c7a683          	lw	a3,-1748(a5)
80003cd0:	c0dfc0ef          	jal	800008dc <__adddf3>
80003cd4:	02812783          	lw	a5,40(sp)
80003cd8:	00000613          	li	a2,0
80003cdc:	3ff78793          	add	a5,a5,1023
80003ce0:	01479793          	sll	a5,a5,0x14
80003ce4:	00078693          	mv	a3,a5
80003ce8:	ca9fd0ef          	jal	80001990 <__muldf3>
80003cec:	00040613          	mv	a2,s0
80003cf0:	000b8693          	mv	a3,s7
80003cf4:	00050d93          	mv	s11,a0
80003cf8:	00b12c23          	sw	a1,24(sp)
80003cfc:	addfd0ef          	jal	800017d8 <__gedf2>
80003d00:	a0001837          	lui	a6,0xa0001
80003d04:	24a04c63          	bgtz	a0,80003f5c <_etoa+0x5b0>
80003d08:	01812783          	lw	a5,24(sp)
80003d0c:	000d8713          	mv	a4,s11
80003d10:	0c600693          	li	a3,198
80003d14:	063d0d93          	add	s11,s10,99
80003d18:	01b6bdb3          	sltu	s11,a3,s11
80003d1c:	014c9693          	sll	a3,s9,0x14
80003d20:	004d8d93          	add	s11,s11,4
80003d24:	0606d263          	bgez	a3,80003d88 <_etoa+0x3dc>
80003d28:	a00016b7          	lui	a3,0xa0001
80003d2c:	9306a603          	lw	a2,-1744(a3) # a0000930 <intpat+0xa4>
80003d30:	9346a683          	lw	a3,-1740(a3)
80003d34:	00040513          	mv	a0,s0
80003d38:	000b8593          	mv	a1,s7
80003d3c:	00e12c23          	sw	a4,24(sp)
80003d40:	00f12e23          	sw	a5,28(sp)
80003d44:	a95fd0ef          	jal	800017d8 <__gedf2>
80003d48:	01812703          	lw	a4,24(sp)
80003d4c:	01c12783          	lw	a5,28(sp)
80003d50:	02054463          	bltz	a0,80003d78 <_etoa+0x3cc>
80003d54:	a00016b7          	lui	a3,0xa0001
80003d58:	9386a603          	lw	a2,-1736(a3) # a0000938 <intpat+0xac>
80003d5c:	93c6a683          	lw	a3,-1732(a3)
80003d60:	00040513          	mv	a0,s0
80003d64:	000b8593          	mv	a1,s7
80003d68:	b4dfd0ef          	jal	800018b4 <__ledf2>
80003d6c:	01812703          	lw	a4,24(sp)
80003d70:	01c12783          	lw	a5,28(sp)
80003d74:	20054663          	bltz	a0,80003f80 <_etoa+0x5d4>
80003d78:	000c0863          	beqz	s8,80003d88 <_etoa+0x3dc>
80003d7c:	03c12683          	lw	a3,60(sp)
80003d80:	00d036b3          	snez	a3,a3
80003d84:	40dc0c33          	sub	s8,s8,a3
80003d88:	00000893          	li	a7,0
80003d8c:	016df463          	bgeu	s11,s6,80003d94 <_etoa+0x3e8>
80003d90:	41bb08b3          	sub	a7,s6,s11
80003d94:	002cf693          	and	a3,s9,2
80003d98:	02d12423          	sw	a3,40(sp)
80003d9c:	00068863          	beqz	a3,80003dac <_etoa+0x400>
80003da0:	001db693          	seqz	a3,s11
80003da4:	40d006b3          	neg	a3,a3
80003da8:	00d8f8b3          	and	a7,a7,a3
80003dac:	020d0463          	beqz	s10,80003dd4 <_etoa+0x428>
80003db0:	000b8593          	mv	a1,s7
80003db4:	00040513          	mv	a0,s0
80003db8:	00070613          	mv	a2,a4
80003dbc:	00078693          	mv	a3,a5
80003dc0:	01112c23          	sw	a7,24(sp)
80003dc4:	aacfd0ef          	jal	80001070 <__divdf3>
80003dc8:	01812883          	lw	a7,24(sp)
80003dcc:	02a12223          	sw	a0,36(sp)
80003dd0:	00058b93          	mv	s7,a1
80003dd4:	00040513          	mv	a0,s0
80003dd8:	00048593          	mv	a1,s1
80003ddc:	00000613          	li	a2,0
80003de0:	00000693          	li	a3,0
80003de4:	01112c23          	sw	a7,24(sp)
80003de8:	acdfd0ef          	jal	800018b4 <__ledf2>
80003dec:	01812883          	lw	a7,24(sp)
80003df0:	00055663          	bgez	a0,80003dfc <_etoa+0x450>
80003df4:	800007b7          	lui	a5,0x80000
80003df8:	0177cbb3          	xor	s7,a5,s7
80003dfc:	02412683          	lw	a3,36(sp)
80003e00:	fffff7b7          	lui	a5,0xfffff
80003e04:	7ff78793          	add	a5,a5,2047 # fffff7ff <__stack_base+0x3ffff7ff>
80003e08:	00fcf7b3          	and	a5,s9,a5
80003e0c:	00f12023          	sw	a5,0(sp)
80003e10:	00068713          	mv	a4,a3
80003e14:	000c0813          	mv	a6,s8
80003e18:	000b8793          	mv	a5,s7
80003e1c:	000a8693          	mv	a3,s5
80003e20:	00090613          	mv	a2,s2
80003e24:	000a0593          	mv	a1,s4
80003e28:	00098513          	mv	a0,s3
80003e2c:	178000ef          	jal	80003fa4 <_ftoa>
80003e30:	00050413          	mv	s0,a0
80003e34:	080d8a63          	beqz	s11,80003ec8 <_etoa+0x51c>
80003e38:	fffcc513          	not	a0,s9
80003e3c:	02057513          	and	a0,a0,32
80003e40:	00040613          	mv	a2,s0
80003e44:	000a8693          	mv	a3,s5
80003e48:	000a0593          	mv	a1,s4
80003e4c:	04550513          	add	a0,a0,69
80003e50:	000980e7          	jalr	s3
80003e54:	41fd5713          	sra	a4,s10,0x1f
80003e58:	00140413          	add	s0,s0,1
80003e5c:	01a746b3          	xor	a3,a4,s10
80003e60:	00500793          	li	a5,5
80003e64:	fffd8d93          	add	s11,s11,-1
80003e68:	00f12223          	sw	a5,4(sp)
80003e6c:	40e68733          	sub	a4,a3,a4
80003e70:	01fd5793          	srl	a5,s10,0x1f
80003e74:	00040613          	mv	a2,s0
80003e78:	01b12023          	sw	s11,0(sp)
80003e7c:	00000893          	li	a7,0
80003e80:	00a00813          	li	a6,10
80003e84:	000a8693          	mv	a3,s5
80003e88:	000a0593          	mv	a1,s4
80003e8c:	00098513          	mv	a0,s3
80003e90:	8c9ff0ef          	jal	80003758 <_ntoa_long>
80003e94:	02812783          	lw	a5,40(sp)
80003e98:	00050413          	mv	s0,a0
80003e9c:	02078663          	beqz	a5,80003ec8 <_etoa+0x51c>
80003ea0:	41250933          	sub	s2,a0,s2
80003ea4:	03697263          	bgeu	s2,s6,80003ec8 <_etoa+0x51c>
80003ea8:	00040613          	mv	a2,s0
80003eac:	000a8693          	mv	a3,s5
80003eb0:	000a0593          	mv	a1,s4
80003eb4:	02000513          	li	a0,32
80003eb8:	00190913          	add	s2,s2,1
80003ebc:	00140413          	add	s0,s0,1
80003ec0:	000980e7          	jalr	s3
80003ec4:	ff6962e3          	bltu	s2,s6,80003ea8 <_etoa+0x4fc>
80003ec8:	07c12083          	lw	ra,124(sp)
80003ecc:	00040513          	mv	a0,s0
80003ed0:	07812403          	lw	s0,120(sp)
80003ed4:	05c12b83          	lw	s7,92(sp)
80003ed8:	05012d03          	lw	s10,80(sp)
80003edc:	04c12d83          	lw	s11,76(sp)
80003ee0:	07412483          	lw	s1,116(sp)
80003ee4:	07012903          	lw	s2,112(sp)
80003ee8:	06c12983          	lw	s3,108(sp)
80003eec:	06812a03          	lw	s4,104(sp)
80003ef0:	06412a83          	lw	s5,100(sp)
80003ef4:	06012b03          	lw	s6,96(sp)
80003ef8:	05812c03          	lw	s8,88(sp)
80003efc:	05412c83          	lw	s9,84(sp)
80003f00:	08010113          	add	sp,sp,128
80003f04:	00008067          	ret
80003f08:	00040713          	mv	a4,s0
80003f0c:	07812403          	lw	s0,120(sp)
80003f10:	09912023          	sw	s9,128(sp)
80003f14:	07c12083          	lw	ra,124(sp)
80003f18:	05412c83          	lw	s9,84(sp)
80003f1c:	00048793          	mv	a5,s1
80003f20:	000b0893          	mv	a7,s6
80003f24:	07412483          	lw	s1,116(sp)
80003f28:	06012b03          	lw	s6,96(sp)
80003f2c:	000c0813          	mv	a6,s8
80003f30:	000a8693          	mv	a3,s5
80003f34:	05812c03          	lw	s8,88(sp)
80003f38:	06412a83          	lw	s5,100(sp)
80003f3c:	00090613          	mv	a2,s2
80003f40:	000a0593          	mv	a1,s4
80003f44:	07012903          	lw	s2,112(sp)
80003f48:	06812a03          	lw	s4,104(sp)
80003f4c:	00098513          	mv	a0,s3
80003f50:	06c12983          	lw	s3,108(sp)
80003f54:	08010113          	add	sp,sp,128
80003f58:	04c0006f          	j	80003fa4 <_ftoa>
80003f5c:	91082603          	lw	a2,-1776(a6) # a0000910 <intpat+0x84>
80003f60:	91482683          	lw	a3,-1772(a6)
80003f64:	01812583          	lw	a1,24(sp)
80003f68:	000d8513          	mv	a0,s11
80003f6c:	fffd0d13          	add	s10,s10,-1
80003f70:	900fd0ef          	jal	80001070 <__divdf3>
80003f74:	00050713          	mv	a4,a0
80003f78:	00058793          	mv	a5,a1
80003f7c:	d95ff06f          	j	80003d10 <_etoa+0x364>
80003f80:	018d5e63          	bge	s10,s8,80003f9c <_etoa+0x5f0>
80003f84:	41ac0d33          	sub	s10,s8,s10
80003f88:	fffd0c13          	add	s8,s10,-1
80003f8c:	400cec93          	or	s9,s9,1024
80003f90:	00000d93          	li	s11,0
80003f94:	00000d13          	li	s10,0
80003f98:	df1ff06f          	j	80003d88 <_etoa+0x3dc>
80003f9c:	00000c13          	li	s8,0
80003fa0:	fedff06f          	j	80003f8c <_etoa+0x5e0>

80003fa4 <_ftoa>:
80003fa4:	f8010113          	add	sp,sp,-128
80003fa8:	07312623          	sw	s3,108(sp)
80003fac:	05812c23          	sw	s8,88(sp)
80003fb0:	05912a23          	sw	s9,84(sp)
80003fb4:	05a12823          	sw	s10,80(sp)
80003fb8:	00050993          	mv	s3,a0
80003fbc:	00058c13          	mv	s8,a1
80003fc0:	00060c93          	mv	s9,a2
80003fc4:	00068d13          	mv	s10,a3
80003fc8:	00070613          	mv	a2,a4
80003fcc:	00078693          	mv	a3,a5
80003fd0:	00070513          	mv	a0,a4
80003fd4:	00078593          	mv	a1,a5
80003fd8:	06812c23          	sw	s0,120(sp)
80003fdc:	06912a23          	sw	s1,116(sp)
80003fe0:	07212823          	sw	s2,112(sp)
80003fe4:	07612023          	sw	s6,96(sp)
80003fe8:	05b12623          	sw	s11,76(sp)
80003fec:	06112e23          	sw	ra,124(sp)
80003ff0:	08012d83          	lw	s11,128(sp)
80003ff4:	00070493          	mv	s1,a4
80003ff8:	00078413          	mv	s0,a5
80003ffc:	00080b13          	mv	s6,a6
80004000:	00088913          	mv	s2,a7
80004004:	f48fd0ef          	jal	8000174c <__eqdf2>
80004008:	20051063          	bnez	a0,80004208 <_ftoa+0x264>
8000400c:	a00017b7          	lui	a5,0xa0001
80004010:	8c07a603          	lw	a2,-1856(a5) # a00008c0 <intpat+0x34>
80004014:	8c47a683          	lw	a3,-1852(a5)
80004018:	00048513          	mv	a0,s1
8000401c:	00040593          	mv	a1,s0
80004020:	895fd0ef          	jal	800018b4 <__ledf2>
80004024:	2c054463          	bltz	a0,800042ec <_ftoa+0x348>
80004028:	a00017b7          	lui	a5,0xa0001
8000402c:	8b87a603          	lw	a2,-1864(a5) # a00008b8 <intpat+0x2c>
80004030:	8bc7a683          	lw	a3,-1860(a5)
80004034:	00048513          	mv	a0,s1
80004038:	00040593          	mv	a1,s0
8000403c:	f9cfd0ef          	jal	800017d8 <__gedf2>
80004040:	1aa04463          	bgtz	a0,800041e8 <_ftoa+0x244>
80004044:	07412423          	sw	s4,104(sp)
80004048:	a0001a37          	lui	s4,0xa0001
8000404c:	940a2603          	lw	a2,-1728(s4) # a0000940 <intpat+0xb4>
80004050:	944a2683          	lw	a3,-1724(s4)
80004054:	00048513          	mv	a0,s1
80004058:	00040593          	mv	a1,s0
8000405c:	f7cfd0ef          	jal	800017d8 <__gedf2>
80004060:	22a04a63          	bgtz	a0,80004294 <_ftoa+0x2f0>
80004064:	a00017b7          	lui	a5,0xa0001
80004068:	9487a603          	lw	a2,-1720(a5) # a0000948 <intpat+0xbc>
8000406c:	94c7a683          	lw	a3,-1716(a5)
80004070:	00048513          	mv	a0,s1
80004074:	00040593          	mv	a1,s0
80004078:	83dfd0ef          	jal	800018b4 <__ledf2>
8000407c:	20054c63          	bltz	a0,80004294 <_ftoa+0x2f0>
80004080:	00048513          	mv	a0,s1
80004084:	00040593          	mv	a1,s0
80004088:	00000613          	li	a2,0
8000408c:	00000693          	li	a3,0
80004090:	07512223          	sw	s5,100(sp)
80004094:	05712e23          	sw	s7,92(sp)
80004098:	81dfd0ef          	jal	800018b4 <__ledf2>
8000409c:	1c054863          	bltz	a0,8000426c <_ftoa+0x2c8>
800040a0:	00012c23          	sw	zero,24(sp)
800040a4:	400dfa93          	and	s5,s11,1024
800040a8:	3c0a8a63          	beqz	s5,8000447c <_ftoa+0x4d8>
800040ac:	00900793          	li	a5,9
800040b0:	4d67f063          	bgeu	a5,s6,80004570 <_ftoa+0x5cc>
800040b4:	ff7b0a93          	add	s5,s6,-9
800040b8:	00000693          	li	a3,0
800040bc:	02010b93          	add	s7,sp,32
800040c0:	03000513          	li	a0,48
800040c4:	02000593          	li	a1,32
800040c8:	00168693          	add	a3,a3,1
800040cc:	00db8633          	add	a2,s7,a3
800040d0:	fea60fa3          	sb	a0,-1(a2)
800040d4:	40db0333          	sub	t1,s6,a3
800040d8:	3eb68c63          	beq	a3,a1,800044d0 <_ftoa+0x52c>
800040dc:	ff5696e3          	bne	a3,s5,800040c8 <_ftoa+0x124>
800040e0:	940a2783          	lw	a5,-1728(s4)
800040e4:	944a2803          	lw	a6,-1724(s4)
800040e8:	00f12023          	sw	a5,0(sp)
800040ec:	01012223          	sw	a6,4(sp)
800040f0:	00040593          	mv	a1,s0
800040f4:	00048513          	mv	a0,s1
800040f8:	00612a23          	sw	t1,20(sp)
800040fc:	e2cfe0ef          	jal	80002728 <__fixdfsi>
80004100:	00050a13          	mv	s4,a0
80004104:	f20fe0ef          	jal	80002824 <__floatsidf>
80004108:	00050613          	mv	a2,a0
8000410c:	00058693          	mv	a3,a1
80004110:	00048513          	mv	a0,s1
80004114:	00040593          	mv	a1,s0
80004118:	e69fd0ef          	jal	80001f80 <__subdf3>
8000411c:	00012603          	lw	a2,0(sp)
80004120:	00412683          	lw	a3,4(sp)
80004124:	86dfd0ef          	jal	80001990 <__muldf3>
80004128:	00058b13          	mv	s6,a1
8000412c:	00a12823          	sw	a0,16(sp)
80004130:	e78fe0ef          	jal	800027a8 <__fixunsdfsi>
80004134:	00a12623          	sw	a0,12(sp)
80004138:	f94fe0ef          	jal	800028cc <__floatunsidf>
8000413c:	01012783          	lw	a5,16(sp)
80004140:	00050613          	mv	a2,a0
80004144:	00058693          	mv	a3,a1
80004148:	00078513          	mv	a0,a5
8000414c:	000b0593          	mv	a1,s6
80004150:	e31fd0ef          	jal	80001f80 <__subdf3>
80004154:	a0001b37          	lui	s6,0xa0001
80004158:	8f0b2603          	lw	a2,-1808(s6) # a00008f0 <intpat+0x64>
8000415c:	8f4b2683          	lw	a3,-1804(s6)
80004160:	00a12823          	sw	a0,16(sp)
80004164:	00b12e23          	sw	a1,28(sp)
80004168:	e70fd0ef          	jal	800017d8 <__gedf2>
8000416c:	00c12883          	lw	a7,12(sp)
80004170:	01412303          	lw	t1,20(sp)
80004174:	2ca05863          	blez	a0,80004444 <_ftoa+0x4a0>
80004178:	00188893          	add	a7,a7,1
8000417c:	00088513          	mv	a0,a7
80004180:	00612823          	sw	t1,16(sp)
80004184:	01112623          	sw	a7,12(sp)
80004188:	f44fe0ef          	jal	800028cc <__floatunsidf>
8000418c:	00012603          	lw	a2,0(sp)
80004190:	00412683          	lw	a3,4(sp)
80004194:	e44fd0ef          	jal	800017d8 <__gedf2>
80004198:	00c12883          	lw	a7,12(sp)
8000419c:	01012303          	lw	t1,16(sp)
800041a0:	00054663          	bltz	a0,800041ac <_ftoa+0x208>
800041a4:	001a0a13          	add	s4,s4,1
800041a8:	00000893          	li	a7,0
800041ac:	14030c63          	beqz	t1,80004304 <_ftoa+0x360>
800041b0:	02000513          	li	a0,32
800041b4:	00a00613          	li	a2,10
800041b8:	00900e13          	li	t3,9
800041bc:	30aa8663          	beq	s5,a0,800044c8 <_ftoa+0x524>
800041c0:	02c8f6b3          	remu	a3,a7,a2
800041c4:	001a8a93          	add	s5,s5,1
800041c8:	015b85b3          	add	a1,s7,s5
800041cc:	fff30313          	add	t1,t1,-1
800041d0:	03068693          	add	a3,a3,48
800041d4:	fed58fa3          	sb	a3,-1(a1)
800041d8:	02c8d6b3          	divu	a3,a7,a2
800041dc:	2d1e7063          	bgeu	t3,a7,8000449c <_ftoa+0x4f8>
800041e0:	00068893          	mv	a7,a3
800041e4:	fd9ff06f          	j	800041bc <_ftoa+0x218>
800041e8:	004df793          	and	a5,s11,4
800041ec:	06079863          	bnez	a5,8000425c <_ftoa+0x2b8>
800041f0:	a0000737          	lui	a4,0xa0000
800041f4:	18070713          	add	a4,a4,384 # a0000180 <__clz_tab+0x108>
800041f8:	00300793          	li	a5,3
800041fc:	000d8893          	mv	a7,s11
80004200:	00090813          	mv	a6,s2
80004204:	0180006f          	j	8000421c <_ftoa+0x278>
80004208:	a0000737          	lui	a4,0xa0000
8000420c:	000d8893          	mv	a7,s11
80004210:	00090813          	mv	a6,s2
80004214:	00300793          	li	a5,3
80004218:	18470713          	add	a4,a4,388 # a0000184 <__clz_tab+0x10c>
8000421c:	07812403          	lw	s0,120(sp)
80004220:	07c12083          	lw	ra,124(sp)
80004224:	07412483          	lw	s1,116(sp)
80004228:	07012903          	lw	s2,112(sp)
8000422c:	06012b03          	lw	s6,96(sp)
80004230:	04c12d83          	lw	s11,76(sp)
80004234:	000d0693          	mv	a3,s10
80004238:	000c8613          	mv	a2,s9
8000423c:	05012d03          	lw	s10,80(sp)
80004240:	05412c83          	lw	s9,84(sp)
80004244:	000c0593          	mv	a1,s8
80004248:	00098513          	mv	a0,s3
8000424c:	05812c03          	lw	s8,88(sp)
80004250:	06c12983          	lw	s3,108(sp)
80004254:	08010113          	add	sp,sp,128
80004258:	870ff06f          	j	800032c8 <_out_rev>
8000425c:	a0000737          	lui	a4,0xa0000
80004260:	17870713          	add	a4,a4,376 # a0000178 <__clz_tab+0x100>
80004264:	00400793          	li	a5,4
80004268:	f95ff06f          	j	800041fc <_ftoa+0x258>
8000426c:	00048613          	mv	a2,s1
80004270:	00040693          	mv	a3,s0
80004274:	00000513          	li	a0,0
80004278:	00000593          	li	a1,0
8000427c:	d05fd0ef          	jal	80001f80 <__subdf3>
80004280:	00100793          	li	a5,1
80004284:	00050493          	mv	s1,a0
80004288:	00058413          	mv	s0,a1
8000428c:	00f12c23          	sw	a5,24(sp)
80004290:	e15ff06f          	j	800040a4 <_ftoa+0x100>
80004294:	00040793          	mv	a5,s0
80004298:	07812403          	lw	s0,120(sp)
8000429c:	09b12023          	sw	s11,128(sp)
800042a0:	06812a03          	lw	s4,104(sp)
800042a4:	07c12083          	lw	ra,124(sp)
800042a8:	04c12d83          	lw	s11,76(sp)
800042ac:	00048713          	mv	a4,s1
800042b0:	00090893          	mv	a7,s2
800042b4:	07412483          	lw	s1,116(sp)
800042b8:	07012903          	lw	s2,112(sp)
800042bc:	000b0813          	mv	a6,s6
800042c0:	000d0693          	mv	a3,s10
800042c4:	06012b03          	lw	s6,96(sp)
800042c8:	05012d03          	lw	s10,80(sp)
800042cc:	000c8613          	mv	a2,s9
800042d0:	000c0593          	mv	a1,s8
800042d4:	05412c83          	lw	s9,84(sp)
800042d8:	05812c03          	lw	s8,88(sp)
800042dc:	00098513          	mv	a0,s3
800042e0:	06c12983          	lw	s3,108(sp)
800042e4:	08010113          	add	sp,sp,128
800042e8:	ec4ff06f          	j	800039ac <_etoa>
800042ec:	a0000737          	lui	a4,0xa0000
800042f0:	000d8893          	mv	a7,s11
800042f4:	00090813          	mv	a6,s2
800042f8:	00400793          	li	a5,4
800042fc:	18870713          	add	a4,a4,392 # a0000188 <__clz_tab+0x110>
80004300:	f1dff06f          	j	8000421c <_ftoa+0x278>
80004304:	000a0513          	mv	a0,s4
80004308:	d1cfe0ef          	jal	80002824 <__floatsidf>
8000430c:	00050613          	mv	a2,a0
80004310:	00058693          	mv	a3,a1
80004314:	00048513          	mv	a0,s1
80004318:	00040593          	mv	a1,s0
8000431c:	c65fd0ef          	jal	80001f80 <__subdf3>
80004320:	8f0b2603          	lw	a2,-1808(s6)
80004324:	8f4b2683          	lw	a3,-1804(s6)
80004328:	d8cfd0ef          	jal	800018b4 <__ledf2>
8000432c:	00054663          	bltz	a0,80004338 <_ftoa+0x394>
80004330:	001a7693          	and	a3,s4,1
80004334:	00da0a33          	add	s4,s4,a3
80004338:	02000513          	li	a0,32
8000433c:	00a00613          	li	a2,10
80004340:	0aaa8a63          	beq	s5,a0,800043f4 <_ftoa+0x450>
80004344:	02ca66b3          	rem	a3,s4,a2
80004348:	001a8a93          	add	s5,s5,1
8000434c:	015b85b3          	add	a1,s7,s5
80004350:	02ca4a33          	div	s4,s4,a2
80004354:	03068693          	add	a3,a3,48
80004358:	fed58fa3          	sb	a3,-1(a1)
8000435c:	fe0a12e3          	bnez	s4,80004340 <_ftoa+0x39c>
80004360:	003df693          	and	a3,s11,3
80004364:	00100613          	li	a2,1
80004368:	22c68c63          	beq	a3,a2,800045a0 <_ftoa+0x5fc>
8000436c:	02000693          	li	a3,32
80004370:	02da8263          	beq	s5,a3,80004394 <_ftoa+0x3f0>
80004374:	01812783          	lw	a5,24(sp)
80004378:	16078c63          	beqz	a5,800044f0 <_ftoa+0x54c>
8000437c:	020a8793          	add	a5,s5,32
80004380:	02010713          	add	a4,sp,32
80004384:	00e786b3          	add	a3,a5,a4
80004388:	02d00613          	li	a2,45
8000438c:	fec68023          	sb	a2,-32(a3)
80004390:	001a8a93          	add	s5,s5,1
80004394:	000d8893          	mv	a7,s11
80004398:	00090813          	mv	a6,s2
8000439c:	000a8793          	mv	a5,s5
800043a0:	000b8713          	mv	a4,s7
800043a4:	000d0693          	mv	a3,s10
800043a8:	000c8613          	mv	a2,s9
800043ac:	000c0593          	mv	a1,s8
800043b0:	00098513          	mv	a0,s3
800043b4:	f15fe0ef          	jal	800032c8 <_out_rev>
800043b8:	07c12083          	lw	ra,124(sp)
800043bc:	07812403          	lw	s0,120(sp)
800043c0:	06812a03          	lw	s4,104(sp)
800043c4:	06412a83          	lw	s5,100(sp)
800043c8:	05c12b83          	lw	s7,92(sp)
800043cc:	07412483          	lw	s1,116(sp)
800043d0:	07012903          	lw	s2,112(sp)
800043d4:	06c12983          	lw	s3,108(sp)
800043d8:	06012b03          	lw	s6,96(sp)
800043dc:	05812c03          	lw	s8,88(sp)
800043e0:	05412c83          	lw	s9,84(sp)
800043e4:	05012d03          	lw	s10,80(sp)
800043e8:	04c12d83          	lw	s11,76(sp)
800043ec:	08010113          	add	sp,sp,128
800043f0:	00008067          	ret
800043f4:	003df693          	and	a3,s11,3
800043f8:	00100613          	li	a2,1
800043fc:	f8c69ce3          	bne	a3,a2,80004394 <_ftoa+0x3f0>
80004400:	f8090ae3          	beqz	s2,80004394 <_ftoa+0x3f0>
80004404:	01812783          	lw	a5,24(sp)
80004408:	14079e63          	bnez	a5,80004564 <_ftoa+0x5c0>
8000440c:	00cdf693          	and	a3,s11,12
80004410:	14069a63          	bnez	a3,80004564 <_ftoa+0x5c0>
80004414:	0d2afa63          	bgeu	s5,s2,800044e8 <_ftoa+0x544>
80004418:	02000693          	li	a3,32
8000441c:	03000613          	li	a2,48
80004420:	02000593          	li	a1,32
80004424:	00da8c63          	beq	s5,a3,8000443c <_ftoa+0x498>
80004428:	001a8a93          	add	s5,s5,1
8000442c:	015b86b3          	add	a3,s7,s5
80004430:	fec68fa3          	sb	a2,-1(a3)
80004434:	f3590ce3          	beq	s2,s5,8000436c <_ftoa+0x3c8>
80004438:	feba98e3          	bne	s5,a1,80004428 <_ftoa+0x484>
8000443c:	02000a93          	li	s5,32
80004440:	f55ff06f          	j	80004394 <_ftoa+0x3f0>
80004444:	a00017b7          	lui	a5,0xa0001
80004448:	01012503          	lw	a0,16(sp)
8000444c:	01c12583          	lw	a1,28(sp)
80004450:	8f07a603          	lw	a2,-1808(a5) # a00008f0 <intpat+0x64>
80004454:	8f47a683          	lw	a3,-1804(a5)
80004458:	00612623          	sw	t1,12(sp)
8000445c:	01112023          	sw	a7,0(sp)
80004460:	c54fd0ef          	jal	800018b4 <__ledf2>
80004464:	00012883          	lw	a7,0(sp)
80004468:	00c12303          	lw	t1,12(sp)
8000446c:	d40540e3          	bltz	a0,800041ac <_ftoa+0x208>
80004470:	0e089263          	bnez	a7,80004554 <_ftoa+0x5b0>
80004474:	00188893          	add	a7,a7,1
80004478:	d35ff06f          	j	800041ac <_ftoa+0x208>
8000447c:	a0001737          	lui	a4,0xa0001
80004480:	93872783          	lw	a5,-1736(a4) # a0000938 <intpat+0xac>
80004484:	93c72803          	lw	a6,-1732(a4)
80004488:	00600313          	li	t1,6
8000448c:	00f12023          	sw	a5,0(sp)
80004490:	01012223          	sw	a6,4(sp)
80004494:	02010b93          	add	s7,sp,32
80004498:	c59ff06f          	j	800040f0 <_ftoa+0x14c>
8000449c:	02aa8663          	beq	s5,a0,800044c8 <_ftoa+0x524>
800044a0:	01530533          	add	a0,t1,s5
800044a4:	03000593          	li	a1,48
800044a8:	02000613          	li	a2,32
800044ac:	00031663          	bnez	t1,800044b8 <_ftoa+0x514>
800044b0:	06c0006f          	j	8000451c <_ftoa+0x578>
800044b4:	06aa8463          	beq	s5,a0,8000451c <_ftoa+0x578>
800044b8:	001a8a93          	add	s5,s5,1
800044bc:	015b86b3          	add	a3,s7,s5
800044c0:	feb68fa3          	sb	a1,-1(a3)
800044c4:	feca98e3          	bne	s5,a2,800044b4 <_ftoa+0x510>
800044c8:	02000a93          	li	s5,32
800044cc:	e6dff06f          	j	80004338 <_ftoa+0x394>
800044d0:	940a2783          	lw	a5,-1728(s4)
800044d4:	944a2803          	lw	a6,-1724(s4)
800044d8:	02000a93          	li	s5,32
800044dc:	00f12023          	sw	a5,0(sp)
800044e0:	01012223          	sw	a6,4(sp)
800044e4:	c0dff06f          	j	800040f0 <_ftoa+0x14c>
800044e8:	02000693          	li	a3,32
800044ec:	eada84e3          	beq	s5,a3,80004394 <_ftoa+0x3f0>
800044f0:	004df693          	and	a3,s11,4
800044f4:	04069263          	bnez	a3,80004538 <_ftoa+0x594>
800044f8:	008df693          	and	a3,s11,8
800044fc:	e8068ce3          	beqz	a3,80004394 <_ftoa+0x3f0>
80004500:	020a8793          	add	a5,s5,32
80004504:	02010713          	add	a4,sp,32
80004508:	00e786b3          	add	a3,a5,a4
8000450c:	02000613          	li	a2,32
80004510:	fec68023          	sb	a2,-32(a3)
80004514:	001a8a93          	add	s5,s5,1
80004518:	e7dff06f          	j	80004394 <_ftoa+0x3f0>
8000451c:	020a8793          	add	a5,s5,32
80004520:	02010713          	add	a4,sp,32
80004524:	00e786b3          	add	a3,a5,a4
80004528:	02e00613          	li	a2,46
8000452c:	fec68023          	sb	a2,-32(a3)
80004530:	001a8a93          	add	s5,s5,1
80004534:	e05ff06f          	j	80004338 <_ftoa+0x394>
80004538:	020a8793          	add	a5,s5,32
8000453c:	02010713          	add	a4,sp,32
80004540:	00e786b3          	add	a3,a5,a4
80004544:	02b00613          	li	a2,43
80004548:	fec68023          	sb	a2,-32(a3)
8000454c:	001a8a93          	add	s5,s5,1
80004550:	e45ff06f          	j	80004394 <_ftoa+0x3f0>
80004554:	0018f693          	and	a3,a7,1
80004558:	c4068ae3          	beqz	a3,800041ac <_ftoa+0x208>
8000455c:	00188893          	add	a7,a7,1
80004560:	c4dff06f          	j	800041ac <_ftoa+0x208>
80004564:	fff90913          	add	s2,s2,-1
80004568:	eb2ae8e3          	bltu	s5,s2,80004418 <_ftoa+0x474>
8000456c:	e01ff06f          	j	8000436c <_ftoa+0x3c8>
80004570:	a00007b7          	lui	a5,0xa0000
80004574:	003b1713          	sll	a4,s6,0x3
80004578:	7e878793          	add	a5,a5,2024 # a00007e8 <pow10.0>
8000457c:	00e787b3          	add	a5,a5,a4
80004580:	0047a803          	lw	a6,4(a5)
80004584:	0007a783          	lw	a5,0(a5)
80004588:	000b0313          	mv	t1,s6
8000458c:	01012223          	sw	a6,4(sp)
80004590:	00f12023          	sw	a5,0(sp)
80004594:	00000a93          	li	s5,0
80004598:	02010b93          	add	s7,sp,32
8000459c:	b55ff06f          	j	800040f0 <_ftoa+0x14c>
800045a0:	dc0906e3          	beqz	s2,8000436c <_ftoa+0x3c8>
800045a4:	e61ff06f          	j	80004404 <_ftoa+0x460>

800045a8 <_out_char>:
800045a8:	00051463          	bnez	a0,800045b0 <_out_char+0x8>
800045ac:	00008067          	ret
800045b0:	5690206f          	j	80007318 <_putchar>

800045b4 <_vsnprintf>:
800045b4:	f9010113          	add	sp,sp,-112
800045b8:	07212023          	sw	s2,96(sp)
800045bc:	05312e23          	sw	s3,92(sp)
800045c0:	05412c23          	sw	s4,88(sp)
800045c4:	05712623          	sw	s7,76(sp)
800045c8:	03b12e23          	sw	s11,60(sp)
800045cc:	06112623          	sw	ra,108(sp)
800045d0:	06812423          	sw	s0,104(sp)
800045d4:	05a12023          	sw	s10,64(sp)
800045d8:	00058993          	mv	s3,a1
800045dc:	00060913          	mv	s2,a2
800045e0:	00068b93          	mv	s7,a3
800045e4:	00070d93          	mv	s11,a4
800045e8:	00050a13          	mv	s4,a0
800045ec:	4e058863          	beqz	a1,80004adc <_vsnprintf+0x528>
800045f0:	000bc503          	lbu	a0,0(s7) # 80000000 <__start>
800045f4:	00000d13          	li	s10,0
800045f8:	4e050c63          	beqz	a0,80004af0 <_vsnprintf+0x53c>
800045fc:	a00007b7          	lui	a5,0xa0000
80004600:	05512a23          	sw	s5,84(sp)
80004604:	69078793          	add	a5,a5,1680 # a0000690 <__clz_tab+0x618>
80004608:	a0000ab7          	lui	s5,0xa0000
8000460c:	06912223          	sw	s1,100(sp)
80004610:	05612823          	sw	s6,80(sp)
80004614:	05812423          	sw	s8,72(sp)
80004618:	05912223          	sw	s9,68(sp)
8000461c:	01000493          	li	s1,16
80004620:	64ca8a93          	add	s5,s5,1612 # a000064c <__clz_tab+0x5d4>
80004624:	00900b13          	li	s6,9
80004628:	02f12223          	sw	a5,36(sp)
8000462c:	0200006f          	j	8000464c <_vsnprintf+0x98>
80004630:	000d0613          	mv	a2,s10
80004634:	00090693          	mv	a3,s2
80004638:	00098593          	mv	a1,s3
8000463c:	001d0d13          	add	s10,s10,1
80004640:	000a00e7          	jalr	s4
80004644:	000bc503          	lbu	a0,0(s7)
80004648:	16050863          	beqz	a0,800047b8 <_vsnprintf+0x204>
8000464c:	02500793          	li	a5,37
80004650:	001b8b93          	add	s7,s7,1
80004654:	fcf51ee3          	bne	a0,a5,80004630 <_vsnprintf+0x7c>
80004658:	00000413          	li	s0,0
8000465c:	000bc503          	lbu	a0,0(s7)
80004660:	001b8713          	add	a4,s7,1
80004664:	fe050793          	add	a5,a0,-32
80004668:	0ff7f793          	zext.b	a5,a5
8000466c:	00f4ea63          	bltu	s1,a5,80004680 <_vsnprintf+0xcc>
80004670:	00279793          	sll	a5,a5,0x2
80004674:	015787b3          	add	a5,a5,s5
80004678:	0007a783          	lw	a5,0(a5)
8000467c:	00078067          	jr	a5
80004680:	fd050793          	add	a5,a0,-48
80004684:	0ff7f793          	zext.b	a5,a5
80004688:	0cfb7263          	bgeu	s6,a5,8000474c <_vsnprintf+0x198>
8000468c:	02a00793          	li	a5,42
80004690:	00000e93          	li	t4,0
80004694:	1ef50e63          	beq	a0,a5,80004890 <_vsnprintf+0x2dc>
80004698:	02e00793          	li	a5,46
8000469c:	00000c93          	li	s9,0
800046a0:	0ef50463          	beq	a0,a5,80004788 <_vsnprintf+0x1d4>
800046a4:	f9850793          	add	a5,a0,-104
800046a8:	0ff7f793          	zext.b	a5,a5
800046ac:	01200693          	li	a3,18
800046b0:	06f6e063          	bltu	a3,a5,80004710 <_vsnprintf+0x15c>
800046b4:	02412683          	lw	a3,36(sp)
800046b8:	00279793          	sll	a5,a5,0x2
800046bc:	00d787b3          	add	a5,a5,a3
800046c0:	0007a783          	lw	a5,0(a5)
800046c4:	00078067          	jr	a5
800046c8:	00146413          	or	s0,s0,1
800046cc:	00070b93          	mv	s7,a4
800046d0:	f8dff06f          	j	8000465c <_vsnprintf+0xa8>
800046d4:	00246413          	or	s0,s0,2
800046d8:	00070b93          	mv	s7,a4
800046dc:	f81ff06f          	j	8000465c <_vsnprintf+0xa8>
800046e0:	00446413          	or	s0,s0,4
800046e4:	00070b93          	mv	s7,a4
800046e8:	f75ff06f          	j	8000465c <_vsnprintf+0xa8>
800046ec:	01046413          	or	s0,s0,16
800046f0:	00070b93          	mv	s7,a4
800046f4:	f69ff06f          	j	8000465c <_vsnprintf+0xa8>
800046f8:	00846413          	or	s0,s0,8
800046fc:	00070b93          	mv	s7,a4
80004700:	f5dff06f          	j	8000465c <_vsnprintf+0xa8>
80004704:	001bc503          	lbu	a0,1(s7)
80004708:	10046413          	or	s0,s0,256
8000470c:	00170713          	add	a4,a4,1
80004710:	06700793          	li	a5,103
80004714:	00070b93          	mv	s7,a4
80004718:	10a7e063          	bltu	a5,a0,80004818 <_vsnprintf+0x264>
8000471c:	02400793          	li	a5,36
80004720:	f0a7f8e3          	bgeu	a5,a0,80004630 <_vsnprintf+0x7c>
80004724:	fdb50793          	add	a5,a0,-37
80004728:	0ff7f793          	zext.b	a5,a5
8000472c:	04200713          	li	a4,66
80004730:	f0f760e3          	bltu	a4,a5,80004630 <_vsnprintf+0x7c>
80004734:	a0000737          	lui	a4,0xa0000
80004738:	00279793          	sll	a5,a5,0x2
8000473c:	6dc70713          	add	a4,a4,1756 # a00006dc <__clz_tab+0x664>
80004740:	00e787b3          	add	a5,a5,a4
80004744:	0007a783          	lw	a5,0(a5)
80004748:	00078067          	jr	a5
8000474c:	00000e93          	li	t4,0
80004750:	002e9793          	sll	a5,t4,0x2
80004754:	01d787b3          	add	a5,a5,t4
80004758:	00179793          	sll	a5,a5,0x1
8000475c:	00a787b3          	add	a5,a5,a0
80004760:	00074503          	lbu	a0,0(a4)
80004764:	fd078e93          	add	t4,a5,-48
80004768:	00070b93          	mv	s7,a4
8000476c:	fd050793          	add	a5,a0,-48
80004770:	0ff7f793          	zext.b	a5,a5
80004774:	00170713          	add	a4,a4,1
80004778:	fcfb7ce3          	bgeu	s6,a5,80004750 <_vsnprintf+0x19c>
8000477c:	02e00793          	li	a5,46
80004780:	00000c93          	li	s9,0
80004784:	f2f510e3          	bne	a0,a5,800046a4 <_vsnprintf+0xf0>
80004788:	001bc503          	lbu	a0,1(s7)
8000478c:	00900613          	li	a2,9
80004790:	00070693          	mv	a3,a4
80004794:	fd050793          	add	a5,a0,-48
80004798:	0ff7f793          	zext.b	a5,a5
8000479c:	40046413          	or	s0,s0,1024
800047a0:	34f67e63          	bgeu	a2,a5,80004afc <_vsnprintf+0x548>
800047a4:	02a00793          	li	a5,42
800047a8:	3af50863          	beq	a0,a5,80004b58 <_vsnprintf+0x5a4>
800047ac:	00070b93          	mv	s7,a4
800047b0:	00170713          	add	a4,a4,1
800047b4:	ef1ff06f          	j	800046a4 <_vsnprintf+0xf0>
800047b8:	06412483          	lw	s1,100(sp)
800047bc:	05412a83          	lw	s5,84(sp)
800047c0:	05012b03          	lw	s6,80(sp)
800047c4:	04812c03          	lw	s8,72(sp)
800047c8:	04412c83          	lw	s9,68(sp)
800047cc:	000d0413          	mv	s0,s10
800047d0:	012d6463          	bltu	s10,s2,800047d8 <_vsnprintf+0x224>
800047d4:	fff90d13          	add	s10,s2,-1
800047d8:	00090693          	mv	a3,s2
800047dc:	000d0613          	mv	a2,s10
800047e0:	00098593          	mv	a1,s3
800047e4:	00000513          	li	a0,0
800047e8:	000a00e7          	jalr	s4
800047ec:	06c12083          	lw	ra,108(sp)
800047f0:	00040513          	mv	a0,s0
800047f4:	06812403          	lw	s0,104(sp)
800047f8:	06012903          	lw	s2,96(sp)
800047fc:	05c12983          	lw	s3,92(sp)
80004800:	05812a03          	lw	s4,88(sp)
80004804:	04c12b83          	lw	s7,76(sp)
80004808:	04012d03          	lw	s10,64(sp)
8000480c:	03c12d83          	lw	s11,60(sp)
80004810:	07010113          	add	sp,sp,112
80004814:	00008067          	ret
80004818:	f9750793          	add	a5,a0,-105
8000481c:	0ff7f793          	zext.b	a5,a5
80004820:	00f00713          	li	a4,15
80004824:	e0f766e3          	bltu	a4,a5,80004630 <_vsnprintf+0x7c>
80004828:	00009737          	lui	a4,0x9
8000482c:	00100c13          	li	s8,1
80004830:	00fc1c33          	sll	s8,s8,a5
80004834:	04170713          	add	a4,a4,65 # 9041 <__stack_size+0x5041>
80004838:	00ec7c33          	and	s8,s8,a4
8000483c:	2e0c1c63          	bnez	s8,80004b34 <_vsnprintf+0x580>
80004840:	00a00713          	li	a4,10
80004844:	06e78463          	beq	a5,a4,800048ac <_vsnprintf+0x2f8>
80004848:	00700713          	li	a4,7
8000484c:	dee792e3          	bne	a5,a4,80004630 <_vsnprintf+0x7c>
80004850:	000da703          	lw	a4,0(s11)
80004854:	00800793          	li	a5,8
80004858:	02146413          	or	s0,s0,33
8000485c:	00f12023          	sw	a5,0(sp)
80004860:	000d0613          	mv	a2,s10
80004864:	00812223          	sw	s0,4(sp)
80004868:	000c8893          	mv	a7,s9
8000486c:	01000813          	li	a6,16
80004870:	00000793          	li	a5,0
80004874:	00090693          	mv	a3,s2
80004878:	00098593          	mv	a1,s3
8000487c:	000a0513          	mv	a0,s4
80004880:	ed9fe0ef          	jal	80003758 <_ntoa_long>
80004884:	004d8d93          	add	s11,s11,4
80004888:	00050d13          	mv	s10,a0
8000488c:	db9ff06f          	j	80004644 <_vsnprintf+0x90>
80004890:	000dae83          	lw	t4,0(s11)
80004894:	004d8d93          	add	s11,s11,4
80004898:	0c0ecc63          	bltz	t4,80004970 <_vsnprintf+0x3bc>
8000489c:	001bc503          	lbu	a0,1(s7)
800048a0:	00070b93          	mv	s7,a4
800048a4:	00170713          	add	a4,a4,1
800048a8:	df1ff06f          	j	80004698 <_vsnprintf+0xe4>
800048ac:	000da783          	lw	a5,0(s11)
800048b0:	004d8713          	add	a4,s11,4
800048b4:	02e12623          	sw	a4,44(sp)
800048b8:	0007c683          	lbu	a3,0(a5)
800048bc:	02f12023          	sw	a5,32(sp)
800048c0:	00068513          	mv	a0,a3
800048c4:	2a0c9c63          	bnez	s9,80004b7c <_vsnprintf+0x5c8>
800048c8:	02068863          	beqz	a3,800048f8 <_vsnprintf+0x344>
800048cc:	ffe00c13          	li	s8,-2
800048d0:	02012783          	lw	a5,32(sp)
800048d4:	001c0c13          	add	s8,s8,1
800048d8:	01878c33          	add	s8,a5,s8
800048dc:	0080006f          	j	800048e4 <_vsnprintf+0x330>
800048e0:	3afc0463          	beq	s8,a5,80004c88 <_vsnprintf+0x6d4>
800048e4:	0017c703          	lbu	a4,1(a5)
800048e8:	00178793          	add	a5,a5,1
800048ec:	fe071ae3          	bnez	a4,800048e0 <_vsnprintf+0x32c>
800048f0:	02012703          	lw	a4,32(sp)
800048f4:	40e78c33          	sub	s8,a5,a4
800048f8:	40047d93          	and	s11,s0,1024
800048fc:	000d8663          	beqz	s11,80004908 <_vsnprintf+0x354>
80004900:	018cf463          	bgeu	s9,s8,80004908 <_vsnprintf+0x354>
80004904:	000c8c13          	mv	s8,s9
80004908:	00247793          	and	a5,s0,2
8000490c:	02f12423          	sw	a5,40(sp)
80004910:	38078863          	beqz	a5,80004ca0 <_vsnprintf+0x6ec>
80004914:	32068263          	beqz	a3,80004c38 <_vsnprintf+0x684>
80004918:	000d0413          	mv	s0,s10
8000491c:	000d8863          	beqz	s11,8000492c <_vsnprintf+0x378>
80004920:	fffc8793          	add	a5,s9,-1
80004924:	020c8c63          	beqz	s9,8000495c <_vsnprintf+0x3a8>
80004928:	00078c93          	mv	s9,a5
8000492c:	01d12e23          	sw	t4,28(sp)
80004930:	00040613          	mv	a2,s0
80004934:	00090693          	mv	a3,s2
80004938:	00098593          	mv	a1,s3
8000493c:	000a00e7          	jalr	s4
80004940:	02012783          	lw	a5,32(sp)
80004944:	00140413          	add	s0,s0,1
80004948:	41a40733          	sub	a4,s0,s10
8000494c:	00e78733          	add	a4,a5,a4
80004950:	00074503          	lbu	a0,0(a4)
80004954:	01c12e83          	lw	t4,28(sp)
80004958:	fc0512e3          	bnez	a0,8000491c <_vsnprintf+0x368>
8000495c:	02812783          	lw	a5,40(sp)
80004960:	2c079a63          	bnez	a5,80004c34 <_vsnprintf+0x680>
80004964:	02c12d83          	lw	s11,44(sp)
80004968:	00040d13          	mv	s10,s0
8000496c:	cd9ff06f          	j	80004644 <_vsnprintf+0x90>
80004970:	001bc503          	lbu	a0,1(s7)
80004974:	00246413          	or	s0,s0,2
80004978:	00070b93          	mv	s7,a4
8000497c:	41d00eb3          	neg	t4,t4
80004980:	00170713          	add	a4,a4,1
80004984:	d15ff06f          	j	80004698 <_vsnprintf+0xe4>
80004988:	001bc503          	lbu	a0,1(s7)
8000498c:	06c00793          	li	a5,108
80004990:	d6f51ce3          	bne	a0,a5,80004708 <_vsnprintf+0x154>
80004994:	002bc503          	lbu	a0,2(s7)
80004998:	30046413          	or	s0,s0,768
8000499c:	003b8713          	add	a4,s7,3
800049a0:	d71ff06f          	j	80004710 <_vsnprintf+0x15c>
800049a4:	001bc503          	lbu	a0,1(s7)
800049a8:	20046413          	or	s0,s0,512
800049ac:	00170713          	add	a4,a4,1
800049b0:	d61ff06f          	j	80004710 <_vsnprintf+0x15c>
800049b4:	001bc503          	lbu	a0,1(s7)
800049b8:	06800793          	li	a5,104
800049bc:	2af50e63          	beq	a0,a5,80004c78 <_vsnprintf+0x6c4>
800049c0:	08046413          	or	s0,s0,128
800049c4:	00170713          	add	a4,a4,1
800049c8:	d49ff06f          	j	80004710 <_vsnprintf+0x15c>
800049cc:	06700793          	li	a5,103
800049d0:	1cf50063          	beq	a0,a5,80004b90 <_vsnprintf+0x5dc>
800049d4:	04700793          	li	a5,71
800049d8:	28f50663          	beq	a0,a5,80004c64 <_vsnprintf+0x6b0>
800049dc:	04500793          	li	a5,69
800049e0:	28f50863          	beq	a0,a5,80004c70 <_vsnprintf+0x6bc>
800049e4:	007d8d93          	add	s11,s11,7
800049e8:	ff8dfd93          	and	s11,s11,-8
800049ec:	000da703          	lw	a4,0(s11)
800049f0:	004da783          	lw	a5,4(s11)
800049f4:	000d0613          	mv	a2,s10
800049f8:	000e8893          	mv	a7,t4
800049fc:	00812023          	sw	s0,0(sp)
80004a00:	000c8813          	mv	a6,s9
80004a04:	00090693          	mv	a3,s2
80004a08:	00098593          	mv	a1,s3
80004a0c:	000a0513          	mv	a0,s4
80004a10:	f9dfe0ef          	jal	800039ac <_etoa>
80004a14:	008d8d93          	add	s11,s11,8
80004a18:	00050d13          	mv	s10,a0
80004a1c:	c29ff06f          	j	80004644 <_vsnprintf+0x90>
80004a20:	04600793          	li	a5,70
80004a24:	16f50263          	beq	a0,a5,80004b88 <_vsnprintf+0x5d4>
80004a28:	007d8d93          	add	s11,s11,7
80004a2c:	ff8dfd93          	and	s11,s11,-8
80004a30:	000da703          	lw	a4,0(s11)
80004a34:	004da783          	lw	a5,4(s11)
80004a38:	000d0613          	mv	a2,s10
80004a3c:	000e8893          	mv	a7,t4
80004a40:	00812023          	sw	s0,0(sp)
80004a44:	000c8813          	mv	a6,s9
80004a48:	00090693          	mv	a3,s2
80004a4c:	00098593          	mv	a1,s3
80004a50:	000a0513          	mv	a0,s4
80004a54:	d50ff0ef          	jal	80003fa4 <_ftoa>
80004a58:	008d8d93          	add	s11,s11,8
80004a5c:	00050d13          	mv	s10,a0
80004a60:	be5ff06f          	j	80004644 <_vsnprintf+0x90>
80004a64:	000d0613          	mv	a2,s10
80004a68:	00090693          	mv	a3,s2
80004a6c:	00098593          	mv	a1,s3
80004a70:	02500513          	li	a0,37
80004a74:	001d0d13          	add	s10,s10,1
80004a78:	000a00e7          	jalr	s4
80004a7c:	bc9ff06f          	j	80004644 <_vsnprintf+0x90>
80004a80:	00247413          	and	s0,s0,2
80004a84:	001d0c93          	add	s9,s10,1
80004a88:	004d8c13          	add	s8,s11,4
80004a8c:	26040063          	beqz	s0,80004cec <_vsnprintf+0x738>
80004a90:	000dc503          	lbu	a0,0(s11)
80004a94:	01d12e23          	sw	t4,28(sp)
80004a98:	000d0613          	mv	a2,s10
80004a9c:	00090693          	mv	a3,s2
80004aa0:	00098593          	mv	a1,s3
80004aa4:	000a00e7          	jalr	s4
80004aa8:	01c12e83          	lw	t4,28(sp)
80004aac:	00100793          	li	a5,1
80004ab0:	01dd0d33          	add	s10,s10,t4
80004ab4:	2bd7f663          	bgeu	a5,t4,80004d60 <_vsnprintf+0x7ac>
80004ab8:	000c8613          	mv	a2,s9
80004abc:	00090693          	mv	a3,s2
80004ac0:	001c8c93          	add	s9,s9,1
80004ac4:	00098593          	mv	a1,s3
80004ac8:	02000513          	li	a0,32
80004acc:	000a00e7          	jalr	s4
80004ad0:	ff9d14e3          	bne	s10,s9,80004ab8 <_vsnprintf+0x504>
80004ad4:	000c0d93          	mv	s11,s8
80004ad8:	b6dff06f          	j	80004644 <_vsnprintf+0x90>
80004adc:	000bc503          	lbu	a0,0(s7)
80004ae0:	80003a37          	lui	s4,0x80003
80004ae4:	2c4a0a13          	add	s4,s4,708 # 800032c4 <_out_null>
80004ae8:	00000d13          	li	s10,0
80004aec:	b00518e3          	bnez	a0,800045fc <_vsnprintf+0x48>
80004af0:	00000413          	li	s0,0
80004af4:	cf2d62e3          	bltu	s10,s2,800047d8 <_vsnprintf+0x224>
80004af8:	cddff06f          	j	800047d4 <_vsnprintf+0x220>
80004afc:	00900713          	li	a4,9
80004b00:	002c9793          	sll	a5,s9,0x2
80004b04:	019787b3          	add	a5,a5,s9
80004b08:	00168693          	add	a3,a3,1
80004b0c:	00179793          	sll	a5,a5,0x1
80004b10:	00a787b3          	add	a5,a5,a0
80004b14:	0006c503          	lbu	a0,0(a3)
80004b18:	fd078c93          	add	s9,a5,-48
80004b1c:	fd050793          	add	a5,a0,-48
80004b20:	0ff7f793          	zext.b	a5,a5
80004b24:	fcf77ee3          	bgeu	a4,a5,80004b00 <_vsnprintf+0x54c>
80004b28:	00068b93          	mv	s7,a3
80004b2c:	00168713          	add	a4,a3,1
80004b30:	b75ff06f          	j	800046a4 <_vsnprintf+0xf0>
80004b34:	06f00793          	li	a5,111
80004b38:	06f50463          	beq	a0,a5,80004ba0 <_vsnprintf+0x5ec>
80004b3c:	28a7f063          	bgeu	a5,a0,80004dbc <_vsnprintf+0x808>
80004b40:	07800793          	li	a5,120
80004b44:	01000813          	li	a6,16
80004b48:	04f50e63          	beq	a0,a5,80004ba4 <_vsnprintf+0x5f0>
80004b4c:	fef47413          	and	s0,s0,-17
80004b50:	00a00813          	li	a6,10
80004b54:	0500006f          	j	80004ba4 <_vsnprintf+0x5f0>
80004b58:	000dac83          	lw	s9,0(s11)
80004b5c:	002bc503          	lbu	a0,2(s7)
80004b60:	002b8b93          	add	s7,s7,2
80004b64:	fffcc793          	not	a5,s9
80004b68:	41f7d793          	sra	a5,a5,0x1f
80004b6c:	00fcfcb3          	and	s9,s9,a5
80004b70:	004d8d93          	add	s11,s11,4
80004b74:	001b8713          	add	a4,s7,1
80004b78:	b2dff06f          	j	800046a4 <_vsnprintf+0xf0>
80004b7c:	d6068ee3          	beqz	a3,800048f8 <_vsnprintf+0x344>
80004b80:	fffc8c13          	add	s8,s9,-1
80004b84:	d4dff06f          	j	800048d0 <_vsnprintf+0x31c>
80004b88:	02046413          	or	s0,s0,32
80004b8c:	e9dff06f          	j	80004a28 <_vsnprintf+0x474>
80004b90:	000017b7          	lui	a5,0x1
80004b94:	80078793          	add	a5,a5,-2048 # 800 <__stack_size-0x3800>
80004b98:	00f46433          	or	s0,s0,a5
80004b9c:	e49ff06f          	j	800049e4 <_vsnprintf+0x430>
80004ba0:	00800813          	li	a6,8
80004ba4:	40047713          	and	a4,s0,1024
80004ba8:	ff347793          	and	a5,s0,-13
80004bac:	00070463          	beqz	a4,80004bb4 <_vsnprintf+0x600>
80004bb0:	ff247793          	and	a5,s0,-14
80004bb4:	2007f713          	and	a4,a5,512
80004bb8:	1a071a63          	bnez	a4,80004d6c <_vsnprintf+0x7b8>
80004bbc:	1007f713          	and	a4,a5,256
80004bc0:	004d8413          	add	s0,s11,4
80004bc4:	2e071063          	bnez	a4,80004ea4 <_vsnprintf+0x8f0>
80004bc8:	0407f713          	and	a4,a5,64
80004bcc:	16071c63          	bnez	a4,80004d44 <_vsnprintf+0x790>
80004bd0:	0807f713          	and	a4,a5,128
80004bd4:	2e070c63          	beqz	a4,80004ecc <_vsnprintf+0x918>
80004bd8:	000dd703          	lhu	a4,0(s11)
80004bdc:	00f12223          	sw	a5,4(sp)
80004be0:	01d12023          	sw	t4,0(sp)
80004be4:	000c8893          	mv	a7,s9
80004be8:	00000793          	li	a5,0
80004bec:	000d0613          	mv	a2,s10
80004bf0:	00090693          	mv	a3,s2
80004bf4:	00098593          	mv	a1,s3
80004bf8:	000a0513          	mv	a0,s4
80004bfc:	b5dfe0ef          	jal	80003758 <_ntoa_long>
80004c00:	00050d13          	mv	s10,a0
80004c04:	00040d93          	mv	s11,s0
80004c08:	a3dff06f          	j	80004644 <_vsnprintf+0x90>
80004c0c:	05800793          	li	a5,88
80004c10:	08f50263          	beq	a0,a5,80004c94 <_vsnprintf+0x6e0>
80004c14:	06200793          	li	a5,98
80004c18:	00200813          	li	a6,2
80004c1c:	f8f504e3          	beq	a0,a5,80004ba4 <_vsnprintf+0x5f0>
80004c20:	40047793          	and	a5,s0,1024
80004c24:	fee47693          	and	a3,s0,-18
80004c28:	1a079663          	bnez	a5,80004dd4 <_vsnprintf+0x820>
80004c2c:	fef47693          	and	a3,s0,-17
80004c30:	1a40006f          	j	80004dd4 <_vsnprintf+0x820>
80004c34:	00040d13          	mv	s10,s0
80004c38:	0bdc7663          	bgeu	s8,t4,80004ce4 <_vsnprintf+0x730>
80004c3c:	01ae87b3          	add	a5,t4,s10
80004c40:	41878433          	sub	s0,a5,s8
80004c44:	000d0613          	mv	a2,s10
80004c48:	00090693          	mv	a3,s2
80004c4c:	001d0d13          	add	s10,s10,1
80004c50:	00098593          	mv	a1,s3
80004c54:	02000513          	li	a0,32
80004c58:	000a00e7          	jalr	s4
80004c5c:	ffa414e3          	bne	s0,s10,80004c44 <_vsnprintf+0x690>
80004c60:	d05ff06f          	j	80004964 <_vsnprintf+0x3b0>
80004c64:	000017b7          	lui	a5,0x1
80004c68:	80078793          	add	a5,a5,-2048 # 800 <__stack_size-0x3800>
80004c6c:	00f46433          	or	s0,s0,a5
80004c70:	02046413          	or	s0,s0,32
80004c74:	d71ff06f          	j	800049e4 <_vsnprintf+0x430>
80004c78:	002bc503          	lbu	a0,2(s7)
80004c7c:	0c046413          	or	s0,s0,192
80004c80:	003b8713          	add	a4,s7,3
80004c84:	a8dff06f          	j	80004710 <_vsnprintf+0x15c>
80004c88:	02012783          	lw	a5,32(sp)
80004c8c:	40fc0c33          	sub	s8,s8,a5
80004c90:	c69ff06f          	j	800048f8 <_vsnprintf+0x344>
80004c94:	02046413          	or	s0,s0,32
80004c98:	01000813          	li	a6,16
80004c9c:	f09ff06f          	j	80004ba4 <_vsnprintf+0x5f0>
80004ca0:	23dc7a63          	bgeu	s8,t4,80004ed4 <_vsnprintf+0x920>
80004ca4:	01ae87b3          	add	a5,t4,s10
80004ca8:	41878c33          	sub	s8,a5,s8
80004cac:	01d12e23          	sw	t4,28(sp)
80004cb0:	000d0613          	mv	a2,s10
80004cb4:	00090693          	mv	a3,s2
80004cb8:	00098593          	mv	a1,s3
80004cbc:	02000513          	li	a0,32
80004cc0:	000a00e7          	jalr	s4
80004cc4:	001d0d13          	add	s10,s10,1
80004cc8:	01c12e83          	lw	t4,28(sp)
80004ccc:	ffac10e3          	bne	s8,s10,80004cac <_vsnprintf+0x6f8>
80004cd0:	02012783          	lw	a5,32(sp)
80004cd4:	001e8c13          	add	s8,t4,1
80004cd8:	0007c683          	lbu	a3,0(a5)
80004cdc:	00068513          	mv	a0,a3
80004ce0:	c2069ce3          	bnez	a3,80004918 <_vsnprintf+0x364>
80004ce4:	000d0413          	mv	s0,s10
80004ce8:	c7dff06f          	j	80004964 <_vsnprintf+0x3b0>
80004cec:	00100793          	li	a5,1
80004cf0:	05d7fe63          	bgeu	a5,t4,80004d4c <_vsnprintf+0x798>
80004cf4:	fffd0413          	add	s0,s10,-1
80004cf8:	01d40433          	add	s0,s0,t4
80004cfc:	000d0c93          	mv	s9,s10
80004d00:	01d12e23          	sw	t4,28(sp)
80004d04:	000c8613          	mv	a2,s9
80004d08:	00090693          	mv	a3,s2
80004d0c:	00098593          	mv	a1,s3
80004d10:	02000513          	li	a0,32
80004d14:	000a00e7          	jalr	s4
80004d18:	001c8c93          	add	s9,s9,1
80004d1c:	01c12e83          	lw	t4,28(sp)
80004d20:	ff9410e3          	bne	s0,s9,80004d00 <_vsnprintf+0x74c>
80004d24:	000dc503          	lbu	a0,0(s11)
80004d28:	00090693          	mv	a3,s2
80004d2c:	00040613          	mv	a2,s0
80004d30:	00098593          	mv	a1,s3
80004d34:	01dd0d33          	add	s10,s10,t4
80004d38:	000c0d93          	mv	s11,s8
80004d3c:	000a00e7          	jalr	s4
80004d40:	905ff06f          	j	80004644 <_vsnprintf+0x90>
80004d44:	000dc703          	lbu	a4,0(s11)
80004d48:	e95ff06f          	j	80004bdc <_vsnprintf+0x628>
80004d4c:	000dc503          	lbu	a0,0(s11)
80004d50:	00090693          	mv	a3,s2
80004d54:	000d0613          	mv	a2,s10
80004d58:	00098593          	mv	a1,s3
80004d5c:	000a00e7          	jalr	s4
80004d60:	000c8d13          	mv	s10,s9
80004d64:	000c0d93          	mv	s11,s8
80004d68:	8ddff06f          	j	80004644 <_vsnprintf+0x90>
80004d6c:	007d8d93          	add	s11,s11,7
80004d70:	ff8dfd93          	and	s11,s11,-8
80004d74:	000da603          	lw	a2,0(s11)
80004d78:	004da683          	lw	a3,4(s11)
80004d7c:	00080893          	mv	a7,a6
80004d80:	00f12623          	sw	a5,12(sp)
80004d84:	01d12423          	sw	t4,8(sp)
80004d88:	01912223          	sw	s9,4(sp)
80004d8c:	00012023          	sw	zero,0(sp)
80004d90:	00000813          	li	a6,0
80004d94:	00060713          	mv	a4,a2
80004d98:	00068793          	mv	a5,a3
80004d9c:	000d0613          	mv	a2,s10
80004da0:	00090693          	mv	a3,s2
80004da4:	00098593          	mv	a1,s3
80004da8:	000a0513          	mv	a0,s4
80004dac:	a75fe0ef          	jal	80003820 <_ntoa_long_long>
80004db0:	008d8d93          	add	s11,s11,8
80004db4:	00050d13          	mv	s10,a0
80004db8:	88dff06f          	j	80004644 <_vsnprintf+0x90>
80004dbc:	06900793          	li	a5,105
80004dc0:	fef47693          	and	a3,s0,-17
80004dc4:	10f51c63          	bne	a0,a5,80004edc <_vsnprintf+0x928>
80004dc8:	40047793          	and	a5,s0,1024
80004dcc:	00078463          	beqz	a5,80004dd4 <_vsnprintf+0x820>
80004dd0:	fee47693          	and	a3,s0,-18
80004dd4:	2006f793          	and	a5,a3,512
80004dd8:	02079c63          	bnez	a5,80004e10 <_vsnprintf+0x85c>
80004ddc:	1006f793          	and	a5,a3,256
80004de0:	004d8413          	add	s0,s11,4
80004de4:	08079c63          	bnez	a5,80004e7c <_vsnprintf+0x8c8>
80004de8:	0406f793          	and	a5,a3,64
80004dec:	06078663          	beqz	a5,80004e58 <_vsnprintf+0x8a4>
80004df0:	000dc783          	lbu	a5,0(s11)
80004df4:	00078713          	mv	a4,a5
80004df8:	00d12223          	sw	a3,4(sp)
80004dfc:	01d12023          	sw	t4,0(sp)
80004e00:	000c8893          	mv	a7,s9
80004e04:	00a00813          	li	a6,10
80004e08:	01f7d793          	srl	a5,a5,0x1f
80004e0c:	de1ff06f          	j	80004bec <_vsnprintf+0x638>
80004e10:	007d8d93          	add	s11,s11,7
80004e14:	ff8dfd93          	and	s11,s11,-8
80004e18:	004da803          	lw	a6,4(s11)
80004e1c:	000da783          	lw	a5,0(s11)
80004e20:	00a00893          	li	a7,10
80004e24:	41f85613          	sra	a2,a6,0x1f
80004e28:	00f647b3          	xor	a5,a2,a5
80004e2c:	40c78733          	sub	a4,a5,a2
80004e30:	010645b3          	xor	a1,a2,a6
80004e34:	00e7b7b3          	sltu	a5,a5,a4
80004e38:	40c58633          	sub	a2,a1,a2
80004e3c:	00d12623          	sw	a3,12(sp)
80004e40:	01d12423          	sw	t4,8(sp)
80004e44:	01912223          	sw	s9,4(sp)
80004e48:	00012023          	sw	zero,0(sp)
80004e4c:	01f85813          	srl	a6,a6,0x1f
80004e50:	40f607b3          	sub	a5,a2,a5
80004e54:	f49ff06f          	j	80004d9c <_vsnprintf+0x7e8>
80004e58:	0806f793          	and	a5,a3,128
80004e5c:	04078e63          	beqz	a5,80004eb8 <_vsnprintf+0x904>
80004e60:	000d9783          	lh	a5,0(s11)
80004e64:	40f7d613          	sra	a2,a5,0xf
80004e68:	00c7c733          	xor	a4,a5,a2
80004e6c:	40c70733          	sub	a4,a4,a2
80004e70:	01071713          	sll	a4,a4,0x10
80004e74:	01075713          	srl	a4,a4,0x10
80004e78:	f81ff06f          	j	80004df8 <_vsnprintf+0x844>
80004e7c:	000da783          	lw	a5,0(s11)
80004e80:	00d12223          	sw	a3,4(sp)
80004e84:	000c8893          	mv	a7,s9
80004e88:	41f7d713          	sra	a4,a5,0x1f
80004e8c:	00f746b3          	xor	a3,a4,a5
80004e90:	01d12023          	sw	t4,0(sp)
80004e94:	00a00813          	li	a6,10
80004e98:	01f7d793          	srl	a5,a5,0x1f
80004e9c:	40e68733          	sub	a4,a3,a4
80004ea0:	d4dff06f          	j	80004bec <_vsnprintf+0x638>
80004ea4:	000da703          	lw	a4,0(s11)
80004ea8:	000c8893          	mv	a7,s9
80004eac:	00f12223          	sw	a5,4(sp)
80004eb0:	01d12023          	sw	t4,0(sp)
80004eb4:	d35ff06f          	j	80004be8 <_vsnprintf+0x634>
80004eb8:	000da783          	lw	a5,0(s11)
80004ebc:	41f7d613          	sra	a2,a5,0x1f
80004ec0:	00f64733          	xor	a4,a2,a5
80004ec4:	40c70733          	sub	a4,a4,a2
80004ec8:	f31ff06f          	j	80004df8 <_vsnprintf+0x844>
80004ecc:	000da703          	lw	a4,0(s11)
80004ed0:	d0dff06f          	j	80004bdc <_vsnprintf+0x628>
80004ed4:	001c0c13          	add	s8,s8,1
80004ed8:	e05ff06f          	j	80004cdc <_vsnprintf+0x728>
80004edc:	00068413          	mv	s0,a3
80004ee0:	00a00813          	li	a6,10
80004ee4:	cc1ff06f          	j	80004ba4 <_vsnprintf+0x5f0>

80004ee8 <printf_>:
80004ee8:	fc010113          	add	sp,sp,-64
80004eec:	02410313          	add	t1,sp,36
80004ef0:	02d12623          	sw	a3,44(sp)
80004ef4:	00050693          	mv	a3,a0
80004ef8:	80004537          	lui	a0,0x80004
80004efc:	02b12223          	sw	a1,36(sp)
80004f00:	02c12423          	sw	a2,40(sp)
80004f04:	02e12823          	sw	a4,48(sp)
80004f08:	00810593          	add	a1,sp,8
80004f0c:	00030713          	mv	a4,t1
80004f10:	fff00613          	li	a2,-1
80004f14:	5a850513          	add	a0,a0,1448 # 800045a8 <_out_char>
80004f18:	00112e23          	sw	ra,28(sp)
80004f1c:	02f12a23          	sw	a5,52(sp)
80004f20:	03012c23          	sw	a6,56(sp)
80004f24:	03112e23          	sw	a7,60(sp)
80004f28:	00612623          	sw	t1,12(sp)
80004f2c:	e88ff0ef          	jal	800045b4 <_vsnprintf>
80004f30:	01c12083          	lw	ra,28(sp)
80004f34:	04010113          	add	sp,sp,64
80004f38:	00008067          	ret

80004f3c <to_host>:
80004f3c:	c00007b7          	lui	a5,0xc0000
80004f40:	00100713          	li	a4,1
80004f44:	00e7a023          	sw	a4,0(a5) # c0000000 <__stack_base>
80004f48:	00008067          	ret

80004f4c <cmp_idx>:
80004f4c:	00060a63          	beqz	a2,80004f60 <cmp_idx+0x14>
80004f50:	00251503          	lh	a0,2(a0)
80004f54:	00259783          	lh	a5,2(a1)
80004f58:	40f50533          	sub	a0,a0,a5
80004f5c:	00008067          	ret
80004f60:	00051783          	lh	a5,0(a0)
80004f64:	01079713          	sll	a4,a5,0x10
80004f68:	01075713          	srl	a4,a4,0x10
80004f6c:	00875713          	srl	a4,a4,0x8
80004f70:	f007f793          	and	a5,a5,-256
80004f74:	00e7e7b3          	or	a5,a5,a4
80004f78:	00f51023          	sh	a5,0(a0)
80004f7c:	00059783          	lh	a5,0(a1)
80004f80:	00251503          	lh	a0,2(a0)
80004f84:	01079713          	sll	a4,a5,0x10
80004f88:	01075713          	srl	a4,a4,0x10
80004f8c:	00875713          	srl	a4,a4,0x8
80004f90:	f007f793          	and	a5,a5,-256
80004f94:	00e7e7b3          	or	a5,a5,a4
80004f98:	00f59023          	sh	a5,0(a1)
80004f9c:	00259783          	lh	a5,2(a1)
80004fa0:	40f50533          	sub	a0,a0,a5
80004fa4:	00008067          	ret

80004fa8 <calc_func>:
80004fa8:	fe010113          	add	sp,sp,-32
80004fac:	00812c23          	sw	s0,24(sp)
80004fb0:	00051403          	lh	s0,0(a0)
80004fb4:	00112e23          	sw	ra,28(sp)
80004fb8:	40745793          	sra	a5,s0,0x7
80004fbc:	0017f793          	and	a5,a5,1
80004fc0:	00078c63          	beqz	a5,80004fd8 <calc_func+0x30>
80004fc4:	01c12083          	lw	ra,28(sp)
80004fc8:	07f47513          	and	a0,s0,127
80004fcc:	01812403          	lw	s0,24(sp)
80004fd0:	02010113          	add	sp,sp,32
80004fd4:	00008067          	ret
80004fd8:	40345713          	sra	a4,s0,0x3
80004fdc:	00f77713          	and	a4,a4,15
80004fe0:	00471693          	sll	a3,a4,0x4
80004fe4:	0385d783          	lhu	a5,56(a1)
80004fe8:	00912a23          	sw	s1,20(sp)
80004fec:	01312623          	sw	s3,12(sp)
80004ff0:	00058493          	mv	s1,a1
80004ff4:	01212823          	sw	s2,16(sp)
80004ff8:	00d705b3          	add	a1,a4,a3
80004ffc:	00747613          	and	a2,s0,7
80005000:	00050993          	mv	s3,a0
80005004:	00058713          	mv	a4,a1
80005008:	08060063          	beqz	a2,80005088 <calc_func+0xe0>
8000500c:	00100693          	li	a3,1
80005010:	06d61463          	bne	a2,a3,80005078 <calc_func+0xd0>
80005014:	00078613          	mv	a2,a5
80005018:	02848513          	add	a0,s1,40
8000501c:	15d010ef          	jal	80006978 <core_bench_matrix>
80005020:	03c4d783          	lhu	a5,60(s1)
80005024:	01051913          	sll	s2,a0,0x10
80005028:	41095913          	sra	s2,s2,0x10
8000502c:	08079c63          	bnez	a5,800050c4 <calc_func+0x11c>
80005030:	0384d783          	lhu	a5,56(s1)
80005034:	02a49e23          	sh	a0,60(s1)
80005038:	00078593          	mv	a1,a5
8000503c:	014020ef          	jal	80007050 <crcu16>
80005040:	00050793          	mv	a5,a0
80005044:	f0047413          	and	s0,s0,-256
80005048:	07f97513          	and	a0,s2,127
8000504c:	00856433          	or	s0,a0,s0
80005050:	02f49c23          	sh	a5,56(s1)
80005054:	08046413          	or	s0,s0,128
80005058:	00899023          	sh	s0,0(s3)
8000505c:	01c12083          	lw	ra,28(sp)
80005060:	01812403          	lw	s0,24(sp)
80005064:	01412483          	lw	s1,20(sp)
80005068:	01012903          	lw	s2,16(sp)
8000506c:	00c12983          	lw	s3,12(sp)
80005070:	02010113          	add	sp,sp,32
80005074:	00008067          	ret
80005078:	01041513          	sll	a0,s0,0x10
8000507c:	01055513          	srl	a0,a0,0x10
80005080:	00040913          	mv	s2,s0
80005084:	fb5ff06f          	j	80005038 <calc_func+0x90>
80005088:	02100693          	li	a3,33
8000508c:	00b6e463          	bltu	a3,a1,80005094 <calc_func+0xec>
80005090:	02200713          	li	a4,34
80005094:	00249683          	lh	a3,2(s1)
80005098:	00049603          	lh	a2,0(s1)
8000509c:	0144a583          	lw	a1,20(s1)
800050a0:	0184a503          	lw	a0,24(s1)
800050a4:	58d010ef          	jal	80006e30 <core_bench_state>
800050a8:	03e4d783          	lhu	a5,62(s1)
800050ac:	01051913          	sll	s2,a0,0x10
800050b0:	41095913          	sra	s2,s2,0x10
800050b4:	00079863          	bnez	a5,800050c4 <calc_func+0x11c>
800050b8:	0384d783          	lhu	a5,56(s1)
800050bc:	02a49f23          	sh	a0,62(s1)
800050c0:	f79ff06f          	j	80005038 <calc_func+0x90>
800050c4:	0384d783          	lhu	a5,56(s1)
800050c8:	f71ff06f          	j	80005038 <calc_func+0x90>

800050cc <cmp_complex>:
800050cc:	ff010113          	add	sp,sp,-16
800050d0:	00912223          	sw	s1,4(sp)
800050d4:	00058493          	mv	s1,a1
800050d8:	00060593          	mv	a1,a2
800050dc:	00112623          	sw	ra,12(sp)
800050e0:	00812423          	sw	s0,8(sp)
800050e4:	00060413          	mv	s0,a2
800050e8:	ec1ff0ef          	jal	80004fa8 <calc_func>
800050ec:	00050793          	mv	a5,a0
800050f0:	00040593          	mv	a1,s0
800050f4:	00048513          	mv	a0,s1
800050f8:	00078413          	mv	s0,a5
800050fc:	eadff0ef          	jal	80004fa8 <calc_func>
80005100:	00c12083          	lw	ra,12(sp)
80005104:	40a40533          	sub	a0,s0,a0
80005108:	00812403          	lw	s0,8(sp)
8000510c:	00412483          	lw	s1,4(sp)
80005110:	01010113          	add	sp,sp,16
80005114:	00008067          	ret

80005118 <core_list_mergesort>:
80005118:	fd010113          	add	sp,sp,-48
8000511c:	01312e23          	sw	s3,28(sp)
80005120:	01512a23          	sw	s5,20(sp)
80005124:	01712623          	sw	s7,12(sp)
80005128:	01812423          	sw	s8,8(sp)
8000512c:	01a12023          	sw	s10,0(sp)
80005130:	02112623          	sw	ra,44(sp)
80005134:	02812423          	sw	s0,40(sp)
80005138:	02912223          	sw	s1,36(sp)
8000513c:	03212023          	sw	s2,32(sp)
80005140:	01412c23          	sw	s4,24(sp)
80005144:	01612823          	sw	s6,16(sp)
80005148:	01912223          	sw	s9,4(sp)
8000514c:	00050993          	mv	s3,a0
80005150:	00058c13          	mv	s8,a1
80005154:	00060b93          	mv	s7,a2
80005158:	00100a93          	li	s5,1
8000515c:	00100d13          	li	s10,1
80005160:	0c098263          	beqz	s3,80005224 <core_list_mergesort+0x10c>
80005164:	00000c93          	li	s9,0
80005168:	00000493          	li	s1,0
8000516c:	00000b13          	li	s6,0
80005170:	001c8c93          	add	s9,s9,1
80005174:	00098793          	mv	a5,s3
80005178:	00000413          	li	s0,0
8000517c:	01545863          	bge	s0,s5,8000518c <core_list_mergesort+0x74>
80005180:	0007a783          	lw	a5,0(a5)
80005184:	00140413          	add	s0,s0,1
80005188:	fe079ae3          	bnez	a5,8000517c <core_list_mergesort+0x64>
8000518c:	00098913          	mv	s2,s3
80005190:	000a8a13          	mv	s4,s5
80005194:	00078993          	mv	s3,a5
80005198:	02805263          	blez	s0,800051bc <core_list_mergesort+0xa4>
8000519c:	040a1463          	bnez	s4,800051e4 <core_list_mergesort+0xcc>
800051a0:	00090793          	mv	a5,s2
800051a4:	00092903          	lw	s2,0(s2)
800051a8:	fff40413          	add	s0,s0,-1
800051ac:	02048663          	beqz	s1,800051d8 <core_list_mergesort+0xc0>
800051b0:	00f4a023          	sw	a5,0(s1)
800051b4:	00078493          	mv	s1,a5
800051b8:	fe8042e3          	bgtz	s0,8000519c <core_list_mergesort+0x84>
800051bc:	05405863          	blez	s4,8000520c <core_list_mergesort+0xf4>
800051c0:	04098863          	beqz	s3,80005210 <core_list_mergesort+0xf8>
800051c4:	02041263          	bnez	s0,800051e8 <core_list_mergesort+0xd0>
800051c8:	00098793          	mv	a5,s3
800051cc:	fffa0a13          	add	s4,s4,-1
800051d0:	0009a983          	lw	s3,0(s3)
800051d4:	fc049ee3          	bnez	s1,800051b0 <core_list_mergesort+0x98>
800051d8:	00078b13          	mv	s6,a5
800051dc:	00078493          	mv	s1,a5
800051e0:	fd9ff06f          	j	800051b8 <core_list_mergesort+0xa0>
800051e4:	fa098ee3          	beqz	s3,800051a0 <core_list_mergesort+0x88>
800051e8:	0049a583          	lw	a1,4(s3)
800051ec:	00492503          	lw	a0,4(s2)
800051f0:	000b8613          	mv	a2,s7
800051f4:	000c00e7          	jalr	s8
800051f8:	faa054e3          	blez	a0,800051a0 <core_list_mergesort+0x88>
800051fc:	00098793          	mv	a5,s3
80005200:	fffa0a13          	add	s4,s4,-1
80005204:	0009a983          	lw	s3,0(s3)
80005208:	fa5ff06f          	j	800051ac <core_list_mergesort+0x94>
8000520c:	f60992e3          	bnez	s3,80005170 <core_list_mergesort+0x58>
80005210:	0004a023          	sw	zero,0(s1)
80005214:	01ac8c63          	beq	s9,s10,8000522c <core_list_mergesort+0x114>
80005218:	000b0993          	mv	s3,s6
8000521c:	001a9a93          	sll	s5,s5,0x1
80005220:	f40992e3          	bnez	s3,80005164 <core_list_mergesort+0x4c>
80005224:	00002023          	sw	zero,0(zero) # 0 <__stack_size-0x4000>
80005228:	00100073          	ebreak
8000522c:	02c12083          	lw	ra,44(sp)
80005230:	02812403          	lw	s0,40(sp)
80005234:	02412483          	lw	s1,36(sp)
80005238:	02012903          	lw	s2,32(sp)
8000523c:	01c12983          	lw	s3,28(sp)
80005240:	01812a03          	lw	s4,24(sp)
80005244:	01412a83          	lw	s5,20(sp)
80005248:	00c12b83          	lw	s7,12(sp)
8000524c:	00812c03          	lw	s8,8(sp)
80005250:	00412c83          	lw	s9,4(sp)
80005254:	00012d03          	lw	s10,0(sp)
80005258:	000b0513          	mv	a0,s6
8000525c:	01012b03          	lw	s6,16(sp)
80005260:	03010113          	add	sp,sp,48
80005264:	00008067          	ret

80005268 <core_bench_list>:
80005268:	00050613          	mv	a2,a0
8000526c:	00451503          	lh	a0,4(a0)
80005270:	fe010113          	add	sp,sp,-32
80005274:	00812c23          	sw	s0,24(sp)
80005278:	00912a23          	sw	s1,20(sp)
8000527c:	00112e23          	sw	ra,28(sp)
80005280:	01212823          	sw	s2,16(sp)
80005284:	01312623          	sw	s3,12(sp)
80005288:	01412423          	sw	s4,8(sp)
8000528c:	01512223          	sw	s5,4(sp)
80005290:	02462403          	lw	s0,36(a2)
80005294:	00058493          	mv	s1,a1
80005298:	26a05463          	blez	a0,80005500 <core_bench_list+0x298>
8000529c:	00000893          	li	a7,0
800052a0:	00000e13          	li	t3,0
800052a4:	00000313          	li	t1,0
800052a8:	00000813          	li	a6,0
800052ac:	0ff8fa13          	zext.b	s4,a7
800052b0:	1c04cc63          	bltz	s1,80005488 <core_bench_list+0x220>
800052b4:	24040c63          	beqz	s0,8000550c <core_bench_list+0x2a4>
800052b8:	00040793          	mv	a5,s0
800052bc:	00c0006f          	j	800052c8 <core_bench_list+0x60>
800052c0:	0007a783          	lw	a5,0(a5)
800052c4:	00078863          	beqz	a5,800052d4 <core_bench_list+0x6c>
800052c8:	0047a703          	lw	a4,4(a5)
800052cc:	00271703          	lh	a4,2(a4)
800052d0:	fe9718e3          	bne	a4,s1,800052c0 <core_bench_list+0x58>
800052d4:	00000693          	li	a3,0
800052d8:	0080006f          	j	800052e0 <core_bench_list+0x78>
800052dc:	00070413          	mv	s0,a4
800052e0:	00042703          	lw	a4,0(s0)
800052e4:	00d42023          	sw	a3,0(s0)
800052e8:	00040693          	mv	a3,s0
800052ec:	fe0718e3          	bnez	a4,800052dc <core_bench_list+0x74>
800052f0:	1a078e63          	beqz	a5,800054ac <core_bench_list+0x244>
800052f4:	0047a703          	lw	a4,4(a5)
800052f8:	00071703          	lh	a4,0(a4)
800052fc:	00177693          	and	a3,a4,1
80005300:	00068c63          	beqz	a3,80005318 <core_bench_list+0xb0>
80005304:	40975713          	sra	a4,a4,0x9
80005308:	00177713          	and	a4,a4,1
8000530c:	00e80733          	add	a4,a6,a4
80005310:	01071813          	sll	a6,a4,0x10
80005314:	01085813          	srl	a6,a6,0x10
80005318:	0007a703          	lw	a4,0(a5)
8000531c:	00070c63          	beqz	a4,80005334 <core_bench_list+0xcc>
80005320:	00072683          	lw	a3,0(a4)
80005324:	00d7a023          	sw	a3,0(a5)
80005328:	00042783          	lw	a5,0(s0)
8000532c:	00f72023          	sw	a5,0(a4)
80005330:	00e42023          	sw	a4,0(s0)
80005334:	00130313          	add	t1,t1,1
80005338:	01031313          	sll	t1,t1,0x10
8000533c:	01035313          	srl	t1,t1,0x10
80005340:	0004c863          	bltz	s1,80005350 <core_bench_list+0xe8>
80005344:	00148493          	add	s1,s1,1
80005348:	01049493          	sll	s1,s1,0x10
8000534c:	4104d493          	sra	s1,s1,0x10
80005350:	00188793          	add	a5,a7,1
80005354:	01079893          	sll	a7,a5,0x10
80005358:	4108d893          	sra	a7,a7,0x10
8000535c:	f51518e3          	bne	a0,a7,800052ac <core_bench_list+0x44>
80005360:	00231793          	sll	a5,t1,0x2
80005364:	41c787b3          	sub	a5,a5,t3
80005368:	00f80833          	add	a6,a6,a5
8000536c:	01081913          	sll	s2,a6,0x10
80005370:	01095913          	srl	s2,s2,0x10
80005374:	00b05c63          	blez	a1,8000538c <core_bench_list+0x124>
80005378:	800055b7          	lui	a1,0x80005
8000537c:	00040513          	mv	a0,s0
80005380:	0cc58593          	add	a1,a1,204 # 800050cc <cmp_complex>
80005384:	d95ff0ef          	jal	80005118 <core_list_mergesort>
80005388:	00050413          	mv	s0,a0
8000538c:	00042783          	lw	a5,0(s0)
80005390:	00040993          	mv	s3,s0
80005394:	0007aa83          	lw	s5,0(a5)
80005398:	0047a703          	lw	a4,4(a5)
8000539c:	004aa603          	lw	a2,4(s5)
800053a0:	000aa683          	lw	a3,0(s5)
800053a4:	00c7a223          	sw	a2,4(a5)
800053a8:	00eaa223          	sw	a4,4(s5)
800053ac:	00d7a023          	sw	a3,0(a5)
800053b0:	000aa023          	sw	zero,0(s5)
800053b4:	0004d863          	bgez	s1,800053c4 <core_bench_list+0x15c>
800053b8:	0c00006f          	j	80005478 <core_bench_list+0x210>
800053bc:	0009a983          	lw	s3,0(s3)
800053c0:	10098c63          	beqz	s3,800054d8 <core_bench_list+0x270>
800053c4:	0049a783          	lw	a5,4(s3)
800053c8:	00279783          	lh	a5,2(a5)
800053cc:	fe9798e3          	bne	a5,s1,800053bc <core_bench_list+0x154>
800053d0:	00442783          	lw	a5,4(s0)
800053d4:	00090593          	mv	a1,s2
800053d8:	00079503          	lh	a0,0(a5)
800053dc:	61d010ef          	jal	800071f8 <crc16>
800053e0:	0009a983          	lw	s3,0(s3)
800053e4:	00050913          	mv	s2,a0
800053e8:	fe0994e3          	bnez	s3,800053d0 <core_bench_list+0x168>
800053ec:	00042983          	lw	s3,0(s0)
800053f0:	004aa703          	lw	a4,4(s5)
800053f4:	0049a683          	lw	a3,4(s3)
800053f8:	0009a783          	lw	a5,0(s3)
800053fc:	800055b7          	lui	a1,0x80005
80005400:	00daa223          	sw	a3,4(s5)
80005404:	00e9a223          	sw	a4,4(s3)
80005408:	00faa023          	sw	a5,0(s5)
8000540c:	00040513          	mv	a0,s0
80005410:	0159a023          	sw	s5,0(s3)
80005414:	00000613          	li	a2,0
80005418:	f4c58593          	add	a1,a1,-180 # 80004f4c <cmp_idx>
8000541c:	cfdff0ef          	jal	80005118 <core_list_mergesort>
80005420:	00052403          	lw	s0,0(a0)
80005424:	00050493          	mv	s1,a0
80005428:	02040063          	beqz	s0,80005448 <core_bench_list+0x1e0>
8000542c:	0044a783          	lw	a5,4(s1)
80005430:	00090593          	mv	a1,s2
80005434:	00079503          	lh	a0,0(a5)
80005438:	5c1010ef          	jal	800071f8 <crc16>
8000543c:	00042403          	lw	s0,0(s0)
80005440:	00050913          	mv	s2,a0
80005444:	fe0414e3          	bnez	s0,8000542c <core_bench_list+0x1c4>
80005448:	01c12083          	lw	ra,28(sp)
8000544c:	01812403          	lw	s0,24(sp)
80005450:	01412483          	lw	s1,20(sp)
80005454:	00c12983          	lw	s3,12(sp)
80005458:	00812a03          	lw	s4,8(sp)
8000545c:	00412a83          	lw	s5,4(sp)
80005460:	00090513          	mv	a0,s2
80005464:	01012903          	lw	s2,16(sp)
80005468:	02010113          	add	sp,sp,32
8000546c:	00008067          	ret
80005470:	0009a983          	lw	s3,0(s3)
80005474:	06098263          	beqz	s3,800054d8 <core_bench_list+0x270>
80005478:	0049a783          	lw	a5,4(s3)
8000547c:	0007c783          	lbu	a5,0(a5)
80005480:	fefa18e3          	bne	s4,a5,80005470 <core_bench_list+0x208>
80005484:	f4dff06f          	j	800053d0 <core_bench_list+0x168>
80005488:	08040263          	beqz	s0,8000550c <core_bench_list+0x2a4>
8000548c:	00040793          	mv	a5,s0
80005490:	00c0006f          	j	8000549c <core_bench_list+0x234>
80005494:	0007a783          	lw	a5,0(a5)
80005498:	e2078ee3          	beqz	a5,800052d4 <core_bench_list+0x6c>
8000549c:	0047a703          	lw	a4,4(a5)
800054a0:	00074703          	lbu	a4,0(a4)
800054a4:	feea18e3          	bne	s4,a4,80005494 <core_bench_list+0x22c>
800054a8:	e2dff06f          	j	800052d4 <core_bench_list+0x6c>
800054ac:	00042783          	lw	a5,0(s0)
800054b0:	001e0e13          	add	t3,t3,1
800054b4:	010e1e13          	sll	t3,t3,0x10
800054b8:	0047a783          	lw	a5,4(a5)
800054bc:	010e5e13          	srl	t3,t3,0x10
800054c0:	00178783          	lb	a5,1(a5)
800054c4:	0017f793          	and	a5,a5,1
800054c8:	00f807b3          	add	a5,a6,a5
800054cc:	01079813          	sll	a6,a5,0x10
800054d0:	01085813          	srl	a6,a6,0x10
800054d4:	e6dff06f          	j	80005340 <core_bench_list+0xd8>
800054d8:	00042983          	lw	s3,0(s0)
800054dc:	f0098ce3          	beqz	s3,800053f4 <core_bench_list+0x18c>
800054e0:	00442783          	lw	a5,4(s0)
800054e4:	00090593          	mv	a1,s2
800054e8:	00079503          	lh	a0,0(a5)
800054ec:	50d010ef          	jal	800071f8 <crc16>
800054f0:	0009a983          	lw	s3,0(s3)
800054f4:	00050913          	mv	s2,a0
800054f8:	ec099ce3          	bnez	s3,800053d0 <core_bench_list+0x168>
800054fc:	ef1ff06f          	j	800053ec <core_bench_list+0x184>
80005500:	00000913          	li	s2,0
80005504:	00000a13          	li	s4,0
80005508:	e6dff06f          	j	80005374 <core_bench_list+0x10c>
8000550c:	00002783          	lw	a5,0(zero) # 0 <__stack_size-0x4000>
80005510:	00100073          	ebreak

80005514 <core_list_init>:
80005514:	01400793          	li	a5,20
80005518:	02f55e33          	divu	t3,a0,a5
8000551c:	ffff87b7          	lui	a5,0xffff8
80005520:	0005a023          	sw	zero,0(a1)
80005524:	08078793          	add	a5,a5,128 # ffff8080 <__stack_base+0x3fff8080>
80005528:	01058693          	add	a3,a1,16
8000552c:	00058513          	mv	a0,a1
80005530:	00858313          	add	t1,a1,8
80005534:	ffee0e13          	add	t3,t3,-2
80005538:	003e1e93          	sll	t4,t3,0x3
8000553c:	01d58eb3          	add	t4,a1,t4
80005540:	01d5a223          	sw	t4,4(a1)
80005544:	002e1f93          	sll	t6,t3,0x2
80005548:	00fe9023          	sh	a5,0(t4)
8000554c:	000e9123          	sh	zero,2(t4)
80005550:	01fe8fb3          	add	t6,t4,t6
80005554:	004e8793          	add	a5,t4,4
80005558:	15d6f063          	bgeu	a3,t4,80005698 <core_list_init+0x184>
8000555c:	008e8893          	add	a7,t4,8
80005560:	13f8fc63          	bgeu	a7,t6,80005698 <core_list_init+0x184>
80005564:	00f5a623          	sw	a5,12(a1)
80005568:	ffff87b7          	lui	a5,0xffff8
8000556c:	0005a423          	sw	zero,8(a1)
80005570:	0065a023          	sw	t1,0(a1)
80005574:	fff00713          	li	a4,-1
80005578:	fff7c793          	not	a5,a5
8000557c:	00ee9223          	sh	a4,4(t4)
80005580:	00fe9323          	sh	a5,6(t4)
80005584:	060e0a63          	beqz	t3,800055f8 <core_list_init+0xe4>
80005588:	01061293          	sll	t0,a2,0x10
8000558c:	ffff83b7          	lui	t2,0xffff8
80005590:	0102d293          	srl	t0,t0,0x10
80005594:	00000813          	li	a6,0
80005598:	fff3c393          	not	t2,t2
8000559c:	01081713          	sll	a4,a6,0x10
800055a0:	01075713          	srl	a4,a4,0x10
800055a4:	00e2c7b3          	xor	a5,t0,a4
800055a8:	00379793          	sll	a5,a5,0x3
800055ac:	00777713          	and	a4,a4,7
800055b0:	0787f793          	and	a5,a5,120
800055b4:	00e7e7b3          	or	a5,a5,a4
800055b8:	00879f13          	sll	t5,a5,0x8
800055bc:	00868713          	add	a4,a3,8
800055c0:	00180813          	add	a6,a6,1
800055c4:	00488593          	add	a1,a7,4
800055c8:	01e787b3          	add	a5,a5,t5
800055cc:	03d77463          	bgeu	a4,t4,800055f4 <core_list_init+0xe0>
800055d0:	03f5f263          	bgeu	a1,t6,800055f4 <core_list_init+0xe0>
800055d4:	0066a023          	sw	t1,0(a3)
800055d8:	00d52023          	sw	a3,0(a0)
800055dc:	0116a223          	sw	a7,4(a3)
800055e0:	00f89023          	sh	a5,0(a7)
800055e4:	00789123          	sh	t2,2(a7)
800055e8:	00068313          	mv	t1,a3
800055ec:	00058893          	mv	a7,a1
800055f0:	00070693          	mv	a3,a4
800055f4:	fb0e14e3          	bne	t3,a6,8000559c <core_list_init+0x88>
800055f8:	00032803          	lw	a6,0(t1)
800055fc:	08080663          	beqz	a6,80005688 <core_list_init+0x174>
80005600:	00500793          	li	a5,5
80005604:	00004eb7          	lui	t4,0x4
80005608:	02fe5e33          	divu	t3,t3,a5
8000560c:	20000713          	li	a4,512
80005610:	00100693          	li	a3,1
80005614:	fffe8e93          	add	t4,t4,-1 # 3fff <__stack_size-0x1>
80005618:	0300006f          	j	80005648 <core_list_init+0x134>
8000561c:	01069793          	sll	a5,a3,0x10
80005620:	00082883          	lw	a7,0(a6)
80005624:	4107d793          	sra	a5,a5,0x10
80005628:	10070713          	add	a4,a4,256
8000562c:	01071713          	sll	a4,a4,0x10
80005630:	00f59123          	sh	a5,2(a1)
80005634:	00080313          	mv	t1,a6
80005638:	00168693          	add	a3,a3,1
8000563c:	01075713          	srl	a4,a4,0x10
80005640:	04088463          	beqz	a7,80005688 <core_list_init+0x174>
80005644:	00088813          	mv	a6,a7
80005648:	00d645b3          	xor	a1,a2,a3
8000564c:	70077793          	and	a5,a4,1792
80005650:	00b7e7b3          	or	a5,a5,a1
80005654:	01d7f7b3          	and	a5,a5,t4
80005658:	00432583          	lw	a1,4(t1)
8000565c:	fdc6e0e3          	bltu	a3,t3,8000561c <core_list_init+0x108>
80005660:	00082883          	lw	a7,0(a6)
80005664:	01079793          	sll	a5,a5,0x10
80005668:	4107d793          	sra	a5,a5,0x10
8000566c:	10070713          	add	a4,a4,256
80005670:	01071713          	sll	a4,a4,0x10
80005674:	00f59123          	sh	a5,2(a1)
80005678:	00080313          	mv	t1,a6
8000567c:	00168693          	add	a3,a3,1
80005680:	01075713          	srl	a4,a4,0x10
80005684:	fc0890e3          	bnez	a7,80005644 <core_list_init+0x130>
80005688:	800055b7          	lui	a1,0x80005
8000568c:	00000613          	li	a2,0
80005690:	f4c58593          	add	a1,a1,-180 # 80004f4c <cmp_idx>
80005694:	a85ff06f          	j	80005118 <core_list_mergesort>
80005698:	00030693          	mv	a3,t1
8000569c:	00078893          	mv	a7,a5
800056a0:	00000313          	li	t1,0
800056a4:	ee1ff06f          	j	80005584 <core_list_init+0x70>

800056a8 <iterate>:
800056a8:	ff010113          	add	sp,sp,-16
800056ac:	01212023          	sw	s2,0(sp)
800056b0:	01c52903          	lw	s2,28(a0)
800056b4:	00112623          	sw	ra,12(sp)
800056b8:	02052c23          	sw	zero,56(a0)
800056bc:	02052e23          	sw	zero,60(a0)
800056c0:	04090e63          	beqz	s2,8000571c <iterate+0x74>
800056c4:	00812423          	sw	s0,8(sp)
800056c8:	00912223          	sw	s1,4(sp)
800056cc:	00050413          	mv	s0,a0
800056d0:	00000493          	li	s1,0
800056d4:	00100593          	li	a1,1
800056d8:	00040513          	mv	a0,s0
800056dc:	b8dff0ef          	jal	80005268 <core_bench_list>
800056e0:	03845583          	lhu	a1,56(s0)
800056e4:	16d010ef          	jal	80007050 <crcu16>
800056e8:	02a41c23          	sh	a0,56(s0)
800056ec:	fff00593          	li	a1,-1
800056f0:	00040513          	mv	a0,s0
800056f4:	b75ff0ef          	jal	80005268 <core_bench_list>
800056f8:	03845583          	lhu	a1,56(s0)
800056fc:	155010ef          	jal	80007050 <crcu16>
80005700:	02a41c23          	sh	a0,56(s0)
80005704:	00049463          	bnez	s1,8000570c <iterate+0x64>
80005708:	02a41d23          	sh	a0,58(s0)
8000570c:	00148493          	add	s1,s1,1
80005710:	fc9912e3          	bne	s2,s1,800056d4 <iterate+0x2c>
80005714:	00812403          	lw	s0,8(sp)
80005718:	00412483          	lw	s1,4(sp)
8000571c:	00c12083          	lw	ra,12(sp)
80005720:	00012903          	lw	s2,0(sp)
80005724:	00000513          	li	a0,0
80005728:	01010113          	add	sp,sp,16
8000572c:	00008067          	ret

80005730 <main>:
80005730:	81010113          	add	sp,sp,-2032
80005734:	00001737          	lui	a4,0x1
80005738:	7e112623          	sw	ra,2028(sp)
8000573c:	7e812423          	sw	s0,2024(sp)
80005740:	7e912223          	sw	s1,2020(sp)
80005744:	7f212023          	sw	s2,2016(sp)
80005748:	7d312e23          	sw	s3,2012(sp)
8000574c:	7d412c23          	sw	s4,2008(sp)
80005750:	7d512a23          	sw	s5,2004(sp)
80005754:	7d612823          	sw	s6,2000(sp)
80005758:	7d712623          	sw	s7,1996(sp)
8000575c:	7d812423          	sw	s8,1992(sp)
80005760:	7d912223          	sw	s9,1988(sp)
80005764:	7da12023          	sw	s10,1984(sp)
80005768:	7bb12e23          	sw	s11,1980(sp)
8000576c:	82070693          	add	a3,a4,-2016 # 820 <__stack_size-0x37e0>
80005770:	f8010113          	add	sp,sp,-128
80005774:	fffff7b7          	lui	a5,0xfffff
80005778:	00f686b3          	add	a3,a3,a5
8000577c:	01010793          	add	a5,sp,16
80005780:	00f687b3          	add	a5,a3,a5
80005784:	fffff637          	lui	a2,0xfffff
80005788:	00f12223          	sw	a5,4(sp)
8000578c:	7e860613          	add	a2,a2,2024 # fffff7e8 <__stack_base+0x3ffff7e8>
80005790:	82070793          	add	a5,a4,-2016
80005794:	01010693          	add	a3,sp,16
80005798:	00c787b3          	add	a5,a5,a2
8000579c:	fffff5b7          	lui	a1,0xfffff
800057a0:	00d78633          	add	a2,a5,a3
800057a4:	7e458593          	add	a1,a1,2020 # fffff7e4 <__stack_base+0x3ffff7e4>
800057a8:	82070793          	add	a5,a4,-2016
800057ac:	00b787b3          	add	a5,a5,a1
800057b0:	00d785b3          	add	a1,a5,a3
800057b4:	00412783          	lw	a5,4(sp)
800057b8:	05e10513          	add	a0,sp,94
800057bc:	7e07a223          	sw	zero,2020(a5) # fffff7e4 <__stack_base+0x3ffff7e4>
800057c0:	369010ef          	jal	80007328 <portable_init>
800057c4:	00100513          	li	a0,1
800057c8:	025010ef          	jal	80006fec <get_seed_32>
800057cc:	00412703          	lw	a4,4(sp)
800057d0:	00050793          	mv	a5,a0
800057d4:	00200513          	li	a0,2
800057d8:	7ef71623          	sh	a5,2028(a4)
800057dc:	011010ef          	jal	80006fec <get_seed_32>
800057e0:	00412703          	lw	a4,4(sp)
800057e4:	00050793          	mv	a5,a0
800057e8:	00300513          	li	a0,3
800057ec:	7ef71723          	sh	a5,2030(a4)
800057f0:	7fc010ef          	jal	80006fec <get_seed_32>
800057f4:	00412703          	lw	a4,4(sp)
800057f8:	00050793          	mv	a5,a0
800057fc:	00400513          	li	a0,4
80005800:	7ef71823          	sh	a5,2032(a4)
80005804:	7e8010ef          	jal	80006fec <get_seed_32>
80005808:	00050793          	mv	a5,a0
8000580c:	00500513          	li	a0,5
80005810:	02f12c23          	sw	a5,56(sp)
80005814:	7d8010ef          	jal	80006fec <get_seed_32>
80005818:	00051463          	bnez	a0,80005820 <main+0xf0>
8000581c:	00700513          	li	a0,7
80005820:	00001737          	lui	a4,0x1
80005824:	fffff7b7          	lui	a5,0xfffff
80005828:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
8000582c:	00f70733          	add	a4,a4,a5
80005830:	01010793          	add	a5,sp,16
80005834:	00f707b3          	add	a5,a4,a5
80005838:	00f12223          	sw	a5,4(sp)
8000583c:	7ec7a783          	lw	a5,2028(a5) # fffff7ec <__stack_base+0x3ffff7ec>
80005840:	02a12e23          	sw	a0,60(sp)
80005844:	30079a63          	bnez	a5,80005b58 <main+0x428>
80005848:	00412783          	lw	a5,4(sp)
8000584c:	7f079783          	lh	a5,2032(a5)
80005850:	4c078c63          	beqz	a5,80005d28 <main+0x5f8>
80005854:	000015b7          	lui	a1,0x1
80005858:	fffff6b7          	lui	a3,0xfffff
8000585c:	82058593          	add	a1,a1,-2016 # 820 <__stack_size-0x37e0>
80005860:	00d585b3          	add	a1,a1,a3
80005864:	01010693          	add	a3,sp,16
80005868:	00d586b3          	add	a3,a1,a3
8000586c:	06010613          	add	a2,sp,96
80005870:	00257793          	and	a5,a0,2
80005874:	00157713          	and	a4,a0,1
80005878:	00f037b3          	snez	a5,a5
8000587c:	00d12223          	sw	a3,4(sp)
80005880:	7ec6aa23          	sw	a2,2036(a3) # fffff7f4 <__stack_base+0x3ffff7f4>
80005884:	04011e23          	sh	zero,92(sp)
80005888:	00457693          	and	a3,a0,4
8000588c:	00f70733          	add	a4,a4,a5
80005890:	00068863          	beqz	a3,800058a0 <main+0x170>
80005894:	00170713          	add	a4,a4,1
80005898:	01071713          	sll	a4,a4,0x10
8000589c:	01075713          	srl	a4,a4,0x10
800058a0:	7d000693          	li	a3,2000
800058a4:	02e6d6b3          	divu	a3,a3,a4
800058a8:	fffff7b7          	lui	a5,0xfffff
800058ac:	00001737          	lui	a4,0x1
800058b0:	7ec78793          	add	a5,a5,2028 # fffff7ec <__stack_base+0x3ffff7ec>
800058b4:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
800058b8:	00f70733          	add	a4,a4,a5
800058bc:	01010793          	add	a5,sp,16
800058c0:	00f707b3          	add	a5,a4,a5
800058c4:	00000813          	li	a6,0
800058c8:	00000713          	li	a4,0
800058cc:	00100313          	li	t1,1
800058d0:	00300893          	li	a7,3
800058d4:	02d12a23          	sw	a3,52(sp)
800058d8:	00e315b3          	sll	a1,t1,a4
800058dc:	00a5f5b3          	and	a1,a1,a0
800058e0:	00170713          	add	a4,a4,1
800058e4:	24059c63          	bnez	a1,80005b3c <main+0x40c>
800058e8:	00478793          	add	a5,a5,4
800058ec:	ff1716e3          	bne	a4,a7,800058d8 <main+0x1a8>
800058f0:	000016b7          	lui	a3,0x1
800058f4:	fffff737          	lui	a4,0xfffff
800058f8:	03c12783          	lw	a5,60(sp)
800058fc:	82068693          	add	a3,a3,-2016 # 820 <__stack_size-0x37e0>
80005900:	00e686b3          	add	a3,a3,a4
80005904:	01010713          	add	a4,sp,16
80005908:	00e68733          	add	a4,a3,a4
8000590c:	00e12223          	sw	a4,4(sp)
80005910:	0017f713          	and	a4,a5,1
80005914:	02070063          	beqz	a4,80005934 <main+0x204>
80005918:	00412783          	lw	a5,4(sp)
8000591c:	03412503          	lw	a0,52(sp)
80005920:	7ec79603          	lh	a2,2028(a5)
80005924:	7f87a583          	lw	a1,2040(a5)
80005928:	bedff0ef          	jal	80005514 <core_list_init>
8000592c:	03c12783          	lw	a5,60(sp)
80005930:	04a12023          	sw	a0,64(sp)
80005934:	0027f713          	and	a4,a5,2
80005938:	1a071e63          	bnez	a4,80005af4 <main+0x3c4>
8000593c:	0047f793          	and	a5,a5,4
80005940:	02078863          	beqz	a5,80005970 <main+0x240>
80005944:	00001737          	lui	a4,0x1
80005948:	fffff7b7          	lui	a5,0xfffff
8000594c:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
80005950:	00f70733          	add	a4,a4,a5
80005954:	01010793          	add	a5,sp,16
80005958:	00f707b3          	add	a5,a4,a5
8000595c:	03012603          	lw	a2,48(sp)
80005960:	7ec79583          	lh	a1,2028(a5) # fffff7ec <__stack_base+0x3ffff7ec>
80005964:	03412503          	lw	a0,52(sp)
80005968:	00f12223          	sw	a5,4(sp)
8000596c:	048010ef          	jal	800069b4 <core_init_state>
80005970:	03812783          	lw	a5,56(sp)
80005974:	0a079663          	bnez	a5,80005a20 <main+0x2f0>
80005978:	a0001737          	lui	a4,0xa0001
8000597c:	92872903          	lw	s2,-1752(a4) # a0000928 <intpat+0x9c>
80005980:	92c72983          	lw	s3,-1748(a4)
80005984:	00100713          	li	a4,1
80005988:	fffff7b7          	lui	a5,0xfffff
8000598c:	02e12c23          	sw	a4,56(sp)
80005990:	00001737          	lui	a4,0x1
80005994:	7ec78793          	add	a5,a5,2028 # fffff7ec <__stack_base+0x3ffff7ec>
80005998:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
8000599c:	00f70733          	add	a4,a4,a5
800059a0:	01010793          	add	a5,sp,16
800059a4:	00f707b3          	add	a5,a4,a5
800059a8:	00f12223          	sw	a5,4(sp)
800059ac:	03812703          	lw	a4,56(sp)
800059b0:	00271793          	sll	a5,a4,0x2
800059b4:	00e787b3          	add	a5,a5,a4
800059b8:	00179793          	sll	a5,a5,0x1
800059bc:	02f12c23          	sw	a5,56(sp)
800059c0:	0d5010ef          	jal	80007294 <start_time>
800059c4:	c03027f3          	csrr	a5,hpmcounter3
800059c8:	00412503          	lw	a0,4(sp)
800059cc:	cddff0ef          	jal	800056a8 <iterate>
800059d0:	c03027f3          	csrr	a5,hpmcounter3
800059d4:	0d9010ef          	jal	800072ac <stop_time>
800059d8:	0ed010ef          	jal	800072c4 <get_time>
800059dc:	115010ef          	jal	800072f0 <time_in_secs>
800059e0:	00090613          	mv	a2,s2
800059e4:	00098693          	mv	a3,s3
800059e8:	00050493          	mv	s1,a0
800059ec:	00058413          	mv	s0,a1
800059f0:	ec5fb0ef          	jal	800018b4 <__ledf2>
800059f4:	fa054ce3          	bltz	a0,800059ac <main+0x27c>
800059f8:	00048513          	mv	a0,s1
800059fc:	00040593          	mv	a1,s0
80005a00:	da9fc0ef          	jal	800027a8 <__fixunsdfsi>
80005a04:	30050e63          	beqz	a0,80005d20 <main+0x5f0>
80005a08:	00a00793          	li	a5,10
80005a0c:	02a7d7b3          	divu	a5,a5,a0
80005a10:	03812703          	lw	a4,56(sp)
80005a14:	00178793          	add	a5,a5,1
80005a18:	02e787b3          	mul	a5,a5,a4
80005a1c:	02f12c23          	sw	a5,56(sp)
80005a20:	075010ef          	jal	80007294 <start_time>
80005a24:	c03027f3          	csrr	a5,hpmcounter3
80005a28:	00001437          	lui	s0,0x1
80005a2c:	fffff537          	lui	a0,0xfffff
80005a30:	00f12623          	sw	a5,12(sp)
80005a34:	7ec50513          	add	a0,a0,2028 # fffff7ec <__stack_base+0x3ffff7ec>
80005a38:	82040793          	add	a5,s0,-2016 # 820 <__stack_size-0x37e0>
80005a3c:	00a787b3          	add	a5,a5,a0
80005a40:	01010713          	add	a4,sp,16
80005a44:	00e78533          	add	a0,a5,a4
80005a48:	c61ff0ef          	jal	800056a8 <iterate>
80005a4c:	c03027f3          	csrr	a5,hpmcounter3
80005a50:	00f12423          	sw	a5,8(sp)
80005a54:	059010ef          	jal	800072ac <stop_time>
80005a58:	06d010ef          	jal	800072c4 <get_time>
80005a5c:	fffff7b7          	lui	a5,0xfffff
80005a60:	82040713          	add	a4,s0,-2016
80005a64:	00f70733          	add	a4,a4,a5
80005a68:	01010793          	add	a5,sp,16
80005a6c:	00f707b3          	add	a5,a4,a5
80005a70:	00050a13          	mv	s4,a0
80005a74:	7ec79503          	lh	a0,2028(a5) # fffff7ec <__stack_base+0x3ffff7ec>
80005a78:	00058a93          	mv	s5,a1
80005a7c:	00000593          	li	a1,0
80005a80:	00f12223          	sw	a5,4(sp)
80005a84:	774010ef          	jal	800071f8 <crc16>
80005a88:	00412783          	lw	a5,4(sp)
80005a8c:	00050593          	mv	a1,a0
80005a90:	7ee79503          	lh	a0,2030(a5)
80005a94:	764010ef          	jal	800071f8 <crc16>
80005a98:	00412783          	lw	a5,4(sp)
80005a9c:	00050593          	mv	a1,a0
80005aa0:	7f079503          	lh	a0,2032(a5)
80005aa4:	754010ef          	jal	800071f8 <crc16>
80005aa8:	00050593          	mv	a1,a0
80005aac:	03411503          	lh	a0,52(sp)
80005ab0:	748010ef          	jal	800071f8 <crc16>
80005ab4:	000087b7          	lui	a5,0x8
80005ab8:	b0578793          	add	a5,a5,-1275 # 7b05 <__stack_size+0x3b05>
80005abc:	00050493          	mv	s1,a0
80005ac0:	72f50063          	beq	a0,a5,800061e0 <main+0xab0>
80005ac4:	0ca7f263          	bgeu	a5,a0,80005b88 <main+0x458>
80005ac8:	000097b7          	lui	a5,0x9
80005acc:	a0278793          	add	a5,a5,-1534 # 8a02 <__stack_size+0x4a02>
80005ad0:	6ef50e63          	beq	a0,a5,800061cc <main+0xa9c>
80005ad4:	0000f7b7          	lui	a5,0xf
80005ad8:	9f578793          	add	a5,a5,-1547 # e9f5 <__stack_size+0xa9f5>
80005adc:	24f51e63          	bne	a0,a5,80005d38 <main+0x608>
80005ae0:	a0000537          	lui	a0,0xa0000
80005ae4:	22050513          	add	a0,a0,544 # a0000220 <__clz_tab+0x1a8>
80005ae8:	c00ff0ef          	jal	80004ee8 <printf_>
80005aec:	00300c93          	li	s9,3
80005af0:	0c00006f          	j	80005bb0 <main+0x480>
80005af4:	00001737          	lui	a4,0x1
80005af8:	fffff7b7          	lui	a5,0xfffff
80005afc:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
80005b00:	00f70733          	add	a4,a4,a5
80005b04:	01010793          	add	a5,sp,16
80005b08:	00f707b3          	add	a5,a4,a5
80005b0c:	00f12223          	sw	a5,4(sp)
80005b10:	00412703          	lw	a4,4(sp)
80005b14:	7ee79783          	lh	a5,2030(a5) # fffff7ee <__stack_base+0x3ffff7ee>
80005b18:	03412503          	lw	a0,52(sp)
80005b1c:	7ec71603          	lh	a2,2028(a4)
80005b20:	7fc72583          	lw	a1,2044(a4)
80005b24:	01079793          	sll	a5,a5,0x10
80005b28:	00c7e633          	or	a2,a5,a2
80005b2c:	04410693          	add	a3,sp,68
80005b30:	6d8000ef          	jal	80006208 <core_init_matrix>
80005b34:	03c12783          	lw	a5,60(sp)
80005b38:	e05ff06f          	j	8000593c <main+0x20c>
80005b3c:	02d805b3          	mul	a1,a6,a3
80005b40:	00180813          	add	a6,a6,1
80005b44:	01081813          	sll	a6,a6,0x10
80005b48:	01085813          	srl	a6,a6,0x10
80005b4c:	00b605b3          	add	a1,a2,a1
80005b50:	00b7a623          	sw	a1,12(a5)
80005b54:	d95ff06f          	j	800058e8 <main+0x1b8>
80005b58:	00100713          	li	a4,1
80005b5c:	cee79ce3          	bne	a5,a4,80005854 <main+0x124>
80005b60:	00412783          	lw	a5,4(sp)
80005b64:	7f079783          	lh	a5,2032(a5)
80005b68:	ce0796e3          	bnez	a5,80005854 <main+0x124>
80005b6c:	00412703          	lw	a4,4(sp)
80005b70:	341537b7          	lui	a5,0x34153
80005b74:	41578793          	add	a5,a5,1045 # 34153415 <__stack_size+0x3414f415>
80005b78:	7ef72623          	sw	a5,2028(a4)
80005b7c:	06600793          	li	a5,102
80005b80:	7ef71823          	sh	a5,2032(a4)
80005b84:	cd1ff06f          	j	80005854 <main+0x124>
80005b88:	000027b7          	lui	a5,0x2
80005b8c:	8f278793          	add	a5,a5,-1806 # 18f2 <__stack_size-0x270e>
80005b90:	62f50463          	beq	a0,a5,800061b8 <main+0xa88>
80005b94:	000057b7          	lui	a5,0x5
80005b98:	eaf78793          	add	a5,a5,-337 # 4eaf <__stack_size+0xeaf>
80005b9c:	18f51e63          	bne	a0,a5,80005d38 <main+0x608>
80005ba0:	a0000537          	lui	a0,0xa0000
80005ba4:	1ec50513          	add	a0,a0,492 # a00001ec <__clz_tab+0x174>
80005ba8:	b40ff0ef          	jal	80004ee8 <printf_>
80005bac:	00200c93          	li	s9,2
80005bb0:	a0001d37          	lui	s10,0xa0001
80005bb4:	958d2783          	lw	a5,-1704(s10) # a0000958 <default_num_contexts>
80005bb8:	62078e63          	beqz	a5,800061f4 <main+0xac4>
80005bbc:	00001737          	lui	a4,0x1
80005bc0:	fffff6b7          	lui	a3,0xfffff
80005bc4:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
80005bc8:	00d70733          	add	a4,a4,a3
80005bcc:	a0001b37          	lui	s6,0xa0001
80005bd0:	a00019b7          	lui	s3,0xa0001
80005bd4:	a0001937          	lui	s2,0xa0001
80005bd8:	01010693          	add	a3,sp,16
80005bdc:	001c9793          	sll	a5,s9,0x1
80005be0:	00d70733          	add	a4,a4,a3
80005be4:	850b0b13          	add	s6,s6,-1968 # a0000850 <list_known_crc>
80005be8:	84498993          	add	s3,s3,-1980 # a0000844 <matrix_known_crc>
80005bec:	83890913          	add	s2,s2,-1992 # a0000838 <state_known_crc>
80005bf0:	00000d93          	li	s11,0
80005bf4:	00000b93          	li	s7,0
80005bf8:	00e12223          	sw	a4,4(sp)
80005bfc:	00fb0b33          	add	s6,s6,a5
80005c00:	00f989b3          	add	s3,s3,a5
80005c04:	00f90933          	add	s2,s2,a5
80005c08:	0400006f          	j	80005c48 <main+0x518>
80005c0c:	00412783          	lw	a5,4(sp)
80005c10:	00878433          	add	s0,a5,s0
80005c14:	000017b7          	lui	a5,0x1
80005c18:	008787b3          	add	a5,a5,s0
80005c1c:	82c7d783          	lhu	a5,-2004(a5) # 82c <__stack_size-0x37d4>
80005c20:	001b8b93          	add	s7,s7,1
80005c24:	958d2683          	lw	a3,-1704(s10)
80005c28:	01b787b3          	add	a5,a5,s11
80005c2c:	010b9b93          	sll	s7,s7,0x10
80005c30:	01079413          	sll	s0,a5,0x10
80005c34:	01079d93          	sll	s11,a5,0x10
80005c38:	010bdb93          	srl	s7,s7,0x10
80005c3c:	01045413          	srl	s0,s0,0x10
80005c40:	410ddd93          	sra	s11,s11,0x10
80005c44:	10dbf263          	bgeu	s7,a3,80005d48 <main+0x618>
80005c48:	00412703          	lw	a4,4(sp)
80005c4c:	004b9413          	sll	s0,s7,0x4
80005c50:	017407b3          	add	a5,s0,s7
80005c54:	00279793          	sll	a5,a5,0x2
80005c58:	00f707b3          	add	a5,a4,a5
80005c5c:	00001c37          	lui	s8,0x1
80005c60:	00fc0c33          	add	s8,s8,a5
80005c64:	80cc2783          	lw	a5,-2036(s8) # 80c <__stack_size-0x37f4>
80005c68:	820c1623          	sh	zero,-2004(s8)
80005c6c:	0017f693          	and	a3,a5,1
80005c70:	02068863          	beqz	a3,80005ca0 <main+0x570>
80005c74:	826c5603          	lhu	a2,-2010(s8)
80005c78:	000b5683          	lhu	a3,0(s6)
80005c7c:	02d60263          	beq	a2,a3,80005ca0 <main+0x570>
80005c80:	a0000537          	lui	a0,0xa0000
80005c84:	000b8593          	mv	a1,s7
80005c88:	27c50513          	add	a0,a0,636 # a000027c <__clz_tab+0x204>
80005c8c:	a5cff0ef          	jal	80004ee8 <printf_>
80005c90:	82cc5683          	lhu	a3,-2004(s8)
80005c94:	80cc2783          	lw	a5,-2036(s8)
80005c98:	00168693          	add	a3,a3,1 # fffff001 <__stack_base+0x3ffff001>
80005c9c:	82dc1623          	sh	a3,-2004(s8)
80005ca0:	0027f693          	and	a3,a5,2
80005ca4:	04068463          	beqz	a3,80005cec <main+0x5bc>
80005ca8:	00412703          	lw	a4,4(sp)
80005cac:	017406b3          	add	a3,s0,s7
80005cb0:	00269693          	sll	a3,a3,0x2
80005cb4:	00d706b3          	add	a3,a4,a3
80005cb8:	00001c37          	lui	s8,0x1
80005cbc:	00dc0c33          	add	s8,s8,a3
80005cc0:	828c5603          	lhu	a2,-2008(s8) # 828 <__stack_size-0x37d8>
80005cc4:	0009d683          	lhu	a3,0(s3)
80005cc8:	02d60263          	beq	a2,a3,80005cec <main+0x5bc>
80005ccc:	a0000537          	lui	a0,0xa0000
80005cd0:	000b8593          	mv	a1,s7
80005cd4:	2ac50513          	add	a0,a0,684 # a00002ac <__clz_tab+0x234>
80005cd8:	a10ff0ef          	jal	80004ee8 <printf_>
80005cdc:	82cc5683          	lhu	a3,-2004(s8)
80005ce0:	80cc2783          	lw	a5,-2036(s8)
80005ce4:	00168693          	add	a3,a3,1
80005ce8:	82dc1623          	sh	a3,-2004(s8)
80005cec:	01740433          	add	s0,s0,s7
80005cf0:	0047f793          	and	a5,a5,4
80005cf4:	00241413          	sll	s0,s0,0x2
80005cf8:	f0078ae3          	beqz	a5,80005c0c <main+0x4dc>
80005cfc:	00412783          	lw	a5,4(sp)
80005d00:	00095683          	lhu	a3,0(s2)
80005d04:	00878433          	add	s0,a5,s0
80005d08:	000017b7          	lui	a5,0x1
80005d0c:	00878433          	add	s0,a5,s0
80005d10:	82a45603          	lhu	a2,-2006(s0)
80005d14:	36d61e63          	bne	a2,a3,80006090 <main+0x960>
80005d18:	82c45783          	lhu	a5,-2004(s0)
80005d1c:	f05ff06f          	j	80005c20 <main+0x4f0>
80005d20:	00100513          	li	a0,1
80005d24:	ce5ff06f          	j	80005a08 <main+0x2d8>
80005d28:	00412703          	lw	a4,4(sp)
80005d2c:	06600793          	li	a5,102
80005d30:	7ef71823          	sh	a5,2032(a4)
80005d34:	b21ff06f          	j	80005854 <main+0x124>
80005d38:	00010437          	lui	s0,0x10
80005d3c:	fff40413          	add	s0,s0,-1 # ffff <__stack_size+0xbfff>
80005d40:	fff00c93          	li	s9,-1
80005d44:	a0001d37          	lui	s10,0xa0001
80005d48:	544010ef          	jal	8000728c <check_data_types>
80005d4c:	03412583          	lw	a1,52(sp)
80005d50:	008509b3          	add	s3,a0,s0
80005d54:	a0000537          	lui	a0,0xa0000
80005d58:	31050513          	add	a0,a0,784 # a0000310 <__clz_tab+0x298>
80005d5c:	98cff0ef          	jal	80004ee8 <printf_>
80005d60:	a0000537          	lui	a0,0xa0000
80005d64:	000a0593          	mv	a1,s4
80005d68:	32850513          	add	a0,a0,808 # a0000328 <__clz_tab+0x2b0>
80005d6c:	97cff0ef          	jal	80004ee8 <printf_>
80005d70:	000a0513          	mv	a0,s4
80005d74:	000a8593          	mv	a1,s5
80005d78:	578010ef          	jal	800072f0 <time_in_secs>
80005d7c:	00050613          	mv	a2,a0
80005d80:	a0000537          	lui	a0,0xa0000
80005d84:	00058693          	mv	a3,a1
80005d88:	34050513          	add	a0,a0,832 # a0000340 <__clz_tab+0x2c8>
80005d8c:	95cff0ef          	jal	80004ee8 <printf_>
80005d90:	000a0513          	mv	a0,s4
80005d94:	000a8593          	mv	a1,s5
80005d98:	558010ef          	jal	800072f0 <time_in_secs>
80005d9c:	01099993          	sll	s3,s3,0x10
80005da0:	00000613          	li	a2,0
80005da4:	00000693          	li	a3,0
80005da8:	4109d993          	sra	s3,s3,0x10
80005dac:	a2dfb0ef          	jal	800017d8 <__gedf2>
80005db0:	04a05863          	blez	a0,80005e00 <main+0x6d0>
80005db4:	958d2783          	lw	a5,-1704(s10) # a0000958 <default_num_contexts>
80005db8:	03812503          	lw	a0,56(sp)
80005dbc:	02f50533          	mul	a0,a0,a5
80005dc0:	b0dfc0ef          	jal	800028cc <__floatunsidf>
80005dc4:	00050913          	mv	s2,a0
80005dc8:	00058413          	mv	s0,a1
80005dcc:	000a0513          	mv	a0,s4
80005dd0:	000a8593          	mv	a1,s5
80005dd4:	51c010ef          	jal	800072f0 <time_in_secs>
80005dd8:	00050613          	mv	a2,a0
80005ddc:	00058693          	mv	a3,a1
80005de0:	00090513          	mv	a0,s2
80005de4:	00040593          	mv	a1,s0
80005de8:	a88fb0ef          	jal	80001070 <__divdf3>
80005dec:	00050613          	mv	a2,a0
80005df0:	a0000537          	lui	a0,0xa0000
80005df4:	00058693          	mv	a3,a1
80005df8:	35850513          	add	a0,a0,856 # a0000358 <__clz_tab+0x2e0>
80005dfc:	8ecff0ef          	jal	80004ee8 <printf_>
80005e00:	958d2783          	lw	a5,-1704(s10)
80005e04:	03812583          	lw	a1,56(sp)
80005e08:	a0000537          	lui	a0,0xa0000
80005e0c:	37050513          	add	a0,a0,880 # a0000370 <__clz_tab+0x2f8>
80005e10:	02f585b3          	mul	a1,a1,a5
80005e14:	a0000b37          	lui	s6,0xa0000
80005e18:	a0000bb7          	lui	s7,0xa0000
80005e1c:	a0000c37          	lui	s8,0xa0000
80005e20:	8c8ff0ef          	jal	80004ee8 <printf_>
80005e24:	a0000537          	lui	a0,0xa0000
80005e28:	388b0593          	add	a1,s6,904 # a0000388 <__clz_tab+0x310>
80005e2c:	39450513          	add	a0,a0,916 # a0000394 <__clz_tab+0x31c>
80005e30:	8b8ff0ef          	jal	80004ee8 <printf_>
80005e34:	a0000537          	lui	a0,0xa0000
80005e38:	3acb8593          	add	a1,s7,940 # a00003ac <__clz_tab+0x334>
80005e3c:	3b050513          	add	a0,a0,944 # a00003b0 <__clz_tab+0x338>
80005e40:	8a8ff0ef          	jal	80004ee8 <printf_>
80005e44:	a0000537          	lui	a0,0xa0000
80005e48:	3c8c0593          	add	a1,s8,968 # a00003c8 <__clz_tab+0x350>
80005e4c:	3d050513          	add	a0,a0,976 # a00003d0 <__clz_tab+0x358>
80005e50:	898ff0ef          	jal	80004ee8 <printf_>
80005e54:	a0000537          	lui	a0,0xa0000
80005e58:	00048593          	mv	a1,s1
80005e5c:	3e850513          	add	a0,a0,1000 # a00003e8 <__clz_tab+0x370>
80005e60:	888ff0ef          	jal	80004ee8 <printf_>
80005e64:	03c12783          	lw	a5,60(sp)
80005e68:	0017f693          	and	a3,a5,1
80005e6c:	06068a63          	beqz	a3,80005ee0 <main+0x7b0>
80005e70:	958d2683          	lw	a3,-1704(s10)
80005e74:	06068663          	beqz	a3,80005ee0 <main+0x7b0>
80005e78:	00001737          	lui	a4,0x1
80005e7c:	fffff7b7          	lui	a5,0xfffff
80005e80:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
80005e84:	00f70733          	add	a4,a4,a5
80005e88:	01010793          	add	a5,sp,16
80005e8c:	00f707b3          	add	a5,a4,a5
80005e90:	00000913          	li	s2,0
80005e94:	a00004b7          	lui	s1,0xa0000
80005e98:	00f12223          	sw	a5,4(sp)
80005e9c:	00001437          	lui	s0,0x1
80005ea0:	00412703          	lw	a4,4(sp)
80005ea4:	00491793          	sll	a5,s2,0x4
80005ea8:	012787b3          	add	a5,a5,s2
80005eac:	00279793          	sll	a5,a5,0x2
80005eb0:	00f707b3          	add	a5,a4,a5
80005eb4:	00f407b3          	add	a5,s0,a5
80005eb8:	8267d603          	lhu	a2,-2010(a5) # ffffe826 <__stack_base+0x3fffe826>
80005ebc:	00090593          	mv	a1,s2
80005ec0:	40448513          	add	a0,s1,1028 # a0000404 <__clz_tab+0x38c>
80005ec4:	824ff0ef          	jal	80004ee8 <printf_>
80005ec8:	00190913          	add	s2,s2,1
80005ecc:	958d2783          	lw	a5,-1704(s10)
80005ed0:	01091913          	sll	s2,s2,0x10
80005ed4:	01095913          	srl	s2,s2,0x10
80005ed8:	fcf964e3          	bltu	s2,a5,80005ea0 <main+0x770>
80005edc:	03c12783          	lw	a5,60(sp)
80005ee0:	0027f693          	and	a3,a5,2
80005ee4:	06068a63          	beqz	a3,80005f58 <main+0x828>
80005ee8:	958d2683          	lw	a3,-1704(s10)
80005eec:	30068863          	beqz	a3,800061fc <main+0xacc>
80005ef0:	00001737          	lui	a4,0x1
80005ef4:	fffff7b7          	lui	a5,0xfffff
80005ef8:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
80005efc:	00f70733          	add	a4,a4,a5
80005f00:	01010793          	add	a5,sp,16
80005f04:	00f707b3          	add	a5,a4,a5
80005f08:	00000913          	li	s2,0
80005f0c:	a00004b7          	lui	s1,0xa0000
80005f10:	00f12223          	sw	a5,4(sp)
80005f14:	00001437          	lui	s0,0x1
80005f18:	00412703          	lw	a4,4(sp)
80005f1c:	00491793          	sll	a5,s2,0x4
80005f20:	012787b3          	add	a5,a5,s2
80005f24:	00279793          	sll	a5,a5,0x2
80005f28:	00f707b3          	add	a5,a4,a5
80005f2c:	00f407b3          	add	a5,s0,a5
80005f30:	8287d603          	lhu	a2,-2008(a5) # ffffe828 <__stack_base+0x3fffe828>
80005f34:	00090593          	mv	a1,s2
80005f38:	42048513          	add	a0,s1,1056 # a0000420 <__clz_tab+0x3a8>
80005f3c:	fadfe0ef          	jal	80004ee8 <printf_>
80005f40:	00190913          	add	s2,s2,1
80005f44:	958d2783          	lw	a5,-1704(s10)
80005f48:	01091913          	sll	s2,s2,0x10
80005f4c:	01095913          	srl	s2,s2,0x10
80005f50:	fcf964e3          	bltu	s2,a5,80005f18 <main+0x7e8>
80005f54:	03c12783          	lw	a5,60(sp)
80005f58:	0047f793          	and	a5,a5,4
80005f5c:	958d2683          	lw	a3,-1704(s10)
80005f60:	06078663          	beqz	a5,80005fcc <main+0x89c>
80005f64:	0c068663          	beqz	a3,80006030 <main+0x900>
80005f68:	00001737          	lui	a4,0x1
80005f6c:	fffff7b7          	lui	a5,0xfffff
80005f70:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
80005f74:	00f70733          	add	a4,a4,a5
80005f78:	01010793          	add	a5,sp,16
80005f7c:	00f707b3          	add	a5,a4,a5
80005f80:	00000913          	li	s2,0
80005f84:	a00004b7          	lui	s1,0xa0000
80005f88:	00f12223          	sw	a5,4(sp)
80005f8c:	00001437          	lui	s0,0x1
80005f90:	00412703          	lw	a4,4(sp)
80005f94:	00491793          	sll	a5,s2,0x4
80005f98:	012787b3          	add	a5,a5,s2
80005f9c:	00279793          	sll	a5,a5,0x2
80005fa0:	00f707b3          	add	a5,a4,a5
80005fa4:	00f407b3          	add	a5,s0,a5
80005fa8:	82a7d603          	lhu	a2,-2006(a5) # ffffe82a <__stack_base+0x3fffe82a>
80005fac:	00090593          	mv	a1,s2
80005fb0:	43c48513          	add	a0,s1,1084 # a000043c <__clz_tab+0x3c4>
80005fb4:	f35fe0ef          	jal	80004ee8 <printf_>
80005fb8:	00190913          	add	s2,s2,1
80005fbc:	958d2783          	lw	a5,-1704(s10)
80005fc0:	01091913          	sll	s2,s2,0x10
80005fc4:	01095913          	srl	s2,s2,0x10
80005fc8:	fcf964e3          	bltu	s2,a5,80005f90 <main+0x860>
80005fcc:	00001737          	lui	a4,0x1
80005fd0:	958d2783          	lw	a5,-1704(s10)
80005fd4:	fffff437          	lui	s0,0xfffff
80005fd8:	82070713          	add	a4,a4,-2016 # 820 <__stack_size-0x37e0>
80005fdc:	00870733          	add	a4,a4,s0
80005fe0:	01010693          	add	a3,sp,16
80005fe4:	00000d93          	li	s11,0
80005fe8:	a0000937          	lui	s2,0xa0000
80005fec:	00d70433          	add	s0,a4,a3
80005ff0:	000014b7          	lui	s1,0x1
80005ff4:	02078e63          	beqz	a5,80006030 <main+0x900>
80005ff8:	004d9793          	sll	a5,s11,0x4
80005ffc:	01b787b3          	add	a5,a5,s11
80006000:	00279793          	sll	a5,a5,0x2
80006004:	00f407b3          	add	a5,s0,a5
80006008:	00f487b3          	add	a5,s1,a5
8000600c:	8247d603          	lhu	a2,-2012(a5)
80006010:	000d8593          	mv	a1,s11
80006014:	45890513          	add	a0,s2,1112 # a0000458 <__clz_tab+0x3e0>
80006018:	ed1fe0ef          	jal	80004ee8 <printf_>
8000601c:	001d8593          	add	a1,s11,1
80006020:	958d2783          	lw	a5,-1704(s10)
80006024:	01059d93          	sll	s11,a1,0x10
80006028:	010ddd93          	srl	s11,s11,0x10
8000602c:	fcfde6e3          	bltu	s11,a5,80005ff8 <main+0x8c8>
80006030:	08098c63          	beqz	s3,800060c8 <main+0x998>
80006034:	09304263          	bgtz	s3,800060b8 <main+0x988>
80006038:	a0000537          	lui	a0,0xa0000
8000603c:	52450513          	add	a0,a0,1316 # a0000524 <__clz_tab+0x4ac>
80006040:	ea9fe0ef          	jal	80004ee8 <printf_>
80006044:	05e10513          	add	a0,sp,94
80006048:	318010ef          	jal	80007360 <portable_fini>
8000604c:	08010113          	add	sp,sp,128
80006050:	7ec12083          	lw	ra,2028(sp)
80006054:	7e812403          	lw	s0,2024(sp)
80006058:	7e412483          	lw	s1,2020(sp)
8000605c:	7e012903          	lw	s2,2016(sp)
80006060:	7dc12983          	lw	s3,2012(sp)
80006064:	7d812a03          	lw	s4,2008(sp)
80006068:	7d412a83          	lw	s5,2004(sp)
8000606c:	7d012b03          	lw	s6,2000(sp)
80006070:	7cc12b83          	lw	s7,1996(sp)
80006074:	7c812c03          	lw	s8,1992(sp)
80006078:	7c412c83          	lw	s9,1988(sp)
8000607c:	7c012d03          	lw	s10,1984(sp)
80006080:	7bc12d83          	lw	s11,1980(sp)
80006084:	00000513          	li	a0,0
80006088:	7f010113          	add	sp,sp,2032
8000608c:	00008067          	ret
80006090:	a0000537          	lui	a0,0xa0000
80006094:	000b8593          	mv	a1,s7
80006098:	2e050513          	add	a0,a0,736 # a00002e0 <__clz_tab+0x268>
8000609c:	e4dfe0ef          	jal	80004ee8 <printf_>
800060a0:	82c45783          	lhu	a5,-2004(s0) # ffffe82c <__stack_base+0x3fffe82c>
800060a4:	00178793          	add	a5,a5,1
800060a8:	01079793          	sll	a5,a5,0x10
800060ac:	0107d793          	srl	a5,a5,0x10
800060b0:	82f41623          	sh	a5,-2004(s0)
800060b4:	b6dff06f          	j	80005c20 <main+0x4f0>
800060b8:	a0000537          	lui	a0,0xa0000
800060bc:	58850513          	add	a0,a0,1416 # a0000588 <__clz_tab+0x510>
800060c0:	e29fe0ef          	jal	80004ee8 <printf_>
800060c4:	f81ff06f          	j	80006044 <main+0x914>
800060c8:	a0000537          	lui	a0,0xa0000
800060cc:	47450513          	add	a0,a0,1140 # a0000474 <__clz_tab+0x3fc>
800060d0:	e19fe0ef          	jal	80004ee8 <printf_>
800060d4:	00300793          	li	a5,3
800060d8:	f6fc96e3          	bne	s9,a5,80006044 <main+0x914>
800060dc:	00812603          	lw	a2,8(sp)
800060e0:	00c12583          	lw	a1,12(sp)
800060e4:	a0000537          	lui	a0,0xa0000
800060e8:	4c050513          	add	a0,a0,1216 # a00004c0 <__clz_tab+0x448>
800060ec:	40b60433          	sub	s0,a2,a1
800060f0:	00040693          	mv	a3,s0
800060f4:	df5fe0ef          	jal	80004ee8 <printf_>
800060f8:	00040513          	mv	a0,s0
800060fc:	d2dfc0ef          	jal	80002e28 <__floatunsisf>
80006100:	00050413          	mv	s0,a0
80006104:	000a8593          	mv	a1,s5
80006108:	000a0513          	mv	a0,s4
8000610c:	df9fc0ef          	jal	80002f04 <__floatundisf>
80006110:	00050593          	mv	a1,a0
80006114:	00040513          	mv	a0,s0
80006118:	9e5fc0ef          	jal	80002afc <__divsf3>
8000611c:	f21fc0ef          	jal	8000303c <__extendsfdf2>
80006120:	a00017b7          	lui	a5,0xa0001
80006124:	9507a603          	lw	a2,-1712(a5) # a0000950 <intpat+0xc4>
80006128:	9547a683          	lw	a3,-1708(a5)
8000612c:	865fb0ef          	jal	80001990 <__muldf3>
80006130:	00050613          	mv	a2,a0
80006134:	a0000537          	lui	a0,0xa0000
80006138:	00058693          	mv	a3,a1
8000613c:	4f050513          	add	a0,a0,1264 # a00004f0 <__clz_tab+0x478>
80006140:	da9fe0ef          	jal	80004ee8 <printf_>
80006144:	958d2783          	lw	a5,-1704(s10)
80006148:	03812503          	lw	a0,56(sp)
8000614c:	02f50533          	mul	a0,a0,a5
80006150:	f7cfc0ef          	jal	800028cc <__floatunsidf>
80006154:	00050493          	mv	s1,a0
80006158:	00058413          	mv	s0,a1
8000615c:	000a0513          	mv	a0,s4
80006160:	000a8593          	mv	a1,s5
80006164:	18c010ef          	jal	800072f0 <time_in_secs>
80006168:	00050613          	mv	a2,a0
8000616c:	00058693          	mv	a3,a1
80006170:	00048513          	mv	a0,s1
80006174:	00040593          	mv	a1,s0
80006178:	ef9fa0ef          	jal	80001070 <__divdf3>
8000617c:	00050613          	mv	a2,a0
80006180:	a0000537          	lui	a0,0xa0000
80006184:	00058693          	mv	a3,a1
80006188:	3acb8793          	add	a5,s7,940
8000618c:	388b0713          	add	a4,s6,904
80006190:	4fc50513          	add	a0,a0,1276 # a00004fc <__clz_tab+0x484>
80006194:	d55fe0ef          	jal	80004ee8 <printf_>
80006198:	a0000537          	lui	a0,0xa0000
8000619c:	3c8c0593          	add	a1,s8,968
800061a0:	51850513          	add	a0,a0,1304 # a0000518 <__clz_tab+0x4a0>
800061a4:	d45fe0ef          	jal	80004ee8 <printf_>
800061a8:	a0000537          	lui	a0,0xa0000
800061ac:	52050513          	add	a0,a0,1312 # a0000520 <__clz_tab+0x4a8>
800061b0:	d39fe0ef          	jal	80004ee8 <printf_>
800061b4:	e91ff06f          	j	80006044 <main+0x914>
800061b8:	a0000537          	lui	a0,0xa0000
800061bc:	25050513          	add	a0,a0,592 # a0000250 <__clz_tab+0x1d8>
800061c0:	d29fe0ef          	jal	80004ee8 <printf_>
800061c4:	00400c93          	li	s9,4
800061c8:	9e9ff06f          	j	80005bb0 <main+0x480>
800061cc:	a0000537          	lui	a0,0xa0000
800061d0:	19050513          	add	a0,a0,400 # a0000190 <__clz_tab+0x118>
800061d4:	d15fe0ef          	jal	80004ee8 <printf_>
800061d8:	00000c93          	li	s9,0
800061dc:	9d5ff06f          	j	80005bb0 <main+0x480>
800061e0:	a0000537          	lui	a0,0xa0000
800061e4:	1c050513          	add	a0,a0,448 # a00001c0 <__clz_tab+0x148>
800061e8:	d01fe0ef          	jal	80004ee8 <printf_>
800061ec:	00100c93          	li	s9,1
800061f0:	9c1ff06f          	j	80005bb0 <main+0x480>
800061f4:	00000413          	li	s0,0
800061f8:	b51ff06f          	j	80005d48 <main+0x618>
800061fc:	0047f793          	and	a5,a5,4
80006200:	dc0786e3          	beqz	a5,80005fcc <main+0x89c>
80006204:	e2dff06f          	j	80006030 <main+0x900>

80006208 <core_init_matrix>:
80006208:	ff010113          	add	sp,sp,-16
8000620c:	00912423          	sw	s1,8(sp)
80006210:	01212223          	sw	s2,4(sp)
80006214:	00050813          	mv	a6,a0
80006218:	00061463          	bnez	a2,80006220 <core_init_matrix+0x18>
8000621c:	00100613          	li	a2,1
80006220:	00000793          	li	a5,0
80006224:	10080663          	beqz	a6,80006330 <core_init_matrix+0x128>
80006228:	00078513          	mv	a0,a5
8000622c:	00178793          	add	a5,a5,1
80006230:	02f78733          	mul	a4,a5,a5
80006234:	00371713          	sll	a4,a4,0x3
80006238:	ff0768e3          	bltu	a4,a6,80006228 <core_init_matrix+0x20>
8000623c:	02a502b3          	mul	t0,a0,a0
80006240:	fff58593          	add	a1,a1,-1
80006244:	ffc5f793          	and	a5,a1,-4
80006248:	00478493          	add	s1,a5,4
8000624c:	00050913          	mv	s2,a0
80006250:	00048e13          	mv	t3,s1
80006254:	00129293          	sll	t0,t0,0x1
80006258:	005483b3          	add	t2,s1,t0
8000625c:	0c050663          	beqz	a0,80006328 <core_init_matrix+0x120>
80006260:	00812623          	sw	s0,12(sp)
80006264:	01312023          	sw	s3,0(sp)
80006268:	00010eb7          	lui	t4,0x10
8000626c:	00150313          	add	t1,a0,1
80006270:	00151413          	sll	s0,a0,0x1
80006274:	00038f13          	mv	t5,t2
80006278:	00000f93          	li	t6,0
8000627c:	00100713          	li	a4,1
80006280:	407e0e33          	sub	t3,t3,t2
80006284:	fffe8e93          	add	t4,t4,-1 # ffff <__stack_size+0xbfff>
80006288:	00070993          	mv	s3,a4
8000628c:	000f0813          	mv	a6,t5
80006290:	02e60633          	mul	a2,a2,a4
80006294:	01071793          	sll	a5,a4,0x10
80006298:	0107d793          	srl	a5,a5,0x10
8000629c:	010e08b3          	add	a7,t3,a6
800062a0:	00280813          	add	a6,a6,2
800062a4:	00170713          	add	a4,a4,1
800062a8:	41f65593          	sra	a1,a2,0x1f
800062ac:	0105d593          	srl	a1,a1,0x10
800062b0:	00b60633          	add	a2,a2,a1
800062b4:	01d67633          	and	a2,a2,t4
800062b8:	40b60633          	sub	a2,a2,a1
800062bc:	00c785b3          	add	a1,a5,a2
800062c0:	01059593          	sll	a1,a1,0x10
800062c4:	0105d593          	srl	a1,a1,0x10
800062c8:	00f587b3          	add	a5,a1,a5
800062cc:	feb81f23          	sh	a1,-2(a6)
800062d0:	0ff7f793          	zext.b	a5,a5
800062d4:	00f89023          	sh	a5,0(a7)
800062d8:	fa671ce3          	bne	a4,t1,80006290 <core_init_matrix+0x88>
800062dc:	001f8f93          	add	t6,t6,1
800062e0:	01350733          	add	a4,a0,s3
800062e4:	00a30333          	add	t1,t1,a0
800062e8:	008f0f33          	add	t5,t5,s0
800062ec:	f9f51ee3          	bne	a0,t6,80006288 <core_init_matrix+0x80>
800062f0:	00c12403          	lw	s0,12(sp)
800062f4:	00012983          	lw	s3,0(sp)
800062f8:	005387b3          	add	a5,t2,t0
800062fc:	fff78793          	add	a5,a5,-1
80006300:	ffc7f793          	and	a5,a5,-4
80006304:	00478793          	add	a5,a5,4
80006308:	0096a223          	sw	s1,4(a3)
8000630c:	0126a023          	sw	s2,0(a3)
80006310:	0076a423          	sw	t2,8(a3)
80006314:	00f6a623          	sw	a5,12(a3)
80006318:	00812483          	lw	s1,8(sp)
8000631c:	00412903          	lw	s2,4(sp)
80006320:	01010113          	add	sp,sp,16
80006324:	00008067          	ret
80006328:	00000293          	li	t0,0
8000632c:	fcdff06f          	j	800062f8 <core_init_matrix+0xf0>
80006330:	fff58593          	add	a1,a1,-1
80006334:	ffc5f393          	and	t2,a1,-4
80006338:	00438e13          	add	t3,t2,4 # ffff8004 <__stack_base+0x3fff8004>
8000633c:	00812623          	sw	s0,12(sp)
80006340:	01312023          	sw	s3,0(sp)
80006344:	000e0493          	mv	s1,t3
80006348:	00638393          	add	t2,t2,6
8000634c:	fff00913          	li	s2,-1
80006350:	00200293          	li	t0,2
80006354:	fff00513          	li	a0,-1
80006358:	f11ff06f          	j	80006268 <core_init_matrix+0x60>

8000635c <matrix_mul_vect>:
8000635c:	04050a63          	beqz	a0,800063b0 <matrix_mul_vect+0x54>
80006360:	00251f13          	sll	t5,a0,0x2
80006364:	00151e13          	sll	t3,a0,0x1
80006368:	01e58f33          	add	t5,a1,t5
8000636c:	01c68e33          	add	t3,a3,t3
80006370:	00000e93          	li	t4,0
80006374:	001e9813          	sll	a6,t4,0x1
80006378:	01060833          	add	a6,a2,a6
8000637c:	00068793          	mv	a5,a3
80006380:	00000893          	li	a7,0
80006384:	00081703          	lh	a4,0(a6)
80006388:	00079303          	lh	t1,0(a5)
8000638c:	00278793          	add	a5,a5,2
80006390:	00280813          	add	a6,a6,2
80006394:	02670733          	mul	a4,a4,t1
80006398:	00e888b3          	add	a7,a7,a4
8000639c:	fefe14e3          	bne	t3,a5,80006384 <matrix_mul_vect+0x28>
800063a0:	0115a023          	sw	a7,0(a1)
800063a4:	00458593          	add	a1,a1,4
800063a8:	00ae8eb3          	add	t4,t4,a0
800063ac:	fcbf14e3          	bne	t5,a1,80006374 <matrix_mul_vect+0x18>
800063b0:	00008067          	ret

800063b4 <matrix_mul_matrix>:
800063b4:	0a050463          	beqz	a0,8000645c <matrix_mul_matrix+0xa8>
800063b8:	ff010113          	add	sp,sp,-16
800063bc:	00050f13          	mv	t5,a0
800063c0:	00151513          	sll	a0,a0,0x1
800063c4:	00812623          	sw	s0,12(sp)
800063c8:	00058393          	mv	t2,a1
800063cc:	00068413          	mv	s0,a3
800063d0:	00060e93          	mv	t4,a2
800063d4:	00a60833          	add	a6,a2,a0
800063d8:	00000f93          	li	t6,0
800063dc:	00000293          	li	t0,0
800063e0:	002f9893          	sll	a7,t6,0x2
800063e4:	011388b3          	add	a7,t2,a7
800063e8:	00040313          	mv	t1,s0
800063ec:	00000e13          	li	t3,0
800063f0:	00030693          	mv	a3,t1
800063f4:	000e8793          	mv	a5,t4
800063f8:	00000613          	li	a2,0
800063fc:	00079703          	lh	a4,0(a5)
80006400:	00069583          	lh	a1,0(a3)
80006404:	00278793          	add	a5,a5,2
80006408:	00a686b3          	add	a3,a3,a0
8000640c:	02b70733          	mul	a4,a4,a1
80006410:	00e60633          	add	a2,a2,a4
80006414:	fef814e3          	bne	a6,a5,800063fc <matrix_mul_matrix+0x48>
80006418:	00c8a023          	sw	a2,0(a7)
8000641c:	001e0793          	add	a5,t3,1
80006420:	00488893          	add	a7,a7,4
80006424:	00230313          	add	t1,t1,2
80006428:	00ff0663          	beq	t5,a5,80006434 <matrix_mul_matrix+0x80>
8000642c:	00078e13          	mv	t3,a5
80006430:	fc1ff06f          	j	800063f0 <matrix_mul_matrix+0x3c>
80006434:	00128793          	add	a5,t0,1
80006438:	00ae8eb3          	add	t4,t4,a0
8000643c:	01ef8fb3          	add	t6,t6,t5
80006440:	00a80833          	add	a6,a6,a0
80006444:	01c28663          	beq	t0,t3,80006450 <matrix_mul_matrix+0x9c>
80006448:	00078293          	mv	t0,a5
8000644c:	f95ff06f          	j	800063e0 <matrix_mul_matrix+0x2c>
80006450:	00c12403          	lw	s0,12(sp)
80006454:	01010113          	add	sp,sp,16
80006458:	00008067          	ret
8000645c:	00008067          	ret

80006460 <matrix_mul_matrix_bitextract>:
80006460:	0a050e63          	beqz	a0,8000651c <matrix_mul_matrix_bitextract+0xbc>
80006464:	ff010113          	add	sp,sp,-16
80006468:	00050f13          	mv	t5,a0
8000646c:	00151513          	sll	a0,a0,0x1
80006470:	00812623          	sw	s0,12(sp)
80006474:	00058393          	mv	t2,a1
80006478:	00068413          	mv	s0,a3
8000647c:	00060e93          	mv	t4,a2
80006480:	00a60833          	add	a6,a2,a0
80006484:	00000f93          	li	t6,0
80006488:	00000293          	li	t0,0
8000648c:	002f9893          	sll	a7,t6,0x2
80006490:	011388b3          	add	a7,t2,a7
80006494:	00040313          	mv	t1,s0
80006498:	00000e13          	li	t3,0
8000649c:	00030613          	mv	a2,t1
800064a0:	000e8693          	mv	a3,t4
800064a4:	00000593          	li	a1,0
800064a8:	00061703          	lh	a4,0(a2)
800064ac:	00069783          	lh	a5,0(a3)
800064b0:	00268693          	add	a3,a3,2
800064b4:	00a60633          	add	a2,a2,a0
800064b8:	02e787b3          	mul	a5,a5,a4
800064bc:	4027d713          	sra	a4,a5,0x2
800064c0:	4057d793          	sra	a5,a5,0x5
800064c4:	00f77713          	and	a4,a4,15
800064c8:	07f7f793          	and	a5,a5,127
800064cc:	02f707b3          	mul	a5,a4,a5
800064d0:	00f585b3          	add	a1,a1,a5
800064d4:	fcd81ae3          	bne	a6,a3,800064a8 <matrix_mul_matrix_bitextract+0x48>
800064d8:	00b8a023          	sw	a1,0(a7)
800064dc:	001e0793          	add	a5,t3,1
800064e0:	00488893          	add	a7,a7,4
800064e4:	00230313          	add	t1,t1,2
800064e8:	00ff0663          	beq	t5,a5,800064f4 <matrix_mul_matrix_bitextract+0x94>
800064ec:	00078e13          	mv	t3,a5
800064f0:	fadff06f          	j	8000649c <matrix_mul_matrix_bitextract+0x3c>
800064f4:	00128793          	add	a5,t0,1
800064f8:	00ae8eb3          	add	t4,t4,a0
800064fc:	01ef8fb3          	add	t6,t6,t5
80006500:	00a80833          	add	a6,a6,a0
80006504:	01c28663          	beq	t0,t3,80006510 <matrix_mul_matrix_bitextract+0xb0>
80006508:	00078293          	mv	t0,a5
8000650c:	f81ff06f          	j	8000648c <matrix_mul_matrix_bitextract+0x2c>
80006510:	00c12403          	lw	s0,12(sp)
80006514:	01010113          	add	sp,sp,16
80006518:	00008067          	ret
8000651c:	00008067          	ret

80006520 <matrix_test>:
80006520:	fc010113          	add	sp,sp,-64
80006524:	02812c23          	sw	s0,56(sp)
80006528:	02912a23          	sw	s1,52(sp)
8000652c:	03612023          	sw	s6,32(sp)
80006530:	02112e23          	sw	ra,60(sp)
80006534:	03212823          	sw	s2,48(sp)
80006538:	00058b13          	mv	s6,a1
8000653c:	00060413          	mv	s0,a2
80006540:	00068493          	mv	s1,a3
80006544:	3a050c63          	beqz	a0,800068fc <matrix_test+0x3dc>
80006548:	00151f13          	sll	t5,a0,0x1
8000654c:	03312623          	sw	s3,44(sp)
80006550:	01912a23          	sw	s9,20(sp)
80006554:	01e605b3          	add	a1,a2,t5
80006558:	40a00cb3          	neg	s9,a0
8000655c:	01071993          	sll	s3,a4,0x10
80006560:	01b12623          	sw	s11,12(sp)
80006564:	03412423          	sw	s4,40(sp)
80006568:	03512223          	sw	s5,36(sp)
8000656c:	01712e23          	sw	s7,28(sp)
80006570:	01812c23          	sw	s8,24(sp)
80006574:	01a12823          	sw	s10,16(sp)
80006578:	00050d93          	mv	s11,a0
8000657c:	0109d993          	srl	s3,s3,0x10
80006580:	00058613          	mv	a2,a1
80006584:	00000813          	li	a6,0
80006588:	002c9893          	sll	a7,s9,0x2
8000658c:	41e60333          	sub	t1,a2,t5
80006590:	00030793          	mv	a5,t1
80006594:	0007d683          	lhu	a3,0(a5)
80006598:	00278793          	add	a5,a5,2
8000659c:	00d986b3          	add	a3,s3,a3
800065a0:	fed79f23          	sh	a3,-2(a5)
800065a4:	fec798e3          	bne	a5,a2,80006594 <matrix_test+0x74>
800065a8:	00180513          	add	a0,a6,1
800065ac:	41130633          	sub	a2,t1,a7
800065b0:	00ad8663          	beq	s11,a0,800065bc <matrix_test+0x9c>
800065b4:	00050813          	mv	a6,a0
800065b8:	fd5ff06f          	j	8000658c <matrix_test+0x6c>
800065bc:	00000e13          	li	t3,0
800065c0:	00000e93          	li	t4,0
800065c4:	41e58333          	sub	t1,a1,t5
800065c8:	002e1613          	sll	a2,t3,0x2
800065cc:	01660633          	add	a2,a2,s6
800065d0:	00030793          	mv	a5,t1
800065d4:	00079683          	lh	a3,0(a5)
800065d8:	00460613          	add	a2,a2,4
800065dc:	00278793          	add	a5,a5,2
800065e0:	02e686b3          	mul	a3,a3,a4
800065e4:	fed62e23          	sw	a3,-4(a2)
800065e8:	feb796e3          	bne	a5,a1,800065d4 <matrix_test+0xb4>
800065ec:	001e8793          	add	a5,t4,1
800065f0:	00ae0e33          	add	t3,t3,a0
800065f4:	411305b3          	sub	a1,t1,a7
800065f8:	010e8663          	beq	t4,a6,80006604 <matrix_test+0xe4>
800065fc:	00078e93          	mv	t4,a5
80006600:	fc5ff06f          	j	800065c4 <matrix_test+0xa4>
80006604:	40a00e33          	neg	t3,a0
80006608:	fffff7b7          	lui	a5,0xfffff
8000660c:	00f76933          	or	s2,a4,a5
80006610:	411b0333          	sub	t1,s6,a7
80006614:	00000513          	li	a0,0
80006618:	00000713          	li	a4,0
8000661c:	00000613          	li	a2,0
80006620:	00000f13          	li	t5,0
80006624:	003e1e13          	sll	t3,t3,0x3
80006628:	01130eb3          	add	t4,t1,a7
8000662c:	000e8793          	mv	a5,t4
80006630:	0140006f          	j	80006644 <matrix_test+0x124>
80006634:	01051513          	sll	a0,a0,0x10
80006638:	00478793          	add	a5,a5,4 # fffff004 <__stack_base+0x3ffff004>
8000663c:	41055513          	sra	a0,a0,0x10
80006640:	02678e63          	beq	a5,t1,8000667c <matrix_test+0x15c>
80006644:	00070693          	mv	a3,a4
80006648:	0007a703          	lw	a4,0(a5)
8000664c:	01051513          	sll	a0,a0,0x10
80006650:	01055513          	srl	a0,a0,0x10
80006654:	00e6a6b3          	slt	a3,a3,a4
80006658:	00e60633          	add	a2,a2,a4
8000665c:	00a50593          	add	a1,a0,10
80006660:	00d50533          	add	a0,a0,a3
80006664:	fcc958e3          	bge	s2,a2,80006634 <matrix_test+0x114>
80006668:	01059513          	sll	a0,a1,0x10
8000666c:	00478793          	add	a5,a5,4
80006670:	41055513          	sra	a0,a0,0x10
80006674:	00000613          	li	a2,0
80006678:	fc6796e3          	bne	a5,t1,80006644 <matrix_test+0x124>
8000667c:	001f0793          	add	a5,t5,1
80006680:	41ce8333          	sub	t1,t4,t3
80006684:	01e80663          	beq	a6,t5,80006690 <matrix_test+0x170>
80006688:	00078f13          	mv	t5,a5
8000668c:	f9dff06f          	j	80006628 <matrix_test+0x108>
80006690:	00000593          	li	a1,0
80006694:	365000ef          	jal	800071f8 <crc16>
80006698:	00040613          	mv	a2,s0
8000669c:	00050b93          	mv	s7,a0
800066a0:	00048693          	mv	a3,s1
800066a4:	000d8513          	mv	a0,s11
800066a8:	000b0593          	mv	a1,s6
800066ac:	002d9a13          	sll	s4,s11,0x2
800066b0:	cadff0ef          	jal	8000635c <matrix_mul_vect>
800066b4:	014b0a33          	add	s4,s6,s4
800066b8:	002c9c13          	sll	s8,s9,0x2
800066bc:	000a0813          	mv	a6,s4
800066c0:	00000513          	li	a0,0
800066c4:	00000713          	li	a4,0
800066c8:	00000613          	li	a2,0
800066cc:	00000a93          	li	s5,0
800066d0:	003c9c93          	sll	s9,s9,0x3
800066d4:	010c08b3          	add	a7,s8,a6
800066d8:	00088793          	mv	a5,a7
800066dc:	0140006f          	j	800066f0 <matrix_test+0x1d0>
800066e0:	01051513          	sll	a0,a0,0x10
800066e4:	00478793          	add	a5,a5,4
800066e8:	41055513          	sra	a0,a0,0x10
800066ec:	03078e63          	beq	a5,a6,80006728 <matrix_test+0x208>
800066f0:	00070693          	mv	a3,a4
800066f4:	0007a703          	lw	a4,0(a5)
800066f8:	01051513          	sll	a0,a0,0x10
800066fc:	01055513          	srl	a0,a0,0x10
80006700:	00e6a6b3          	slt	a3,a3,a4
80006704:	00e60633          	add	a2,a2,a4
80006708:	00a50593          	add	a1,a0,10
8000670c:	00d50533          	add	a0,a0,a3
80006710:	fcc958e3          	bge	s2,a2,800066e0 <matrix_test+0x1c0>
80006714:	01059513          	sll	a0,a1,0x10
80006718:	00478793          	add	a5,a5,4
8000671c:	41055513          	sra	a0,a0,0x10
80006720:	00000613          	li	a2,0
80006724:	fd0796e3          	bne	a5,a6,800066f0 <matrix_test+0x1d0>
80006728:	001a8d13          	add	s10,s5,1
8000672c:	41988833          	sub	a6,a7,s9
80006730:	01ad8663          	beq	s11,s10,8000673c <matrix_test+0x21c>
80006734:	000d0a93          	mv	s5,s10
80006738:	f9dff06f          	j	800066d4 <matrix_test+0x1b4>
8000673c:	000b8593          	mv	a1,s7
80006740:	2b9000ef          	jal	800071f8 <crc16>
80006744:	00040613          	mv	a2,s0
80006748:	00050b93          	mv	s7,a0
8000674c:	00048693          	mv	a3,s1
80006750:	000d0513          	mv	a0,s10
80006754:	000b0593          	mv	a1,s6
80006758:	c5dff0ef          	jal	800063b4 <matrix_mul_matrix>
8000675c:	000a0813          	mv	a6,s4
80006760:	00000513          	li	a0,0
80006764:	00000713          	li	a4,0
80006768:	00000613          	li	a2,0
8000676c:	00000313          	li	t1,0
80006770:	018808b3          	add	a7,a6,s8
80006774:	00088793          	mv	a5,a7
80006778:	0140006f          	j	8000678c <matrix_test+0x26c>
8000677c:	01051513          	sll	a0,a0,0x10
80006780:	00478793          	add	a5,a5,4
80006784:	41055513          	sra	a0,a0,0x10
80006788:	02f80e63          	beq	a6,a5,800067c4 <matrix_test+0x2a4>
8000678c:	00070693          	mv	a3,a4
80006790:	0007a703          	lw	a4,0(a5)
80006794:	01051513          	sll	a0,a0,0x10
80006798:	01055513          	srl	a0,a0,0x10
8000679c:	00e6a6b3          	slt	a3,a3,a4
800067a0:	00e60633          	add	a2,a2,a4
800067a4:	00a50593          	add	a1,a0,10
800067a8:	00d50533          	add	a0,a0,a3
800067ac:	fcc958e3          	bge	s2,a2,8000677c <matrix_test+0x25c>
800067b0:	01059513          	sll	a0,a1,0x10
800067b4:	00478793          	add	a5,a5,4
800067b8:	41055513          	sra	a0,a0,0x10
800067bc:	00000613          	li	a2,0
800067c0:	fcf816e3          	bne	a6,a5,8000678c <matrix_test+0x26c>
800067c4:	00130793          	add	a5,t1,1
800067c8:	41988833          	sub	a6,a7,s9
800067cc:	01530663          	beq	t1,s5,800067d8 <matrix_test+0x2b8>
800067d0:	00078313          	mv	t1,a5
800067d4:	f9dff06f          	j	80006770 <matrix_test+0x250>
800067d8:	000b8593          	mv	a1,s7
800067dc:	21d000ef          	jal	800071f8 <crc16>
800067e0:	00050793          	mv	a5,a0
800067e4:	00048693          	mv	a3,s1
800067e8:	00040613          	mv	a2,s0
800067ec:	000d0513          	mv	a0,s10
800067f0:	000b0593          	mv	a1,s6
800067f4:	00078493          	mv	s1,a5
800067f8:	c69ff0ef          	jal	80006460 <matrix_mul_matrix_bitextract>
800067fc:	00000513          	li	a0,0
80006800:	00000713          	li	a4,0
80006804:	00000613          	li	a2,0
80006808:	00000893          	li	a7,0
8000680c:	014c0833          	add	a6,s8,s4
80006810:	00080793          	mv	a5,a6
80006814:	0140006f          	j	80006828 <matrix_test+0x308>
80006818:	01051513          	sll	a0,a0,0x10
8000681c:	00478793          	add	a5,a5,4
80006820:	41055513          	sra	a0,a0,0x10
80006824:	02fa0e63          	beq	s4,a5,80006860 <matrix_test+0x340>
80006828:	00070693          	mv	a3,a4
8000682c:	0007a703          	lw	a4,0(a5)
80006830:	01051513          	sll	a0,a0,0x10
80006834:	01055513          	srl	a0,a0,0x10
80006838:	00e6a6b3          	slt	a3,a3,a4
8000683c:	00e60633          	add	a2,a2,a4
80006840:	00a50593          	add	a1,a0,10
80006844:	00d50533          	add	a0,a0,a3
80006848:	fcc958e3          	bge	s2,a2,80006818 <matrix_test+0x2f8>
8000684c:	01059513          	sll	a0,a1,0x10
80006850:	00478793          	add	a5,a5,4
80006854:	41055513          	sra	a0,a0,0x10
80006858:	00000613          	li	a2,0
8000685c:	fcfa16e3          	bne	s4,a5,80006828 <matrix_test+0x308>
80006860:	00188793          	add	a5,a7,1
80006864:	41980a33          	sub	s4,a6,s9
80006868:	01588663          	beq	a7,s5,80006874 <matrix_test+0x354>
8000686c:	00078893          	mv	a7,a5
80006870:	f9dff06f          	j	8000680c <matrix_test+0x2ec>
80006874:	00048593          	mv	a1,s1
80006878:	181000ef          	jal	800071f8 <crc16>
8000687c:	001d1d13          	sll	s10,s10,0x1
80006880:	01a40433          	add	s0,s0,s10
80006884:	00000613          	li	a2,0
80006888:	41a406b3          	sub	a3,s0,s10
8000688c:	00068793          	mv	a5,a3
80006890:	0007d703          	lhu	a4,0(a5)
80006894:	00278793          	add	a5,a5,2
80006898:	41370733          	sub	a4,a4,s3
8000689c:	fee79f23          	sh	a4,-2(a5)
800068a0:	fe8798e3          	bne	a5,s0,80006890 <matrix_test+0x370>
800068a4:	00160793          	add	a5,a2,1
800068a8:	41868433          	sub	s0,a3,s8
800068ac:	01560663          	beq	a2,s5,800068b8 <matrix_test+0x398>
800068b0:	00078613          	mv	a2,a5
800068b4:	fd5ff06f          	j	80006888 <matrix_test+0x368>
800068b8:	02c12983          	lw	s3,44(sp)
800068bc:	02812a03          	lw	s4,40(sp)
800068c0:	02412a83          	lw	s5,36(sp)
800068c4:	01c12b83          	lw	s7,28(sp)
800068c8:	01812c03          	lw	s8,24(sp)
800068cc:	01412c83          	lw	s9,20(sp)
800068d0:	01012d03          	lw	s10,16(sp)
800068d4:	00c12d83          	lw	s11,12(sp)
800068d8:	03c12083          	lw	ra,60(sp)
800068dc:	03812403          	lw	s0,56(sp)
800068e0:	01051513          	sll	a0,a0,0x10
800068e4:	03412483          	lw	s1,52(sp)
800068e8:	03012903          	lw	s2,48(sp)
800068ec:	02012b03          	lw	s6,32(sp)
800068f0:	41055513          	sra	a0,a0,0x10
800068f4:	04010113          	add	sp,sp,64
800068f8:	00008067          	ret
800068fc:	00000593          	li	a1,0
80006900:	0f9000ef          	jal	800071f8 <crc16>
80006904:	00048693          	mv	a3,s1
80006908:	00040613          	mv	a2,s0
8000690c:	00050913          	mv	s2,a0
80006910:	000b0593          	mv	a1,s6
80006914:	00000513          	li	a0,0
80006918:	a45ff0ef          	jal	8000635c <matrix_mul_vect>
8000691c:	00090593          	mv	a1,s2
80006920:	00000513          	li	a0,0
80006924:	0d5000ef          	jal	800071f8 <crc16>
80006928:	00048693          	mv	a3,s1
8000692c:	00040613          	mv	a2,s0
80006930:	00050913          	mv	s2,a0
80006934:	000b0593          	mv	a1,s6
80006938:	00000513          	li	a0,0
8000693c:	a79ff0ef          	jal	800063b4 <matrix_mul_matrix>
80006940:	00090593          	mv	a1,s2
80006944:	00000513          	li	a0,0
80006948:	0b1000ef          	jal	800071f8 <crc16>
8000694c:	00050793          	mv	a5,a0
80006950:	00040613          	mv	a2,s0
80006954:	000b0593          	mv	a1,s6
80006958:	00048693          	mv	a3,s1
8000695c:	00000513          	li	a0,0
80006960:	00078413          	mv	s0,a5
80006964:	afdff0ef          	jal	80006460 <matrix_mul_matrix_bitextract>
80006968:	00040593          	mv	a1,s0
8000696c:	00000513          	li	a0,0
80006970:	089000ef          	jal	800071f8 <crc16>
80006974:	f65ff06f          	j	800068d8 <matrix_test+0x3b8>

80006978 <core_bench_matrix>:
80006978:	ff010113          	add	sp,sp,-16
8000697c:	00812423          	sw	s0,8(sp)
80006980:	00852683          	lw	a3,8(a0)
80006984:	00060413          	mv	s0,a2
80006988:	00058713          	mv	a4,a1
8000698c:	00452603          	lw	a2,4(a0)
80006990:	00c52583          	lw	a1,12(a0)
80006994:	00052503          	lw	a0,0(a0)
80006998:	00112623          	sw	ra,12(sp)
8000699c:	b85ff0ef          	jal	80006520 <matrix_test>
800069a0:	00040593          	mv	a1,s0
800069a4:	00812403          	lw	s0,8(sp)
800069a8:	00c12083          	lw	ra,12(sp)
800069ac:	01010113          	add	sp,sp,16
800069b0:	0490006f          	j	800071f8 <crc16>

800069b4 <core_init_state>:
800069b4:	ff010113          	add	sp,sp,-16
800069b8:	01212223          	sw	s2,4(sp)
800069bc:	fff50893          	add	a7,a0,-1
800069c0:	00100793          	li	a5,1
800069c4:	00060813          	mv	a6,a2
800069c8:	1717fa63          	bgeu	a5,a7,80006b3c <core_init_state+0x188>
800069cc:	00158593          	add	a1,a1,1
800069d0:	01059693          	sll	a3,a1,0x10
800069d4:	0106d693          	srl	a3,a3,0x10
800069d8:	a0001f37          	lui	t5,0xa0001
800069dc:	a0001eb7          	lui	t4,0xa0001
800069e0:	a0001e37          	lui	t3,0xa0001
800069e4:	a0001337          	lui	t1,0xa0001
800069e8:	0036d793          	srl	a5,a3,0x3
800069ec:	00812623          	sw	s0,12(sp)
800069f0:	00912423          	sw	s1,8(sp)
800069f4:	01312023          	sw	s3,0(sp)
800069f8:	00700613          	li	a2,7
800069fc:	0076f393          	and	t2,a3,7
80006a00:	00000913          	li	s2,0
80006a04:	85cf0f13          	add	t5,t5,-1956 # a000085c <errpat>
80006a08:	00400593          	li	a1,4
80006a0c:	86ce8e93          	add	t4,t4,-1940 # a000086c <scipat>
80006a10:	00100f93          	li	t6,1
80006a14:	87ce0e13          	add	t3,t3,-1924 # a000087c <floatpat>
80006a18:	88c30313          	add	t1,t1,-1908 # a000088c <intpat>
80006a1c:	02c00293          	li	t0,44
80006a20:	0037f793          	and	a5,a5,3
80006a24:	06c38e63          	beq	t2,a2,80006aa0 <core_init_state+0xec>
80006a28:	0c75e863          	bltu	a1,t2,80006af8 <core_init_state+0x144>
80006a2c:	ffd38393          	add	t2,t2,-3
80006a30:	01039393          	sll	t2,t2,0x10
80006a34:	0103d393          	srl	t2,t2,0x10
80006a38:	00279793          	sll	a5,a5,0x2
80006a3c:	0a7fe663          	bltu	t6,t2,80006ae8 <core_init_state+0x134>
80006a40:	00fe07b3          	add	a5,t3,a5
80006a44:	0007a783          	lw	a5,0(a5)
80006a48:	00800413          	li	s0,8
80006a4c:	00190393          	add	t2,s2,1
80006a50:	008389b3          	add	s3,t2,s0
80006a54:	0719f463          	bgeu	s3,a7,80006abc <core_init_state+0x108>
80006a58:	01280933          	add	s2,a6,s2
80006a5c:	00090713          	mv	a4,s2
80006a60:	008784b3          	add	s1,a5,s0
80006a64:	0007c383          	lbu	t2,0(a5)
80006a68:	00178793          	add	a5,a5,1
80006a6c:	00170713          	add	a4,a4,1
80006a70:	fe770fa3          	sb	t2,-1(a4)
80006a74:	fef498e3          	bne	s1,a5,80006a64 <core_init_state+0xb0>
80006a78:	00168693          	add	a3,a3,1
80006a7c:	01069693          	sll	a3,a3,0x10
80006a80:	00890733          	add	a4,s2,s0
80006a84:	0106d693          	srl	a3,a3,0x10
80006a88:	0036d793          	srl	a5,a3,0x3
80006a8c:	00570023          	sb	t0,0(a4)
80006a90:	0076f393          	and	t2,a3,7
80006a94:	00098913          	mv	s2,s3
80006a98:	0037f793          	and	a5,a5,3
80006a9c:	f8c396e3          	bne	t2,a2,80006a28 <core_init_state+0x74>
80006aa0:	00279793          	sll	a5,a5,0x2
80006aa4:	00800413          	li	s0,8
80006aa8:	00190393          	add	t2,s2,1
80006aac:	00ff07b3          	add	a5,t5,a5
80006ab0:	008389b3          	add	s3,t2,s0
80006ab4:	0007a783          	lw	a5,0(a5)
80006ab8:	fb19e0e3          	bltu	s3,a7,80006a58 <core_init_state+0xa4>
80006abc:	06a97463          	bgeu	s2,a0,80006b24 <core_init_state+0x170>
80006ac0:	00c12403          	lw	s0,12(sp)
80006ac4:	00812483          	lw	s1,8(sp)
80006ac8:	00012983          	lw	s3,0(sp)
80006acc:	00100613          	li	a2,1
80006ad0:	02757e63          	bgeu	a0,t2,80006b0c <core_init_state+0x158>
80006ad4:	01280533          	add	a0,a6,s2
80006ad8:	00412903          	lw	s2,4(sp)
80006adc:	00000593          	li	a1,0
80006ae0:	01010113          	add	sp,sp,16
80006ae4:	ef0fc06f          	j	800031d4 <memset>
80006ae8:	00f307b3          	add	a5,t1,a5
80006aec:	0007a783          	lw	a5,0(a5)
80006af0:	00400413          	li	s0,4
80006af4:	f59ff06f          	j	80006a4c <core_init_state+0x98>
80006af8:	00279793          	sll	a5,a5,0x2
80006afc:	00fe87b3          	add	a5,t4,a5
80006b00:	0007a783          	lw	a5,0(a5)
80006b04:	00800413          	li	s0,8
80006b08:	f45ff06f          	j	80006a4c <core_init_state+0x98>
80006b0c:	41250633          	sub	a2,a0,s2
80006b10:	01280533          	add	a0,a6,s2
80006b14:	00412903          	lw	s2,4(sp)
80006b18:	00000593          	li	a1,0
80006b1c:	01010113          	add	sp,sp,16
80006b20:	eb4fc06f          	j	800031d4 <memset>
80006b24:	00c12403          	lw	s0,12(sp)
80006b28:	00812483          	lw	s1,8(sp)
80006b2c:	00012983          	lw	s3,0(sp)
80006b30:	00412903          	lw	s2,4(sp)
80006b34:	01010113          	add	sp,sp,16
80006b38:	00008067          	ret
80006b3c:	00000913          	li	s2,0
80006b40:	00100393          	li	t2,1
80006b44:	f89ff06f          	j	80006acc <core_init_state+0x118>

80006b48 <core_state_transition>:
80006b48:	00052783          	lw	a5,0(a0)
80006b4c:	00050813          	mv	a6,a0
80006b50:	0007c703          	lbu	a4,0(a5)
80006b54:	28070263          	beqz	a4,80006dd8 <core_state_transition+0x290>
80006b58:	02c00693          	li	a3,44
80006b5c:	00000513          	li	a0,0
80006b60:	20d70a63          	beq	a4,a3,80006d74 <core_state_transition+0x22c>
80006b64:	02e00513          	li	a0,46
80006b68:	22a70663          	beq	a4,a0,80006d94 <core_state_transition+0x24c>
80006b6c:	1ce56a63          	bltu	a0,a4,80006d40 <core_state_transition+0x1f8>
80006b70:	fd570713          	add	a4,a4,-43
80006b74:	0fd77713          	and	a4,a4,253
80006b78:	02070663          	beqz	a4,80006ba4 <core_state_transition+0x5c>
80006b7c:	0045a683          	lw	a3,4(a1)
80006b80:	0005a703          	lw	a4,0(a1)
80006b84:	00178793          	add	a5,a5,1
80006b88:	00168693          	add	a3,a3,1
80006b8c:	00170713          	add	a4,a4,1
80006b90:	00d5a223          	sw	a3,4(a1)
80006b94:	00e5a023          	sw	a4,0(a1)
80006b98:	00100513          	li	a0,1
80006b9c:	00f82023          	sw	a5,0(a6)
80006ba0:	00008067          	ret
80006ba4:	0005a703          	lw	a4,0(a1)
80006ba8:	00178613          	add	a2,a5,1
80006bac:	00170713          	add	a4,a4,1
80006bb0:	00e5a023          	sw	a4,0(a1)
80006bb4:	0017c883          	lbu	a7,1(a5)
80006bb8:	26088663          	beqz	a7,80006e24 <core_state_transition+0x2dc>
80006bbc:	20d88663          	beq	a7,a3,80006dc8 <core_state_transition+0x280>
80006bc0:	0085a683          	lw	a3,8(a1)
80006bc4:	fd088713          	add	a4,a7,-48
80006bc8:	0ff77713          	zext.b	a4,a4
80006bcc:	00900313          	li	t1,9
80006bd0:	00168693          	add	a3,a3,1
80006bd4:	00e37e63          	bgeu	t1,a4,80006bf0 <core_state_transition+0xa8>
80006bd8:	1ea88463          	beq	a7,a0,80006dc0 <core_state_transition+0x278>
80006bdc:	00d5a423          	sw	a3,8(a1)
80006be0:	00278793          	add	a5,a5,2
80006be4:	00100513          	li	a0,1
80006be8:	00f82023          	sw	a5,0(a6)
80006bec:	00008067          	ret
80006bf0:	00d5a423          	sw	a3,8(a1)
80006bf4:	00164783          	lbu	a5,1(a2)
80006bf8:	00160613          	add	a2,a2,1
80006bfc:	1e078263          	beqz	a5,80006de0 <core_state_transition+0x298>
80006c00:	02c00713          	li	a4,44
80006c04:	16e78463          	beq	a5,a4,80006d6c <core_state_transition+0x224>
80006c08:	02e00713          	li	a4,46
80006c0c:	02e78863          	beq	a5,a4,80006c3c <core_state_transition+0xf4>
80006c10:	fd078793          	add	a5,a5,-48
80006c14:	0ff7f793          	zext.b	a5,a5
80006c18:	00900713          	li	a4,9
80006c1c:	fcf77ce3          	bgeu	a4,a5,80006bf4 <core_state_transition+0xac>
80006c20:	0105a703          	lw	a4,16(a1)
80006c24:	00160793          	add	a5,a2,1
80006c28:	00100513          	li	a0,1
80006c2c:	00170713          	add	a4,a4,1
80006c30:	00e5a823          	sw	a4,16(a1)
80006c34:	00f82023          	sw	a5,0(a6)
80006c38:	00008067          	ret
80006c3c:	0105a783          	lw	a5,16(a1)
80006c40:	00178793          	add	a5,a5,1
80006c44:	00f5a823          	sw	a5,16(a1)
80006c48:	0140006f          	j	80006c5c <core_state_transition+0x114>
80006c4c:	fd078793          	add	a5,a5,-48
80006c50:	0ff7f793          	zext.b	a5,a5
80006c54:	00900713          	li	a4,9
80006c58:	12f76263          	bltu	a4,a5,80006d7c <core_state_transition+0x234>
80006c5c:	00164783          	lbu	a5,1(a2)
80006c60:	00160613          	add	a2,a2,1
80006c64:	1a078a63          	beqz	a5,80006e18 <core_state_transition+0x2d0>
80006c68:	02c00713          	li	a4,44
80006c6c:	14e78263          	beq	a5,a4,80006db0 <core_state_transition+0x268>
80006c70:	0df7f713          	and	a4,a5,223
80006c74:	04500693          	li	a3,69
80006c78:	fcd71ae3          	bne	a4,a3,80006c4c <core_state_transition+0x104>
80006c7c:	0145a703          	lw	a4,20(a1)
80006c80:	00160793          	add	a5,a2,1
80006c84:	00300513          	li	a0,3
80006c88:	00170713          	add	a4,a4,1
80006c8c:	00e5aa23          	sw	a4,20(a1)
80006c90:	00164703          	lbu	a4,1(a2)
80006c94:	f00704e3          	beqz	a4,80006b9c <core_state_transition+0x54>
80006c98:	02c00693          	li	a3,44
80006c9c:	14d70863          	beq	a4,a3,80006dec <core_state_transition+0x2a4>
80006ca0:	00c5a783          	lw	a5,12(a1)
80006ca4:	fd570713          	add	a4,a4,-43
80006ca8:	0fd77713          	and	a4,a4,253
80006cac:	00178793          	add	a5,a5,1
80006cb0:	00f5a623          	sw	a5,12(a1)
80006cb4:	00100513          	li	a0,1
80006cb8:	00260793          	add	a5,a2,2
80006cbc:	ee0710e3          	bnez	a4,80006b9c <core_state_transition+0x54>
80006cc0:	00264703          	lbu	a4,2(a2)
80006cc4:	00260793          	add	a5,a2,2
80006cc8:	00600513          	li	a0,6
80006ccc:	ec0708e3          	beqz	a4,80006b9c <core_state_transition+0x54>
80006cd0:	12d70463          	beq	a4,a3,80006df8 <core_state_transition+0x2b0>
80006cd4:	0185a683          	lw	a3,24(a1)
80006cd8:	fd070713          	add	a4,a4,-48
80006cdc:	0ff77713          	zext.b	a4,a4
80006ce0:	00168693          	add	a3,a3,1
80006ce4:	00900513          	li	a0,9
80006ce8:	00d5ac23          	sw	a3,24(a1)
80006cec:	00e57a63          	bgeu	a0,a4,80006d00 <core_state_transition+0x1b8>
80006cf0:	00360793          	add	a5,a2,3
80006cf4:	00100513          	li	a0,1
80006cf8:	00f82023          	sw	a5,0(a6)
80006cfc:	00008067          	ret
80006d00:	00900613          	li	a2,9
80006d04:	0017c683          	lbu	a3,1(a5)
80006d08:	00078513          	mv	a0,a5
80006d0c:	02c00893          	li	a7,44
80006d10:	fd068713          	add	a4,a3,-48
80006d14:	00178793          	add	a5,a5,1
80006d18:	0ff77713          	zext.b	a4,a4
80006d1c:	0e068463          	beqz	a3,80006e04 <core_state_transition+0x2bc>
80006d20:	0f168663          	beq	a3,a7,80006e0c <core_state_transition+0x2c4>
80006d24:	fee670e3          	bgeu	a2,a4,80006d04 <core_state_transition+0x1bc>
80006d28:	0045a703          	lw	a4,4(a1)
80006d2c:	00250793          	add	a5,a0,2
80006d30:	00100513          	li	a0,1
80006d34:	00170713          	add	a4,a4,1
80006d38:	00e5a223          	sw	a4,4(a1)
80006d3c:	e61ff06f          	j	80006b9c <core_state_transition+0x54>
80006d40:	fd070713          	add	a4,a4,-48
80006d44:	0ff77713          	zext.b	a4,a4
80006d48:	00900613          	li	a2,9
80006d4c:	e2e668e3          	bltu	a2,a4,80006b7c <core_state_transition+0x34>
80006d50:	0005a703          	lw	a4,0(a1)
80006d54:	00178613          	add	a2,a5,1
80006d58:	00170713          	add	a4,a4,1
80006d5c:	00e5a023          	sw	a4,0(a1)
80006d60:	0017c783          	lbu	a5,1(a5)
80006d64:	06078e63          	beqz	a5,80006de0 <core_state_transition+0x298>
80006d68:	ead790e3          	bne	a5,a3,80006c08 <core_state_transition+0xc0>
80006d6c:	00060793          	mv	a5,a2
80006d70:	00400513          	li	a0,4
80006d74:	00178793          	add	a5,a5,1
80006d78:	e25ff06f          	j	80006b9c <core_state_transition+0x54>
80006d7c:	0145a703          	lw	a4,20(a1)
80006d80:	00160793          	add	a5,a2,1
80006d84:	00100513          	li	a0,1
80006d88:	00170713          	add	a4,a4,1
80006d8c:	00e5aa23          	sw	a4,20(a1)
80006d90:	e0dff06f          	j	80006b9c <core_state_transition+0x54>
80006d94:	0005a703          	lw	a4,0(a1)
80006d98:	00178613          	add	a2,a5,1
80006d9c:	00170713          	add	a4,a4,1
80006da0:	00e5a023          	sw	a4,0(a1)
80006da4:	0017c783          	lbu	a5,1(a5)
80006da8:	06078863          	beqz	a5,80006e18 <core_state_transition+0x2d0>
80006dac:	ecd792e3          	bne	a5,a3,80006c70 <core_state_transition+0x128>
80006db0:	00060793          	mv	a5,a2
80006db4:	00500513          	li	a0,5
80006db8:	00178793          	add	a5,a5,1
80006dbc:	de1ff06f          	j	80006b9c <core_state_transition+0x54>
80006dc0:	00d5a423          	sw	a3,8(a1)
80006dc4:	e99ff06f          	j	80006c5c <core_state_transition+0x114>
80006dc8:	00060793          	mv	a5,a2
80006dcc:	00200513          	li	a0,2
80006dd0:	00178793          	add	a5,a5,1
80006dd4:	dc9ff06f          	j	80006b9c <core_state_transition+0x54>
80006dd8:	00000513          	li	a0,0
80006ddc:	dc1ff06f          	j	80006b9c <core_state_transition+0x54>
80006de0:	00060793          	mv	a5,a2
80006de4:	00400513          	li	a0,4
80006de8:	db5ff06f          	j	80006b9c <core_state_transition+0x54>
80006dec:	00300513          	li	a0,3
80006df0:	00178793          	add	a5,a5,1
80006df4:	da9ff06f          	j	80006b9c <core_state_transition+0x54>
80006df8:	00600513          	li	a0,6
80006dfc:	00178793          	add	a5,a5,1
80006e00:	d9dff06f          	j	80006b9c <core_state_transition+0x54>
80006e04:	00700513          	li	a0,7
80006e08:	d95ff06f          	j	80006b9c <core_state_transition+0x54>
80006e0c:	00700513          	li	a0,7
80006e10:	00178793          	add	a5,a5,1
80006e14:	d89ff06f          	j	80006b9c <core_state_transition+0x54>
80006e18:	00060793          	mv	a5,a2
80006e1c:	00500513          	li	a0,5
80006e20:	d7dff06f          	j	80006b9c <core_state_transition+0x54>
80006e24:	00060793          	mv	a5,a2
80006e28:	00200513          	li	a0,2
80006e2c:	d71ff06f          	j	80006b9c <core_state_transition+0x54>

80006e30 <core_bench_state>:
80006e30:	f8010113          	add	sp,sp,-128
80006e34:	06812c23          	sw	s0,120(sp)
80006e38:	06912a23          	sw	s1,116(sp)
80006e3c:	07212823          	sw	s2,112(sp)
80006e40:	07312623          	sw	s3,108(sp)
80006e44:	07412423          	sw	s4,104(sp)
80006e48:	07512223          	sw	s5,100(sp)
80006e4c:	07612023          	sw	s6,96(sp)
80006e50:	05712e23          	sw	s7,92(sp)
80006e54:	06112e23          	sw	ra,124(sp)
80006e58:	00058413          	mv	s0,a1
80006e5c:	0005c583          	lbu	a1,0(a1)
80006e60:	00812623          	sw	s0,12(sp)
80006e64:	02012823          	sw	zero,48(sp)
80006e68:	00012823          	sw	zero,16(sp)
80006e6c:	02012a23          	sw	zero,52(sp)
80006e70:	02012c23          	sw	zero,56(sp)
80006e74:	02012e23          	sw	zero,60(sp)
80006e78:	04012023          	sw	zero,64(sp)
80006e7c:	04012223          	sw	zero,68(sp)
80006e80:	04012423          	sw	zero,72(sp)
80006e84:	04012623          	sw	zero,76(sp)
80006e88:	00012a23          	sw	zero,20(sp)
80006e8c:	00012c23          	sw	zero,24(sp)
80006e90:	00012e23          	sw	zero,28(sp)
80006e94:	02012023          	sw	zero,32(sp)
80006e98:	02012223          	sw	zero,36(sp)
80006e9c:	02012423          	sw	zero,40(sp)
80006ea0:	02012623          	sw	zero,44(sp)
80006ea4:	03010913          	add	s2,sp,48
80006ea8:	00050b93          	mv	s7,a0
80006eac:	00060b13          	mv	s6,a2
80006eb0:	00068a13          	mv	s4,a3
80006eb4:	00070993          	mv	s3,a4
80006eb8:	00078493          	mv	s1,a5
80006ebc:	00c10a93          	add	s5,sp,12
80006ec0:	12058063          	beqz	a1,80006fe0 <core_bench_state+0x1b0>
80006ec4:	00090593          	mv	a1,s2
80006ec8:	000a8513          	mv	a0,s5
80006ecc:	c7dff0ef          	jal	80006b48 <core_state_transition>
80006ed0:	00251813          	sll	a6,a0,0x2
80006ed4:	05080793          	add	a5,a6,80
80006ed8:	00278833          	add	a6,a5,sp
80006edc:	00c12703          	lw	a4,12(sp)
80006ee0:	fc082783          	lw	a5,-64(a6)
80006ee4:	00074703          	lbu	a4,0(a4)
80006ee8:	00178793          	add	a5,a5,1
80006eec:	fcf82023          	sw	a5,-64(a6)
80006ef0:	fc071ae3          	bnez	a4,80006ec4 <core_bench_state+0x94>
80006ef4:	00812623          	sw	s0,12(sp)
80006ef8:	01740bb3          	add	s7,s0,s7
80006efc:	03747863          	bgeu	s0,s7,80006f2c <core_bench_state+0xfc>
80006f00:	00040793          	mv	a5,s0
80006f04:	02c00613          	li	a2,44
80006f08:	0007c703          	lbu	a4,0(a5)
80006f0c:	016746b3          	xor	a3,a4,s6
80006f10:	00c70463          	beq	a4,a2,80006f18 <core_bench_state+0xe8>
80006f14:	00d78023          	sb	a3,0(a5)
80006f18:	013787b3          	add	a5,a5,s3
80006f1c:	ff77e6e3          	bltu	a5,s7,80006f08 <core_bench_state+0xd8>
80006f20:	00044783          	lbu	a5,0(s0)
80006f24:	00c10a93          	add	s5,sp,12
80006f28:	02078a63          	beqz	a5,80006f5c <core_bench_state+0x12c>
80006f2c:	00090593          	mv	a1,s2
80006f30:	000a8513          	mv	a0,s5
80006f34:	c15ff0ef          	jal	80006b48 <core_state_transition>
80006f38:	00251613          	sll	a2,a0,0x2
80006f3c:	05060793          	add	a5,a2,80
80006f40:	00278633          	add	a2,a5,sp
80006f44:	00c12703          	lw	a4,12(sp)
80006f48:	fc062783          	lw	a5,-64(a2)
80006f4c:	00074703          	lbu	a4,0(a4)
80006f50:	00178793          	add	a5,a5,1
80006f54:	fcf62023          	sw	a5,-64(a2)
80006f58:	fc071ae3          	bnez	a4,80006f2c <core_bench_state+0xfc>
80006f5c:	00812623          	sw	s0,12(sp)
80006f60:	00040613          	mv	a2,s0
80006f64:	02c00693          	li	a3,44
80006f68:	01747e63          	bgeu	s0,s7,80006f84 <core_bench_state+0x154>
80006f6c:	00064783          	lbu	a5,0(a2)
80006f70:	0147c733          	xor	a4,a5,s4
80006f74:	00d78463          	beq	a5,a3,80006f7c <core_bench_state+0x14c>
80006f78:	00e60023          	sb	a4,0(a2)
80006f7c:	01360633          	add	a2,a2,s3
80006f80:	ff7666e3          	bltu	a2,s7,80006f6c <core_bench_state+0x13c>
80006f84:	01010413          	add	s0,sp,16
80006f88:	00090993          	mv	s3,s2
80006f8c:	00042503          	lw	a0,0(s0)
80006f90:	00048593          	mv	a1,s1
80006f94:	00440413          	add	s0,s0,4
80006f98:	144000ef          	jal	800070dc <crcu32>
80006f9c:	00050593          	mv	a1,a0
80006fa0:	0009a503          	lw	a0,0(s3)
80006fa4:	00498993          	add	s3,s3,4
80006fa8:	134000ef          	jal	800070dc <crcu32>
80006fac:	00050493          	mv	s1,a0
80006fb0:	fc891ee3          	bne	s2,s0,80006f8c <core_bench_state+0x15c>
80006fb4:	07c12083          	lw	ra,124(sp)
80006fb8:	07812403          	lw	s0,120(sp)
80006fbc:	07412483          	lw	s1,116(sp)
80006fc0:	07012903          	lw	s2,112(sp)
80006fc4:	06c12983          	lw	s3,108(sp)
80006fc8:	06812a03          	lw	s4,104(sp)
80006fcc:	06412a83          	lw	s5,100(sp)
80006fd0:	06012b03          	lw	s6,96(sp)
80006fd4:	05c12b83          	lw	s7,92(sp)
80006fd8:	08010113          	add	sp,sp,128
80006fdc:	00008067          	ret
80006fe0:	00a40bb3          	add	s7,s0,a0
80006fe4:	f1746ee3          	bltu	s0,s7,80006f00 <core_bench_state+0xd0>
80006fe8:	f9dff06f          	j	80006f84 <core_bench_state+0x154>

80006fec <get_seed_32>:
80006fec:	00500793          	li	a5,5
80006ff0:	04a7ec63          	bltu	a5,a0,80007048 <get_seed_32+0x5c>
80006ff4:	a00017b7          	lui	a5,0xa0001
80006ff8:	89c78793          	add	a5,a5,-1892 # a000089c <intpat+0x10>
80006ffc:	00251513          	sll	a0,a0,0x2
80007000:	00f50533          	add	a0,a0,a5
80007004:	00052783          	lw	a5,0(a0)
80007008:	00078067          	jr	a5
8000700c:	a00017b7          	lui	a5,0xa0001
80007010:	9807a503          	lw	a0,-1664(a5) # a0000980 <seed5_volatile>
80007014:	00008067          	ret
80007018:	a00017b7          	lui	a5,0xa0001
8000701c:	9887a503          	lw	a0,-1656(a5) # a0000988 <seed1_volatile>
80007020:	00008067          	ret
80007024:	a00017b7          	lui	a5,0xa0001
80007028:	9847a503          	lw	a0,-1660(a5) # a0000984 <seed2_volatile>
8000702c:	00008067          	ret
80007030:	a00017b7          	lui	a5,0xa0001
80007034:	9607a503          	lw	a0,-1696(a5) # a0000960 <seed3_volatile>
80007038:	00008067          	ret
8000703c:	a00017b7          	lui	a5,0xa0001
80007040:	95c7a503          	lw	a0,-1700(a5) # a000095c <seed4_volatile>
80007044:	00008067          	ret
80007048:	00000513          	li	a0,0
8000704c:	00008067          	ret

80007050 <crcu16>:
80007050:	00050693          	mv	a3,a0
80007054:	ffffa837          	lui	a6,0xffffa
80007058:	00058513          	mv	a0,a1
8000705c:	0ff6f613          	zext.b	a2,a3
80007060:	00800713          	li	a4,8
80007064:	00180813          	add	a6,a6,1 # ffffa001 <__stack_base+0x3fffa001>
80007068:	00a647b3          	xor	a5,a2,a0
8000706c:	0017f793          	and	a5,a5,1
80007070:	40f007b3          	neg	a5,a5
80007074:	00155513          	srl	a0,a0,0x1
80007078:	0107f7b3          	and	a5,a5,a6
8000707c:	fff70713          	add	a4,a4,-1
80007080:	00a7c7b3          	xor	a5,a5,a0
80007084:	01079513          	sll	a0,a5,0x10
80007088:	0ff77713          	zext.b	a4,a4
8000708c:	00165613          	srl	a2,a2,0x1
80007090:	01055513          	srl	a0,a0,0x10
80007094:	fc071ae3          	bnez	a4,80007068 <crcu16+0x18>
80007098:	ffffa637          	lui	a2,0xffffa
8000709c:	0086d693          	srl	a3,a3,0x8
800070a0:	00800713          	li	a4,8
800070a4:	00160613          	add	a2,a2,1 # ffffa001 <__stack_base+0x3fffa001>
800070a8:	00a6c7b3          	xor	a5,a3,a0
800070ac:	0017f793          	and	a5,a5,1
800070b0:	40f007b3          	neg	a5,a5
800070b4:	00155513          	srl	a0,a0,0x1
800070b8:	00c7f7b3          	and	a5,a5,a2
800070bc:	fff70713          	add	a4,a4,-1
800070c0:	00a7c7b3          	xor	a5,a5,a0
800070c4:	01079513          	sll	a0,a5,0x10
800070c8:	0ff77713          	zext.b	a4,a4
800070cc:	0016d693          	srl	a3,a3,0x1
800070d0:	01055513          	srl	a0,a0,0x10
800070d4:	fc071ae3          	bnez	a4,800070a8 <crcu16+0x58>
800070d8:	00008067          	ret

800070dc <crcu32>:
800070dc:	00050693          	mv	a3,a0
800070e0:	ffffa837          	lui	a6,0xffffa
800070e4:	01069613          	sll	a2,a3,0x10
800070e8:	00058513          	mv	a0,a1
800070ec:	01065613          	srl	a2,a2,0x10
800070f0:	0ff6f593          	zext.b	a1,a3
800070f4:	00800713          	li	a4,8
800070f8:	00180813          	add	a6,a6,1 # ffffa001 <__stack_base+0x3fffa001>
800070fc:	00a5c7b3          	xor	a5,a1,a0
80007100:	0017f793          	and	a5,a5,1
80007104:	40f007b3          	neg	a5,a5
80007108:	00155513          	srl	a0,a0,0x1
8000710c:	0107f7b3          	and	a5,a5,a6
80007110:	fff70713          	add	a4,a4,-1
80007114:	00a7c7b3          	xor	a5,a5,a0
80007118:	01079513          	sll	a0,a5,0x10
8000711c:	0ff77713          	zext.b	a4,a4
80007120:	0015d593          	srl	a1,a1,0x1
80007124:	01055513          	srl	a0,a0,0x10
80007128:	fc071ae3          	bnez	a4,800070fc <crcu32+0x20>
8000712c:	ffffa5b7          	lui	a1,0xffffa
80007130:	00865613          	srl	a2,a2,0x8
80007134:	00800713          	li	a4,8
80007138:	00158593          	add	a1,a1,1 # ffffa001 <__stack_base+0x3fffa001>
8000713c:	00a647b3          	xor	a5,a2,a0
80007140:	0017f793          	and	a5,a5,1
80007144:	40f007b3          	neg	a5,a5
80007148:	00155513          	srl	a0,a0,0x1
8000714c:	00b7f7b3          	and	a5,a5,a1
80007150:	fff70713          	add	a4,a4,-1
80007154:	00a7c7b3          	xor	a5,a5,a0
80007158:	01079513          	sll	a0,a5,0x10
8000715c:	0ff77713          	zext.b	a4,a4
80007160:	00165613          	srl	a2,a2,0x1
80007164:	01055513          	srl	a0,a0,0x10
80007168:	fc071ae3          	bnez	a4,8000713c <crcu32+0x60>
8000716c:	0106d613          	srl	a2,a3,0x10
80007170:	ffffa5b7          	lui	a1,0xffffa
80007174:	00060693          	mv	a3,a2
80007178:	00800713          	li	a4,8
8000717c:	0ff67613          	zext.b	a2,a2
80007180:	00158593          	add	a1,a1,1 # ffffa001 <__stack_base+0x3fffa001>
80007184:	00a647b3          	xor	a5,a2,a0
80007188:	0017f793          	and	a5,a5,1
8000718c:	40f007b3          	neg	a5,a5
80007190:	00155513          	srl	a0,a0,0x1
80007194:	00b7f7b3          	and	a5,a5,a1
80007198:	fff70713          	add	a4,a4,-1
8000719c:	00a7c7b3          	xor	a5,a5,a0
800071a0:	01079513          	sll	a0,a5,0x10
800071a4:	0ff77713          	zext.b	a4,a4
800071a8:	00165613          	srl	a2,a2,0x1
800071ac:	01055513          	srl	a0,a0,0x10
800071b0:	fc071ae3          	bnez	a4,80007184 <crcu32+0xa8>
800071b4:	ffffa637          	lui	a2,0xffffa
800071b8:	0086d693          	srl	a3,a3,0x8
800071bc:	00800713          	li	a4,8
800071c0:	00160613          	add	a2,a2,1 # ffffa001 <__stack_base+0x3fffa001>
800071c4:	00a6c7b3          	xor	a5,a3,a0
800071c8:	0017f793          	and	a5,a5,1
800071cc:	40f007b3          	neg	a5,a5
800071d0:	00155513          	srl	a0,a0,0x1
800071d4:	00c7f7b3          	and	a5,a5,a2
800071d8:	fff70713          	add	a4,a4,-1
800071dc:	00a7c7b3          	xor	a5,a5,a0
800071e0:	01079513          	sll	a0,a5,0x10
800071e4:	0ff77713          	zext.b	a4,a4
800071e8:	0016d693          	srl	a3,a3,0x1
800071ec:	01055513          	srl	a0,a0,0x10
800071f0:	fc071ae3          	bnez	a4,800071c4 <crcu32+0xe8>
800071f4:	00008067          	ret

800071f8 <crc16>:
800071f8:	00050693          	mv	a3,a0
800071fc:	01069613          	sll	a2,a3,0x10
80007200:	ffffa837          	lui	a6,0xffffa
80007204:	00058513          	mv	a0,a1
80007208:	01065613          	srl	a2,a2,0x10
8000720c:	0ff6f693          	zext.b	a3,a3
80007210:	00800713          	li	a4,8
80007214:	00180813          	add	a6,a6,1 # ffffa001 <__stack_base+0x3fffa001>
80007218:	00a6c7b3          	xor	a5,a3,a0
8000721c:	0017f793          	and	a5,a5,1
80007220:	40f007b3          	neg	a5,a5
80007224:	00155513          	srl	a0,a0,0x1
80007228:	0107f7b3          	and	a5,a5,a6
8000722c:	fff70713          	add	a4,a4,-1
80007230:	00a7c7b3          	xor	a5,a5,a0
80007234:	01079513          	sll	a0,a5,0x10
80007238:	0ff77713          	zext.b	a4,a4
8000723c:	0016d693          	srl	a3,a3,0x1
80007240:	01055513          	srl	a0,a0,0x10
80007244:	fc071ae3          	bnez	a4,80007218 <crc16+0x20>
80007248:	ffffa5b7          	lui	a1,0xffffa
8000724c:	00865693          	srl	a3,a2,0x8
80007250:	00800713          	li	a4,8
80007254:	00158593          	add	a1,a1,1 # ffffa001 <__stack_base+0x3fffa001>
80007258:	00a6c7b3          	xor	a5,a3,a0
8000725c:	0017f793          	and	a5,a5,1
80007260:	40f007b3          	neg	a5,a5
80007264:	00155513          	srl	a0,a0,0x1
80007268:	00b7f7b3          	and	a5,a5,a1
8000726c:	fff70713          	add	a4,a4,-1
80007270:	00a7c7b3          	xor	a5,a5,a0
80007274:	01079513          	sll	a0,a5,0x10
80007278:	0ff77713          	zext.b	a4,a4
8000727c:	0016d693          	srl	a3,a3,0x1
80007280:	01055513          	srl	a0,a0,0x10
80007284:	fc071ae3          	bnez	a4,80007258 <crc16+0x60>
80007288:	00008067          	ret

8000728c <check_data_types>:
8000728c:	00000513          	li	a0,0
80007290:	00008067          	ret

80007294 <start_time>:
80007294:	b00026f3          	csrr	a3,mcycle
80007298:	b8002773          	csrr	a4,mcycleh
8000729c:	a00017b7          	lui	a5,0xa0001
800072a0:	96d7ac23          	sw	a3,-1672(a5) # a0000978 <start_time_val>
800072a4:	96e7ae23          	sw	a4,-1668(a5)
800072a8:	00008067          	ret

800072ac <stop_time>:
800072ac:	b00026f3          	csrr	a3,mcycle
800072b0:	b8002773          	csrr	a4,mcycleh
800072b4:	a00017b7          	lui	a5,0xa0001
800072b8:	96d7a823          	sw	a3,-1680(a5) # a0000970 <stop_time_val>
800072bc:	96e7aa23          	sw	a4,-1676(a5)
800072c0:	00008067          	ret

800072c4 <get_time>:
800072c4:	a00016b7          	lui	a3,0xa0001
800072c8:	a0001737          	lui	a4,0xa0001
800072cc:	9706a783          	lw	a5,-1680(a3) # a0000970 <stop_time_val>
800072d0:	97872503          	lw	a0,-1672(a4) # a0000978 <start_time_val>
800072d4:	9746a583          	lw	a1,-1676(a3)
800072d8:	97c72703          	lw	a4,-1668(a4)
800072dc:	40a78533          	sub	a0,a5,a0
800072e0:	00a7b7b3          	sltu	a5,a5,a0
800072e4:	40e585b3          	sub	a1,a1,a4
800072e8:	40f585b3          	sub	a1,a1,a5
800072ec:	00008067          	ret

800072f0 <time_in_secs>:
800072f0:	ff010113          	add	sp,sp,-16
800072f4:	00112623          	sw	ra,12(sp)
800072f8:	e54fb0ef          	jal	8000294c <__floatundidf>
800072fc:	a00017b7          	lui	a5,0xa0001
80007300:	9407a603          	lw	a2,-1728(a5) # a0000940 <intpat+0xb4>
80007304:	9447a683          	lw	a3,-1724(a5)
80007308:	d69f90ef          	jal	80001070 <__divdf3>
8000730c:	00c12083          	lw	ra,12(sp)
80007310:	01010113          	add	sp,sp,16
80007314:	00008067          	ret

80007318 <_putchar>:
80007318:	00050593          	mv	a1,a0
8000731c:	a0001537          	lui	a0,0xa0001
80007320:	96850513          	add	a0,a0,-1688 # a0000968 <uart_element>
80007324:	f95fb06f          	j	800032b8 <uart_put_char>

80007328 <portable_init>:
80007328:	ff010113          	add	sp,sp,-16
8000732c:	00812423          	sw	s0,8(sp)
80007330:	00050413          	mv	s0,a0
80007334:	a0001537          	lui	a0,0xa0001
80007338:	c00015b7          	lui	a1,0xc0001
8000733c:	96850513          	add	a0,a0,-1688 # a0000968 <uart_element>
80007340:	00112623          	sw	ra,12(sp)
80007344:	f6dfb0ef          	jal	800032b0 <uart_init>
80007348:	00100793          	li	a5,1
8000734c:	00f40023          	sb	a5,0(s0)
80007350:	00c12083          	lw	ra,12(sp)
80007354:	00812403          	lw	s0,8(sp)
80007358:	01010113          	add	sp,sp,16
8000735c:	00008067          	ret

80007360 <portable_fini>:
80007360:	00050023          	sb	zero,0(a0)
80007364:	00008067          	ret
