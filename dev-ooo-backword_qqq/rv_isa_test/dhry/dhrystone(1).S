
/data/usr/huangt/hello_world_ht/build/dhrystone.elf:     file format elf32-littleriscv


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
80000088:	a2428293          	add	t0,t0,-1500 # a0000aa8 <Ptr_Glob_inst>
8000008c:	20003317          	auipc	t1,0x20003
80000090:	25430313          	add	t1,t1,596 # a00032e0 <__bss_end>

80000094 <clear_bss_loop>:
80000094:	0002a023          	sw	zero,0(t0)
80000098:	00428293          	add	t0,t0,4
8000009c:	fe62cce3          	blt	t0,t1,80000094 <clear_bss_loop>
800000a0:	20001297          	auipc	t0,0x20001
800000a4:	9e428293          	add	t0,t0,-1564 # a0000a84 <Dhrystones_Per_Second>
800000a8:	20001317          	auipc	t1,0x20001
800000ac:	a0030313          	add	t1,t1,-1536 # a0000aa8 <Ptr_Glob_inst>

800000b0 <clear_sbss_loop>:
800000b0:	0002a023          	sw	zero,0(t0)
800000b4:	00428293          	add	t0,t0,4
800000b8:	fe62cce3          	blt	t0,t1,800000b0 <clear_sbss_loop>
800000bc:	224050ef          	jal	800052e0 <main>
800000c0:	088050ef          	jal	80005148 <to_host>
800000c4:	10500073          	wfi

800000c8 <strcmp>:
800000c8:	00b56733          	or	a4,a0,a1
800000cc:	fff00393          	li	t2,-1
800000d0:	00377713          	and	a4,a4,3
800000d4:	10071063          	bnez	a4,800001d4 <strcmp+0x10c>
800000d8:	7f7f87b7          	lui	a5,0x7f7f8
800000dc:	f7f78793          	add	a5,a5,-129 # 7f7f7f7f <__stack_size+0x7f7f3f7f>
800000e0:	00052603          	lw	a2,0(a0)
800000e4:	0005a683          	lw	a3,0(a1)
800000e8:	00f672b3          	and	t0,a2,a5
800000ec:	00f66333          	or	t1,a2,a5
800000f0:	00f282b3          	add	t0,t0,a5
800000f4:	0062e2b3          	or	t0,t0,t1
800000f8:	10729263          	bne	t0,t2,800001fc <strcmp+0x134>
800000fc:	08d61663          	bne	a2,a3,80000188 <strcmp+0xc0>
80000100:	00452603          	lw	a2,4(a0)
80000104:	0045a683          	lw	a3,4(a1)
80000108:	00f672b3          	and	t0,a2,a5
8000010c:	00f66333          	or	t1,a2,a5
80000110:	00f282b3          	add	t0,t0,a5
80000114:	0062e2b3          	or	t0,t0,t1
80000118:	0c729e63          	bne	t0,t2,800001f4 <strcmp+0x12c>
8000011c:	06d61663          	bne	a2,a3,80000188 <strcmp+0xc0>
80000120:	00852603          	lw	a2,8(a0)
80000124:	0085a683          	lw	a3,8(a1)
80000128:	00f672b3          	and	t0,a2,a5
8000012c:	00f66333          	or	t1,a2,a5
80000130:	00f282b3          	add	t0,t0,a5
80000134:	0062e2b3          	or	t0,t0,t1
80000138:	0c729863          	bne	t0,t2,80000208 <strcmp+0x140>
8000013c:	04d61663          	bne	a2,a3,80000188 <strcmp+0xc0>
80000140:	00c52603          	lw	a2,12(a0)
80000144:	00c5a683          	lw	a3,12(a1)
80000148:	00f672b3          	and	t0,a2,a5
8000014c:	00f66333          	or	t1,a2,a5
80000150:	00f282b3          	add	t0,t0,a5
80000154:	0062e2b3          	or	t0,t0,t1
80000158:	0c729263          	bne	t0,t2,8000021c <strcmp+0x154>
8000015c:	02d61663          	bne	a2,a3,80000188 <strcmp+0xc0>
80000160:	01052603          	lw	a2,16(a0)
80000164:	0105a683          	lw	a3,16(a1)
80000168:	00f672b3          	and	t0,a2,a5
8000016c:	00f66333          	or	t1,a2,a5
80000170:	00f282b3          	add	t0,t0,a5
80000174:	0062e2b3          	or	t0,t0,t1
80000178:	0a729c63          	bne	t0,t2,80000230 <strcmp+0x168>
8000017c:	01450513          	add	a0,a0,20
80000180:	01458593          	add	a1,a1,20
80000184:	f4d60ee3          	beq	a2,a3,800000e0 <strcmp+0x18>
80000188:	01061713          	sll	a4,a2,0x10
8000018c:	01069793          	sll	a5,a3,0x10
80000190:	00f71e63          	bne	a4,a5,800001ac <strcmp+0xe4>
80000194:	01065713          	srl	a4,a2,0x10
80000198:	0106d793          	srl	a5,a3,0x10
8000019c:	40f70533          	sub	a0,a4,a5
800001a0:	0ff57593          	zext.b	a1,a0
800001a4:	02059063          	bnez	a1,800001c4 <strcmp+0xfc>
800001a8:	00008067          	ret
800001ac:	01075713          	srl	a4,a4,0x10
800001b0:	0107d793          	srl	a5,a5,0x10
800001b4:	40f70533          	sub	a0,a4,a5
800001b8:	0ff57593          	zext.b	a1,a0
800001bc:	00059463          	bnez	a1,800001c4 <strcmp+0xfc>
800001c0:	00008067          	ret
800001c4:	0ff77713          	zext.b	a4,a4
800001c8:	0ff7f793          	zext.b	a5,a5
800001cc:	40f70533          	sub	a0,a4,a5
800001d0:	00008067          	ret
800001d4:	00054603          	lbu	a2,0(a0)
800001d8:	0005c683          	lbu	a3,0(a1)
800001dc:	00150513          	add	a0,a0,1
800001e0:	00158593          	add	a1,a1,1
800001e4:	00d61463          	bne	a2,a3,800001ec <strcmp+0x124>
800001e8:	fe0616e3          	bnez	a2,800001d4 <strcmp+0x10c>
800001ec:	40d60533          	sub	a0,a2,a3
800001f0:	00008067          	ret
800001f4:	00450513          	add	a0,a0,4
800001f8:	00458593          	add	a1,a1,4
800001fc:	fcd61ce3          	bne	a2,a3,800001d4 <strcmp+0x10c>
80000200:	00000513          	li	a0,0
80000204:	00008067          	ret
80000208:	00850513          	add	a0,a0,8
8000020c:	00858593          	add	a1,a1,8
80000210:	fcd612e3          	bne	a2,a3,800001d4 <strcmp+0x10c>
80000214:	00000513          	li	a0,0
80000218:	00008067          	ret
8000021c:	00c50513          	add	a0,a0,12
80000220:	00c58593          	add	a1,a1,12
80000224:	fad618e3          	bne	a2,a3,800001d4 <strcmp+0x10c>
80000228:	00000513          	li	a0,0
8000022c:	00008067          	ret
80000230:	01050513          	add	a0,a0,16
80000234:	01058593          	add	a1,a1,16
80000238:	f8d61ee3          	bne	a2,a3,800001d4 <strcmp+0x10c>
8000023c:	00000513          	li	a0,0
80000240:	00008067          	ret

80000244 <__udivdi3>:
#endif

#ifdef L_udivdi3
UDWtype
__udivdi3 (UDWtype n, UDWtype d)
{
80000244:	00050893          	mv	a7,a0
80000248:	00058313          	mv	t1,a1
  d0 = dd.s.low;
8000024c:	00060713          	mv	a4,a2
  n0 = nn.s.low;
80000250:	00050813          	mv	a6,a0
  n1 = nn.s.high;
80000254:	00058793          	mv	a5,a1
  if (d1 == 0)
80000258:	28069263          	bnez	a3,800004dc <__udivdi3+0x298>
      if (d0 > n1)
8000025c:	a00005b7          	lui	a1,0xa0000
80000260:	07858593          	add	a1,a1,120 # a0000078 <__clz_tab>
80000264:	0ec37663          	bgeu	t1,a2,80000350 <__udivdi3+0x10c>
	  count_leading_zeros (bm, d0);
80000268:	000106b7          	lui	a3,0x10
8000026c:	0cd67863          	bgeu	a2,a3,8000033c <__udivdi3+0xf8>
80000270:	10063693          	sltiu	a3,a2,256
80000274:	0016b693          	seqz	a3,a3
80000278:	00369693          	sll	a3,a3,0x3
8000027c:	00d65533          	srl	a0,a2,a3
80000280:	00a585b3          	add	a1,a1,a0
80000284:	0005c583          	lbu	a1,0(a1)
80000288:	02000513          	li	a0,32
8000028c:	00d586b3          	add	a3,a1,a3
80000290:	40d505b3          	sub	a1,a0,a3
	  if (bm != 0)
80000294:	00d50c63          	beq	a0,a3,800002ac <__udivdi3+0x68>
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
80000298:	00b317b3          	sll	a5,t1,a1
8000029c:	00d8d6b3          	srl	a3,a7,a3
	      d0 = d0 << bm;
800002a0:	00b61733          	sll	a4,a2,a1
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
800002a4:	00f6e7b3          	or	a5,a3,a5
	      n0 = n0 << bm;
800002a8:	00b89833          	sll	a6,a7,a1
	  udiv_qrnnd (q0, n0, n1, n0, d0);
800002ac:	01075593          	srl	a1,a4,0x10
800002b0:	02b7d333          	divu	t1,a5,a1
800002b4:	01071613          	sll	a2,a4,0x10
800002b8:	01065613          	srl	a2,a2,0x10
800002bc:	02b7f7b3          	remu	a5,a5,a1
800002c0:	00030513          	mv	a0,t1
800002c4:	026608b3          	mul	a7,a2,t1
800002c8:	01079693          	sll	a3,a5,0x10
800002cc:	01085793          	srl	a5,a6,0x10
800002d0:	00d7e7b3          	or	a5,a5,a3
800002d4:	0117fe63          	bgeu	a5,a7,800002f0 <__udivdi3+0xac>
800002d8:	00f707b3          	add	a5,a4,a5
800002dc:	fff30513          	add	a0,t1,-1
800002e0:	00e7e863          	bltu	a5,a4,800002f0 <__udivdi3+0xac>
800002e4:	0117f663          	bgeu	a5,a7,800002f0 <__udivdi3+0xac>
800002e8:	ffe30513          	add	a0,t1,-2
800002ec:	00e787b3          	add	a5,a5,a4
800002f0:	411787b3          	sub	a5,a5,a7
800002f4:	02b7d8b3          	divu	a7,a5,a1
800002f8:	01081813          	sll	a6,a6,0x10
800002fc:	01085813          	srl	a6,a6,0x10
80000300:	02b7f7b3          	remu	a5,a5,a1
80000304:	031606b3          	mul	a3,a2,a7
80000308:	01079793          	sll	a5,a5,0x10
8000030c:	00f86833          	or	a6,a6,a5
80000310:	00088793          	mv	a5,a7
80000314:	00d87c63          	bgeu	a6,a3,8000032c <__udivdi3+0xe8>
80000318:	01070833          	add	a6,a4,a6
8000031c:	fff88793          	add	a5,a7,-1
80000320:	00e86663          	bltu	a6,a4,8000032c <__udivdi3+0xe8>
80000324:	00d87463          	bgeu	a6,a3,8000032c <__udivdi3+0xe8>
80000328:	ffe88793          	add	a5,a7,-2
8000032c:	01051513          	sll	a0,a0,0x10
80000330:	00f56533          	or	a0,a0,a5
	      q1 = 0;
80000334:	00000593          	li	a1,0
  return __udivmoddi4 (n, d, (UDWtype *) 0);
}
80000338:	00008067          	ret
	  count_leading_zeros (bm, d0);
8000033c:	01000537          	lui	a0,0x1000
80000340:	01800693          	li	a3,24
80000344:	f2a67ce3          	bgeu	a2,a0,8000027c <__udivdi3+0x38>
80000348:	01000693          	li	a3,16
8000034c:	f31ff06f          	j	8000027c <__udivdi3+0x38>
	  count_leading_zeros (bm, d0);
80000350:	00000693          	li	a3,0
	  if (d0 == 0)
80000354:	00060c63          	beqz	a2,8000036c <__udivdi3+0x128>
	  count_leading_zeros (bm, d0);
80000358:	000107b7          	lui	a5,0x10
8000035c:	0cf67063          	bgeu	a2,a5,8000041c <__udivdi3+0x1d8>
80000360:	10063693          	sltiu	a3,a2,256
80000364:	0016b693          	seqz	a3,a3
80000368:	00369693          	sll	a3,a3,0x3
8000036c:	00d657b3          	srl	a5,a2,a3
80000370:	00f585b3          	add	a1,a1,a5
80000374:	0005c783          	lbu	a5,0(a1)
80000378:	00d787b3          	add	a5,a5,a3
8000037c:	02000693          	li	a3,32
80000380:	40f685b3          	sub	a1,a3,a5
	  if (bm == 0)
80000384:	0af69663          	bne	a3,a5,80000430 <__udivdi3+0x1ec>
	      n1 -= d0;
80000388:	40c307b3          	sub	a5,t1,a2
	      q1 = 1;
8000038c:	00100593          	li	a1,1
	  udiv_qrnnd (q0, n0, n1, n0, d0);
80000390:	01075893          	srl	a7,a4,0x10
80000394:	0317de33          	divu	t3,a5,a7
80000398:	01071613          	sll	a2,a4,0x10
8000039c:	01065613          	srl	a2,a2,0x10
800003a0:	01085693          	srl	a3,a6,0x10
800003a4:	0317f7b3          	remu	a5,a5,a7
800003a8:	000e0513          	mv	a0,t3
800003ac:	03c60333          	mul	t1,a2,t3
800003b0:	01079793          	sll	a5,a5,0x10
800003b4:	00f6e7b3          	or	a5,a3,a5
800003b8:	0067fe63          	bgeu	a5,t1,800003d4 <__udivdi3+0x190>
800003bc:	00f707b3          	add	a5,a4,a5
800003c0:	fffe0513          	add	a0,t3,-1
800003c4:	00e7e863          	bltu	a5,a4,800003d4 <__udivdi3+0x190>
800003c8:	0067f663          	bgeu	a5,t1,800003d4 <__udivdi3+0x190>
800003cc:	ffee0513          	add	a0,t3,-2
800003d0:	00e787b3          	add	a5,a5,a4
800003d4:	406787b3          	sub	a5,a5,t1
800003d8:	0317d333          	divu	t1,a5,a7
800003dc:	01081813          	sll	a6,a6,0x10
800003e0:	01085813          	srl	a6,a6,0x10
800003e4:	0317f7b3          	remu	a5,a5,a7
800003e8:	026606b3          	mul	a3,a2,t1
800003ec:	01079793          	sll	a5,a5,0x10
800003f0:	00f86833          	or	a6,a6,a5
800003f4:	00030793          	mv	a5,t1
800003f8:	00d87c63          	bgeu	a6,a3,80000410 <__udivdi3+0x1cc>
800003fc:	01070833          	add	a6,a4,a6
80000400:	fff30793          	add	a5,t1,-1
80000404:	00e86663          	bltu	a6,a4,80000410 <__udivdi3+0x1cc>
80000408:	00d87463          	bgeu	a6,a3,80000410 <__udivdi3+0x1cc>
8000040c:	ffe30793          	add	a5,t1,-2
80000410:	01051513          	sll	a0,a0,0x10
80000414:	00f56533          	or	a0,a0,a5
80000418:	00008067          	ret
	  count_leading_zeros (bm, d0);
8000041c:	010007b7          	lui	a5,0x1000
80000420:	01800693          	li	a3,24
80000424:	f4f674e3          	bgeu	a2,a5,8000036c <__udivdi3+0x128>
80000428:	01000693          	li	a3,16
8000042c:	f41ff06f          	j	8000036c <__udivdi3+0x128>
	      d0 = d0 << bm;
80000430:	00b61733          	sll	a4,a2,a1
	      n2 = n1 >> b;
80000434:	00f356b3          	srl	a3,t1,a5
	      udiv_qrnnd (q1, n1, n2, n1, d0);
80000438:	01075513          	srl	a0,a4,0x10
	      n1 = (n1 << bm) | (n0 >> b);
8000043c:	00b31333          	sll	t1,t1,a1
80000440:	00f8d7b3          	srl	a5,a7,a5
80000444:	0067e7b3          	or	a5,a5,t1
	      udiv_qrnnd (q1, n1, n2, n1, d0);
80000448:	02a6d333          	divu	t1,a3,a0
8000044c:	01071613          	sll	a2,a4,0x10
80000450:	01065613          	srl	a2,a2,0x10
	      n0 = n0 << bm;
80000454:	00b89833          	sll	a6,a7,a1
	      udiv_qrnnd (q1, n1, n2, n1, d0);
80000458:	02a6f6b3          	remu	a3,a3,a0
8000045c:	026608b3          	mul	a7,a2,t1
80000460:	01069593          	sll	a1,a3,0x10
80000464:	0107d693          	srl	a3,a5,0x10
80000468:	00b6e6b3          	or	a3,a3,a1
8000046c:	00030593          	mv	a1,t1
80000470:	0116fe63          	bgeu	a3,a7,8000048c <__udivdi3+0x248>
80000474:	00d706b3          	add	a3,a4,a3
80000478:	fff30593          	add	a1,t1,-1
8000047c:	00e6e863          	bltu	a3,a4,8000048c <__udivdi3+0x248>
80000480:	0116f663          	bgeu	a3,a7,8000048c <__udivdi3+0x248>
80000484:	ffe30593          	add	a1,t1,-2
80000488:	00e686b3          	add	a3,a3,a4
8000048c:	411686b3          	sub	a3,a3,a7
80000490:	02a6d8b3          	divu	a7,a3,a0
80000494:	01079793          	sll	a5,a5,0x10
80000498:	0107d793          	srl	a5,a5,0x10
8000049c:	02a6f6b3          	remu	a3,a3,a0
800004a0:	03160633          	mul	a2,a2,a7
800004a4:	01069693          	sll	a3,a3,0x10
800004a8:	00d7e7b3          	or	a5,a5,a3
800004ac:	00088693          	mv	a3,a7
800004b0:	00c7fe63          	bgeu	a5,a2,800004cc <__udivdi3+0x288>
800004b4:	00f707b3          	add	a5,a4,a5
800004b8:	fff88693          	add	a3,a7,-1
800004bc:	00e7e863          	bltu	a5,a4,800004cc <__udivdi3+0x288>
800004c0:	00c7f663          	bgeu	a5,a2,800004cc <__udivdi3+0x288>
800004c4:	ffe88693          	add	a3,a7,-2
800004c8:	00e787b3          	add	a5,a5,a4
800004cc:	01059593          	sll	a1,a1,0x10
800004d0:	40c787b3          	sub	a5,a5,a2
800004d4:	00d5e5b3          	or	a1,a1,a3
800004d8:	eb9ff06f          	j	80000390 <__udivdi3+0x14c>
      if (d1 > n1)
800004dc:	18d5e663          	bltu	a1,a3,80000668 <__udivdi3+0x424>
	  count_leading_zeros (bm, d1);
800004e0:	000107b7          	lui	a5,0x10
800004e4:	04f6f463          	bgeu	a3,a5,8000052c <__udivdi3+0x2e8>
800004e8:	1006b713          	sltiu	a4,a3,256
800004ec:	00173713          	seqz	a4,a4
800004f0:	00371713          	sll	a4,a4,0x3
800004f4:	a00007b7          	lui	a5,0xa0000
800004f8:	00e6d5b3          	srl	a1,a3,a4
800004fc:	07878793          	add	a5,a5,120 # a0000078 <__clz_tab>
80000500:	00b787b3          	add	a5,a5,a1
80000504:	0007c783          	lbu	a5,0(a5)
80000508:	00e787b3          	add	a5,a5,a4
8000050c:	02000713          	li	a4,32
80000510:	40f705b3          	sub	a1,a4,a5
	  if (bm == 0)
80000514:	02f71663          	bne	a4,a5,80000540 <__udivdi3+0x2fc>
		  q0 = 1;
80000518:	00100513          	li	a0,1
	      if (n1 > d1 || n0 >= d0)
8000051c:	e066eee3          	bltu	a3,t1,80000338 <__udivdi3+0xf4>
80000520:	00c8b533          	sltu	a0,a7,a2
80000524:	00153513          	seqz	a0,a0
80000528:	00008067          	ret
	  count_leading_zeros (bm, d1);
8000052c:	010007b7          	lui	a5,0x1000
80000530:	01800713          	li	a4,24
80000534:	fcf6f0e3          	bgeu	a3,a5,800004f4 <__udivdi3+0x2b0>
80000538:	01000713          	li	a4,16
8000053c:	fb9ff06f          	j	800004f4 <__udivdi3+0x2b0>
	      d1 = (d1 << bm) | (d0 >> b);
80000540:	00f65733          	srl	a4,a2,a5
80000544:	00b696b3          	sll	a3,a3,a1
80000548:	00d766b3          	or	a3,a4,a3
	      n2 = n1 >> b;
8000054c:	00f35733          	srl	a4,t1,a5
	      n1 = (n1 << bm) | (n0 >> b);
80000550:	00b31333          	sll	t1,t1,a1
80000554:	00f8d7b3          	srl	a5,a7,a5
80000558:	0067e7b3          	or	a5,a5,t1
	      udiv_qrnnd (q0, n1, n2, n1, d1);
8000055c:	0106d313          	srl	t1,a3,0x10
80000560:	02675eb3          	divu	t4,a4,t1
80000564:	01069813          	sll	a6,a3,0x10
80000568:	01085813          	srl	a6,a6,0x10
	      d0 = d0 << bm;
8000056c:	00b61633          	sll	a2,a2,a1
	      udiv_qrnnd (q0, n1, n2, n1, d1);
80000570:	02677733          	remu	a4,a4,t1
80000574:	03d80e33          	mul	t3,a6,t4
80000578:	01071513          	sll	a0,a4,0x10
8000057c:	0107d713          	srl	a4,a5,0x10
80000580:	00a76733          	or	a4,a4,a0
80000584:	000e8513          	mv	a0,t4
80000588:	01c77e63          	bgeu	a4,t3,800005a4 <__udivdi3+0x360>
8000058c:	00e68733          	add	a4,a3,a4
80000590:	fffe8513          	add	a0,t4,-1
80000594:	00d76863          	bltu	a4,a3,800005a4 <__udivdi3+0x360>
80000598:	01c77663          	bgeu	a4,t3,800005a4 <__udivdi3+0x360>
8000059c:	ffee8513          	add	a0,t4,-2
800005a0:	00d70733          	add	a4,a4,a3
800005a4:	41c70733          	sub	a4,a4,t3
800005a8:	02675e33          	divu	t3,a4,t1
800005ac:	01079793          	sll	a5,a5,0x10
800005b0:	0107d793          	srl	a5,a5,0x10
800005b4:	02677733          	remu	a4,a4,t1
800005b8:	03c80833          	mul	a6,a6,t3
800005bc:	01071713          	sll	a4,a4,0x10
800005c0:	00e7e7b3          	or	a5,a5,a4
800005c4:	000e0713          	mv	a4,t3
800005c8:	0107fe63          	bgeu	a5,a6,800005e4 <__udivdi3+0x3a0>
800005cc:	00f687b3          	add	a5,a3,a5
800005d0:	fffe0713          	add	a4,t3,-1
800005d4:	00d7e863          	bltu	a5,a3,800005e4 <__udivdi3+0x3a0>
800005d8:	0107f663          	bgeu	a5,a6,800005e4 <__udivdi3+0x3a0>
800005dc:	ffee0713          	add	a4,t3,-2
800005e0:	00d787b3          	add	a5,a5,a3
800005e4:	01051513          	sll	a0,a0,0x10
	      umul_ppmm (m1, m0, q0, d0);
800005e8:	00010e37          	lui	t3,0x10
	      udiv_qrnnd (q0, n1, n2, n1, d1);
800005ec:	00e56533          	or	a0,a0,a4
	      umul_ppmm (m1, m0, q0, d0);
800005f0:	fffe0693          	add	a3,t3,-1 # ffff <__stack_size+0xbfff>
800005f4:	00d57733          	and	a4,a0,a3
	      udiv_qrnnd (q0, n1, n2, n1, d1);
800005f8:	410787b3          	sub	a5,a5,a6
	      umul_ppmm (m1, m0, q0, d0);
800005fc:	00d676b3          	and	a3,a2,a3
80000600:	01055813          	srl	a6,a0,0x10
80000604:	01065613          	srl	a2,a2,0x10
80000608:	02d70333          	mul	t1,a4,a3
8000060c:	02d806b3          	mul	a3,a6,a3
80000610:	02c70733          	mul	a4,a4,a2
80000614:	02c80833          	mul	a6,a6,a2
80000618:	00d70633          	add	a2,a4,a3
8000061c:	01035713          	srl	a4,t1,0x10
80000620:	00c70733          	add	a4,a4,a2
80000624:	00d77463          	bgeu	a4,a3,8000062c <__udivdi3+0x3e8>
80000628:	01c80833          	add	a6,a6,t3
8000062c:	01075693          	srl	a3,a4,0x10
80000630:	010686b3          	add	a3,a3,a6
	      if (m1 > n1 || (m1 == n1 && m0 > n0))
80000634:	02d7e663          	bltu	a5,a3,80000660 <__udivdi3+0x41c>
80000638:	ced79ee3          	bne	a5,a3,80000334 <__udivdi3+0xf0>
	      umul_ppmm (m1, m0, q0, d0);
8000063c:	000107b7          	lui	a5,0x10
80000640:	fff78793          	add	a5,a5,-1 # ffff <__stack_size+0xbfff>
80000644:	00f77733          	and	a4,a4,a5
80000648:	01071713          	sll	a4,a4,0x10
8000064c:	00f37333          	and	t1,t1,a5
	      n0 = n0 << bm;
80000650:	00b898b3          	sll	a7,a7,a1
	      umul_ppmm (m1, m0, q0, d0);
80000654:	00670733          	add	a4,a4,t1
	      q1 = 0;
80000658:	00000593          	li	a1,0
	      if (m1 > n1 || (m1 == n1 && m0 > n0))
8000065c:	cce8fee3          	bgeu	a7,a4,80000338 <__udivdi3+0xf4>
		  q0--;
80000660:	fff50513          	add	a0,a0,-1 # ffffff <__stack_size+0xffbfff>
		  sub_ddmmss (m1, m0, m1, m0, d1, d0);
80000664:	cd1ff06f          	j	80000334 <__udivdi3+0xf0>
	  q1 = 0;
80000668:	00000593          	li	a1,0
	  q0 = 0;
8000066c:	00000513          	li	a0,0
80000670:	00008067          	ret

80000674 <__umoddi3>:
  d0 = dd.s.low;
80000674:	00060813          	mv	a6,a2
  n0 = nn.s.low;
80000678:	00050793          	mv	a5,a0
  n1 = nn.s.high;
8000067c:	00058713          	mv	a4,a1
  if (d1 == 0)
80000680:	20069663          	bnez	a3,8000088c <__umoddi3+0x218>
      if (d0 > n1)
80000684:	a00008b7          	lui	a7,0xa0000
80000688:	07888893          	add	a7,a7,120 # a0000078 <__clz_tab>
8000068c:	0cc5fc63          	bgeu	a1,a2,80000764 <__umoddi3+0xf0>
	  count_leading_zeros (bm, d0);
80000690:	000106b7          	lui	a3,0x10
80000694:	0ad67e63          	bgeu	a2,a3,80000750 <__umoddi3+0xdc>
80000698:	10063693          	sltiu	a3,a2,256
8000069c:	0016b693          	seqz	a3,a3
800006a0:	00369693          	sll	a3,a3,0x3
800006a4:	00d65333          	srl	t1,a2,a3
800006a8:	006888b3          	add	a7,a7,t1
800006ac:	0008c883          	lbu	a7,0(a7)
800006b0:	02000313          	li	t1,32
800006b4:	00d886b3          	add	a3,a7,a3
800006b8:	40d308b3          	sub	a7,t1,a3
	  if (bm != 0)
800006bc:	00d30c63          	beq	t1,a3,800006d4 <__umoddi3+0x60>
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
800006c0:	01159733          	sll	a4,a1,a7
800006c4:	00d556b3          	srl	a3,a0,a3
	      d0 = d0 << bm;
800006c8:	01161833          	sll	a6,a2,a7
	      n1 = (n1 << bm) | (n0 >> (W_TYPE_SIZE - bm));
800006cc:	00e6e733          	or	a4,a3,a4
	      n0 = n0 << bm;
800006d0:	011517b3          	sll	a5,a0,a7
	  udiv_qrnnd (q0, n0, n1, n0, d0);
800006d4:	01085613          	srl	a2,a6,0x10
800006d8:	02c756b3          	divu	a3,a4,a2
800006dc:	01081513          	sll	a0,a6,0x10
800006e0:	01055513          	srl	a0,a0,0x10
800006e4:	02c77733          	remu	a4,a4,a2
800006e8:	02a686b3          	mul	a3,a3,a0
800006ec:	01071593          	sll	a1,a4,0x10
800006f0:	0107d713          	srl	a4,a5,0x10
800006f4:	00b76733          	or	a4,a4,a1
800006f8:	00d77a63          	bgeu	a4,a3,8000070c <__umoddi3+0x98>
800006fc:	00e80733          	add	a4,a6,a4
80000700:	01076663          	bltu	a4,a6,8000070c <__umoddi3+0x98>
80000704:	00d77463          	bgeu	a4,a3,8000070c <__umoddi3+0x98>
80000708:	01070733          	add	a4,a4,a6
8000070c:	40d70733          	sub	a4,a4,a3
80000710:	02c756b3          	divu	a3,a4,a2
80000714:	02c77733          	remu	a4,a4,a2
80000718:	02a686b3          	mul	a3,a3,a0
	  udiv_qrnnd (q0, n0, n1, n0, d0);
8000071c:	01079793          	sll	a5,a5,0x10
80000720:	01071713          	sll	a4,a4,0x10
80000724:	0107d793          	srl	a5,a5,0x10
80000728:	00e7e7b3          	or	a5,a5,a4
8000072c:	00d7fa63          	bgeu	a5,a3,80000740 <__umoddi3+0xcc>
80000730:	00f807b3          	add	a5,a6,a5
80000734:	0107e663          	bltu	a5,a6,80000740 <__umoddi3+0xcc>
80000738:	00d7f463          	bgeu	a5,a3,80000740 <__umoddi3+0xcc>
8000073c:	010787b3          	add	a5,a5,a6
80000740:	40d787b3          	sub	a5,a5,a3
	  rr.s.low = n0 >> bm;
80000744:	0117d533          	srl	a0,a5,a7
	  *rp = rr.ll;
80000748:	00000593          	li	a1,0
8000074c:	00008067          	ret
	  count_leading_zeros (bm, d0);
80000750:	01000337          	lui	t1,0x1000
80000754:	01800693          	li	a3,24
80000758:	f46676e3          	bgeu	a2,t1,800006a4 <__umoddi3+0x30>
8000075c:	01000693          	li	a3,16
80000760:	f45ff06f          	j	800006a4 <__umoddi3+0x30>
	  count_leading_zeros (bm, d0);
80000764:	00000693          	li	a3,0
	  if (d0 == 0)
80000768:	00060c63          	beqz	a2,80000780 <__umoddi3+0x10c>
	  count_leading_zeros (bm, d0);
8000076c:	00010737          	lui	a4,0x10
80000770:	06e67e63          	bgeu	a2,a4,800007ec <__umoddi3+0x178>
80000774:	10063693          	sltiu	a3,a2,256
80000778:	0016b693          	seqz	a3,a3
8000077c:	00369693          	sll	a3,a3,0x3
80000780:	00d65733          	srl	a4,a2,a3
80000784:	00e888b3          	add	a7,a7,a4
80000788:	0008c703          	lbu	a4,0(a7)
8000078c:	00d70733          	add	a4,a4,a3
80000790:	02000693          	li	a3,32
80000794:	40e688b3          	sub	a7,a3,a4
	  if (bm == 0)
80000798:	06e69463          	bne	a3,a4,80000800 <__umoddi3+0x18c>
	      n1 -= d0;
8000079c:	40c58733          	sub	a4,a1,a2
	  udiv_qrnnd (q0, n0, n1, n0, d0);
800007a0:	01085593          	srl	a1,a6,0x10
800007a4:	02b75633          	divu	a2,a4,a1
800007a8:	01081513          	sll	a0,a6,0x10
800007ac:	01055513          	srl	a0,a0,0x10
800007b0:	0107d693          	srl	a3,a5,0x10
800007b4:	02b77733          	remu	a4,a4,a1
800007b8:	02a60633          	mul	a2,a2,a0
800007bc:	01071713          	sll	a4,a4,0x10
800007c0:	00e6e733          	or	a4,a3,a4
800007c4:	00c77a63          	bgeu	a4,a2,800007d8 <__umoddi3+0x164>
800007c8:	00e80733          	add	a4,a6,a4
800007cc:	01076663          	bltu	a4,a6,800007d8 <__umoddi3+0x164>
800007d0:	00c77463          	bgeu	a4,a2,800007d8 <__umoddi3+0x164>
800007d4:	01070733          	add	a4,a4,a6
800007d8:	40c70733          	sub	a4,a4,a2
800007dc:	02b756b3          	divu	a3,a4,a1
800007e0:	02b77733          	remu	a4,a4,a1
800007e4:	02a686b3          	mul	a3,a3,a0
800007e8:	f35ff06f          	j	8000071c <__umoddi3+0xa8>
	  count_leading_zeros (bm, d0);
800007ec:	01000737          	lui	a4,0x1000
800007f0:	01800693          	li	a3,24
800007f4:	f8e676e3          	bgeu	a2,a4,80000780 <__umoddi3+0x10c>
800007f8:	01000693          	li	a3,16
800007fc:	f85ff06f          	j	80000780 <__umoddi3+0x10c>
	      d0 = d0 << bm;
80000800:	01161833          	sll	a6,a2,a7
	      n2 = n1 >> b;
80000804:	00e5d6b3          	srl	a3,a1,a4
	      n0 = n0 << bm;
80000808:	011517b3          	sll	a5,a0,a7
	      n1 = (n1 << bm) | (n0 >> b);
8000080c:	011595b3          	sll	a1,a1,a7
80000810:	00e55733          	srl	a4,a0,a4
	      udiv_qrnnd (q1, n1, n2, n1, d0);
80000814:	01085513          	srl	a0,a6,0x10
	      n1 = (n1 << bm) | (n0 >> b);
80000818:	00b76733          	or	a4,a4,a1
	      udiv_qrnnd (q1, n1, n2, n1, d0);
8000081c:	02a6d5b3          	divu	a1,a3,a0
80000820:	01081313          	sll	t1,a6,0x10
80000824:	01035313          	srl	t1,t1,0x10
80000828:	02a6f6b3          	remu	a3,a3,a0
8000082c:	026585b3          	mul	a1,a1,t1
80000830:	01069613          	sll	a2,a3,0x10
80000834:	01075693          	srl	a3,a4,0x10
80000838:	00c6e6b3          	or	a3,a3,a2
8000083c:	00b6fa63          	bgeu	a3,a1,80000850 <__umoddi3+0x1dc>
80000840:	00d806b3          	add	a3,a6,a3
80000844:	0106e663          	bltu	a3,a6,80000850 <__umoddi3+0x1dc>
80000848:	00b6f463          	bgeu	a3,a1,80000850 <__umoddi3+0x1dc>
8000084c:	010686b3          	add	a3,a3,a6
80000850:	40b686b3          	sub	a3,a3,a1
80000854:	02a6d633          	divu	a2,a3,a0
80000858:	01071713          	sll	a4,a4,0x10
8000085c:	01075713          	srl	a4,a4,0x10
80000860:	02a6f6b3          	remu	a3,a3,a0
80000864:	02660633          	mul	a2,a2,t1
80000868:	01069693          	sll	a3,a3,0x10
8000086c:	00d76733          	or	a4,a4,a3
80000870:	00c77a63          	bgeu	a4,a2,80000884 <__umoddi3+0x210>
80000874:	00e80733          	add	a4,a6,a4
80000878:	01076663          	bltu	a4,a6,80000884 <__umoddi3+0x210>
8000087c:	00c77463          	bgeu	a4,a2,80000884 <__umoddi3+0x210>
80000880:	01070733          	add	a4,a4,a6
80000884:	40c70733          	sub	a4,a4,a2
80000888:	f19ff06f          	j	800007a0 <__umoddi3+0x12c>
      if (d1 > n1)
8000088c:	1cd5e463          	bltu	a1,a3,80000a54 <__umoddi3+0x3e0>
	  count_leading_zeros (bm, d1);
80000890:	00010837          	lui	a6,0x10
80000894:	0506fe63          	bgeu	a3,a6,800008f0 <__umoddi3+0x27c>
80000898:	1006b813          	sltiu	a6,a3,256
8000089c:	00183813          	seqz	a6,a6
800008a0:	00381813          	sll	a6,a6,0x3
800008a4:	a00008b7          	lui	a7,0xa0000
800008a8:	0106d333          	srl	t1,a3,a6
800008ac:	07888893          	add	a7,a7,120 # a0000078 <__clz_tab>
800008b0:	006888b3          	add	a7,a7,t1
800008b4:	0008c883          	lbu	a7,0(a7)
800008b8:	02000313          	li	t1,32
800008bc:	010888b3          	add	a7,a7,a6
800008c0:	41130833          	sub	a6,t1,a7
	  if (bm == 0)
800008c4:	05131063          	bne	t1,a7,80000904 <__umoddi3+0x290>
	      if (n1 > d1 || n0 >= d0)
800008c8:	00b6e463          	bltu	a3,a1,800008d0 <__umoddi3+0x25c>
800008cc:	00c56c63          	bltu	a0,a2,800008e4 <__umoddi3+0x270>
		  sub_ddmmss (n1, n0, n1, n0, d1, d0);
800008d0:	40c50633          	sub	a2,a0,a2
800008d4:	40d586b3          	sub	a3,a1,a3
800008d8:	00c53733          	sltu	a4,a0,a2
800008dc:	00060793          	mv	a5,a2
800008e0:	40e68733          	sub	a4,a3,a4
		  *rp = rr.ll;
800008e4:	00078513          	mv	a0,a5
800008e8:	00070593          	mv	a1,a4
800008ec:	00008067          	ret
	  count_leading_zeros (bm, d1);
800008f0:	010008b7          	lui	a7,0x1000
800008f4:	01800813          	li	a6,24
800008f8:	fb16f6e3          	bgeu	a3,a7,800008a4 <__umoddi3+0x230>
800008fc:	01000813          	li	a6,16
80000900:	fa5ff06f          	j	800008a4 <__umoddi3+0x230>
	      d1 = (d1 << bm) | (d0 >> b);
80000904:	011657b3          	srl	a5,a2,a7
80000908:	010696b3          	sll	a3,a3,a6
8000090c:	00d7e6b3          	or	a3,a5,a3
	      n2 = n1 >> b;
80000910:	0115d733          	srl	a4,a1,a7
	      udiv_qrnnd (q0, n1, n2, n1, d1);
80000914:	0106de13          	srl	t3,a3,0x10
80000918:	03c75f33          	divu	t5,a4,t3
8000091c:	01069313          	sll	t1,a3,0x10
80000920:	01035313          	srl	t1,t1,0x10
	      n1 = (n1 << bm) | (n0 >> b);
80000924:	010597b3          	sll	a5,a1,a6
80000928:	011555b3          	srl	a1,a0,a7
8000092c:	00f5e5b3          	or	a1,a1,a5
	      udiv_qrnnd (q0, n1, n2, n1, d1);
80000930:	0105d793          	srl	a5,a1,0x10
	      d0 = d0 << bm;
80000934:	01061633          	sll	a2,a2,a6
	      n0 = n0 << bm;
80000938:	01051533          	sll	a0,a0,a6
	      udiv_qrnnd (q0, n1, n2, n1, d1);
8000093c:	03c77733          	remu	a4,a4,t3
80000940:	03e30eb3          	mul	t4,t1,t5
80000944:	01071713          	sll	a4,a4,0x10
80000948:	00e7e7b3          	or	a5,a5,a4
8000094c:	000f0713          	mv	a4,t5
80000950:	01d7fe63          	bgeu	a5,t4,8000096c <__umoddi3+0x2f8>
80000954:	00f687b3          	add	a5,a3,a5
80000958:	ffff0713          	add	a4,t5,-1
8000095c:	00d7e863          	bltu	a5,a3,8000096c <__umoddi3+0x2f8>
80000960:	01d7f663          	bgeu	a5,t4,8000096c <__umoddi3+0x2f8>
80000964:	ffef0713          	add	a4,t5,-2
80000968:	00d787b3          	add	a5,a5,a3
8000096c:	41d787b3          	sub	a5,a5,t4
80000970:	03c7deb3          	divu	t4,a5,t3
80000974:	01059593          	sll	a1,a1,0x10
80000978:	0105d593          	srl	a1,a1,0x10
8000097c:	03c7f7b3          	remu	a5,a5,t3
80000980:	000e8e13          	mv	t3,t4
80000984:	03d30333          	mul	t1,t1,t4
80000988:	01079793          	sll	a5,a5,0x10
8000098c:	00f5e5b3          	or	a1,a1,a5
80000990:	0065fe63          	bgeu	a1,t1,800009ac <__umoddi3+0x338>
80000994:	00b685b3          	add	a1,a3,a1
80000998:	fffe8e13          	add	t3,t4,-1
8000099c:	00d5e863          	bltu	a1,a3,800009ac <__umoddi3+0x338>
800009a0:	0065f663          	bgeu	a1,t1,800009ac <__umoddi3+0x338>
800009a4:	ffee8e13          	add	t3,t4,-2
800009a8:	00d585b3          	add	a1,a1,a3
800009ac:	01071793          	sll	a5,a4,0x10
	      umul_ppmm (m1, m0, q0, d0);
800009b0:	00010f37          	lui	t5,0x10
	      udiv_qrnnd (q0, n1, n2, n1, d1);
800009b4:	01c7e7b3          	or	a5,a5,t3
800009b8:	406585b3          	sub	a1,a1,t1
	      umul_ppmm (m1, m0, q0, d0);
800009bc:	ffff0313          	add	t1,t5,-1 # ffff <__stack_size+0xbfff>
800009c0:	0067f733          	and	a4,a5,t1
800009c4:	01065e13          	srl	t3,a2,0x10
800009c8:	0107d793          	srl	a5,a5,0x10
800009cc:	00667333          	and	t1,a2,t1
800009d0:	02670eb3          	mul	t4,a4,t1
800009d4:	02678333          	mul	t1,a5,t1
800009d8:	03c70733          	mul	a4,a4,t3
800009dc:	03c787b3          	mul	a5,a5,t3
800009e0:	00670e33          	add	t3,a4,t1
800009e4:	010ed713          	srl	a4,t4,0x10
800009e8:	01c70733          	add	a4,a4,t3
800009ec:	00677463          	bgeu	a4,t1,800009f4 <__umoddi3+0x380>
800009f0:	01e787b3          	add	a5,a5,t5
800009f4:	01075313          	srl	t1,a4,0x10
800009f8:	00f307b3          	add	a5,t1,a5
800009fc:	00010337          	lui	t1,0x10
80000a00:	fff30313          	add	t1,t1,-1 # ffff <__stack_size+0xbfff>
80000a04:	00677733          	and	a4,a4,t1
80000a08:	01071713          	sll	a4,a4,0x10
80000a0c:	006efeb3          	and	t4,t4,t1
80000a10:	01d70733          	add	a4,a4,t4
	      if (m1 > n1 || (m1 == n1 && m0 > n0))
80000a14:	00f5e663          	bltu	a1,a5,80000a20 <__umoddi3+0x3ac>
80000a18:	00f59e63          	bne	a1,a5,80000a34 <__umoddi3+0x3c0>
80000a1c:	00e57c63          	bgeu	a0,a4,80000a34 <__umoddi3+0x3c0>
		  sub_ddmmss (m1, m0, m1, m0, d1, d0);
80000a20:	40c70633          	sub	a2,a4,a2
80000a24:	00c73333          	sltu	t1,a4,a2
80000a28:	00d306b3          	add	a3,t1,a3
80000a2c:	00060713          	mv	a4,a2
80000a30:	40d787b3          	sub	a5,a5,a3
		  sub_ddmmss (n1, n0, n1, n0, m1, m0);
80000a34:	40e50733          	sub	a4,a0,a4
80000a38:	00e53533          	sltu	a0,a0,a4
80000a3c:	40f585b3          	sub	a1,a1,a5
80000a40:	40a585b3          	sub	a1,a1,a0
		  rr.s.low = (n1 << b) | (n0 >> bm);
80000a44:	011598b3          	sll	a7,a1,a7
80000a48:	01075733          	srl	a4,a4,a6
		  *rp = rr.ll;
80000a4c:	00e8e533          	or	a0,a7,a4
80000a50:	0105d5b3          	srl	a1,a1,a6
}
80000a54:	00008067          	ret

80000a58 <__adddf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
80000a58:	00100837          	lui	a6,0x100
80000a5c:	fff80813          	add	a6,a6,-1 # fffff <__stack_size+0xfbfff>
{
80000a60:	fe010113          	add	sp,sp,-32
  FP_UNPACK_SEMIRAW_D (A, a);
80000a64:	00b878b3          	and	a7,a6,a1
80000a68:	0145d713          	srl	a4,a1,0x14
80000a6c:	01d55793          	srl	a5,a0,0x1d
  FP_UNPACK_SEMIRAW_D (B, b);
80000a70:	00d87833          	and	a6,a6,a3
{
80000a74:	00912a23          	sw	s1,20(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
80000a78:	7ff77493          	and	s1,a4,2047
80000a7c:	00389713          	sll	a4,a7,0x3
  FP_UNPACK_SEMIRAW_D (B, b);
80000a80:	0146d893          	srl	a7,a3,0x14
80000a84:	00381813          	sll	a6,a6,0x3
{
80000a88:	01212823          	sw	s2,16(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
80000a8c:	00e7e7b3          	or	a5,a5,a4
  FP_UNPACK_SEMIRAW_D (B, b);
80000a90:	7ff8f893          	and	a7,a7,2047
80000a94:	01d65713          	srl	a4,a2,0x1d
{
80000a98:	00112e23          	sw	ra,28(sp)
80000a9c:	00812c23          	sw	s0,24(sp)
80000aa0:	01312623          	sw	s3,12(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
80000aa4:	01f5d913          	srl	s2,a1,0x1f
  FP_UNPACK_SEMIRAW_D (B, b);
80000aa8:	01f6d693          	srl	a3,a3,0x1f
80000aac:	01076733          	or	a4,a4,a6
  FP_UNPACK_SEMIRAW_D (A, a);
80000ab0:	00351513          	sll	a0,a0,0x3
  FP_UNPACK_SEMIRAW_D (B, b);
80000ab4:	00361613          	sll	a2,a2,0x3
  FP_ADD_D (R, A, B);
80000ab8:	41148833          	sub	a6,s1,a7
80000abc:	2ad91a63          	bne	s2,a3,80000d70 <__adddf3+0x318>
80000ac0:	11005c63          	blez	a6,80000bd8 <__adddf3+0x180>
80000ac4:	04089063          	bnez	a7,80000b04 <__adddf3+0xac>
80000ac8:	00c766b3          	or	a3,a4,a2
80000acc:	66068063          	beqz	a3,8000112c <__adddf3+0x6d4>
80000ad0:	fff80593          	add	a1,a6,-1
80000ad4:	02059063          	bnez	a1,80000af4 <__adddf3+0x9c>
80000ad8:	00c50633          	add	a2,a0,a2
80000adc:	00a636b3          	sltu	a3,a2,a0
80000ae0:	00e78733          	add	a4,a5,a4
80000ae4:	00060513          	mv	a0,a2
80000ae8:	00d707b3          	add	a5,a4,a3
80000aec:	00100493          	li	s1,1
80000af0:	06c0006f          	j	80000b5c <__adddf3+0x104>
80000af4:	7ff00693          	li	a3,2047
80000af8:	02d81063          	bne	a6,a3,80000b18 <__adddf3+0xc0>
80000afc:	7ff00493          	li	s1,2047
80000b00:	1f80006f          	j	80000cf8 <__adddf3+0x2a0>
80000b04:	7ff00693          	li	a3,2047
80000b08:	1ed48863          	beq	s1,a3,80000cf8 <__adddf3+0x2a0>
80000b0c:	008006b7          	lui	a3,0x800
80000b10:	00d76733          	or	a4,a4,a3
80000b14:	00080593          	mv	a1,a6
80000b18:	03800693          	li	a3,56
80000b1c:	0ab6c863          	blt	a3,a1,80000bcc <__adddf3+0x174>
80000b20:	01f00693          	li	a3,31
80000b24:	06b6ca63          	blt	a3,a1,80000b98 <__adddf3+0x140>
80000b28:	02000813          	li	a6,32
80000b2c:	40b80833          	sub	a6,a6,a1
80000b30:	010716b3          	sll	a3,a4,a6
80000b34:	00b658b3          	srl	a7,a2,a1
80000b38:	01061833          	sll	a6,a2,a6
80000b3c:	0116e6b3          	or	a3,a3,a7
80000b40:	01003833          	snez	a6,a6
80000b44:	0106e6b3          	or	a3,a3,a6
80000b48:	00b755b3          	srl	a1,a4,a1
80000b4c:	00a68533          	add	a0,a3,a0
80000b50:	00f585b3          	add	a1,a1,a5
80000b54:	00d536b3          	sltu	a3,a0,a3
80000b58:	00d587b3          	add	a5,a1,a3
80000b5c:	00879713          	sll	a4,a5,0x8
80000b60:	18075c63          	bgez	a4,80000cf8 <__adddf3+0x2a0>
80000b64:	00148493          	add	s1,s1,1
80000b68:	7ff00713          	li	a4,2047
80000b6c:	5ae48a63          	beq	s1,a4,80001120 <__adddf3+0x6c8>
80000b70:	ff800737          	lui	a4,0xff800
80000b74:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
80000b78:	00e7f733          	and	a4,a5,a4
80000b7c:	00155793          	srl	a5,a0,0x1
80000b80:	00157513          	and	a0,a0,1
80000b84:	00a7e7b3          	or	a5,a5,a0
80000b88:	01f71513          	sll	a0,a4,0x1f
80000b8c:	00f56533          	or	a0,a0,a5
80000b90:	00175793          	srl	a5,a4,0x1
80000b94:	1640006f          	j	80000cf8 <__adddf3+0x2a0>
80000b98:	fe058693          	add	a3,a1,-32
80000b9c:	02000893          	li	a7,32
80000ba0:	00d756b3          	srl	a3,a4,a3
80000ba4:	00000813          	li	a6,0
80000ba8:	01158863          	beq	a1,a7,80000bb8 <__adddf3+0x160>
80000bac:	04000813          	li	a6,64
80000bb0:	40b80833          	sub	a6,a6,a1
80000bb4:	01071833          	sll	a6,a4,a6
80000bb8:	00c86833          	or	a6,a6,a2
80000bbc:	01003833          	snez	a6,a6
80000bc0:	0106e6b3          	or	a3,a3,a6
80000bc4:	00000593          	li	a1,0
80000bc8:	f85ff06f          	j	80000b4c <__adddf3+0xf4>
80000bcc:	00c766b3          	or	a3,a4,a2
80000bd0:	00d036b3          	snez	a3,a3
80000bd4:	ff1ff06f          	j	80000bc4 <__adddf3+0x16c>
80000bd8:	0c080a63          	beqz	a6,80000cac <__adddf3+0x254>
80000bdc:	409886b3          	sub	a3,a7,s1
80000be0:	02049463          	bnez	s1,80000c08 <__adddf3+0x1b0>
80000be4:	00a7e5b3          	or	a1,a5,a0
80000be8:	50058e63          	beqz	a1,80001104 <__adddf3+0x6ac>
80000bec:	fff68593          	add	a1,a3,-1 # 7fffff <__stack_size+0x7fbfff>
80000bf0:	ee0584e3          	beqz	a1,80000ad8 <__adddf3+0x80>
80000bf4:	7ff00813          	li	a6,2047
80000bf8:	03069263          	bne	a3,a6,80000c1c <__adddf3+0x1c4>
80000bfc:	00070793          	mv	a5,a4
80000c00:	00060513          	mv	a0,a2
80000c04:	ef9ff06f          	j	80000afc <__adddf3+0xa4>
80000c08:	7ff00593          	li	a1,2047
80000c0c:	feb888e3          	beq	a7,a1,80000bfc <__adddf3+0x1a4>
80000c10:	008005b7          	lui	a1,0x800
80000c14:	00b7e7b3          	or	a5,a5,a1
80000c18:	00068593          	mv	a1,a3
80000c1c:	03800693          	li	a3,56
80000c20:	08b6c063          	blt	a3,a1,80000ca0 <__adddf3+0x248>
80000c24:	01f00693          	li	a3,31
80000c28:	04b6c263          	blt	a3,a1,80000c6c <__adddf3+0x214>
80000c2c:	02000813          	li	a6,32
80000c30:	40b80833          	sub	a6,a6,a1
80000c34:	010796b3          	sll	a3,a5,a6
80000c38:	00b55333          	srl	t1,a0,a1
80000c3c:	01051833          	sll	a6,a0,a6
80000c40:	0066e6b3          	or	a3,a3,t1
80000c44:	01003833          	snez	a6,a6
80000c48:	0106e6b3          	or	a3,a3,a6
80000c4c:	00b7d5b3          	srl	a1,a5,a1
80000c50:	00c68633          	add	a2,a3,a2
80000c54:	00e585b3          	add	a1,a1,a4
80000c58:	00d636b3          	sltu	a3,a2,a3
80000c5c:	00060513          	mv	a0,a2
80000c60:	00d587b3          	add	a5,a1,a3
80000c64:	00088493          	mv	s1,a7
80000c68:	ef5ff06f          	j	80000b5c <__adddf3+0x104>
80000c6c:	fe058693          	add	a3,a1,-32 # 7fffe0 <__stack_size+0x7fbfe0>
80000c70:	02000313          	li	t1,32
80000c74:	00d7d6b3          	srl	a3,a5,a3
80000c78:	00000813          	li	a6,0
80000c7c:	00658863          	beq	a1,t1,80000c8c <__adddf3+0x234>
80000c80:	04000813          	li	a6,64
80000c84:	40b80833          	sub	a6,a6,a1
80000c88:	01079833          	sll	a6,a5,a6
80000c8c:	00a86833          	or	a6,a6,a0
80000c90:	01003833          	snez	a6,a6
80000c94:	0106e6b3          	or	a3,a3,a6
80000c98:	00000593          	li	a1,0
80000c9c:	fb5ff06f          	j	80000c50 <__adddf3+0x1f8>
80000ca0:	00a7e6b3          	or	a3,a5,a0
80000ca4:	00d036b3          	snez	a3,a3
80000ca8:	ff1ff06f          	j	80000c98 <__adddf3+0x240>
80000cac:	00148693          	add	a3,s1,1
80000cb0:	7fe6f593          	and	a1,a3,2046
80000cb4:	08059663          	bnez	a1,80000d40 <__adddf3+0x2e8>
80000cb8:	00a7e6b3          	or	a3,a5,a0
80000cbc:	06049263          	bnez	s1,80000d20 <__adddf3+0x2c8>
80000cc0:	44068863          	beqz	a3,80001110 <__adddf3+0x6b8>
80000cc4:	00c766b3          	or	a3,a4,a2
80000cc8:	02068863          	beqz	a3,80000cf8 <__adddf3+0x2a0>
80000ccc:	00c50633          	add	a2,a0,a2
80000cd0:	00a636b3          	sltu	a3,a2,a0
80000cd4:	00e78733          	add	a4,a5,a4
80000cd8:	00d707b3          	add	a5,a4,a3
80000cdc:	00879713          	sll	a4,a5,0x8
80000ce0:	00060513          	mv	a0,a2
80000ce4:	00075a63          	bgez	a4,80000cf8 <__adddf3+0x2a0>
80000ce8:	ff800737          	lui	a4,0xff800
80000cec:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
80000cf0:	00e7f7b3          	and	a5,a5,a4
80000cf4:	00100493          	li	s1,1
  FP_PACK_SEMIRAW_D (r, R);
80000cf8:	00757713          	and	a4,a0,7
80000cfc:	44070863          	beqz	a4,8000114c <__adddf3+0x6f4>
80000d00:	00f57713          	and	a4,a0,15
80000d04:	00400693          	li	a3,4
80000d08:	44d70263          	beq	a4,a3,8000114c <__adddf3+0x6f4>
80000d0c:	00450713          	add	a4,a0,4
80000d10:	00a736b3          	sltu	a3,a4,a0
80000d14:	00d787b3          	add	a5,a5,a3
80000d18:	00070513          	mv	a0,a4
80000d1c:	4300006f          	j	8000114c <__adddf3+0x6f4>
  FP_ADD_D (R, A, B);
80000d20:	ec068ee3          	beqz	a3,80000bfc <__adddf3+0x1a4>
80000d24:	00c76633          	or	a2,a4,a2
80000d28:	dc060ae3          	beqz	a2,80000afc <__adddf3+0xa4>
80000d2c:	00000913          	li	s2,0
80000d30:	004007b7          	lui	a5,0x400
80000d34:	00000513          	li	a0,0
80000d38:	7ff00493          	li	s1,2047
80000d3c:	4100006f          	j	8000114c <__adddf3+0x6f4>
80000d40:	7ff00593          	li	a1,2047
80000d44:	3cb68c63          	beq	a3,a1,8000111c <__adddf3+0x6c4>
80000d48:	00c50633          	add	a2,a0,a2
80000d4c:	00a63533          	sltu	a0,a2,a0
80000d50:	00e78733          	add	a4,a5,a4
80000d54:	00a70733          	add	a4,a4,a0
80000d58:	01f71513          	sll	a0,a4,0x1f
80000d5c:	00165613          	srl	a2,a2,0x1
80000d60:	00c56533          	or	a0,a0,a2
80000d64:	00175793          	srl	a5,a4,0x1
80000d68:	00068493          	mv	s1,a3
80000d6c:	f8dff06f          	j	80000cf8 <__adddf3+0x2a0>
80000d70:	0f005c63          	blez	a6,80000e68 <__adddf3+0x410>
80000d74:	08089e63          	bnez	a7,80000e10 <__adddf3+0x3b8>
80000d78:	00c766b3          	or	a3,a4,a2
80000d7c:	3a068863          	beqz	a3,8000112c <__adddf3+0x6d4>
80000d80:	fff80693          	add	a3,a6,-1
80000d84:	02069063          	bnez	a3,80000da4 <__adddf3+0x34c>
80000d88:	40c50633          	sub	a2,a0,a2
80000d8c:	00c536b3          	sltu	a3,a0,a2
80000d90:	40e78733          	sub	a4,a5,a4
80000d94:	00060513          	mv	a0,a2
80000d98:	40d707b3          	sub	a5,a4,a3
80000d9c:	00100493          	li	s1,1
80000da0:	0540006f          	j	80000df4 <__adddf3+0x39c>
80000da4:	7ff00593          	li	a1,2047
80000da8:	d4b80ae3          	beq	a6,a1,80000afc <__adddf3+0xa4>
80000dac:	03800593          	li	a1,56
80000db0:	0ad5c663          	blt	a1,a3,80000e5c <__adddf3+0x404>
80000db4:	01f00593          	li	a1,31
80000db8:	06d5c863          	blt	a1,a3,80000e28 <__adddf3+0x3d0>
80000dbc:	02000813          	li	a6,32
80000dc0:	40d80833          	sub	a6,a6,a3
80000dc4:	00d658b3          	srl	a7,a2,a3
80000dc8:	010715b3          	sll	a1,a4,a6
80000dcc:	01061833          	sll	a6,a2,a6
80000dd0:	0115e5b3          	or	a1,a1,a7
80000dd4:	01003833          	snez	a6,a6
80000dd8:	0105e633          	or	a2,a1,a6
80000ddc:	00d756b3          	srl	a3,a4,a3
80000de0:	40c50633          	sub	a2,a0,a2
80000de4:	00c53733          	sltu	a4,a0,a2
80000de8:	40d786b3          	sub	a3,a5,a3
80000dec:	00060513          	mv	a0,a2
80000df0:	40e687b3          	sub	a5,a3,a4
80000df4:	00879713          	sll	a4,a5,0x8
80000df8:	f00750e3          	bgez	a4,80000cf8 <__adddf3+0x2a0>
80000dfc:	00800437          	lui	s0,0x800
80000e00:	fff40413          	add	s0,s0,-1 # 7fffff <__stack_size+0x7fbfff>
80000e04:	0087f433          	and	s0,a5,s0
80000e08:	00050993          	mv	s3,a0
80000e0c:	2100006f          	j	8000101c <__adddf3+0x5c4>
80000e10:	7ff00693          	li	a3,2047
80000e14:	eed482e3          	beq	s1,a3,80000cf8 <__adddf3+0x2a0>
80000e18:	008006b7          	lui	a3,0x800
80000e1c:	00d76733          	or	a4,a4,a3
80000e20:	00080693          	mv	a3,a6
80000e24:	f89ff06f          	j	80000dac <__adddf3+0x354>
80000e28:	fe068593          	add	a1,a3,-32 # 7fffe0 <__stack_size+0x7fbfe0>
80000e2c:	02000893          	li	a7,32
80000e30:	00b755b3          	srl	a1,a4,a1
80000e34:	00000813          	li	a6,0
80000e38:	01168863          	beq	a3,a7,80000e48 <__adddf3+0x3f0>
80000e3c:	04000813          	li	a6,64
80000e40:	40d80833          	sub	a6,a6,a3
80000e44:	01071833          	sll	a6,a4,a6
80000e48:	00c86833          	or	a6,a6,a2
80000e4c:	01003833          	snez	a6,a6
80000e50:	0105e633          	or	a2,a1,a6
80000e54:	00000693          	li	a3,0
80000e58:	f89ff06f          	j	80000de0 <__adddf3+0x388>
80000e5c:	00c76633          	or	a2,a4,a2
80000e60:	00c03633          	snez	a2,a2
80000e64:	ff1ff06f          	j	80000e54 <__adddf3+0x3fc>
80000e68:	0e080863          	beqz	a6,80000f58 <__adddf3+0x500>
80000e6c:	40988833          	sub	a6,a7,s1
80000e70:	04049263          	bnez	s1,80000eb4 <__adddf3+0x45c>
80000e74:	00a7e5b3          	or	a1,a5,a0
80000e78:	2a058e63          	beqz	a1,80001134 <__adddf3+0x6dc>
80000e7c:	fff80593          	add	a1,a6,-1
80000e80:	00059e63          	bnez	a1,80000e9c <__adddf3+0x444>
80000e84:	40a60533          	sub	a0,a2,a0
80000e88:	40f70733          	sub	a4,a4,a5
80000e8c:	00a63633          	sltu	a2,a2,a0
80000e90:	40c707b3          	sub	a5,a4,a2
80000e94:	00068913          	mv	s2,a3
80000e98:	f05ff06f          	j	80000d9c <__adddf3+0x344>
80000e9c:	7ff00313          	li	t1,2047
80000ea0:	02681463          	bne	a6,t1,80000ec8 <__adddf3+0x470>
80000ea4:	00070793          	mv	a5,a4
80000ea8:	00060513          	mv	a0,a2
80000eac:	7ff00493          	li	s1,2047
80000eb0:	0d00006f          	j	80000f80 <__adddf3+0x528>
80000eb4:	7ff00593          	li	a1,2047
80000eb8:	feb886e3          	beq	a7,a1,80000ea4 <__adddf3+0x44c>
80000ebc:	008005b7          	lui	a1,0x800
80000ec0:	00b7e7b3          	or	a5,a5,a1
80000ec4:	00080593          	mv	a1,a6
80000ec8:	03800813          	li	a6,56
80000ecc:	08b84063          	blt	a6,a1,80000f4c <__adddf3+0x4f4>
80000ed0:	01f00813          	li	a6,31
80000ed4:	04b84263          	blt	a6,a1,80000f18 <__adddf3+0x4c0>
80000ed8:	02000313          	li	t1,32
80000edc:	40b30333          	sub	t1,t1,a1
80000ee0:	00b55e33          	srl	t3,a0,a1
80000ee4:	00679833          	sll	a6,a5,t1
80000ee8:	00651333          	sll	t1,a0,t1
80000eec:	01c86833          	or	a6,a6,t3
80000ef0:	00603333          	snez	t1,t1
80000ef4:	00686533          	or	a0,a6,t1
80000ef8:	00b7d5b3          	srl	a1,a5,a1
80000efc:	40a60533          	sub	a0,a2,a0
80000f00:	40b705b3          	sub	a1,a4,a1
80000f04:	00a63633          	sltu	a2,a2,a0
80000f08:	40c587b3          	sub	a5,a1,a2
80000f0c:	00088493          	mv	s1,a7
80000f10:	00068913          	mv	s2,a3
80000f14:	ee1ff06f          	j	80000df4 <__adddf3+0x39c>
80000f18:	fe058813          	add	a6,a1,-32 # 7fffe0 <__stack_size+0x7fbfe0>
80000f1c:	02000e13          	li	t3,32
80000f20:	0107d833          	srl	a6,a5,a6
80000f24:	00000313          	li	t1,0
80000f28:	01c58863          	beq	a1,t3,80000f38 <__adddf3+0x4e0>
80000f2c:	04000313          	li	t1,64
80000f30:	40b30333          	sub	t1,t1,a1
80000f34:	00679333          	sll	t1,a5,t1
80000f38:	00a36333          	or	t1,t1,a0
80000f3c:	00603333          	snez	t1,t1
80000f40:	00686533          	or	a0,a6,t1
80000f44:	00000593          	li	a1,0
80000f48:	fb5ff06f          	j	80000efc <__adddf3+0x4a4>
80000f4c:	00a7e533          	or	a0,a5,a0
80000f50:	00a03533          	snez	a0,a0
80000f54:	ff1ff06f          	j	80000f44 <__adddf3+0x4ec>
80000f58:	00148593          	add	a1,s1,1
80000f5c:	7fe5f593          	and	a1,a1,2046
80000f60:	08059663          	bnez	a1,80000fec <__adddf3+0x594>
80000f64:	00a7e833          	or	a6,a5,a0
80000f68:	00c765b3          	or	a1,a4,a2
80000f6c:	06049063          	bnez	s1,80000fcc <__adddf3+0x574>
80000f70:	00081c63          	bnez	a6,80000f88 <__adddf3+0x530>
80000f74:	10058e63          	beqz	a1,80001090 <__adddf3+0x638>
80000f78:	00070793          	mv	a5,a4
80000f7c:	00060513          	mv	a0,a2
80000f80:	00068913          	mv	s2,a3
80000f84:	d75ff06f          	j	80000cf8 <__adddf3+0x2a0>
80000f88:	d60588e3          	beqz	a1,80000cf8 <__adddf3+0x2a0>
80000f8c:	40c50833          	sub	a6,a0,a2
80000f90:	010538b3          	sltu	a7,a0,a6
80000f94:	40e785b3          	sub	a1,a5,a4
80000f98:	411585b3          	sub	a1,a1,a7
80000f9c:	00859893          	sll	a7,a1,0x8
80000fa0:	0008dc63          	bgez	a7,80000fb8 <__adddf3+0x560>
80000fa4:	40a60533          	sub	a0,a2,a0
80000fa8:	40f70733          	sub	a4,a4,a5
80000fac:	00a63633          	sltu	a2,a2,a0
80000fb0:	40c707b3          	sub	a5,a4,a2
80000fb4:	fcdff06f          	j	80000f80 <__adddf3+0x528>
80000fb8:	00b86533          	or	a0,a6,a1
80000fbc:	18050463          	beqz	a0,80001144 <__adddf3+0x6ec>
80000fc0:	00058793          	mv	a5,a1
80000fc4:	00080513          	mv	a0,a6
80000fc8:	d31ff06f          	j	80000cf8 <__adddf3+0x2a0>
80000fcc:	00081c63          	bnez	a6,80000fe4 <__adddf3+0x58c>
80000fd0:	d4058ee3          	beqz	a1,80000d2c <__adddf3+0x2d4>
80000fd4:	00070793          	mv	a5,a4
80000fd8:	00060513          	mv	a0,a2
80000fdc:	00068913          	mv	s2,a3
80000fe0:	b1dff06f          	j	80000afc <__adddf3+0xa4>
80000fe4:	b0058ce3          	beqz	a1,80000afc <__adddf3+0xa4>
80000fe8:	d45ff06f          	j	80000d2c <__adddf3+0x2d4>
80000fec:	40c505b3          	sub	a1,a0,a2
80000ff0:	00b53833          	sltu	a6,a0,a1
80000ff4:	40e78433          	sub	s0,a5,a4
80000ff8:	41040433          	sub	s0,s0,a6
80000ffc:	00841813          	sll	a6,s0,0x8
80001000:	00058993          	mv	s3,a1
80001004:	08085063          	bgez	a6,80001084 <__adddf3+0x62c>
80001008:	40a609b3          	sub	s3,a2,a0
8000100c:	40f70433          	sub	s0,a4,a5
80001010:	01363633          	sltu	a2,a2,s3
80001014:	40c40433          	sub	s0,s0,a2
80001018:	00068913          	mv	s2,a3
8000101c:	06040e63          	beqz	s0,80001098 <__adddf3+0x640>
80001020:	00040513          	mv	a0,s0
80001024:	44c020ef          	jal	80003470 <__clzsi2>
80001028:	ff850693          	add	a3,a0,-8
8000102c:	02000793          	li	a5,32
80001030:	40d787b3          	sub	a5,a5,a3
80001034:	00d41433          	sll	s0,s0,a3
80001038:	00f9d7b3          	srl	a5,s3,a5
8000103c:	0087e7b3          	or	a5,a5,s0
80001040:	00d99433          	sll	s0,s3,a3
80001044:	0a96c463          	blt	a3,s1,800010ec <__adddf3+0x694>
80001048:	409686b3          	sub	a3,a3,s1
8000104c:	00168613          	add	a2,a3,1
80001050:	01f00713          	li	a4,31
80001054:	06c74263          	blt	a4,a2,800010b8 <__adddf3+0x660>
80001058:	02000713          	li	a4,32
8000105c:	40c70733          	sub	a4,a4,a2
80001060:	00e79533          	sll	a0,a5,a4
80001064:	00c456b3          	srl	a3,s0,a2
80001068:	00e41733          	sll	a4,s0,a4
8000106c:	00d56533          	or	a0,a0,a3
80001070:	00e03733          	snez	a4,a4
80001074:	00e56533          	or	a0,a0,a4
80001078:	00c7d7b3          	srl	a5,a5,a2
8000107c:	00000493          	li	s1,0
80001080:	c79ff06f          	j	80000cf8 <__adddf3+0x2a0>
80001084:	0085e5b3          	or	a1,a1,s0
80001088:	f8059ae3          	bnez	a1,8000101c <__adddf3+0x5c4>
8000108c:	00000493          	li	s1,0
80001090:	00000913          	li	s2,0
80001094:	08c0006f          	j	80001120 <__adddf3+0x6c8>
80001098:	00098513          	mv	a0,s3
8000109c:	3d4020ef          	jal	80003470 <__clzsi2>
800010a0:	01850693          	add	a3,a0,24
800010a4:	01f00793          	li	a5,31
800010a8:	f8d7d2e3          	bge	a5,a3,8000102c <__adddf3+0x5d4>
800010ac:	ff850793          	add	a5,a0,-8
800010b0:	00f997b3          	sll	a5,s3,a5
800010b4:	f91ff06f          	j	80001044 <__adddf3+0x5ec>
800010b8:	fe168693          	add	a3,a3,-31
800010bc:	00d7d533          	srl	a0,a5,a3
800010c0:	02000693          	li	a3,32
800010c4:	00000713          	li	a4,0
800010c8:	00d60863          	beq	a2,a3,800010d8 <__adddf3+0x680>
800010cc:	04000713          	li	a4,64
800010d0:	40c70733          	sub	a4,a4,a2
800010d4:	00e79733          	sll	a4,a5,a4
800010d8:	00e46733          	or	a4,s0,a4
800010dc:	00e03733          	snez	a4,a4
800010e0:	00e56533          	or	a0,a0,a4
800010e4:	00000793          	li	a5,0
800010e8:	f95ff06f          	j	8000107c <__adddf3+0x624>
800010ec:	ff800737          	lui	a4,0xff800
800010f0:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
800010f4:	40d484b3          	sub	s1,s1,a3
800010f8:	00e7f7b3          	and	a5,a5,a4
800010fc:	00040513          	mv	a0,s0
80001100:	bf9ff06f          	j	80000cf8 <__adddf3+0x2a0>
80001104:	00070793          	mv	a5,a4
80001108:	00060513          	mv	a0,a2
8000110c:	c5dff06f          	j	80000d68 <__adddf3+0x310>
80001110:	00070793          	mv	a5,a4
80001114:	00060513          	mv	a0,a2
80001118:	be1ff06f          	j	80000cf8 <__adddf3+0x2a0>
8000111c:	7ff00493          	li	s1,2047
80001120:	00000793          	li	a5,0
80001124:	00000513          	li	a0,0
80001128:	0240006f          	j	8000114c <__adddf3+0x6f4>
8000112c:	00080493          	mv	s1,a6
80001130:	bc9ff06f          	j	80000cf8 <__adddf3+0x2a0>
80001134:	00070793          	mv	a5,a4
80001138:	00060513          	mv	a0,a2
8000113c:	00080493          	mv	s1,a6
80001140:	e41ff06f          	j	80000f80 <__adddf3+0x528>
80001144:	00000793          	li	a5,0
80001148:	00000913          	li	s2,0
  FP_PACK_SEMIRAW_D (r, R);
8000114c:	00879713          	sll	a4,a5,0x8
80001150:	00075e63          	bgez	a4,8000116c <__adddf3+0x714>
80001154:	00148493          	add	s1,s1,1
80001158:	7ff00713          	li	a4,2047
8000115c:	08e48263          	beq	s1,a4,800011e0 <__adddf3+0x788>
80001160:	ff800737          	lui	a4,0xff800
80001164:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
80001168:	00e7f7b3          	and	a5,a5,a4
8000116c:	01d79693          	sll	a3,a5,0x1d
80001170:	00355513          	srl	a0,a0,0x3
80001174:	7ff00713          	li	a4,2047
80001178:	00a6e6b3          	or	a3,a3,a0
8000117c:	0037d793          	srl	a5,a5,0x3
80001180:	00e49e63          	bne	s1,a4,8000119c <__adddf3+0x744>
80001184:	00f6e6b3          	or	a3,a3,a5
80001188:	00000793          	li	a5,0
8000118c:	00068863          	beqz	a3,8000119c <__adddf3+0x744>
80001190:	000807b7          	lui	a5,0x80
80001194:	00000693          	li	a3,0
80001198:	00000913          	li	s2,0
8000119c:	01449713          	sll	a4,s1,0x14
800011a0:	7ff00637          	lui	a2,0x7ff00
800011a4:	00c79793          	sll	a5,a5,0xc
800011a8:	00c77733          	and	a4,a4,a2
  FP_HANDLE_EXCEPTIONS;

  return r;
}
800011ac:	01c12083          	lw	ra,28(sp)
800011b0:	01812403          	lw	s0,24(sp)
  FP_PACK_SEMIRAW_D (r, R);
800011b4:	00c7d793          	srl	a5,a5,0xc
800011b8:	00f767b3          	or	a5,a4,a5
800011bc:	01f91713          	sll	a4,s2,0x1f
800011c0:	00e7e633          	or	a2,a5,a4
}
800011c4:	01412483          	lw	s1,20(sp)
800011c8:	01012903          	lw	s2,16(sp)
800011cc:	00c12983          	lw	s3,12(sp)
800011d0:	00068513          	mv	a0,a3
800011d4:	00060593          	mv	a1,a2
800011d8:	02010113          	add	sp,sp,32
800011dc:	00008067          	ret
800011e0:	00000793          	li	a5,0
800011e4:	00000513          	li	a0,0
800011e8:	f85ff06f          	j	8000116c <__adddf3+0x714>

800011ec <__divdf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__divdf3 (DFtype a, DFtype b)
{
800011ec:	fd010113          	add	sp,sp,-48
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
800011f0:	0145d813          	srl	a6,a1,0x14
{
800011f4:	02912223          	sw	s1,36(sp)
800011f8:	03212023          	sw	s2,32(sp)
800011fc:	01312e23          	sw	s3,28(sp)
80001200:	01612823          	sw	s6,16(sp)
80001204:	01712623          	sw	s7,12(sp)
  FP_UNPACK_D (A, a);
80001208:	00c59493          	sll	s1,a1,0xc
{
8000120c:	02112623          	sw	ra,44(sp)
80001210:	02812423          	sw	s0,40(sp)
80001214:	01412c23          	sw	s4,24(sp)
80001218:	01512a23          	sw	s5,20(sp)
  FP_UNPACK_D (A, a);
8000121c:	7ff87813          	and	a6,a6,2047
{
80001220:	00050b13          	mv	s6,a0
80001224:	00060b93          	mv	s7,a2
80001228:	00068913          	mv	s2,a3
  FP_UNPACK_D (A, a);
8000122c:	00c4d493          	srl	s1,s1,0xc
80001230:	01f5d993          	srl	s3,a1,0x1f
80001234:	0a080063          	beqz	a6,800012d4 <__divdf3+0xe8>
80001238:	7ff00793          	li	a5,2047
8000123c:	10f80063          	beq	a6,a5,8000133c <__divdf3+0x150>
80001240:	01d55a13          	srl	s4,a0,0x1d
80001244:	00349493          	sll	s1,s1,0x3
80001248:	009a6a33          	or	s4,s4,s1
8000124c:	008007b7          	lui	a5,0x800
80001250:	00fa6a33          	or	s4,s4,a5
80001254:	00351413          	sll	s0,a0,0x3
80001258:	c0180a93          	add	s5,a6,-1023
8000125c:	00000b13          	li	s6,0
  FP_UNPACK_D (B, b);
80001260:	01495713          	srl	a4,s2,0x14
80001264:	00c91493          	sll	s1,s2,0xc
80001268:	7ff77713          	and	a4,a4,2047
8000126c:	00c4d493          	srl	s1,s1,0xc
80001270:	01f95913          	srl	s2,s2,0x1f
80001274:	10070263          	beqz	a4,80001378 <__divdf3+0x18c>
80001278:	7ff00793          	li	a5,2047
8000127c:	16f70663          	beq	a4,a5,800013e8 <__divdf3+0x1fc>
80001280:	00349493          	sll	s1,s1,0x3
80001284:	01dbd793          	srl	a5,s7,0x1d
80001288:	0097e7b3          	or	a5,a5,s1
8000128c:	008004b7          	lui	s1,0x800
80001290:	0097e4b3          	or	s1,a5,s1
80001294:	003b9f13          	sll	t5,s7,0x3
80001298:	c0170713          	add	a4,a4,-1023
8000129c:	00000793          	li	a5,0
  FP_DIV_D (R, A, B);
800012a0:	40ea8833          	sub	a6,s5,a4
800012a4:	002b1713          	sll	a4,s6,0x2
800012a8:	00f76733          	or	a4,a4,a5
800012ac:	fff70713          	add	a4,a4,-1
800012b0:	00e00693          	li	a3,14
800012b4:	0129c633          	xor	a2,s3,s2
800012b8:	16e6e463          	bltu	a3,a4,80001420 <__divdf3+0x234>
800012bc:	a00006b7          	lui	a3,0xa0000
800012c0:	00271713          	sll	a4,a4,0x2
800012c4:	00068693          	mv	a3,a3
800012c8:	00d70733          	add	a4,a4,a3
800012cc:	00072703          	lw	a4,0(a4)
800012d0:	00070067          	jr	a4
  FP_UNPACK_D (A, a);
800012d4:	00a4ea33          	or	s4,s1,a0
800012d8:	060a0e63          	beqz	s4,80001354 <__divdf3+0x168>
800012dc:	02048e63          	beqz	s1,80001318 <__divdf3+0x12c>
800012e0:	00048513          	mv	a0,s1
800012e4:	18c020ef          	jal	80003470 <__clzsi2>
800012e8:	ff550793          	add	a5,a0,-11
800012ec:	01d00a13          	li	s4,29
800012f0:	ff850713          	add	a4,a0,-8
800012f4:	40fa0a33          	sub	s4,s4,a5
800012f8:	00e494b3          	sll	s1,s1,a4
800012fc:	014b5a33          	srl	s4,s6,s4
80001300:	009a6a33          	or	s4,s4,s1
80001304:	00eb14b3          	sll	s1,s6,a4
80001308:	c0d00813          	li	a6,-1011
8000130c:	40a80ab3          	sub	s5,a6,a0
80001310:	00048413          	mv	s0,s1
80001314:	f49ff06f          	j	8000125c <__divdf3+0x70>
80001318:	158020ef          	jal	80003470 <__clzsi2>
8000131c:	00050a13          	mv	s4,a0
80001320:	015a0793          	add	a5,s4,21
80001324:	01c00713          	li	a4,28
80001328:	02050513          	add	a0,a0,32
8000132c:	fcf750e3          	bge	a4,a5,800012ec <__divdf3+0x100>
80001330:	ff8a0a13          	add	s4,s4,-8
80001334:	014b1a33          	sll	s4,s6,s4
80001338:	fd1ff06f          	j	80001308 <__divdf3+0x11c>
8000133c:	00a4ea33          	or	s4,s1,a0
80001340:	020a1263          	bnez	s4,80001364 <__divdf3+0x178>
80001344:	00000413          	li	s0,0
80001348:	7ff00a93          	li	s5,2047
8000134c:	00200b13          	li	s6,2
80001350:	f11ff06f          	j	80001260 <__divdf3+0x74>
80001354:	00000413          	li	s0,0
80001358:	00000a93          	li	s5,0
8000135c:	00100b13          	li	s6,1
80001360:	f01ff06f          	j	80001260 <__divdf3+0x74>
80001364:	00050413          	mv	s0,a0
80001368:	00048a13          	mv	s4,s1
8000136c:	7ff00a93          	li	s5,2047
80001370:	00300b13          	li	s6,3
80001374:	eedff06f          	j	80001260 <__divdf3+0x74>
  FP_UNPACK_D (B, b);
80001378:	0174ef33          	or	t5,s1,s7
8000137c:	080f0263          	beqz	t5,80001400 <__divdf3+0x214>
80001380:	04048063          	beqz	s1,800013c0 <__divdf3+0x1d4>
80001384:	00048513          	mv	a0,s1
80001388:	0e8020ef          	jal	80003470 <__clzsi2>
8000138c:	ff550713          	add	a4,a0,-11
80001390:	01d00793          	li	a5,29
80001394:	ff850693          	add	a3,a0,-8
80001398:	40e787b3          	sub	a5,a5,a4
8000139c:	00d494b3          	sll	s1,s1,a3
800013a0:	00fbd7b3          	srl	a5,s7,a5
800013a4:	0097e7b3          	or	a5,a5,s1
800013a8:	00db94b3          	sll	s1,s7,a3
800013ac:	c0d00713          	li	a4,-1011
800013b0:	00048f13          	mv	t5,s1
800013b4:	40a70733          	sub	a4,a4,a0
800013b8:	00078493          	mv	s1,a5
800013bc:	ee1ff06f          	j	8000129c <__divdf3+0xb0>
800013c0:	000b8513          	mv	a0,s7
800013c4:	0ac020ef          	jal	80003470 <__clzsi2>
800013c8:	00050793          	mv	a5,a0
800013cc:	01578713          	add	a4,a5,21 # 800015 <__stack_size+0x7fc015>
800013d0:	01c00693          	li	a3,28
800013d4:	02050513          	add	a0,a0,32
800013d8:	fae6dce3          	bge	a3,a4,80001390 <__divdf3+0x1a4>
800013dc:	ff878793          	add	a5,a5,-8
800013e0:	00fb97b3          	sll	a5,s7,a5
800013e4:	fc9ff06f          	j	800013ac <__divdf3+0x1c0>
800013e8:	0174ef33          	or	t5,s1,s7
800013ec:	020f1263          	bnez	t5,80001410 <__divdf3+0x224>
800013f0:	00000493          	li	s1,0
800013f4:	7ff00713          	li	a4,2047
800013f8:	00200793          	li	a5,2
800013fc:	ea5ff06f          	j	800012a0 <__divdf3+0xb4>
80001400:	00000493          	li	s1,0
80001404:	00000713          	li	a4,0
80001408:	00100793          	li	a5,1
8000140c:	e95ff06f          	j	800012a0 <__divdf3+0xb4>
80001410:	000b8f13          	mv	t5,s7
80001414:	7ff00713          	li	a4,2047
80001418:	00300793          	li	a5,3
8000141c:	e85ff06f          	j	800012a0 <__divdf3+0xb4>
  FP_DIV_D (R, A, B);
80001420:	0144e663          	bltu	s1,s4,8000142c <__divdf3+0x240>
80001424:	349a1c63          	bne	s4,s1,8000177c <__divdf3+0x590>
80001428:	35e46a63          	bltu	s0,t5,8000177c <__divdf3+0x590>
8000142c:	01fa1693          	sll	a3,s4,0x1f
80001430:	00145793          	srl	a5,s0,0x1
80001434:	01f41713          	sll	a4,s0,0x1f
80001438:	001a5a13          	srl	s4,s4,0x1
8000143c:	00f6e433          	or	s0,a3,a5
80001440:	00849893          	sll	a7,s1,0x8
80001444:	018f5593          	srl	a1,t5,0x18
80001448:	0115e5b3          	or	a1,a1,a7
8000144c:	0108d893          	srl	a7,a7,0x10
80001450:	031a5eb3          	divu	t4,s4,a7
80001454:	01059313          	sll	t1,a1,0x10
80001458:	01035313          	srl	t1,t1,0x10
8000145c:	01045793          	srl	a5,s0,0x10
80001460:	008f1513          	sll	a0,t5,0x8
80001464:	031a7a33          	remu	s4,s4,a7
80001468:	000e8693          	mv	a3,t4
8000146c:	03d30e33          	mul	t3,t1,t4
80001470:	010a1a13          	sll	s4,s4,0x10
80001474:	0147e7b3          	or	a5,a5,s4
80001478:	01c7fe63          	bgeu	a5,t3,80001494 <__divdf3+0x2a8>
8000147c:	00f587b3          	add	a5,a1,a5
80001480:	fffe8693          	add	a3,t4,-1
80001484:	00b7e863          	bltu	a5,a1,80001494 <__divdf3+0x2a8>
80001488:	01c7f663          	bgeu	a5,t3,80001494 <__divdf3+0x2a8>
8000148c:	ffee8693          	add	a3,t4,-2
80001490:	00b787b3          	add	a5,a5,a1
80001494:	41c787b3          	sub	a5,a5,t3
80001498:	0317df33          	divu	t5,a5,a7
8000149c:	01041413          	sll	s0,s0,0x10
800014a0:	01045413          	srl	s0,s0,0x10
800014a4:	0317f7b3          	remu	a5,a5,a7
800014a8:	000f0e13          	mv	t3,t5
800014ac:	03e30eb3          	mul	t4,t1,t5
800014b0:	01079793          	sll	a5,a5,0x10
800014b4:	00f467b3          	or	a5,s0,a5
800014b8:	01d7fe63          	bgeu	a5,t4,800014d4 <__divdf3+0x2e8>
800014bc:	00f587b3          	add	a5,a1,a5
800014c0:	ffff0e13          	add	t3,t5,-1
800014c4:	00b7e863          	bltu	a5,a1,800014d4 <__divdf3+0x2e8>
800014c8:	01d7f663          	bgeu	a5,t4,800014d4 <__divdf3+0x2e8>
800014cc:	ffef0e13          	add	t3,t5,-2
800014d0:	00b787b3          	add	a5,a5,a1
800014d4:	01069693          	sll	a3,a3,0x10
800014d8:	00010437          	lui	s0,0x10
800014dc:	01c6e2b3          	or	t0,a3,t3
800014e0:	fff40e13          	add	t3,s0,-1 # ffff <__stack_size+0xbfff>
800014e4:	01c2f6b3          	and	a3,t0,t3
800014e8:	0102df93          	srl	t6,t0,0x10
800014ec:	01c57e33          	and	t3,a0,t3
800014f0:	41d787b3          	sub	a5,a5,t4
800014f4:	01055e93          	srl	t4,a0,0x10
800014f8:	02de03b3          	mul	t2,t3,a3
800014fc:	03cf84b3          	mul	s1,t6,t3
80001500:	02de86b3          	mul	a3,t4,a3
80001504:	00968f33          	add	t5,a3,s1
80001508:	0103d693          	srl	a3,t2,0x10
8000150c:	01e686b3          	add	a3,a3,t5
80001510:	03df8fb3          	mul	t6,t6,t4
80001514:	0096f463          	bgeu	a3,s1,8000151c <__divdf3+0x330>
80001518:	008f8fb3          	add	t6,t6,s0
8000151c:	0106df13          	srl	t5,a3,0x10
80001520:	01ff0f33          	add	t5,t5,t6
80001524:	00010fb7          	lui	t6,0x10
80001528:	ffff8f93          	add	t6,t6,-1 # ffff <__stack_size+0xbfff>
8000152c:	01f6f6b3          	and	a3,a3,t6
80001530:	01069693          	sll	a3,a3,0x10
80001534:	01f3f3b3          	and	t2,t2,t6
80001538:	007686b3          	add	a3,a3,t2
8000153c:	01e7e863          	bltu	a5,t5,8000154c <__divdf3+0x360>
80001540:	00028493          	mv	s1,t0
80001544:	05e79863          	bne	a5,t5,80001594 <__divdf3+0x3a8>
80001548:	04d77663          	bgeu	a4,a3,80001594 <__divdf3+0x3a8>
8000154c:	00a70fb3          	add	t6,a4,a0
80001550:	00efb3b3          	sltu	t2,t6,a4
80001554:	00b38433          	add	s0,t2,a1
80001558:	008787b3          	add	a5,a5,s0
8000155c:	fff28493          	add	s1,t0,-1
80001560:	000f8713          	mv	a4,t6
80001564:	00f5e663          	bltu	a1,a5,80001570 <__divdf3+0x384>
80001568:	02f59663          	bne	a1,a5,80001594 <__divdf3+0x3a8>
8000156c:	02039463          	bnez	t2,80001594 <__divdf3+0x3a8>
80001570:	01e7e663          	bltu	a5,t5,8000157c <__divdf3+0x390>
80001574:	02ff1063          	bne	t5,a5,80001594 <__divdf3+0x3a8>
80001578:	00dffe63          	bgeu	t6,a3,80001594 <__divdf3+0x3a8>
8000157c:	01f50fb3          	add	t6,a0,t6
80001580:	000f8713          	mv	a4,t6
80001584:	00afbfb3          	sltu	t6,t6,a0
80001588:	00bf8fb3          	add	t6,t6,a1
8000158c:	ffe28493          	add	s1,t0,-2
80001590:	01f787b3          	add	a5,a5,t6
80001594:	40d706b3          	sub	a3,a4,a3
80001598:	41e787b3          	sub	a5,a5,t5
8000159c:	00d73733          	sltu	a4,a4,a3
800015a0:	40e787b3          	sub	a5,a5,a4
800015a4:	fff00f13          	li	t5,-1
800015a8:	12f58663          	beq	a1,a5,800016d4 <__divdf3+0x4e8>
800015ac:	0317dfb3          	divu	t6,a5,a7
800015b0:	0106d713          	srl	a4,a3,0x10
800015b4:	0317f7b3          	remu	a5,a5,a7
800015b8:	03f30f33          	mul	t5,t1,t6
800015bc:	01079793          	sll	a5,a5,0x10
800015c0:	00f767b3          	or	a5,a4,a5
800015c4:	000f8713          	mv	a4,t6
800015c8:	01e7fe63          	bgeu	a5,t5,800015e4 <__divdf3+0x3f8>
800015cc:	00f587b3          	add	a5,a1,a5
800015d0:	ffff8713          	add	a4,t6,-1
800015d4:	00b7e863          	bltu	a5,a1,800015e4 <__divdf3+0x3f8>
800015d8:	01e7f663          	bgeu	a5,t5,800015e4 <__divdf3+0x3f8>
800015dc:	ffef8713          	add	a4,t6,-2
800015e0:	00b787b3          	add	a5,a5,a1
800015e4:	41e787b3          	sub	a5,a5,t5
800015e8:	0317df33          	divu	t5,a5,a7
800015ec:	01069693          	sll	a3,a3,0x10
800015f0:	0106d693          	srl	a3,a3,0x10
800015f4:	0317f7b3          	remu	a5,a5,a7
800015f8:	000f0893          	mv	a7,t5
800015fc:	03e30333          	mul	t1,t1,t5
80001600:	01079793          	sll	a5,a5,0x10
80001604:	00f6e7b3          	or	a5,a3,a5
80001608:	0067fe63          	bgeu	a5,t1,80001624 <__divdf3+0x438>
8000160c:	00f587b3          	add	a5,a1,a5
80001610:	ffff0893          	add	a7,t5,-1
80001614:	00b7e863          	bltu	a5,a1,80001624 <__divdf3+0x438>
80001618:	0067f663          	bgeu	a5,t1,80001624 <__divdf3+0x438>
8000161c:	ffef0893          	add	a7,t5,-2
80001620:	00b787b3          	add	a5,a5,a1
80001624:	01071693          	sll	a3,a4,0x10
80001628:	0116e6b3          	or	a3,a3,a7
8000162c:	01069713          	sll	a4,a3,0x10
80001630:	01075713          	srl	a4,a4,0x10
80001634:	406787b3          	sub	a5,a5,t1
80001638:	0106d313          	srl	t1,a3,0x10
8000163c:	03c70f33          	mul	t5,a4,t3
80001640:	03c30e33          	mul	t3,t1,t3
80001644:	026e8333          	mul	t1,t4,t1
80001648:	02ee8eb3          	mul	t4,t4,a4
8000164c:	010f5713          	srl	a4,t5,0x10
80001650:	01ce8eb3          	add	t4,t4,t3
80001654:	01d70733          	add	a4,a4,t4
80001658:	01c77663          	bgeu	a4,t3,80001664 <__divdf3+0x478>
8000165c:	000108b7          	lui	a7,0x10
80001660:	01130333          	add	t1,t1,a7
80001664:	01075893          	srl	a7,a4,0x10
80001668:	006888b3          	add	a7,a7,t1
8000166c:	00010337          	lui	t1,0x10
80001670:	fff30313          	add	t1,t1,-1 # ffff <__stack_size+0xbfff>
80001674:	00677733          	and	a4,a4,t1
80001678:	01071713          	sll	a4,a4,0x10
8000167c:	006f7f33          	and	t5,t5,t1
80001680:	01e70733          	add	a4,a4,t5
80001684:	0117e863          	bltu	a5,a7,80001694 <__divdf3+0x4a8>
80001688:	23179c63          	bne	a5,a7,800018c0 <__divdf3+0x6d4>
8000168c:	00068f13          	mv	t5,a3
80001690:	04070263          	beqz	a4,800016d4 <__divdf3+0x4e8>
80001694:	00f587b3          	add	a5,a1,a5
80001698:	fff68f13          	add	t5,a3,-1 # 9fffffff <Func_2+0x1fffa343>
8000169c:	00078313          	mv	t1,a5
800016a0:	02b7e463          	bltu	a5,a1,800016c8 <__divdf3+0x4dc>
800016a4:	0117e663          	bltu	a5,a7,800016b0 <__divdf3+0x4c4>
800016a8:	21179a63          	bne	a5,a7,800018bc <__divdf3+0x6d0>
800016ac:	02e57063          	bgeu	a0,a4,800016cc <__divdf3+0x4e0>
800016b0:	ffe68f13          	add	t5,a3,-2
800016b4:	00151693          	sll	a3,a0,0x1
800016b8:	00a6b333          	sltu	t1,a3,a0
800016bc:	00b30333          	add	t1,t1,a1
800016c0:	00678333          	add	t1,a5,t1
800016c4:	00068513          	mv	a0,a3
800016c8:	01131463          	bne	t1,a7,800016d0 <__divdf3+0x4e4>
800016cc:	00a70463          	beq	a4,a0,800016d4 <__divdf3+0x4e8>
800016d0:	001f6f13          	or	t5,t5,1
  FP_PACK_D (r, R);
800016d4:	3ff80713          	add	a4,a6,1023
800016d8:	10e05263          	blez	a4,800017dc <__divdf3+0x5f0>
800016dc:	007f7793          	and	a5,t5,7
800016e0:	02078063          	beqz	a5,80001700 <__divdf3+0x514>
800016e4:	00ff7793          	and	a5,t5,15
800016e8:	00400693          	li	a3,4
800016ec:	00d78a63          	beq	a5,a3,80001700 <__divdf3+0x514>
800016f0:	004f0793          	add	a5,t5,4
800016f4:	01e7b6b3          	sltu	a3,a5,t5
800016f8:	00d484b3          	add	s1,s1,a3
800016fc:	00078f13          	mv	t5,a5
80001700:	00749793          	sll	a5,s1,0x7
80001704:	0007da63          	bgez	a5,80001718 <__divdf3+0x52c>
80001708:	ff0007b7          	lui	a5,0xff000
8000170c:	fff78793          	add	a5,a5,-1 # feffffff <__stack_base+0x3effffff>
80001710:	00f4f4b3          	and	s1,s1,a5
80001714:	40080713          	add	a4,a6,1024
80001718:	7fe00793          	li	a5,2046
8000171c:	08e7ca63          	blt	a5,a4,800017b0 <__divdf3+0x5c4>
80001720:	003f5f13          	srl	t5,t5,0x3
80001724:	01d49793          	sll	a5,s1,0x1d
80001728:	01e7ef33          	or	t5,a5,t5
8000172c:	0034d513          	srl	a0,s1,0x3
80001730:	00c51513          	sll	a0,a0,0xc
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80001734:	02c12083          	lw	ra,44(sp)
80001738:	02812403          	lw	s0,40(sp)
  FP_PACK_D (r, R);
8000173c:	00c55513          	srl	a0,a0,0xc
80001740:	01471713          	sll	a4,a4,0x14
80001744:	00a76733          	or	a4,a4,a0
80001748:	01f61613          	sll	a2,a2,0x1f
8000174c:	00c767b3          	or	a5,a4,a2
}
80001750:	02412483          	lw	s1,36(sp)
80001754:	02012903          	lw	s2,32(sp)
80001758:	01c12983          	lw	s3,28(sp)
8000175c:	01812a03          	lw	s4,24(sp)
80001760:	01412a83          	lw	s5,20(sp)
80001764:	01012b03          	lw	s6,16(sp)
80001768:	00c12b83          	lw	s7,12(sp)
8000176c:	000f0513          	mv	a0,t5
80001770:	00078593          	mv	a1,a5
80001774:	03010113          	add	sp,sp,48
80001778:	00008067          	ret
  FP_DIV_D (R, A, B);
8000177c:	fff80813          	add	a6,a6,-1
80001780:	00000713          	li	a4,0
80001784:	cbdff06f          	j	80001440 <__divdf3+0x254>
  FP_UNPACK_D (A, a);
80001788:	00098613          	mv	a2,s3
  FP_DIV_D (R, A, B);
8000178c:	000a0493          	mv	s1,s4
80001790:	00040f13          	mv	t5,s0
80001794:	000b0793          	mv	a5,s6
  FP_PACK_D (r, R);
80001798:	00300713          	li	a4,3
8000179c:	0ee78863          	beq	a5,a4,8000188c <__divdf3+0x6a0>
800017a0:	00100713          	li	a4,1
800017a4:	0ee78e63          	beq	a5,a4,800018a0 <__divdf3+0x6b4>
800017a8:	00200713          	li	a4,2
800017ac:	f2e794e3          	bne	a5,a4,800016d4 <__divdf3+0x4e8>
800017b0:	00000513          	li	a0,0
800017b4:	00000f13          	li	t5,0
800017b8:	7ff00713          	li	a4,2047
800017bc:	f75ff06f          	j	80001730 <__divdf3+0x544>
  FP_UNPACK_D (B, b);
800017c0:	00090613          	mv	a2,s2
  FP_DIV_D (R, A, B);
800017c4:	fd5ff06f          	j	80001798 <__divdf3+0x5ac>
800017c8:	000804b7          	lui	s1,0x80
800017cc:	00000f13          	li	t5,0
800017d0:	00000613          	li	a2,0
800017d4:	00300793          	li	a5,3
800017d8:	fc1ff06f          	j	80001798 <__divdf3+0x5ac>
  FP_PACK_D (r, R);
800017dc:	00100513          	li	a0,1
800017e0:	40e50533          	sub	a0,a0,a4
800017e4:	03800793          	li	a5,56
800017e8:	0aa7cc63          	blt	a5,a0,800018a0 <__divdf3+0x6b4>
800017ec:	01f00793          	li	a5,31
800017f0:	06a7c463          	blt	a5,a0,80001858 <__divdf3+0x66c>
800017f4:	41e80813          	add	a6,a6,1054
800017f8:	010497b3          	sll	a5,s1,a6
800017fc:	00af5733          	srl	a4,t5,a0
80001800:	010f1833          	sll	a6,t5,a6
80001804:	00e7e7b3          	or	a5,a5,a4
80001808:	01003833          	snez	a6,a6
8000180c:	0107e7b3          	or	a5,a5,a6
80001810:	00a4d533          	srl	a0,s1,a0
80001814:	0077f713          	and	a4,a5,7
80001818:	02070063          	beqz	a4,80001838 <__divdf3+0x64c>
8000181c:	00f7f713          	and	a4,a5,15
80001820:	00400693          	li	a3,4
80001824:	00d70a63          	beq	a4,a3,80001838 <__divdf3+0x64c>
80001828:	00478713          	add	a4,a5,4
8000182c:	00f736b3          	sltu	a3,a4,a5
80001830:	00d50533          	add	a0,a0,a3
80001834:	00070793          	mv	a5,a4
80001838:	00851713          	sll	a4,a0,0x8
8000183c:	06074863          	bltz	a4,800018ac <__divdf3+0x6c0>
80001840:	01d51f13          	sll	t5,a0,0x1d
80001844:	0037d793          	srl	a5,a5,0x3
80001848:	00ff6f33          	or	t5,t5,a5
8000184c:	00355513          	srl	a0,a0,0x3
80001850:	00000713          	li	a4,0
80001854:	eddff06f          	j	80001730 <__divdf3+0x544>
80001858:	fe100793          	li	a5,-31
8000185c:	40e787b3          	sub	a5,a5,a4
80001860:	02000693          	li	a3,32
80001864:	00f4d7b3          	srl	a5,s1,a5
80001868:	00000713          	li	a4,0
8000186c:	00d50663          	beq	a0,a3,80001878 <__divdf3+0x68c>
80001870:	43e80713          	add	a4,a6,1086
80001874:	00e49733          	sll	a4,s1,a4
80001878:	01e76733          	or	a4,a4,t5
8000187c:	00e03733          	snez	a4,a4
80001880:	00e7e7b3          	or	a5,a5,a4
80001884:	00000513          	li	a0,0
80001888:	f8dff06f          	j	80001814 <__divdf3+0x628>
8000188c:	00080537          	lui	a0,0x80
80001890:	00000f13          	li	t5,0
80001894:	7ff00713          	li	a4,2047
80001898:	00000613          	li	a2,0
8000189c:	e95ff06f          	j	80001730 <__divdf3+0x544>
800018a0:	00000513          	li	a0,0
800018a4:	00000f13          	li	t5,0
800018a8:	fa9ff06f          	j	80001850 <__divdf3+0x664>
800018ac:	00000513          	li	a0,0
800018b0:	00000f13          	li	t5,0
800018b4:	00100713          	li	a4,1
800018b8:	e79ff06f          	j	80001730 <__divdf3+0x544>
  FP_DIV_D (R, A, B);
800018bc:	000f0693          	mv	a3,t5
800018c0:	00068f13          	mv	t5,a3
800018c4:	e0dff06f          	j	800016d0 <__divdf3+0x4e4>

800018c8 <__eqdf2>:
  FP_DECL_D (A);
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
800018c8:	0145d713          	srl	a4,a1,0x14
800018cc:	001007b7          	lui	a5,0x100
800018d0:	fff78793          	add	a5,a5,-1 # fffff <__stack_size+0xfbfff>
  FP_UNPACK_RAW_D (B, b);
800018d4:	0146d813          	srl	a6,a3,0x14
{
800018d8:	00050313          	mv	t1,a0
800018dc:	00050e93          	mv	t4,a0
  FP_UNPACK_RAW_D (A, a);
800018e0:	7ff77713          	and	a4,a4,2047
  FP_CMP_EQ_D (r, A, B, 1);
800018e4:	7ff00513          	li	a0,2047
  FP_UNPACK_RAW_D (A, a);
800018e8:	00b7f8b3          	and	a7,a5,a1
800018ec:	00060f13          	mv	t5,a2
  FP_UNPACK_RAW_D (B, b);
800018f0:	00d7f7b3          	and	a5,a5,a3
  FP_UNPACK_RAW_D (A, a);
800018f4:	01f5d593          	srl	a1,a1,0x1f
  FP_UNPACK_RAW_D (B, b);
800018f8:	7ff87813          	and	a6,a6,2047
800018fc:	01f6d693          	srl	a3,a3,0x1f
  FP_CMP_EQ_D (r, A, B, 1);
80001900:	00a71c63          	bne	a4,a0,80001918 <__eqdf2+0x50>
80001904:	0068ee33          	or	t3,a7,t1
80001908:	00100513          	li	a0,1
8000190c:	000e1463          	bnez	t3,80001914 <__eqdf2+0x4c>
80001910:	00e80663          	beq	a6,a4,8000191c <__eqdf2+0x54>
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80001914:	00008067          	ret
  FP_CMP_EQ_D (r, A, B, 1);
80001918:	00a81863          	bne	a6,a0,80001928 <__eqdf2+0x60>
8000191c:	00c7e633          	or	a2,a5,a2
80001920:	00100513          	li	a0,1
80001924:	fe0618e3          	bnez	a2,80001914 <__eqdf2+0x4c>
80001928:	00100513          	li	a0,1
8000192c:	ff0714e3          	bne	a4,a6,80001914 <__eqdf2+0x4c>
80001930:	fef892e3          	bne	a7,a5,80001914 <__eqdf2+0x4c>
80001934:	ffee90e3          	bne	t4,t5,80001914 <__eqdf2+0x4c>
80001938:	00d58a63          	beq	a1,a3,8000194c <__eqdf2+0x84>
8000193c:	fc071ce3          	bnez	a4,80001914 <__eqdf2+0x4c>
80001940:	0068e8b3          	or	a7,a7,t1
80001944:	01103533          	snez	a0,a7
80001948:	00008067          	ret
8000194c:	00000513          	li	a0,0
80001950:	00008067          	ret

80001954 <__gedf2>:
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
  FP_UNPACK_RAW_D (B, b);
80001954:	0146d793          	srl	a5,a3,0x14
  FP_UNPACK_RAW_D (A, a);
80001958:	0145d893          	srl	a7,a1,0x14
8000195c:	00100737          	lui	a4,0x100
80001960:	fff70713          	add	a4,a4,-1 # fffff <__stack_size+0xfbfff>
{
80001964:	00050813          	mv	a6,a0
80001968:	00050e13          	mv	t3,a0
  FP_UNPACK_RAW_D (A, a);
8000196c:	7ff8f893          	and	a7,a7,2047
  FP_UNPACK_RAW_D (B, b);
80001970:	7ff7f513          	and	a0,a5,2047
  FP_CMP_D (r, A, B, -2, 2);
80001974:	7ff00793          	li	a5,2047
  FP_UNPACK_RAW_D (A, a);
80001978:	00b77333          	and	t1,a4,a1
8000197c:	00060e93          	mv	t4,a2
  FP_UNPACK_RAW_D (B, b);
80001980:	00d77733          	and	a4,a4,a3
  FP_UNPACK_RAW_D (A, a);
80001984:	01f5d593          	srl	a1,a1,0x1f
  FP_UNPACK_RAW_D (B, b);
80001988:	01f6d693          	srl	a3,a3,0x1f
  FP_CMP_D (r, A, B, -2, 2);
8000198c:	00f89663          	bne	a7,a5,80001998 <__gedf2+0x44>
80001990:	010367b3          	or	a5,t1,a6
80001994:	06079c63          	bnez	a5,80001a0c <__gedf2+0xb8>
80001998:	7ff00793          	li	a5,2047
8000199c:	00f51663          	bne	a0,a5,800019a8 <__gedf2+0x54>
800019a0:	00c767b3          	or	a5,a4,a2
800019a4:	06079463          	bnez	a5,80001a0c <__gedf2+0xb8>
800019a8:	00000793          	li	a5,0
800019ac:	00089663          	bnez	a7,800019b8 <__gedf2+0x64>
800019b0:	01036833          	or	a6,t1,a6
800019b4:	00183793          	seqz	a5,a6
800019b8:	04051e63          	bnez	a0,80001a14 <__gedf2+0xc0>
800019bc:	00c76633          	or	a2,a4,a2
800019c0:	00078c63          	beqz	a5,800019d8 <__gedf2+0x84>
800019c4:	02060063          	beqz	a2,800019e4 <__gedf2+0x90>
800019c8:	00100513          	li	a0,1
800019cc:	00069c63          	bnez	a3,800019e4 <__gedf2+0x90>
800019d0:	fff00513          	li	a0,-1
800019d4:	00008067          	ret
800019d8:	04061063          	bnez	a2,80001a18 <__gedf2+0xc4>
800019dc:	fff00513          	li	a0,-1
800019e0:	04058463          	beqz	a1,80001a28 <__gedf2+0xd4>
  FP_HANDLE_EXCEPTIONS;

  return r;
}
800019e4:	00008067          	ret
  FP_CMP_D (r, A, B, -2, 2);
800019e8:	fea8c0e3          	blt	a7,a0,800019c8 <__gedf2+0x74>
800019ec:	fe6768e3          	bltu	a4,t1,800019dc <__gedf2+0x88>
800019f0:	00e31863          	bne	t1,a4,80001a00 <__gedf2+0xac>
800019f4:	ffcee4e3          	bltu	t4,t3,800019dc <__gedf2+0x88>
800019f8:	00000513          	li	a0,0
800019fc:	ffde74e3          	bgeu	t3,t4,800019e4 <__gedf2+0x90>
80001a00:	00100513          	li	a0,1
80001a04:	fe0590e3          	bnez	a1,800019e4 <__gedf2+0x90>
80001a08:	fc9ff06f          	j	800019d0 <__gedf2+0x7c>
80001a0c:	ffe00513          	li	a0,-2
80001a10:	00008067          	ret
80001a14:	fa079ae3          	bnez	a5,800019c8 <__gedf2+0x74>
80001a18:	fcb692e3          	bne	a3,a1,800019dc <__gedf2+0x88>
80001a1c:	fd1556e3          	bge	a0,a7,800019e8 <__gedf2+0x94>
80001a20:	fff00513          	li	a0,-1
80001a24:	fc0690e3          	bnez	a3,800019e4 <__gedf2+0x90>
80001a28:	00100513          	li	a0,1
80001a2c:	00008067          	ret

80001a30 <__ledf2>:
  FP_DECL_D (B);
  CMPtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
  FP_UNPACK_RAW_D (B, b);
80001a30:	0146d793          	srl	a5,a3,0x14
  FP_UNPACK_RAW_D (A, a);
80001a34:	0145d893          	srl	a7,a1,0x14
80001a38:	00100737          	lui	a4,0x100
80001a3c:	fff70713          	add	a4,a4,-1 # fffff <__stack_size+0xfbfff>
{
80001a40:	00050813          	mv	a6,a0
80001a44:	00050e13          	mv	t3,a0
  FP_UNPACK_RAW_D (A, a);
80001a48:	7ff8f893          	and	a7,a7,2047
  FP_UNPACK_RAW_D (B, b);
80001a4c:	7ff7f513          	and	a0,a5,2047
  FP_CMP_D (r, A, B, 2, 2);
80001a50:	7ff00793          	li	a5,2047
  FP_UNPACK_RAW_D (A, a);
80001a54:	00b77333          	and	t1,a4,a1
80001a58:	00060e93          	mv	t4,a2
  FP_UNPACK_RAW_D (B, b);
80001a5c:	00d77733          	and	a4,a4,a3
  FP_UNPACK_RAW_D (A, a);
80001a60:	01f5d593          	srl	a1,a1,0x1f
  FP_UNPACK_RAW_D (B, b);
80001a64:	01f6d693          	srl	a3,a3,0x1f
  FP_CMP_D (r, A, B, 2, 2);
80001a68:	00f89663          	bne	a7,a5,80001a74 <__ledf2+0x44>
80001a6c:	010367b3          	or	a5,t1,a6
80001a70:	06079c63          	bnez	a5,80001ae8 <__ledf2+0xb8>
80001a74:	7ff00793          	li	a5,2047
80001a78:	00f51663          	bne	a0,a5,80001a84 <__ledf2+0x54>
80001a7c:	00c767b3          	or	a5,a4,a2
80001a80:	06079463          	bnez	a5,80001ae8 <__ledf2+0xb8>
80001a84:	00000793          	li	a5,0
80001a88:	00089663          	bnez	a7,80001a94 <__ledf2+0x64>
80001a8c:	01036833          	or	a6,t1,a6
80001a90:	00183793          	seqz	a5,a6
80001a94:	04051e63          	bnez	a0,80001af0 <__ledf2+0xc0>
80001a98:	00c76633          	or	a2,a4,a2
80001a9c:	00078c63          	beqz	a5,80001ab4 <__ledf2+0x84>
80001aa0:	02060063          	beqz	a2,80001ac0 <__ledf2+0x90>
80001aa4:	00100513          	li	a0,1
80001aa8:	00069c63          	bnez	a3,80001ac0 <__ledf2+0x90>
80001aac:	fff00513          	li	a0,-1
80001ab0:	00008067          	ret
80001ab4:	04061063          	bnez	a2,80001af4 <__ledf2+0xc4>
80001ab8:	fff00513          	li	a0,-1
80001abc:	04058463          	beqz	a1,80001b04 <__ledf2+0xd4>
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80001ac0:	00008067          	ret
  FP_CMP_D (r, A, B, 2, 2);
80001ac4:	fea8c0e3          	blt	a7,a0,80001aa4 <__ledf2+0x74>
80001ac8:	fe6768e3          	bltu	a4,t1,80001ab8 <__ledf2+0x88>
80001acc:	00e31863          	bne	t1,a4,80001adc <__ledf2+0xac>
80001ad0:	ffcee4e3          	bltu	t4,t3,80001ab8 <__ledf2+0x88>
80001ad4:	00000513          	li	a0,0
80001ad8:	ffde74e3          	bgeu	t3,t4,80001ac0 <__ledf2+0x90>
80001adc:	00100513          	li	a0,1
80001ae0:	fe0590e3          	bnez	a1,80001ac0 <__ledf2+0x90>
80001ae4:	fc9ff06f          	j	80001aac <__ledf2+0x7c>
80001ae8:	00200513          	li	a0,2
80001aec:	00008067          	ret
80001af0:	fa079ae3          	bnez	a5,80001aa4 <__ledf2+0x74>
80001af4:	fcb692e3          	bne	a3,a1,80001ab8 <__ledf2+0x88>
80001af8:	fd1556e3          	bge	a0,a7,80001ac4 <__ledf2+0x94>
80001afc:	fff00513          	li	a0,-1
80001b00:	fc0690e3          	bnez	a3,80001ac0 <__ledf2+0x90>
80001b04:	00100513          	li	a0,1
80001b08:	00008067          	ret

80001b0c <__muldf3>:
#include "soft-fp.h"
#include "double.h"

DFtype
__muldf3 (DFtype a, DFtype b)
{
80001b0c:	fd010113          	add	sp,sp,-48
80001b10:	01512a23          	sw	s5,20(sp)
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_D (A, a);
80001b14:	0145da93          	srl	s5,a1,0x14
{
80001b18:	02812423          	sw	s0,40(sp)
80001b1c:	02912223          	sw	s1,36(sp)
80001b20:	01312e23          	sw	s3,28(sp)
80001b24:	01412c23          	sw	s4,24(sp)
80001b28:	01612823          	sw	s6,16(sp)
  FP_UNPACK_D (A, a);
80001b2c:	00c59493          	sll	s1,a1,0xc
{
80001b30:	02112623          	sw	ra,44(sp)
80001b34:	03212023          	sw	s2,32(sp)
80001b38:	01712623          	sw	s7,12(sp)
  FP_UNPACK_D (A, a);
80001b3c:	7ffafa93          	and	s5,s5,2047
{
80001b40:	00050413          	mv	s0,a0
80001b44:	00060b13          	mv	s6,a2
80001b48:	00068993          	mv	s3,a3
  FP_UNPACK_D (A, a);
80001b4c:	00c4d493          	srl	s1,s1,0xc
80001b50:	01f5da13          	srl	s4,a1,0x1f
80001b54:	240a8e63          	beqz	s5,80001db0 <__muldf3+0x2a4>
80001b58:	7ff00793          	li	a5,2047
80001b5c:	2cfa8063          	beq	s5,a5,80001e1c <__muldf3+0x310>
80001b60:	00349493          	sll	s1,s1,0x3
80001b64:	01d55793          	srl	a5,a0,0x1d
80001b68:	0097e7b3          	or	a5,a5,s1
80001b6c:	008004b7          	lui	s1,0x800
80001b70:	0097e4b3          	or	s1,a5,s1
80001b74:	00351913          	sll	s2,a0,0x3
80001b78:	c01a8a93          	add	s5,s5,-1023
80001b7c:	00000b93          	li	s7,0
  FP_UNPACK_D (B, b);
80001b80:	0149d713          	srl	a4,s3,0x14
80001b84:	00c99413          	sll	s0,s3,0xc
80001b88:	7ff77713          	and	a4,a4,2047
80001b8c:	00c45413          	srl	s0,s0,0xc
80001b90:	01f9d993          	srl	s3,s3,0x1f
80001b94:	2c070063          	beqz	a4,80001e54 <__muldf3+0x348>
80001b98:	7ff00793          	li	a5,2047
80001b9c:	32f70463          	beq	a4,a5,80001ec4 <__muldf3+0x3b8>
80001ba0:	00341413          	sll	s0,s0,0x3
80001ba4:	01db5793          	srl	a5,s6,0x1d
80001ba8:	0087e7b3          	or	a5,a5,s0
80001bac:	00800437          	lui	s0,0x800
80001bb0:	0087e433          	or	s0,a5,s0
80001bb4:	c0170693          	add	a3,a4,-1023
80001bb8:	003b1793          	sll	a5,s6,0x3
80001bbc:	00000713          	li	a4,0
  FP_MUL_D (R, A, B);
80001bc0:	00da8ab3          	add	s5,s5,a3
80001bc4:	002b9693          	sll	a3,s7,0x2
80001bc8:	00e6e6b3          	or	a3,a3,a4
80001bcc:	00a00613          	li	a2,10
80001bd0:	001a8513          	add	a0,s5,1
80001bd4:	40d64663          	blt	a2,a3,80001fe0 <__muldf3+0x4d4>
80001bd8:	00200613          	li	a2,2
80001bdc:	013a45b3          	xor	a1,s4,s3
80001be0:	30d64e63          	blt	a2,a3,80001efc <__muldf3+0x3f0>
80001be4:	fff68693          	add	a3,a3,-1
80001be8:	00100613          	li	a2,1
80001bec:	32d67a63          	bgeu	a2,a3,80001f20 <__muldf3+0x414>
80001bf0:	00010337          	lui	t1,0x10
80001bf4:	fff30e13          	add	t3,t1,-1 # ffff <__stack_size+0xbfff>
80001bf8:	01095713          	srl	a4,s2,0x10
80001bfc:	0107d893          	srl	a7,a5,0x10
80001c00:	01c97933          	and	s2,s2,t3
80001c04:	01c7ff33          	and	t5,a5,t3
80001c08:	03e907b3          	mul	a5,s2,t5
80001c0c:	03e70eb3          	mul	t4,a4,t5
80001c10:	0107d813          	srl	a6,a5,0x10
80001c14:	03288633          	mul	a2,a7,s2
80001c18:	01d60633          	add	a2,a2,t4
80001c1c:	00c80833          	add	a6,a6,a2
80001c20:	031706b3          	mul	a3,a4,a7
80001c24:	01d87463          	bgeu	a6,t4,80001c2c <__muldf3+0x120>
80001c28:	006686b3          	add	a3,a3,t1
80001c2c:	01085293          	srl	t0,a6,0x10
80001c30:	01c87833          	and	a6,a6,t3
80001c34:	01c7f7b3          	and	a5,a5,t3
80001c38:	01045613          	srl	a2,s0,0x10
80001c3c:	01c47e33          	and	t3,s0,t3
80001c40:	01081813          	sll	a6,a6,0x10
80001c44:	00f80833          	add	a6,a6,a5
80001c48:	03c90eb3          	mul	t4,s2,t3
80001c4c:	03c707b3          	mul	a5,a4,t3
80001c50:	03260933          	mul	s2,a2,s2
80001c54:	02c70333          	mul	t1,a4,a2
80001c58:	00f90933          	add	s2,s2,a5
80001c5c:	010ed713          	srl	a4,t4,0x10
80001c60:	01270733          	add	a4,a4,s2
80001c64:	00f77663          	bgeu	a4,a5,80001c70 <__muldf3+0x164>
80001c68:	000107b7          	lui	a5,0x10
80001c6c:	00f30333          	add	t1,t1,a5
80001c70:	00010437          	lui	s0,0x10
80001c74:	01075793          	srl	a5,a4,0x10
80001c78:	fff40f93          	add	t6,s0,-1 # ffff <__stack_size+0xbfff>
80001c7c:	00678333          	add	t1,a5,t1
80001c80:	01f777b3          	and	a5,a4,t6
80001c84:	01fefeb3          	and	t4,t4,t6
80001c88:	01079793          	sll	a5,a5,0x10
80001c8c:	01f4ffb3          	and	t6,s1,t6
80001c90:	01d787b3          	add	a5,a5,t4
80001c94:	0104de93          	srl	t4,s1,0x10
80001c98:	03ff03b3          	mul	t2,t5,t6
80001c9c:	00f282b3          	add	t0,t0,a5
80001ca0:	03ee8f33          	mul	t5,t4,t5
80001ca4:	0103d713          	srl	a4,t2,0x10
80001ca8:	03d884b3          	mul	s1,a7,t4
80001cac:	03f888b3          	mul	a7,a7,t6
80001cb0:	01e888b3          	add	a7,a7,t5
80001cb4:	01170733          	add	a4,a4,a7
80001cb8:	01e77463          	bgeu	a4,t5,80001cc0 <__muldf3+0x1b4>
80001cbc:	008484b3          	add	s1,s1,s0
80001cc0:	01075f13          	srl	t5,a4,0x10
80001cc4:	009f0f33          	add	t5,t5,s1
80001cc8:	000104b7          	lui	s1,0x10
80001ccc:	fff48413          	add	s0,s1,-1 # ffff <__stack_size+0xbfff>
80001cd0:	00877733          	and	a4,a4,s0
80001cd4:	0083f3b3          	and	t2,t2,s0
80001cd8:	01071713          	sll	a4,a4,0x10
80001cdc:	007708b3          	add	a7,a4,t2
80001ce0:	03fe03b3          	mul	t2,t3,t6
80001ce4:	03ce8e33          	mul	t3,t4,t3
80001ce8:	03d60eb3          	mul	t4,a2,t4
80001cec:	03f60633          	mul	a2,a2,t6
80001cf0:	0103df93          	srl	t6,t2,0x10
80001cf4:	01c60633          	add	a2,a2,t3
80001cf8:	00cf8fb3          	add	t6,t6,a2
80001cfc:	01cff463          	bgeu	t6,t3,80001d04 <__muldf3+0x1f8>
80001d00:	009e8eb3          	add	t4,t4,s1
80001d04:	008ff733          	and	a4,t6,s0
80001d08:	0083f3b3          	and	t2,t2,s0
80001d0c:	01071713          	sll	a4,a4,0x10
80001d10:	005686b3          	add	a3,a3,t0
80001d14:	00770733          	add	a4,a4,t2
80001d18:	00670333          	add	t1,a4,t1
80001d1c:	00f6b7b3          	sltu	a5,a3,a5
80001d20:	00f307b3          	add	a5,t1,a5
80001d24:	00e33633          	sltu	a2,t1,a4
80001d28:	011688b3          	add	a7,a3,a7
80001d2c:	0067b333          	sltu	t1,a5,t1
80001d30:	00666633          	or	a2,a2,t1
80001d34:	00d8b6b3          	sltu	a3,a7,a3
80001d38:	01e78333          	add	t1,a5,t5
80001d3c:	00d306b3          	add	a3,t1,a3
80001d40:	00f33733          	sltu	a4,t1,a5
80001d44:	010fdf93          	srl	t6,t6,0x10
80001d48:	0066b333          	sltu	t1,a3,t1
80001d4c:	00989793          	sll	a5,a7,0x9
80001d50:	01f60633          	add	a2,a2,t6
80001d54:	00676733          	or	a4,a4,t1
80001d58:	00c70733          	add	a4,a4,a2
80001d5c:	0107e7b3          	or	a5,a5,a6
80001d60:	01d70733          	add	a4,a4,t4
80001d64:	00f037b3          	snez	a5,a5
80001d68:	0178d893          	srl	a7,a7,0x17
80001d6c:	00971713          	sll	a4,a4,0x9
80001d70:	0176d413          	srl	s0,a3,0x17
80001d74:	0117e7b3          	or	a5,a5,a7
80001d78:	00969693          	sll	a3,a3,0x9
80001d7c:	00d7e7b3          	or	a5,a5,a3
80001d80:	00771693          	sll	a3,a4,0x7
80001d84:	00876433          	or	s0,a4,s0
80001d88:	0206d063          	bgez	a3,80001da8 <__muldf3+0x29c>
80001d8c:	0017d713          	srl	a4,a5,0x1
80001d90:	0017f793          	and	a5,a5,1
80001d94:	00f76733          	or	a4,a4,a5
80001d98:	01f41793          	sll	a5,s0,0x1f
80001d9c:	00f767b3          	or	a5,a4,a5
80001da0:	00145413          	srl	s0,s0,0x1
80001da4:	00050a93          	mv	s5,a0
80001da8:	000a8513          	mv	a0,s5
80001dac:	18c0006f          	j	80001f38 <__muldf3+0x42c>
  FP_UNPACK_D (A, a);
80001db0:	00a4e933          	or	s2,s1,a0
80001db4:	08090063          	beqz	s2,80001e34 <__muldf3+0x328>
80001db8:	04048063          	beqz	s1,80001df8 <__muldf3+0x2ec>
80001dbc:	00048513          	mv	a0,s1
80001dc0:	6b0010ef          	jal	80003470 <__clzsi2>
80001dc4:	ff550713          	add	a4,a0,-11 # 7fff5 <__stack_size+0x7bff5>
80001dc8:	01d00793          	li	a5,29
80001dcc:	ff850693          	add	a3,a0,-8
80001dd0:	40e787b3          	sub	a5,a5,a4
80001dd4:	00d494b3          	sll	s1,s1,a3
80001dd8:	00f457b3          	srl	a5,s0,a5
80001ddc:	0097e7b3          	or	a5,a5,s1
80001de0:	00d414b3          	sll	s1,s0,a3
80001de4:	c0d00a93          	li	s5,-1011
80001de8:	00048913          	mv	s2,s1
80001dec:	40aa8ab3          	sub	s5,s5,a0
80001df0:	00078493          	mv	s1,a5
80001df4:	d89ff06f          	j	80001b7c <__muldf3+0x70>
80001df8:	678010ef          	jal	80003470 <__clzsi2>
80001dfc:	00050793          	mv	a5,a0
80001e00:	01578713          	add	a4,a5,21 # 10015 <__stack_size+0xc015>
80001e04:	01c00693          	li	a3,28
80001e08:	02050513          	add	a0,a0,32
80001e0c:	fae6dee3          	bge	a3,a4,80001dc8 <__muldf3+0x2bc>
80001e10:	ff878793          	add	a5,a5,-8
80001e14:	00f417b3          	sll	a5,s0,a5
80001e18:	fcdff06f          	j	80001de4 <__muldf3+0x2d8>
80001e1c:	00a4e933          	or	s2,s1,a0
80001e20:	02091263          	bnez	s2,80001e44 <__muldf3+0x338>
80001e24:	00000493          	li	s1,0
80001e28:	7ff00a93          	li	s5,2047
80001e2c:	00200b93          	li	s7,2
80001e30:	d51ff06f          	j	80001b80 <__muldf3+0x74>
80001e34:	00000493          	li	s1,0
80001e38:	00000a93          	li	s5,0
80001e3c:	00100b93          	li	s7,1
80001e40:	d41ff06f          	j	80001b80 <__muldf3+0x74>
80001e44:	00050913          	mv	s2,a0
80001e48:	7ff00a93          	li	s5,2047
80001e4c:	00300b93          	li	s7,3
80001e50:	d31ff06f          	j	80001b80 <__muldf3+0x74>
  FP_UNPACK_D (B, b);
80001e54:	016467b3          	or	a5,s0,s6
80001e58:	08078263          	beqz	a5,80001edc <__muldf3+0x3d0>
80001e5c:	04040063          	beqz	s0,80001e9c <__muldf3+0x390>
80001e60:	00040513          	mv	a0,s0
80001e64:	60c010ef          	jal	80003470 <__clzsi2>
80001e68:	ff550693          	add	a3,a0,-11
80001e6c:	01d00713          	li	a4,29
80001e70:	ff850793          	add	a5,a0,-8
80001e74:	40d70733          	sub	a4,a4,a3
80001e78:	00f41433          	sll	s0,s0,a5
80001e7c:	00eb5733          	srl	a4,s6,a4
80001e80:	00876733          	or	a4,a4,s0
80001e84:	00fb1433          	sll	s0,s6,a5
80001e88:	c0d00693          	li	a3,-1011
80001e8c:	00040793          	mv	a5,s0
80001e90:	40a686b3          	sub	a3,a3,a0
80001e94:	00070413          	mv	s0,a4
80001e98:	d25ff06f          	j	80001bbc <__muldf3+0xb0>
80001e9c:	000b0513          	mv	a0,s6
80001ea0:	5d0010ef          	jal	80003470 <__clzsi2>
80001ea4:	00050793          	mv	a5,a0
80001ea8:	01578693          	add	a3,a5,21
80001eac:	01c00713          	li	a4,28
80001eb0:	02050513          	add	a0,a0,32
80001eb4:	fad75ce3          	bge	a4,a3,80001e6c <__muldf3+0x360>
80001eb8:	ff878793          	add	a5,a5,-8
80001ebc:	00fb1733          	sll	a4,s6,a5
80001ec0:	fc9ff06f          	j	80001e88 <__muldf3+0x37c>
80001ec4:	016467b3          	or	a5,s0,s6
80001ec8:	02079263          	bnez	a5,80001eec <__muldf3+0x3e0>
80001ecc:	00000413          	li	s0,0
80001ed0:	7ff00693          	li	a3,2047
80001ed4:	00200713          	li	a4,2
80001ed8:	ce9ff06f          	j	80001bc0 <__muldf3+0xb4>
80001edc:	00000413          	li	s0,0
80001ee0:	00000693          	li	a3,0
80001ee4:	00100713          	li	a4,1
80001ee8:	cd9ff06f          	j	80001bc0 <__muldf3+0xb4>
80001eec:	000b0793          	mv	a5,s6
80001ef0:	7ff00693          	li	a3,2047
80001ef4:	00300713          	li	a4,3
80001ef8:	cc9ff06f          	j	80001bc0 <__muldf3+0xb4>
80001efc:	00100613          	li	a2,1
80001f00:	00d61633          	sll	a2,a2,a3
  FP_MUL_D (R, A, B);
80001f04:	53067693          	and	a3,a2,1328
80001f08:	0e069663          	bnez	a3,80001ff4 <__muldf3+0x4e8>
80001f0c:	24067813          	and	a6,a2,576
80001f10:	1a081a63          	bnez	a6,800020c4 <__muldf3+0x5b8>
80001f14:	08867613          	and	a2,a2,136
80001f18:	cc060ce3          	beqz	a2,80001bf0 <__muldf3+0xe4>
  FP_UNPACK_D (B, b);
80001f1c:	00098593          	mv	a1,s3
  FP_PACK_D (r, R);
80001f20:	00200693          	li	a3,2
80001f24:	18d70863          	beq	a4,a3,800020b4 <__muldf3+0x5a8>
80001f28:	00300693          	li	a3,3
80001f2c:	1ad70463          	beq	a4,a3,800020d4 <__muldf3+0x5c8>
80001f30:	00100693          	li	a3,1
80001f34:	1ad70663          	beq	a4,a3,800020e0 <__muldf3+0x5d4>
80001f38:	3ff50613          	add	a2,a0,1023
80001f3c:	0cc05463          	blez	a2,80002004 <__muldf3+0x4f8>
80001f40:	0077f713          	and	a4,a5,7
80001f44:	02070063          	beqz	a4,80001f64 <__muldf3+0x458>
80001f48:	00f7f713          	and	a4,a5,15
80001f4c:	00400693          	li	a3,4
80001f50:	00d70a63          	beq	a4,a3,80001f64 <__muldf3+0x458>
80001f54:	00478713          	add	a4,a5,4
80001f58:	00f736b3          	sltu	a3,a4,a5
80001f5c:	00d40433          	add	s0,s0,a3
80001f60:	00070793          	mv	a5,a4
80001f64:	00741713          	sll	a4,s0,0x7
80001f68:	00075a63          	bgez	a4,80001f7c <__muldf3+0x470>
80001f6c:	ff000737          	lui	a4,0xff000
80001f70:	fff70713          	add	a4,a4,-1 # feffffff <__stack_base+0x3effffff>
80001f74:	00e47433          	and	s0,s0,a4
80001f78:	40050613          	add	a2,a0,1024
80001f7c:	7fe00713          	li	a4,2046
80001f80:	12c74a63          	blt	a4,a2,800020b4 <__muldf3+0x5a8>
80001f84:	0037d793          	srl	a5,a5,0x3
80001f88:	01d41693          	sll	a3,s0,0x1d
80001f8c:	00f6e6b3          	or	a3,a3,a5
80001f90:	00345713          	srl	a4,s0,0x3
80001f94:	00c71713          	sll	a4,a4,0xc
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80001f98:	02c12083          	lw	ra,44(sp)
80001f9c:	02812403          	lw	s0,40(sp)
  FP_PACK_D (r, R);
80001fa0:	01461613          	sll	a2,a2,0x14
80001fa4:	00c75713          	srl	a4,a4,0xc
80001fa8:	01f59593          	sll	a1,a1,0x1f
80001fac:	00e66633          	or	a2,a2,a4
80001fb0:	00b667b3          	or	a5,a2,a1
}
80001fb4:	02412483          	lw	s1,36(sp)
80001fb8:	02012903          	lw	s2,32(sp)
80001fbc:	01c12983          	lw	s3,28(sp)
80001fc0:	01812a03          	lw	s4,24(sp)
80001fc4:	01412a83          	lw	s5,20(sp)
80001fc8:	01012b03          	lw	s6,16(sp)
80001fcc:	00c12b83          	lw	s7,12(sp)
80001fd0:	00068513          	mv	a0,a3
80001fd4:	00078593          	mv	a1,a5
80001fd8:	03010113          	add	sp,sp,48
80001fdc:	00008067          	ret
  FP_MUL_D (R, A, B);
80001fe0:	00f00613          	li	a2,15
80001fe4:	0ec68863          	beq	a3,a2,800020d4 <__muldf3+0x5c8>
80001fe8:	00b00613          	li	a2,11
  FP_UNPACK_D (A, a);
80001fec:	000a0593          	mv	a1,s4
  FP_MUL_D (R, A, B);
80001ff0:	f2c686e3          	beq	a3,a2,80001f1c <__muldf3+0x410>
80001ff4:	00048413          	mv	s0,s1
80001ff8:	00090793          	mv	a5,s2
80001ffc:	000b8713          	mv	a4,s7
80002000:	f21ff06f          	j	80001f20 <__muldf3+0x414>
  FP_PACK_D (r, R);
80002004:	00100713          	li	a4,1
80002008:	40c70733          	sub	a4,a4,a2
8000200c:	03800693          	li	a3,56
80002010:	0ce6c863          	blt	a3,a4,800020e0 <__muldf3+0x5d4>
80002014:	01f00693          	li	a3,31
80002018:	06e6c463          	blt	a3,a4,80002080 <__muldf3+0x574>
8000201c:	41e50513          	add	a0,a0,1054
80002020:	00e7d633          	srl	a2,a5,a4
80002024:	00a416b3          	sll	a3,s0,a0
80002028:	00a79533          	sll	a0,a5,a0
8000202c:	00c6e6b3          	or	a3,a3,a2
80002030:	00a03533          	snez	a0,a0
80002034:	00a6e7b3          	or	a5,a3,a0
80002038:	00e45733          	srl	a4,s0,a4
8000203c:	0077f693          	and	a3,a5,7
80002040:	02068063          	beqz	a3,80002060 <__muldf3+0x554>
80002044:	00f7f693          	and	a3,a5,15
80002048:	00400613          	li	a2,4
8000204c:	00c68a63          	beq	a3,a2,80002060 <__muldf3+0x554>
80002050:	00478693          	add	a3,a5,4
80002054:	00f6b633          	sltu	a2,a3,a5
80002058:	00c70733          	add	a4,a4,a2
8000205c:	00068793          	mv	a5,a3
80002060:	00871693          	sll	a3,a4,0x8
80002064:	0806c463          	bltz	a3,800020ec <__muldf3+0x5e0>
80002068:	01d71693          	sll	a3,a4,0x1d
8000206c:	0037d793          	srl	a5,a5,0x3
80002070:	00f6e6b3          	or	a3,a3,a5
80002074:	00375713          	srl	a4,a4,0x3
80002078:	00000613          	li	a2,0
8000207c:	f19ff06f          	j	80001f94 <__muldf3+0x488>
80002080:	fe100693          	li	a3,-31
80002084:	40c686b3          	sub	a3,a3,a2
80002088:	02000813          	li	a6,32
8000208c:	00d456b3          	srl	a3,s0,a3
80002090:	00000613          	li	a2,0
80002094:	01070663          	beq	a4,a6,800020a0 <__muldf3+0x594>
80002098:	43e50613          	add	a2,a0,1086
8000209c:	00c41633          	sll	a2,s0,a2
800020a0:	00f66633          	or	a2,a2,a5
800020a4:	00c03633          	snez	a2,a2
800020a8:	00c6e7b3          	or	a5,a3,a2
800020ac:	00000713          	li	a4,0
800020b0:	f8dff06f          	j	8000203c <__muldf3+0x530>
800020b4:	00000713          	li	a4,0
800020b8:	00000693          	li	a3,0
800020bc:	7ff00613          	li	a2,2047
800020c0:	ed5ff06f          	j	80001f94 <__muldf3+0x488>
  FP_MUL_D (R, A, B);
800020c4:	00080737          	lui	a4,0x80
  FP_PACK_D (r, R);
800020c8:	7ff00613          	li	a2,2047
800020cc:	00000593          	li	a1,0
800020d0:	ec5ff06f          	j	80001f94 <__muldf3+0x488>
800020d4:	00080737          	lui	a4,0x80
800020d8:	00000693          	li	a3,0
800020dc:	fedff06f          	j	800020c8 <__muldf3+0x5bc>
800020e0:	00000713          	li	a4,0
800020e4:	00000693          	li	a3,0
800020e8:	f91ff06f          	j	80002078 <__muldf3+0x56c>
800020ec:	00000713          	li	a4,0
800020f0:	00000693          	li	a3,0
800020f4:	00100613          	li	a2,1
800020f8:	e9dff06f          	j	80001f94 <__muldf3+0x488>

800020fc <__subdf3>:
  FP_DECL_D (B);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_SEMIRAW_D (A, a);
800020fc:	00100837          	lui	a6,0x100
80002100:	fff80813          	add	a6,a6,-1 # fffff <__stack_size+0xfbfff>
{
80002104:	fe010113          	add	sp,sp,-32
  FP_UNPACK_SEMIRAW_D (A, a);
80002108:	00b878b3          	and	a7,a6,a1
8000210c:	0145d713          	srl	a4,a1,0x14
80002110:	01d55793          	srl	a5,a0,0x1d
  FP_UNPACK_SEMIRAW_D (B, b);
80002114:	00d87833          	and	a6,a6,a3
{
80002118:	01212823          	sw	s2,16(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
8000211c:	7ff77913          	and	s2,a4,2047
80002120:	00389713          	sll	a4,a7,0x3
  FP_UNPACK_SEMIRAW_D (B, b);
80002124:	0146d893          	srl	a7,a3,0x14
{
80002128:	00912a23          	sw	s1,20(sp)
  FP_UNPACK_SEMIRAW_D (A, a);
8000212c:	00e7e7b3          	or	a5,a5,a4
80002130:	01f5d493          	srl	s1,a1,0x1f
  FP_UNPACK_SEMIRAW_D (B, b);
80002134:	01d65713          	srl	a4,a2,0x1d
80002138:	00381813          	sll	a6,a6,0x3
{
8000213c:	00112e23          	sw	ra,28(sp)
80002140:	00812c23          	sw	s0,24(sp)
80002144:	01312623          	sw	s3,12(sp)
  FP_UNPACK_SEMIRAW_D (B, b);
80002148:	7ff8f893          	and	a7,a7,2047
  FP_SUB_D (R, A, B);
8000214c:	7ff00593          	li	a1,2047
  FP_UNPACK_SEMIRAW_D (A, a);
80002150:	00351513          	sll	a0,a0,0x3
  FP_UNPACK_SEMIRAW_D (B, b);
80002154:	01f6d693          	srl	a3,a3,0x1f
80002158:	01076733          	or	a4,a4,a6
8000215c:	00361613          	sll	a2,a2,0x3
  FP_SUB_D (R, A, B);
80002160:	00b89663          	bne	a7,a1,8000216c <__subdf3+0x70>
80002164:	00c765b3          	or	a1,a4,a2
80002168:	00059463          	bnez	a1,80002170 <__subdf3+0x74>
8000216c:	0016c693          	xor	a3,a3,1
80002170:	41190833          	sub	a6,s2,a7
80002174:	2a969a63          	bne	a3,s1,80002428 <__subdf3+0x32c>
80002178:	11005c63          	blez	a6,80002290 <__subdf3+0x194>
8000217c:	04089063          	bnez	a7,800021bc <__subdf3+0xc0>
80002180:	00c766b3          	or	a3,a4,a2
80002184:	66068063          	beqz	a3,800027e4 <__subdf3+0x6e8>
80002188:	fff80593          	add	a1,a6,-1
8000218c:	02059063          	bnez	a1,800021ac <__subdf3+0xb0>
80002190:	00c50633          	add	a2,a0,a2
80002194:	00a636b3          	sltu	a3,a2,a0
80002198:	00e78733          	add	a4,a5,a4
8000219c:	00060513          	mv	a0,a2
800021a0:	00d707b3          	add	a5,a4,a3
800021a4:	00100913          	li	s2,1
800021a8:	06c0006f          	j	80002214 <__subdf3+0x118>
800021ac:	7ff00693          	li	a3,2047
800021b0:	02d81063          	bne	a6,a3,800021d0 <__subdf3+0xd4>
800021b4:	7ff00913          	li	s2,2047
800021b8:	1f80006f          	j	800023b0 <__subdf3+0x2b4>
800021bc:	7ff00693          	li	a3,2047
800021c0:	1ed90863          	beq	s2,a3,800023b0 <__subdf3+0x2b4>
800021c4:	008006b7          	lui	a3,0x800
800021c8:	00d76733          	or	a4,a4,a3
800021cc:	00080593          	mv	a1,a6
800021d0:	03800693          	li	a3,56
800021d4:	0ab6c863          	blt	a3,a1,80002284 <__subdf3+0x188>
800021d8:	01f00693          	li	a3,31
800021dc:	06b6ca63          	blt	a3,a1,80002250 <__subdf3+0x154>
800021e0:	02000813          	li	a6,32
800021e4:	40b80833          	sub	a6,a6,a1
800021e8:	010716b3          	sll	a3,a4,a6
800021ec:	00b658b3          	srl	a7,a2,a1
800021f0:	01061833          	sll	a6,a2,a6
800021f4:	0116e6b3          	or	a3,a3,a7
800021f8:	01003833          	snez	a6,a6
800021fc:	0106e6b3          	or	a3,a3,a6
80002200:	00b755b3          	srl	a1,a4,a1
80002204:	00a68533          	add	a0,a3,a0
80002208:	00f585b3          	add	a1,a1,a5
8000220c:	00d536b3          	sltu	a3,a0,a3
80002210:	00d587b3          	add	a5,a1,a3
80002214:	00879713          	sll	a4,a5,0x8
80002218:	18075c63          	bgez	a4,800023b0 <__subdf3+0x2b4>
8000221c:	00190913          	add	s2,s2,1
80002220:	7ff00713          	li	a4,2047
80002224:	5ae90a63          	beq	s2,a4,800027d8 <__subdf3+0x6dc>
80002228:	ff800737          	lui	a4,0xff800
8000222c:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
80002230:	00e7f733          	and	a4,a5,a4
80002234:	00155793          	srl	a5,a0,0x1
80002238:	00157513          	and	a0,a0,1
8000223c:	00a7e7b3          	or	a5,a5,a0
80002240:	01f71513          	sll	a0,a4,0x1f
80002244:	00f56533          	or	a0,a0,a5
80002248:	00175793          	srl	a5,a4,0x1
8000224c:	1640006f          	j	800023b0 <__subdf3+0x2b4>
80002250:	fe058693          	add	a3,a1,-32
80002254:	02000893          	li	a7,32
80002258:	00d756b3          	srl	a3,a4,a3
8000225c:	00000813          	li	a6,0
80002260:	01158863          	beq	a1,a7,80002270 <__subdf3+0x174>
80002264:	04000813          	li	a6,64
80002268:	40b80833          	sub	a6,a6,a1
8000226c:	01071833          	sll	a6,a4,a6
80002270:	00c86833          	or	a6,a6,a2
80002274:	01003833          	snez	a6,a6
80002278:	0106e6b3          	or	a3,a3,a6
8000227c:	00000593          	li	a1,0
80002280:	f85ff06f          	j	80002204 <__subdf3+0x108>
80002284:	00c766b3          	or	a3,a4,a2
80002288:	00d036b3          	snez	a3,a3
8000228c:	ff1ff06f          	j	8000227c <__subdf3+0x180>
80002290:	0c080a63          	beqz	a6,80002364 <__subdf3+0x268>
80002294:	412886b3          	sub	a3,a7,s2
80002298:	02091463          	bnez	s2,800022c0 <__subdf3+0x1c4>
8000229c:	00a7e5b3          	or	a1,a5,a0
800022a0:	50058e63          	beqz	a1,800027bc <__subdf3+0x6c0>
800022a4:	fff68593          	add	a1,a3,-1 # 7fffff <__stack_size+0x7fbfff>
800022a8:	ee0584e3          	beqz	a1,80002190 <__subdf3+0x94>
800022ac:	7ff00813          	li	a6,2047
800022b0:	03069263          	bne	a3,a6,800022d4 <__subdf3+0x1d8>
800022b4:	00070793          	mv	a5,a4
800022b8:	00060513          	mv	a0,a2
800022bc:	ef9ff06f          	j	800021b4 <__subdf3+0xb8>
800022c0:	7ff00593          	li	a1,2047
800022c4:	feb888e3          	beq	a7,a1,800022b4 <__subdf3+0x1b8>
800022c8:	008005b7          	lui	a1,0x800
800022cc:	00b7e7b3          	or	a5,a5,a1
800022d0:	00068593          	mv	a1,a3
800022d4:	03800693          	li	a3,56
800022d8:	08b6c063          	blt	a3,a1,80002358 <__subdf3+0x25c>
800022dc:	01f00693          	li	a3,31
800022e0:	04b6c263          	blt	a3,a1,80002324 <__subdf3+0x228>
800022e4:	02000813          	li	a6,32
800022e8:	40b80833          	sub	a6,a6,a1
800022ec:	010796b3          	sll	a3,a5,a6
800022f0:	00b55333          	srl	t1,a0,a1
800022f4:	01051833          	sll	a6,a0,a6
800022f8:	0066e6b3          	or	a3,a3,t1
800022fc:	01003833          	snez	a6,a6
80002300:	0106e6b3          	or	a3,a3,a6
80002304:	00b7d5b3          	srl	a1,a5,a1
80002308:	00c68633          	add	a2,a3,a2
8000230c:	00e585b3          	add	a1,a1,a4
80002310:	00d636b3          	sltu	a3,a2,a3
80002314:	00060513          	mv	a0,a2
80002318:	00d587b3          	add	a5,a1,a3
8000231c:	00088913          	mv	s2,a7
80002320:	ef5ff06f          	j	80002214 <__subdf3+0x118>
80002324:	fe058693          	add	a3,a1,-32 # 7fffe0 <__stack_size+0x7fbfe0>
80002328:	02000313          	li	t1,32
8000232c:	00d7d6b3          	srl	a3,a5,a3
80002330:	00000813          	li	a6,0
80002334:	00658863          	beq	a1,t1,80002344 <__subdf3+0x248>
80002338:	04000813          	li	a6,64
8000233c:	40b80833          	sub	a6,a6,a1
80002340:	01079833          	sll	a6,a5,a6
80002344:	00a86833          	or	a6,a6,a0
80002348:	01003833          	snez	a6,a6
8000234c:	0106e6b3          	or	a3,a3,a6
80002350:	00000593          	li	a1,0
80002354:	fb5ff06f          	j	80002308 <__subdf3+0x20c>
80002358:	00a7e6b3          	or	a3,a5,a0
8000235c:	00d036b3          	snez	a3,a3
80002360:	ff1ff06f          	j	80002350 <__subdf3+0x254>
80002364:	00190693          	add	a3,s2,1
80002368:	7fe6f593          	and	a1,a3,2046
8000236c:	08059663          	bnez	a1,800023f8 <__subdf3+0x2fc>
80002370:	00a7e6b3          	or	a3,a5,a0
80002374:	06091263          	bnez	s2,800023d8 <__subdf3+0x2dc>
80002378:	44068863          	beqz	a3,800027c8 <__subdf3+0x6cc>
8000237c:	00c766b3          	or	a3,a4,a2
80002380:	02068863          	beqz	a3,800023b0 <__subdf3+0x2b4>
80002384:	00c50633          	add	a2,a0,a2
80002388:	00a636b3          	sltu	a3,a2,a0
8000238c:	00e78733          	add	a4,a5,a4
80002390:	00d707b3          	add	a5,a4,a3
80002394:	00879713          	sll	a4,a5,0x8
80002398:	00060513          	mv	a0,a2
8000239c:	00075a63          	bgez	a4,800023b0 <__subdf3+0x2b4>
800023a0:	ff800737          	lui	a4,0xff800
800023a4:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
800023a8:	00e7f7b3          	and	a5,a5,a4
800023ac:	00100913          	li	s2,1
  FP_PACK_SEMIRAW_D (r, R);
800023b0:	00757713          	and	a4,a0,7
800023b4:	44070863          	beqz	a4,80002804 <__subdf3+0x708>
800023b8:	00f57713          	and	a4,a0,15
800023bc:	00400693          	li	a3,4
800023c0:	44d70263          	beq	a4,a3,80002804 <__subdf3+0x708>
800023c4:	00450713          	add	a4,a0,4
800023c8:	00a736b3          	sltu	a3,a4,a0
800023cc:	00d787b3          	add	a5,a5,a3
800023d0:	00070513          	mv	a0,a4
800023d4:	4300006f          	j	80002804 <__subdf3+0x708>
  FP_SUB_D (R, A, B);
800023d8:	ec068ee3          	beqz	a3,800022b4 <__subdf3+0x1b8>
800023dc:	00c76633          	or	a2,a4,a2
800023e0:	dc060ae3          	beqz	a2,800021b4 <__subdf3+0xb8>
800023e4:	00000493          	li	s1,0
800023e8:	004007b7          	lui	a5,0x400
800023ec:	00000513          	li	a0,0
800023f0:	7ff00913          	li	s2,2047
800023f4:	4100006f          	j	80002804 <__subdf3+0x708>
800023f8:	7ff00593          	li	a1,2047
800023fc:	3cb68c63          	beq	a3,a1,800027d4 <__subdf3+0x6d8>
80002400:	00c50633          	add	a2,a0,a2
80002404:	00a63533          	sltu	a0,a2,a0
80002408:	00e78733          	add	a4,a5,a4
8000240c:	00a70733          	add	a4,a4,a0
80002410:	01f71513          	sll	a0,a4,0x1f
80002414:	00165613          	srl	a2,a2,0x1
80002418:	00c56533          	or	a0,a0,a2
8000241c:	00175793          	srl	a5,a4,0x1
80002420:	00068913          	mv	s2,a3
80002424:	f8dff06f          	j	800023b0 <__subdf3+0x2b4>
80002428:	0f005c63          	blez	a6,80002520 <__subdf3+0x424>
8000242c:	08089e63          	bnez	a7,800024c8 <__subdf3+0x3cc>
80002430:	00c766b3          	or	a3,a4,a2
80002434:	3a068863          	beqz	a3,800027e4 <__subdf3+0x6e8>
80002438:	fff80693          	add	a3,a6,-1
8000243c:	02069063          	bnez	a3,8000245c <__subdf3+0x360>
80002440:	40c50633          	sub	a2,a0,a2
80002444:	00c536b3          	sltu	a3,a0,a2
80002448:	40e78733          	sub	a4,a5,a4
8000244c:	00060513          	mv	a0,a2
80002450:	40d707b3          	sub	a5,a4,a3
80002454:	00100913          	li	s2,1
80002458:	0540006f          	j	800024ac <__subdf3+0x3b0>
8000245c:	7ff00593          	li	a1,2047
80002460:	d4b80ae3          	beq	a6,a1,800021b4 <__subdf3+0xb8>
80002464:	03800593          	li	a1,56
80002468:	0ad5c663          	blt	a1,a3,80002514 <__subdf3+0x418>
8000246c:	01f00593          	li	a1,31
80002470:	06d5c863          	blt	a1,a3,800024e0 <__subdf3+0x3e4>
80002474:	02000813          	li	a6,32
80002478:	40d80833          	sub	a6,a6,a3
8000247c:	00d658b3          	srl	a7,a2,a3
80002480:	010715b3          	sll	a1,a4,a6
80002484:	01061833          	sll	a6,a2,a6
80002488:	0115e5b3          	or	a1,a1,a7
8000248c:	01003833          	snez	a6,a6
80002490:	0105e633          	or	a2,a1,a6
80002494:	00d756b3          	srl	a3,a4,a3
80002498:	40c50633          	sub	a2,a0,a2
8000249c:	00c53733          	sltu	a4,a0,a2
800024a0:	40d786b3          	sub	a3,a5,a3
800024a4:	00060513          	mv	a0,a2
800024a8:	40e687b3          	sub	a5,a3,a4
800024ac:	00879713          	sll	a4,a5,0x8
800024b0:	f00750e3          	bgez	a4,800023b0 <__subdf3+0x2b4>
800024b4:	00800437          	lui	s0,0x800
800024b8:	fff40413          	add	s0,s0,-1 # 7fffff <__stack_size+0x7fbfff>
800024bc:	0087f433          	and	s0,a5,s0
800024c0:	00050993          	mv	s3,a0
800024c4:	2100006f          	j	800026d4 <__subdf3+0x5d8>
800024c8:	7ff00693          	li	a3,2047
800024cc:	eed902e3          	beq	s2,a3,800023b0 <__subdf3+0x2b4>
800024d0:	008006b7          	lui	a3,0x800
800024d4:	00d76733          	or	a4,a4,a3
800024d8:	00080693          	mv	a3,a6
800024dc:	f89ff06f          	j	80002464 <__subdf3+0x368>
800024e0:	fe068593          	add	a1,a3,-32 # 7fffe0 <__stack_size+0x7fbfe0>
800024e4:	02000893          	li	a7,32
800024e8:	00b755b3          	srl	a1,a4,a1
800024ec:	00000813          	li	a6,0
800024f0:	01168863          	beq	a3,a7,80002500 <__subdf3+0x404>
800024f4:	04000813          	li	a6,64
800024f8:	40d80833          	sub	a6,a6,a3
800024fc:	01071833          	sll	a6,a4,a6
80002500:	00c86833          	or	a6,a6,a2
80002504:	01003833          	snez	a6,a6
80002508:	0105e633          	or	a2,a1,a6
8000250c:	00000693          	li	a3,0
80002510:	f89ff06f          	j	80002498 <__subdf3+0x39c>
80002514:	00c76633          	or	a2,a4,a2
80002518:	00c03633          	snez	a2,a2
8000251c:	ff1ff06f          	j	8000250c <__subdf3+0x410>
80002520:	0e080863          	beqz	a6,80002610 <__subdf3+0x514>
80002524:	41288833          	sub	a6,a7,s2
80002528:	04091263          	bnez	s2,8000256c <__subdf3+0x470>
8000252c:	00a7e5b3          	or	a1,a5,a0
80002530:	2a058e63          	beqz	a1,800027ec <__subdf3+0x6f0>
80002534:	fff80593          	add	a1,a6,-1
80002538:	00059e63          	bnez	a1,80002554 <__subdf3+0x458>
8000253c:	40a60533          	sub	a0,a2,a0
80002540:	40f70733          	sub	a4,a4,a5
80002544:	00a63633          	sltu	a2,a2,a0
80002548:	40c707b3          	sub	a5,a4,a2
8000254c:	00068493          	mv	s1,a3
80002550:	f05ff06f          	j	80002454 <__subdf3+0x358>
80002554:	7ff00313          	li	t1,2047
80002558:	02681463          	bne	a6,t1,80002580 <__subdf3+0x484>
8000255c:	00070793          	mv	a5,a4
80002560:	00060513          	mv	a0,a2
80002564:	7ff00913          	li	s2,2047
80002568:	0d00006f          	j	80002638 <__subdf3+0x53c>
8000256c:	7ff00593          	li	a1,2047
80002570:	feb886e3          	beq	a7,a1,8000255c <__subdf3+0x460>
80002574:	008005b7          	lui	a1,0x800
80002578:	00b7e7b3          	or	a5,a5,a1
8000257c:	00080593          	mv	a1,a6
80002580:	03800813          	li	a6,56
80002584:	08b84063          	blt	a6,a1,80002604 <__subdf3+0x508>
80002588:	01f00813          	li	a6,31
8000258c:	04b84263          	blt	a6,a1,800025d0 <__subdf3+0x4d4>
80002590:	02000313          	li	t1,32
80002594:	40b30333          	sub	t1,t1,a1
80002598:	00b55e33          	srl	t3,a0,a1
8000259c:	00679833          	sll	a6,a5,t1
800025a0:	00651333          	sll	t1,a0,t1
800025a4:	01c86833          	or	a6,a6,t3
800025a8:	00603333          	snez	t1,t1
800025ac:	00686533          	or	a0,a6,t1
800025b0:	00b7d5b3          	srl	a1,a5,a1
800025b4:	40a60533          	sub	a0,a2,a0
800025b8:	40b705b3          	sub	a1,a4,a1
800025bc:	00a63633          	sltu	a2,a2,a0
800025c0:	40c587b3          	sub	a5,a1,a2
800025c4:	00088913          	mv	s2,a7
800025c8:	00068493          	mv	s1,a3
800025cc:	ee1ff06f          	j	800024ac <__subdf3+0x3b0>
800025d0:	fe058813          	add	a6,a1,-32 # 7fffe0 <__stack_size+0x7fbfe0>
800025d4:	02000e13          	li	t3,32
800025d8:	0107d833          	srl	a6,a5,a6
800025dc:	00000313          	li	t1,0
800025e0:	01c58863          	beq	a1,t3,800025f0 <__subdf3+0x4f4>
800025e4:	04000313          	li	t1,64
800025e8:	40b30333          	sub	t1,t1,a1
800025ec:	00679333          	sll	t1,a5,t1
800025f0:	00a36333          	or	t1,t1,a0
800025f4:	00603333          	snez	t1,t1
800025f8:	00686533          	or	a0,a6,t1
800025fc:	00000593          	li	a1,0
80002600:	fb5ff06f          	j	800025b4 <__subdf3+0x4b8>
80002604:	00a7e533          	or	a0,a5,a0
80002608:	00a03533          	snez	a0,a0
8000260c:	ff1ff06f          	j	800025fc <__subdf3+0x500>
80002610:	00190593          	add	a1,s2,1
80002614:	7fe5f593          	and	a1,a1,2046
80002618:	08059663          	bnez	a1,800026a4 <__subdf3+0x5a8>
8000261c:	00c765b3          	or	a1,a4,a2
80002620:	00a7e833          	or	a6,a5,a0
80002624:	06091063          	bnez	s2,80002684 <__subdf3+0x588>
80002628:	00081c63          	bnez	a6,80002640 <__subdf3+0x544>
8000262c:	10058e63          	beqz	a1,80002748 <__subdf3+0x64c>
80002630:	00070793          	mv	a5,a4
80002634:	00060513          	mv	a0,a2
80002638:	00068493          	mv	s1,a3
8000263c:	d75ff06f          	j	800023b0 <__subdf3+0x2b4>
80002640:	d60588e3          	beqz	a1,800023b0 <__subdf3+0x2b4>
80002644:	40c50833          	sub	a6,a0,a2
80002648:	010538b3          	sltu	a7,a0,a6
8000264c:	40e785b3          	sub	a1,a5,a4
80002650:	411585b3          	sub	a1,a1,a7
80002654:	00859893          	sll	a7,a1,0x8
80002658:	0008dc63          	bgez	a7,80002670 <__subdf3+0x574>
8000265c:	40a60533          	sub	a0,a2,a0
80002660:	40f70733          	sub	a4,a4,a5
80002664:	00a63633          	sltu	a2,a2,a0
80002668:	40c707b3          	sub	a5,a4,a2
8000266c:	fcdff06f          	j	80002638 <__subdf3+0x53c>
80002670:	00b86533          	or	a0,a6,a1
80002674:	18050463          	beqz	a0,800027fc <__subdf3+0x700>
80002678:	00058793          	mv	a5,a1
8000267c:	00080513          	mv	a0,a6
80002680:	d31ff06f          	j	800023b0 <__subdf3+0x2b4>
80002684:	00081c63          	bnez	a6,8000269c <__subdf3+0x5a0>
80002688:	d4058ee3          	beqz	a1,800023e4 <__subdf3+0x2e8>
8000268c:	00070793          	mv	a5,a4
80002690:	00060513          	mv	a0,a2
80002694:	00068493          	mv	s1,a3
80002698:	b1dff06f          	j	800021b4 <__subdf3+0xb8>
8000269c:	b0058ce3          	beqz	a1,800021b4 <__subdf3+0xb8>
800026a0:	d45ff06f          	j	800023e4 <__subdf3+0x2e8>
800026a4:	40c505b3          	sub	a1,a0,a2
800026a8:	00b53833          	sltu	a6,a0,a1
800026ac:	40e78433          	sub	s0,a5,a4
800026b0:	41040433          	sub	s0,s0,a6
800026b4:	00841813          	sll	a6,s0,0x8
800026b8:	00058993          	mv	s3,a1
800026bc:	08085063          	bgez	a6,8000273c <__subdf3+0x640>
800026c0:	40a609b3          	sub	s3,a2,a0
800026c4:	40f70433          	sub	s0,a4,a5
800026c8:	01363633          	sltu	a2,a2,s3
800026cc:	40c40433          	sub	s0,s0,a2
800026d0:	00068493          	mv	s1,a3
800026d4:	06040e63          	beqz	s0,80002750 <__subdf3+0x654>
800026d8:	00040513          	mv	a0,s0
800026dc:	595000ef          	jal	80003470 <__clzsi2>
800026e0:	ff850693          	add	a3,a0,-8
800026e4:	02000793          	li	a5,32
800026e8:	40d787b3          	sub	a5,a5,a3
800026ec:	00d41433          	sll	s0,s0,a3
800026f0:	00f9d7b3          	srl	a5,s3,a5
800026f4:	0087e7b3          	or	a5,a5,s0
800026f8:	00d99433          	sll	s0,s3,a3
800026fc:	0b26c463          	blt	a3,s2,800027a4 <__subdf3+0x6a8>
80002700:	412686b3          	sub	a3,a3,s2
80002704:	00168613          	add	a2,a3,1
80002708:	01f00713          	li	a4,31
8000270c:	06c74263          	blt	a4,a2,80002770 <__subdf3+0x674>
80002710:	02000713          	li	a4,32
80002714:	40c70733          	sub	a4,a4,a2
80002718:	00e79533          	sll	a0,a5,a4
8000271c:	00c456b3          	srl	a3,s0,a2
80002720:	00e41733          	sll	a4,s0,a4
80002724:	00d56533          	or	a0,a0,a3
80002728:	00e03733          	snez	a4,a4
8000272c:	00e56533          	or	a0,a0,a4
80002730:	00c7d7b3          	srl	a5,a5,a2
80002734:	00000913          	li	s2,0
80002738:	c79ff06f          	j	800023b0 <__subdf3+0x2b4>
8000273c:	0085e5b3          	or	a1,a1,s0
80002740:	f8059ae3          	bnez	a1,800026d4 <__subdf3+0x5d8>
80002744:	00000913          	li	s2,0
80002748:	00000493          	li	s1,0
8000274c:	08c0006f          	j	800027d8 <__subdf3+0x6dc>
80002750:	00098513          	mv	a0,s3
80002754:	51d000ef          	jal	80003470 <__clzsi2>
80002758:	01850693          	add	a3,a0,24
8000275c:	01f00793          	li	a5,31
80002760:	f8d7d2e3          	bge	a5,a3,800026e4 <__subdf3+0x5e8>
80002764:	ff850793          	add	a5,a0,-8
80002768:	00f997b3          	sll	a5,s3,a5
8000276c:	f91ff06f          	j	800026fc <__subdf3+0x600>
80002770:	fe168693          	add	a3,a3,-31
80002774:	00d7d533          	srl	a0,a5,a3
80002778:	02000693          	li	a3,32
8000277c:	00000713          	li	a4,0
80002780:	00d60863          	beq	a2,a3,80002790 <__subdf3+0x694>
80002784:	04000713          	li	a4,64
80002788:	40c70733          	sub	a4,a4,a2
8000278c:	00e79733          	sll	a4,a5,a4
80002790:	00e46733          	or	a4,s0,a4
80002794:	00e03733          	snez	a4,a4
80002798:	00e56533          	or	a0,a0,a4
8000279c:	00000793          	li	a5,0
800027a0:	f95ff06f          	j	80002734 <__subdf3+0x638>
800027a4:	ff800737          	lui	a4,0xff800
800027a8:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
800027ac:	40d90933          	sub	s2,s2,a3
800027b0:	00e7f7b3          	and	a5,a5,a4
800027b4:	00040513          	mv	a0,s0
800027b8:	bf9ff06f          	j	800023b0 <__subdf3+0x2b4>
800027bc:	00070793          	mv	a5,a4
800027c0:	00060513          	mv	a0,a2
800027c4:	c5dff06f          	j	80002420 <__subdf3+0x324>
800027c8:	00070793          	mv	a5,a4
800027cc:	00060513          	mv	a0,a2
800027d0:	be1ff06f          	j	800023b0 <__subdf3+0x2b4>
800027d4:	7ff00913          	li	s2,2047
800027d8:	00000793          	li	a5,0
800027dc:	00000513          	li	a0,0
800027e0:	0240006f          	j	80002804 <__subdf3+0x708>
800027e4:	00080913          	mv	s2,a6
800027e8:	bc9ff06f          	j	800023b0 <__subdf3+0x2b4>
800027ec:	00070793          	mv	a5,a4
800027f0:	00060513          	mv	a0,a2
800027f4:	00080913          	mv	s2,a6
800027f8:	e41ff06f          	j	80002638 <__subdf3+0x53c>
800027fc:	00000793          	li	a5,0
80002800:	00000493          	li	s1,0
  FP_PACK_SEMIRAW_D (r, R);
80002804:	00879713          	sll	a4,a5,0x8
80002808:	00075e63          	bgez	a4,80002824 <__subdf3+0x728>
8000280c:	00190913          	add	s2,s2,1
80002810:	7ff00713          	li	a4,2047
80002814:	08e90263          	beq	s2,a4,80002898 <__subdf3+0x79c>
80002818:	ff800737          	lui	a4,0xff800
8000281c:	fff70713          	add	a4,a4,-1 # ff7fffff <__stack_base+0x3f7fffff>
80002820:	00e7f7b3          	and	a5,a5,a4
80002824:	01d79693          	sll	a3,a5,0x1d
80002828:	00355513          	srl	a0,a0,0x3
8000282c:	7ff00713          	li	a4,2047
80002830:	00a6e6b3          	or	a3,a3,a0
80002834:	0037d793          	srl	a5,a5,0x3
80002838:	00e91e63          	bne	s2,a4,80002854 <__subdf3+0x758>
8000283c:	00f6e6b3          	or	a3,a3,a5
80002840:	00000793          	li	a5,0
80002844:	00068863          	beqz	a3,80002854 <__subdf3+0x758>
80002848:	000807b7          	lui	a5,0x80
8000284c:	00000693          	li	a3,0
80002850:	00000493          	li	s1,0
80002854:	01491713          	sll	a4,s2,0x14
80002858:	7ff00637          	lui	a2,0x7ff00
8000285c:	00c79793          	sll	a5,a5,0xc
80002860:	00c77733          	and	a4,a4,a2
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80002864:	01c12083          	lw	ra,28(sp)
80002868:	01812403          	lw	s0,24(sp)
  FP_PACK_SEMIRAW_D (r, R);
8000286c:	00c7d793          	srl	a5,a5,0xc
80002870:	00f767b3          	or	a5,a4,a5
80002874:	01f49713          	sll	a4,s1,0x1f
80002878:	00e7e633          	or	a2,a5,a4
}
8000287c:	01412483          	lw	s1,20(sp)
80002880:	01012903          	lw	s2,16(sp)
80002884:	00c12983          	lw	s3,12(sp)
80002888:	00068513          	mv	a0,a3
8000288c:	00060593          	mv	a1,a2
80002890:	02010113          	add	sp,sp,32
80002894:	00008067          	ret
80002898:	00000793          	li	a5,0
8000289c:	00000513          	li	a0,0
800028a0:	f85ff06f          	j	80002824 <__subdf3+0x728>

800028a4 <__fixdfsi>:
  FP_DECL_EX;
  FP_DECL_D (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
800028a4:	0145d713          	srl	a4,a1,0x14
800028a8:	001006b7          	lui	a3,0x100
800028ac:	fff68793          	add	a5,a3,-1 # fffff <__stack_size+0xfbfff>
800028b0:	7ff77713          	and	a4,a4,2047
  FP_TO_INT_D (r, A, SI_BITS, 1);
800028b4:	3fe00613          	li	a2,1022
  FP_UNPACK_RAW_D (A, a);
800028b8:	00b7f7b3          	and	a5,a5,a1
800028bc:	01f5d593          	srl	a1,a1,0x1f
  FP_TO_INT_D (r, A, SI_BITS, 1);
800028c0:	04e65e63          	bge	a2,a4,8000291c <__fixdfsi+0x78>
800028c4:	41d00613          	li	a2,1053
800028c8:	00e65a63          	bge	a2,a4,800028dc <__fixdfsi+0x38>
800028cc:	80000537          	lui	a0,0x80000
800028d0:	fff50513          	add	a0,a0,-1 # 7fffffff <__stack_size+0x7fffbfff>
800028d4:	00a58533          	add	a0,a1,a0
800028d8:	00008067          	ret
800028dc:	00d7e7b3          	or	a5,a5,a3
800028e0:	43300693          	li	a3,1075
800028e4:	40e686b3          	sub	a3,a3,a4
800028e8:	01f00613          	li	a2,31
800028ec:	02d64063          	blt	a2,a3,8000290c <__fixdfsi+0x68>
800028f0:	bed70713          	add	a4,a4,-1043
800028f4:	00e797b3          	sll	a5,a5,a4
800028f8:	00d55533          	srl	a0,a0,a3
800028fc:	00a7e533          	or	a0,a5,a0
80002900:	02058063          	beqz	a1,80002920 <__fixdfsi+0x7c>
80002904:	40a00533          	neg	a0,a0
80002908:	00008067          	ret
8000290c:	41300693          	li	a3,1043
80002910:	40e68733          	sub	a4,a3,a4
80002914:	00e7d533          	srl	a0,a5,a4
80002918:	fe9ff06f          	j	80002900 <__fixdfsi+0x5c>
8000291c:	00000513          	li	a0,0
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80002920:	00008067          	ret

80002924 <__fixunsdfsi>:
  FP_DECL_EX;
  FP_DECL_D (A);
  USItype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_D (A, a);
80002924:	0145d713          	srl	a4,a1,0x14
80002928:	00100837          	lui	a6,0x100
8000292c:	fff80793          	add	a5,a6,-1 # fffff <__stack_size+0xfbfff>
80002930:	7ff77713          	and	a4,a4,2047
  FP_TO_INT_D (r, A, SI_BITS, 0);
80002934:	3fe00613          	li	a2,1022
  FP_UNPACK_RAW_D (A, a);
80002938:	00b7f7b3          	and	a5,a5,a1
{
8000293c:	00050693          	mv	a3,a0
  FP_UNPACK_RAW_D (A, a);
80002940:	01f5d593          	srl	a1,a1,0x1f
  FP_TO_INT_D (r, A, SI_BITS, 0);
80002944:	04e65a63          	bge	a2,a4,80002998 <__fixunsdfsi+0x74>
80002948:	0015c613          	xor	a2,a1,1
8000294c:	41e60613          	add	a2,a2,1054 # 7ff0041e <__stack_size+0x7fefc41e>
80002950:	fff58513          	add	a0,a1,-1
80002954:	04c75463          	bge	a4,a2,8000299c <__fixunsdfsi+0x78>
80002958:	00000513          	li	a0,0
8000295c:	04059063          	bnez	a1,8000299c <__fixunsdfsi+0x78>
80002960:	43300613          	li	a2,1075
80002964:	40e60633          	sub	a2,a2,a4
80002968:	01f00593          	li	a1,31
8000296c:	0107e7b3          	or	a5,a5,a6
80002970:	00c5cc63          	blt	a1,a2,80002988 <__fixunsdfsi+0x64>
80002974:	bed70713          	add	a4,a4,-1043
80002978:	00e797b3          	sll	a5,a5,a4
8000297c:	00c6d533          	srl	a0,a3,a2
80002980:	00a7e533          	or	a0,a5,a0
80002984:	00008067          	ret
80002988:	41300693          	li	a3,1043
8000298c:	40e68733          	sub	a4,a3,a4
80002990:	00e7d533          	srl	a0,a5,a4
80002994:	00008067          	ret
80002998:	00000513          	li	a0,0
  FP_HANDLE_EXCEPTIONS;

  return r;
}
8000299c:	00008067          	ret

800029a0 <__floatsidf>:
#include "soft-fp.h"
#include "double.h"

DFtype
__floatsidf (SItype i)
{
800029a0:	ff010113          	add	sp,sp,-16
800029a4:	00112623          	sw	ra,12(sp)
800029a8:	00812423          	sw	s0,8(sp)
800029ac:	00912223          	sw	s1,4(sp)
  FP_DECL_D (A);
  DFtype a;

  FP_FROM_INT_D (A, i, SI_BITS, USItype);
800029b0:	08050663          	beqz	a0,80002a3c <__floatsidf+0x9c>
800029b4:	41f55793          	sra	a5,a0,0x1f
800029b8:	00a7c433          	xor	s0,a5,a0
800029bc:	40f40433          	sub	s0,s0,a5
800029c0:	01f55493          	srl	s1,a0,0x1f
800029c4:	00040513          	mv	a0,s0
800029c8:	2a9000ef          	jal	80003470 <__clzsi2>
800029cc:	41e00713          	li	a4,1054
800029d0:	00a00793          	li	a5,10
800029d4:	40a70733          	sub	a4,a4,a0
800029d8:	04a7c863          	blt	a5,a0,80002a28 <__floatsidf+0x88>
800029dc:	00b00793          	li	a5,11
800029e0:	40a787b3          	sub	a5,a5,a0
800029e4:	01550513          	add	a0,a0,21
800029e8:	00f457b3          	srl	a5,s0,a5
800029ec:	00a41433          	sll	s0,s0,a0
800029f0:	00048513          	mv	a0,s1
  FP_PACK_RAW_D (a, A);
800029f4:	00c79793          	sll	a5,a5,0xc
800029f8:	00c7d793          	srl	a5,a5,0xc
800029fc:	01471713          	sll	a4,a4,0x14
80002a00:	01f51513          	sll	a0,a0,0x1f
80002a04:	00f76733          	or	a4,a4,a5

  return a;
}
80002a08:	00c12083          	lw	ra,12(sp)
  FP_PACK_RAW_D (a, A);
80002a0c:	00a767b3          	or	a5,a4,a0
}
80002a10:	00040513          	mv	a0,s0
80002a14:	00812403          	lw	s0,8(sp)
80002a18:	00412483          	lw	s1,4(sp)
80002a1c:	00078593          	mv	a1,a5
80002a20:	01010113          	add	sp,sp,16
80002a24:	00008067          	ret
  FP_FROM_INT_D (A, i, SI_BITS, USItype);
80002a28:	ff550513          	add	a0,a0,-11
80002a2c:	00a417b3          	sll	a5,s0,a0
80002a30:	00048513          	mv	a0,s1
80002a34:	00000413          	li	s0,0
80002a38:	fbdff06f          	j	800029f4 <__floatsidf+0x54>
80002a3c:	00000713          	li	a4,0
80002a40:	00000793          	li	a5,0
80002a44:	ff1ff06f          	j	80002a34 <__floatsidf+0x94>

80002a48 <__floatunsidf>:
#include "soft-fp.h"
#include "double.h"

DFtype
__floatunsidf (USItype i)
{
80002a48:	ff010113          	add	sp,sp,-16
80002a4c:	00812423          	sw	s0,8(sp)
80002a50:	00112623          	sw	ra,12(sp)
80002a54:	00050413          	mv	s0,a0
  FP_DECL_D (A);
  DFtype a;

  FP_FROM_INT_D (A, i, SI_BITS, USItype);
80002a58:	06050263          	beqz	a0,80002abc <__floatunsidf+0x74>
80002a5c:	215000ef          	jal	80003470 <__clzsi2>
80002a60:	41e00713          	li	a4,1054
80002a64:	00a00793          	li	a5,10
80002a68:	40a70733          	sub	a4,a4,a0
80002a6c:	04a7c063          	blt	a5,a0,80002aac <__floatunsidf+0x64>
80002a70:	00b00793          	li	a5,11
80002a74:	40a787b3          	sub	a5,a5,a0
80002a78:	01550513          	add	a0,a0,21
80002a7c:	00f457b3          	srl	a5,s0,a5
80002a80:	00a41433          	sll	s0,s0,a0
  FP_PACK_RAW_D (a, A);

  return a;
}
80002a84:	00c12083          	lw	ra,12(sp)
80002a88:	00040513          	mv	a0,s0
  FP_PACK_RAW_D (a, A);
80002a8c:	00c79793          	sll	a5,a5,0xc
}
80002a90:	00812403          	lw	s0,8(sp)
  FP_PACK_RAW_D (a, A);
80002a94:	01471713          	sll	a4,a4,0x14
80002a98:	00c7d793          	srl	a5,a5,0xc
80002a9c:	00f766b3          	or	a3,a4,a5
}
80002aa0:	00068593          	mv	a1,a3
80002aa4:	01010113          	add	sp,sp,16
80002aa8:	00008067          	ret
  FP_FROM_INT_D (A, i, SI_BITS, USItype);
80002aac:	ff550513          	add	a0,a0,-11
80002ab0:	00a417b3          	sll	a5,s0,a0
80002ab4:	00000413          	li	s0,0
80002ab8:	fcdff06f          	j	80002a84 <__floatunsidf+0x3c>
80002abc:	00000793          	li	a5,0
80002ac0:	00000713          	li	a4,0
80002ac4:	fc1ff06f          	j	80002a84 <__floatunsidf+0x3c>

80002ac8 <__divsf3>:
#include "soft-fp.h"
#include "single.h"

SFtype
__divsf3 (SFtype a, SFtype b)
{
80002ac8:	fe010113          	add	sp,sp,-32
80002acc:	00912a23          	sw	s1,20(sp)
80002ad0:	01755493          	srl	s1,a0,0x17
80002ad4:	01212823          	sw	s2,16(sp)
80002ad8:	01312623          	sw	s3,12(sp)
80002adc:	01412423          	sw	s4,8(sp)
  FP_DECL_S (B);
  FP_DECL_S (R);
  SFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_S (A, a);
80002ae0:	00951993          	sll	s3,a0,0x9
{
80002ae4:	00112e23          	sw	ra,28(sp)
80002ae8:	00812c23          	sw	s0,24(sp)
80002aec:	01512223          	sw	s5,4(sp)
80002af0:	0ff4f493          	zext.b	s1,s1
80002af4:	00058a13          	mv	s4,a1
  FP_UNPACK_S (A, a);
80002af8:	0099d993          	srl	s3,s3,0x9
80002afc:	01f55913          	srl	s2,a0,0x1f
80002b00:	08048463          	beqz	s1,80002b88 <__divsf3+0xc0>
80002b04:	0ff00793          	li	a5,255
80002b08:	0af48063          	beq	s1,a5,80002ba8 <__divsf3+0xe0>
80002b0c:	00399993          	sll	s3,s3,0x3
80002b10:	040007b7          	lui	a5,0x4000
80002b14:	00f9e9b3          	or	s3,s3,a5
80002b18:	f8148493          	add	s1,s1,-127
80002b1c:	00000a93          	li	s5,0
  FP_UNPACK_S (B, b);
80002b20:	017a5793          	srl	a5,s4,0x17
80002b24:	009a1413          	sll	s0,s4,0x9
80002b28:	0ff7f793          	zext.b	a5,a5
80002b2c:	00945413          	srl	s0,s0,0x9
80002b30:	01fa5a13          	srl	s4,s4,0x1f
80002b34:	08078a63          	beqz	a5,80002bc8 <__divsf3+0x100>
80002b38:	0ff00713          	li	a4,255
80002b3c:	0ae78663          	beq	a5,a4,80002be8 <__divsf3+0x120>
80002b40:	00341413          	sll	s0,s0,0x3
80002b44:	04000737          	lui	a4,0x4000
80002b48:	00e46433          	or	s0,s0,a4
80002b4c:	f8178793          	add	a5,a5,-127 # 3ffff81 <__stack_size+0x3ffbf81>
80002b50:	00000713          	li	a4,0
  FP_DIV_S (R, A, B);
80002b54:	40f484b3          	sub	s1,s1,a5
80002b58:	002a9793          	sll	a5,s5,0x2
80002b5c:	00e7e7b3          	or	a5,a5,a4
80002b60:	fff78793          	add	a5,a5,-1
80002b64:	00e00613          	li	a2,14
80002b68:	014946b3          	xor	a3,s2,s4
80002b6c:	08f66e63          	bltu	a2,a5,80002c08 <__divsf3+0x140>
80002b70:	a0000637          	lui	a2,0xa0000
80002b74:	00279793          	sll	a5,a5,0x2
80002b78:	03c60613          	add	a2,a2,60 # a000003c <Func_2+0x1fffa380>
80002b7c:	00c787b3          	add	a5,a5,a2
80002b80:	0007a783          	lw	a5,0(a5)
80002b84:	00078067          	jr	a5
  FP_UNPACK_S (A, a);
80002b88:	02098a63          	beqz	s3,80002bbc <__divsf3+0xf4>
80002b8c:	00098513          	mv	a0,s3
80002b90:	0e1000ef          	jal	80003470 <__clzsi2>
80002b94:	ffb50793          	add	a5,a0,-5
80002b98:	f8a00493          	li	s1,-118
80002b9c:	00f999b3          	sll	s3,s3,a5
80002ba0:	40a484b3          	sub	s1,s1,a0
80002ba4:	f79ff06f          	j	80002b1c <__divsf3+0x54>
80002ba8:	0ff00493          	li	s1,255
80002bac:	00200a93          	li	s5,2
80002bb0:	f60988e3          	beqz	s3,80002b20 <__divsf3+0x58>
80002bb4:	00300a93          	li	s5,3
80002bb8:	f69ff06f          	j	80002b20 <__divsf3+0x58>
80002bbc:	00000493          	li	s1,0
80002bc0:	00100a93          	li	s5,1
80002bc4:	f5dff06f          	j	80002b20 <__divsf3+0x58>
  FP_UNPACK_S (B, b);
80002bc8:	02040a63          	beqz	s0,80002bfc <__divsf3+0x134>
80002bcc:	00040513          	mv	a0,s0
80002bd0:	0a1000ef          	jal	80003470 <__clzsi2>
80002bd4:	ffb50793          	add	a5,a0,-5
80002bd8:	00f41433          	sll	s0,s0,a5
80002bdc:	f8a00793          	li	a5,-118
80002be0:	40a787b3          	sub	a5,a5,a0
80002be4:	f6dff06f          	j	80002b50 <__divsf3+0x88>
80002be8:	0ff00793          	li	a5,255
80002bec:	00200713          	li	a4,2
80002bf0:	f60402e3          	beqz	s0,80002b54 <__divsf3+0x8c>
80002bf4:	00300713          	li	a4,3
80002bf8:	f5dff06f          	j	80002b54 <__divsf3+0x8c>
80002bfc:	00000793          	li	a5,0
80002c00:	00100713          	li	a4,1
80002c04:	f51ff06f          	j	80002b54 <__divsf3+0x8c>
  FP_DIV_S (R, A, B);
80002c08:	00541613          	sll	a2,s0,0x5
80002c0c:	1289f263          	bgeu	s3,s0,80002d30 <__divsf3+0x268>
80002c10:	fff48493          	add	s1,s1,-1
80002c14:	00000793          	li	a5,0
80002c18:	01065593          	srl	a1,a2,0x10
80002c1c:	02b9d833          	divu	a6,s3,a1
80002c20:	00010737          	lui	a4,0x10
80002c24:	fe070713          	add	a4,a4,-32 # ffe0 <__stack_size+0xbfe0>
80002c28:	00e67733          	and	a4,a2,a4
80002c2c:	0107d793          	srl	a5,a5,0x10
80002c30:	02b9f9b3          	remu	s3,s3,a1
80002c34:	00080413          	mv	s0,a6
80002c38:	03070533          	mul	a0,a4,a6
80002c3c:	01099993          	sll	s3,s3,0x10
80002c40:	0137e7b3          	or	a5,a5,s3
80002c44:	00a7fe63          	bgeu	a5,a0,80002c60 <__divsf3+0x198>
80002c48:	00f607b3          	add	a5,a2,a5
80002c4c:	fff80413          	add	s0,a6,-1
80002c50:	00c7e863          	bltu	a5,a2,80002c60 <__divsf3+0x198>
80002c54:	00a7f663          	bgeu	a5,a0,80002c60 <__divsf3+0x198>
80002c58:	ffe80413          	add	s0,a6,-2
80002c5c:	00c787b3          	add	a5,a5,a2
80002c60:	40a787b3          	sub	a5,a5,a0
80002c64:	02b7d533          	divu	a0,a5,a1
80002c68:	02b7f7b3          	remu	a5,a5,a1
80002c6c:	00050593          	mv	a1,a0
80002c70:	02a70733          	mul	a4,a4,a0
80002c74:	01079793          	sll	a5,a5,0x10
80002c78:	02e7f263          	bgeu	a5,a4,80002c9c <__divsf3+0x1d4>
80002c7c:	00c78833          	add	a6,a5,a2
80002c80:	00f838b3          	sltu	a7,a6,a5
80002c84:	fff50593          	add	a1,a0,-1
80002c88:	00080793          	mv	a5,a6
80002c8c:	00089863          	bnez	a7,80002c9c <__divsf3+0x1d4>
80002c90:	00e87663          	bgeu	a6,a4,80002c9c <__divsf3+0x1d4>
80002c94:	ffe50593          	add	a1,a0,-2
80002c98:	00c807b3          	add	a5,a6,a2
80002c9c:	01041413          	sll	s0,s0,0x10
80002ca0:	40e787b3          	sub	a5,a5,a4
80002ca4:	00b46433          	or	s0,s0,a1
80002ca8:	00f037b3          	snez	a5,a5
80002cac:	00f46433          	or	s0,s0,a5
  FP_PACK_S (r, R);
80002cb0:	07f48713          	add	a4,s1,127
80002cb4:	0ce05863          	blez	a4,80002d84 <__divsf3+0x2bc>
80002cb8:	00747793          	and	a5,s0,7
80002cbc:	00078a63          	beqz	a5,80002cd0 <__divsf3+0x208>
80002cc0:	00f47793          	and	a5,s0,15
80002cc4:	00400613          	li	a2,4
80002cc8:	00c78463          	beq	a5,a2,80002cd0 <__divsf3+0x208>
80002ccc:	00440413          	add	s0,s0,4
80002cd0:	00441793          	sll	a5,s0,0x4
80002cd4:	0007da63          	bgez	a5,80002ce8 <__divsf3+0x220>
80002cd8:	f80007b7          	lui	a5,0xf8000
80002cdc:	fff78793          	add	a5,a5,-1 # f7ffffff <__stack_base+0x37ffffff>
80002ce0:	00f47433          	and	s0,s0,a5
80002ce4:	08048713          	add	a4,s1,128
80002ce8:	0fe00793          	li	a5,254
80002cec:	06e7ca63          	blt	a5,a4,80002d60 <__divsf3+0x298>
80002cf0:	00345793          	srl	a5,s0,0x3
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80002cf4:	01c12083          	lw	ra,28(sp)
80002cf8:	01812403          	lw	s0,24(sp)
  FP_PACK_S (r, R);
80002cfc:	00979793          	sll	a5,a5,0x9
80002d00:	01771713          	sll	a4,a4,0x17
80002d04:	0097d793          	srl	a5,a5,0x9
80002d08:	00f76733          	or	a4,a4,a5
80002d0c:	01f69513          	sll	a0,a3,0x1f
}
80002d10:	01412483          	lw	s1,20(sp)
80002d14:	01012903          	lw	s2,16(sp)
80002d18:	00c12983          	lw	s3,12(sp)
80002d1c:	00812a03          	lw	s4,8(sp)
80002d20:	00412a83          	lw	s5,4(sp)
80002d24:	00a76533          	or	a0,a4,a0
80002d28:	02010113          	add	sp,sp,32
80002d2c:	00008067          	ret
  FP_DIV_S (R, A, B);
80002d30:	01f99793          	sll	a5,s3,0x1f
80002d34:	0019d993          	srl	s3,s3,0x1
80002d38:	ee1ff06f          	j	80002c18 <__divsf3+0x150>
  FP_UNPACK_S (A, a);
80002d3c:	00090693          	mv	a3,s2
  FP_DIV_S (R, A, B);
80002d40:	00098413          	mv	s0,s3
80002d44:	000a8713          	mv	a4,s5
  FP_PACK_S (r, R);
80002d48:	00300793          	li	a5,3
80002d4c:	08f70663          	beq	a4,a5,80002dd8 <__divsf3+0x310>
80002d50:	00100793          	li	a5,1
80002d54:	08f70a63          	beq	a4,a5,80002de8 <__divsf3+0x320>
80002d58:	00200793          	li	a5,2
80002d5c:	f4f71ae3          	bne	a4,a5,80002cb0 <__divsf3+0x1e8>
80002d60:	00000793          	li	a5,0
80002d64:	0ff00713          	li	a4,255
80002d68:	f8dff06f          	j	80002cf4 <__divsf3+0x22c>
  FP_UNPACK_S (B, b);
80002d6c:	000a0693          	mv	a3,s4
  FP_DIV_S (R, A, B);
80002d70:	fd9ff06f          	j	80002d48 <__divsf3+0x280>
80002d74:	00400437          	lui	s0,0x400
80002d78:	00000693          	li	a3,0
80002d7c:	00300713          	li	a4,3
80002d80:	fc9ff06f          	j	80002d48 <__divsf3+0x280>
  FP_PACK_S (r, R);
80002d84:	00100793          	li	a5,1
80002d88:	40e787b3          	sub	a5,a5,a4
80002d8c:	01b00713          	li	a4,27
80002d90:	04f74c63          	blt	a4,a5,80002de8 <__divsf3+0x320>
80002d94:	09e48493          	add	s1,s1,158
80002d98:	00f457b3          	srl	a5,s0,a5
80002d9c:	00941433          	sll	s0,s0,s1
80002da0:	00803433          	snez	s0,s0
80002da4:	0087e7b3          	or	a5,a5,s0
80002da8:	0077f713          	and	a4,a5,7
80002dac:	00070a63          	beqz	a4,80002dc0 <__divsf3+0x2f8>
80002db0:	00f7f713          	and	a4,a5,15
80002db4:	00400613          	li	a2,4
80002db8:	00c70463          	beq	a4,a2,80002dc0 <__divsf3+0x2f8>
80002dbc:	00478793          	add	a5,a5,4
80002dc0:	00579713          	sll	a4,a5,0x5
80002dc4:	0037d793          	srl	a5,a5,0x3
80002dc8:	02075263          	bgez	a4,80002dec <__divsf3+0x324>
80002dcc:	00000793          	li	a5,0
80002dd0:	00100713          	li	a4,1
80002dd4:	f21ff06f          	j	80002cf4 <__divsf3+0x22c>
80002dd8:	004007b7          	lui	a5,0x400
80002ddc:	0ff00713          	li	a4,255
80002de0:	00000693          	li	a3,0
80002de4:	f11ff06f          	j	80002cf4 <__divsf3+0x22c>
80002de8:	00000793          	li	a5,0
80002dec:	00000713          	li	a4,0
80002df0:	f05ff06f          	j	80002cf4 <__divsf3+0x22c>

80002df4 <__mulsf3>:
#include "soft-fp.h"
#include "single.h"

SFtype
__mulsf3 (SFtype a, SFtype b)
{
80002df4:	fe010113          	add	sp,sp,-32
80002df8:	01212823          	sw	s2,16(sp)
80002dfc:	01755913          	srl	s2,a0,0x17
80002e00:	00912a23          	sw	s1,20(sp)
80002e04:	01312623          	sw	s3,12(sp)
80002e08:	01512223          	sw	s5,4(sp)
  FP_DECL_S (B);
  FP_DECL_S (R);
  SFtype r;

  FP_INIT_ROUNDMODE;
  FP_UNPACK_S (A, a);
80002e0c:	00951493          	sll	s1,a0,0x9
{
80002e10:	00112e23          	sw	ra,28(sp)
80002e14:	00812c23          	sw	s0,24(sp)
80002e18:	01412423          	sw	s4,8(sp)
80002e1c:	0ff97913          	zext.b	s2,s2
80002e20:	00058a93          	mv	s5,a1
  FP_UNPACK_S (A, a);
80002e24:	0094d493          	srl	s1,s1,0x9
80002e28:	01f55993          	srl	s3,a0,0x1f
80002e2c:	10090863          	beqz	s2,80002f3c <__mulsf3+0x148>
80002e30:	0ff00793          	li	a5,255
80002e34:	12f90463          	beq	s2,a5,80002f5c <__mulsf3+0x168>
80002e38:	00349493          	sll	s1,s1,0x3
80002e3c:	040007b7          	lui	a5,0x4000
80002e40:	00f4e4b3          	or	s1,s1,a5
80002e44:	f8190913          	add	s2,s2,-127
80002e48:	00000a13          	li	s4,0
  FP_UNPACK_S (B, b);
80002e4c:	017ad793          	srl	a5,s5,0x17
80002e50:	009a9413          	sll	s0,s5,0x9
80002e54:	0ff7f793          	zext.b	a5,a5
80002e58:	00945413          	srl	s0,s0,0x9
80002e5c:	01fada93          	srl	s5,s5,0x1f
80002e60:	10078e63          	beqz	a5,80002f7c <__mulsf3+0x188>
80002e64:	0ff00713          	li	a4,255
80002e68:	12e78a63          	beq	a5,a4,80002f9c <__mulsf3+0x1a8>
80002e6c:	00341413          	sll	s0,s0,0x3
80002e70:	04000737          	lui	a4,0x4000
80002e74:	00e46433          	or	s0,s0,a4
80002e78:	f8178793          	add	a5,a5,-127 # 3ffff81 <__stack_size+0x3ffbf81>
80002e7c:	00000713          	li	a4,0
  FP_MUL_S (R, A, B);
80002e80:	00f90933          	add	s2,s2,a5
80002e84:	002a1793          	sll	a5,s4,0x2
80002e88:	00e7e7b3          	or	a5,a5,a4
80002e8c:	00a00613          	li	a2,10
80002e90:	00190693          	add	a3,s2,1
80002e94:	1ef64263          	blt	a2,a5,80003078 <__mulsf3+0x284>
80002e98:	00200613          	li	a2,2
80002e9c:	0159c9b3          	xor	s3,s3,s5
80002ea0:	10f64e63          	blt	a2,a5,80002fbc <__mulsf3+0x1c8>
80002ea4:	fff78793          	add	a5,a5,-1
80002ea8:	00100613          	li	a2,1
80002eac:	12f67a63          	bgeu	a2,a5,80002fe0 <__mulsf3+0x1ec>
80002eb0:	00010837          	lui	a6,0x10
80002eb4:	fff80513          	add	a0,a6,-1 # ffff <__stack_size+0xbfff>
80002eb8:	0104d613          	srl	a2,s1,0x10
80002ebc:	01045793          	srl	a5,s0,0x10
80002ec0:	00a4f4b3          	and	s1,s1,a0
80002ec4:	00a47433          	and	s0,s0,a0
80002ec8:	029405b3          	mul	a1,s0,s1
80002ecc:	02860433          	mul	s0,a2,s0
80002ed0:	02f60633          	mul	a2,a2,a5
80002ed4:	029787b3          	mul	a5,a5,s1
80002ed8:	00878733          	add	a4,a5,s0
80002edc:	0105d793          	srl	a5,a1,0x10
80002ee0:	00e787b3          	add	a5,a5,a4
80002ee4:	0087f463          	bgeu	a5,s0,80002eec <__mulsf3+0xf8>
80002ee8:	01060633          	add	a2,a2,a6
80002eec:	00a7f733          	and	a4,a5,a0
80002ef0:	01071713          	sll	a4,a4,0x10
80002ef4:	00a5f5b3          	and	a1,a1,a0
80002ef8:	00b70733          	add	a4,a4,a1
80002efc:	0107d793          	srl	a5,a5,0x10
80002f00:	00671413          	sll	s0,a4,0x6
80002f04:	00c787b3          	add	a5,a5,a2
80002f08:	01a75713          	srl	a4,a4,0x1a
80002f0c:	00679793          	sll	a5,a5,0x6
80002f10:	00803433          	snez	s0,s0
80002f14:	00e46433          	or	s0,s0,a4
80002f18:	00479713          	sll	a4,a5,0x4
80002f1c:	0087e433          	or	s0,a5,s0
80002f20:	00075a63          	bgez	a4,80002f34 <__mulsf3+0x140>
80002f24:	00145793          	srl	a5,s0,0x1
80002f28:	00147413          	and	s0,s0,1
80002f2c:	0087e433          	or	s0,a5,s0
80002f30:	00068913          	mv	s2,a3
80002f34:	00090693          	mv	a3,s2
80002f38:	0c00006f          	j	80002ff8 <__mulsf3+0x204>
  FP_UNPACK_S (A, a);
80002f3c:	02048a63          	beqz	s1,80002f70 <__mulsf3+0x17c>
80002f40:	00048513          	mv	a0,s1
80002f44:	52c000ef          	jal	80003470 <__clzsi2>
80002f48:	ffb50793          	add	a5,a0,-5
80002f4c:	f8a00913          	li	s2,-118
80002f50:	00f494b3          	sll	s1,s1,a5
80002f54:	40a90933          	sub	s2,s2,a0
80002f58:	ef1ff06f          	j	80002e48 <__mulsf3+0x54>
80002f5c:	0ff00913          	li	s2,255
80002f60:	00200a13          	li	s4,2
80002f64:	ee0484e3          	beqz	s1,80002e4c <__mulsf3+0x58>
80002f68:	00300a13          	li	s4,3
80002f6c:	ee1ff06f          	j	80002e4c <__mulsf3+0x58>
80002f70:	00000913          	li	s2,0
80002f74:	00100a13          	li	s4,1
80002f78:	ed5ff06f          	j	80002e4c <__mulsf3+0x58>
  FP_UNPACK_S (B, b);
80002f7c:	02040a63          	beqz	s0,80002fb0 <__mulsf3+0x1bc>
80002f80:	00040513          	mv	a0,s0
80002f84:	4ec000ef          	jal	80003470 <__clzsi2>
80002f88:	ffb50793          	add	a5,a0,-5
80002f8c:	00f41433          	sll	s0,s0,a5
80002f90:	f8a00793          	li	a5,-118
80002f94:	40a787b3          	sub	a5,a5,a0
80002f98:	ee5ff06f          	j	80002e7c <__mulsf3+0x88>
80002f9c:	0ff00793          	li	a5,255
80002fa0:	00200713          	li	a4,2
80002fa4:	ec040ee3          	beqz	s0,80002e80 <__mulsf3+0x8c>
80002fa8:	00300713          	li	a4,3
80002fac:	ed5ff06f          	j	80002e80 <__mulsf3+0x8c>
80002fb0:	00000793          	li	a5,0
80002fb4:	00100713          	li	a4,1
80002fb8:	ec9ff06f          	j	80002e80 <__mulsf3+0x8c>
80002fbc:	00100613          	li	a2,1
80002fc0:	00f617b3          	sll	a5,a2,a5
  FP_MUL_S (R, A, B);
80002fc4:	5307f613          	and	a2,a5,1328
80002fc8:	0c061063          	bnez	a2,80003088 <__mulsf3+0x294>
80002fcc:	2407f613          	and	a2,a5,576
80002fd0:	12061263          	bnez	a2,800030f4 <__mulsf3+0x300>
80002fd4:	0887f793          	and	a5,a5,136
80002fd8:	ec078ce3          	beqz	a5,80002eb0 <__mulsf3+0xbc>
  FP_UNPACK_S (B, b);
80002fdc:	000a8993          	mv	s3,s5
  FP_PACK_S (r, R);
80002fe0:	00200793          	li	a5,2
80002fe4:	10f70263          	beq	a4,a5,800030e8 <__mulsf3+0x2f4>
80002fe8:	00300793          	li	a5,3
80002fec:	10f70463          	beq	a4,a5,800030f4 <__mulsf3+0x300>
80002ff0:	00100793          	li	a5,1
80002ff4:	10f70863          	beq	a4,a5,80003104 <__mulsf3+0x310>
80002ff8:	07f68713          	add	a4,a3,127
80002ffc:	08e05c63          	blez	a4,80003094 <__mulsf3+0x2a0>
80003000:	00747793          	and	a5,s0,7
80003004:	00078a63          	beqz	a5,80003018 <__mulsf3+0x224>
80003008:	00f47793          	and	a5,s0,15
8000300c:	00400613          	li	a2,4
80003010:	00c78463          	beq	a5,a2,80003018 <__mulsf3+0x224>
80003014:	00440413          	add	s0,s0,4 # 400004 <__stack_size+0x3fc004>
80003018:	00441793          	sll	a5,s0,0x4
8000301c:	0007da63          	bgez	a5,80003030 <__mulsf3+0x23c>
80003020:	f80007b7          	lui	a5,0xf8000
80003024:	fff78793          	add	a5,a5,-1 # f7ffffff <__stack_base+0x37ffffff>
80003028:	00f47433          	and	s0,s0,a5
8000302c:	08068713          	add	a4,a3,128
80003030:	0fe00793          	li	a5,254
80003034:	0ae7ca63          	blt	a5,a4,800030e8 <__mulsf3+0x2f4>
80003038:	00345793          	srl	a5,s0,0x3
  FP_HANDLE_EXCEPTIONS;

  return r;
}
8000303c:	01c12083          	lw	ra,28(sp)
80003040:	01812403          	lw	s0,24(sp)
  FP_PACK_S (r, R);
80003044:	00979793          	sll	a5,a5,0x9
80003048:	01771513          	sll	a0,a4,0x17
8000304c:	0097d793          	srl	a5,a5,0x9
80003050:	01f99993          	sll	s3,s3,0x1f
80003054:	00f56533          	or	a0,a0,a5
}
80003058:	01412483          	lw	s1,20(sp)
8000305c:	01012903          	lw	s2,16(sp)
80003060:	00812a03          	lw	s4,8(sp)
80003064:	00412a83          	lw	s5,4(sp)
  FP_PACK_S (r, R);
80003068:	01356533          	or	a0,a0,s3
}
8000306c:	00c12983          	lw	s3,12(sp)
80003070:	02010113          	add	sp,sp,32
80003074:	00008067          	ret
  FP_MUL_S (R, A, B);
80003078:	00f00613          	li	a2,15
8000307c:	06c78c63          	beq	a5,a2,800030f4 <__mulsf3+0x300>
80003080:	00b00613          	li	a2,11
80003084:	f4c78ce3          	beq	a5,a2,80002fdc <__mulsf3+0x1e8>
80003088:	00048413          	mv	s0,s1
8000308c:	000a0713          	mv	a4,s4
80003090:	f51ff06f          	j	80002fe0 <__mulsf3+0x1ec>
  FP_PACK_S (r, R);
80003094:	00100793          	li	a5,1
80003098:	40e787b3          	sub	a5,a5,a4
8000309c:	01b00713          	li	a4,27
800030a0:	06f74263          	blt	a4,a5,80003104 <__mulsf3+0x310>
800030a4:	09e68693          	add	a3,a3,158
800030a8:	00d416b3          	sll	a3,s0,a3
800030ac:	00f457b3          	srl	a5,s0,a5
800030b0:	00d036b3          	snez	a3,a3
800030b4:	00d7e7b3          	or	a5,a5,a3
800030b8:	0077f713          	and	a4,a5,7
800030bc:	00070a63          	beqz	a4,800030d0 <__mulsf3+0x2dc>
800030c0:	00f7f713          	and	a4,a5,15
800030c4:	00400693          	li	a3,4
800030c8:	00d70463          	beq	a4,a3,800030d0 <__mulsf3+0x2dc>
800030cc:	00478793          	add	a5,a5,4
800030d0:	00579713          	sll	a4,a5,0x5
800030d4:	0037d793          	srl	a5,a5,0x3
800030d8:	02075863          	bgez	a4,80003108 <__mulsf3+0x314>
800030dc:	00000793          	li	a5,0
800030e0:	00100713          	li	a4,1
800030e4:	f59ff06f          	j	8000303c <__mulsf3+0x248>
800030e8:	00000793          	li	a5,0
800030ec:	0ff00713          	li	a4,255
800030f0:	f4dff06f          	j	8000303c <__mulsf3+0x248>
800030f4:	004007b7          	lui	a5,0x400
800030f8:	0ff00713          	li	a4,255
800030fc:	00000993          	li	s3,0
80003100:	f3dff06f          	j	8000303c <__mulsf3+0x248>
80003104:	00000793          	li	a5,0
80003108:	00000713          	li	a4,0
8000310c:	f31ff06f          	j	8000303c <__mulsf3+0x248>

80003110 <__floatunsisf>:
#include "soft-fp.h"
#include "single.h"

SFtype
__floatunsisf (USItype i)
{
80003110:	ff010113          	add	sp,sp,-16
80003114:	00812423          	sw	s0,8(sp)
80003118:	00112623          	sw	ra,12(sp)
8000311c:	00050413          	mv	s0,a0
  FP_DECL_EX;
  FP_DECL_S (A);
  SFtype a;

  FP_INIT_ROUNDMODE;
  FP_FROM_INT_S (A, i, SI_BITS, USItype);
80003120:	00000713          	li	a4,0
80003124:	02050463          	beqz	a0,8000314c <__floatunsisf+0x3c>
80003128:	348000ef          	jal	80003470 <__clzsi2>
8000312c:	09e00713          	li	a4,158
80003130:	40a70733          	sub	a4,a4,a0
80003134:	09600793          	li	a5,150
80003138:	02e7ca63          	blt	a5,a4,8000316c <__floatunsisf+0x5c>
8000313c:	00800793          	li	a5,8
80003140:	0af50263          	beq	a0,a5,800031e4 <__floatunsisf+0xd4>
80003144:	ff850513          	add	a0,a0,-8
80003148:	00a41433          	sll	s0,s0,a0
  FP_PACK_RAW_S (a, A);
8000314c:	00941413          	sll	s0,s0,0x9
80003150:	00945413          	srl	s0,s0,0x9
80003154:	01771513          	sll	a0,a4,0x17
  FP_HANDLE_EXCEPTIONS;

  return a;
}
80003158:	00c12083          	lw	ra,12(sp)
8000315c:	00856533          	or	a0,a0,s0
80003160:	00812403          	lw	s0,8(sp)
80003164:	01010113          	add	sp,sp,16
80003168:	00008067          	ret
  FP_FROM_INT_S (A, i, SI_BITS, USItype);
8000316c:	09900793          	li	a5,153
80003170:	06e7d463          	bge	a5,a4,800031d8 <__floatunsisf+0xc8>
80003174:	01b50793          	add	a5,a0,27
80003178:	00500693          	li	a3,5
8000317c:	00f417b3          	sll	a5,s0,a5
80003180:	40a686b3          	sub	a3,a3,a0
80003184:	00f037b3          	snez	a5,a5
80003188:	00d45433          	srl	s0,s0,a3
8000318c:	0087e7b3          	or	a5,a5,s0
80003190:	fc000437          	lui	s0,0xfc000
80003194:	fff40413          	add	s0,s0,-1 # fbffffff <__stack_base+0x3bffffff>
80003198:	0077f693          	and	a3,a5,7
8000319c:	0087f433          	and	s0,a5,s0
800031a0:	00068a63          	beqz	a3,800031b4 <__floatunsisf+0xa4>
800031a4:	00f7f793          	and	a5,a5,15
800031a8:	00400693          	li	a3,4
800031ac:	00d78463          	beq	a5,a3,800031b4 <__floatunsisf+0xa4>
800031b0:	00440413          	add	s0,s0,4
800031b4:	00541793          	sll	a5,s0,0x5
800031b8:	0007dc63          	bgez	a5,800031d0 <__floatunsisf+0xc0>
800031bc:	fc0007b7          	lui	a5,0xfc000
800031c0:	fff78793          	add	a5,a5,-1 # fbffffff <__stack_base+0x3bffffff>
800031c4:	09f00713          	li	a4,159
800031c8:	00f47433          	and	s0,s0,a5
800031cc:	40a70733          	sub	a4,a4,a0
800031d0:	00345413          	srl	s0,s0,0x3
800031d4:	f79ff06f          	j	8000314c <__floatunsisf+0x3c>
800031d8:	ffb50793          	add	a5,a0,-5
800031dc:	00f417b3          	sll	a5,s0,a5
800031e0:	fb1ff06f          	j	80003190 <__floatunsisf+0x80>
800031e4:	09600713          	li	a4,150
800031e8:	f65ff06f          	j	8000314c <__floatunsisf+0x3c>

800031ec <__floatundisf>:
#include "soft-fp.h"
#include "single.h"

SFtype
__floatundisf (UDItype i)
{
800031ec:	fe010113          	add	sp,sp,-32
800031f0:	00112e23          	sw	ra,28(sp)
800031f4:	00812c23          	sw	s0,24(sp)
800031f8:	00912a23          	sw	s1,20(sp)
800031fc:	01212823          	sw	s2,16(sp)
80003200:	01312623          	sw	s3,12(sp)
80003204:	01412423          	sw	s4,8(sp)
  FP_DECL_EX;
  FP_DECL_S (A);
  SFtype a;

  FP_INIT_ROUNDMODE;
  FP_FROM_INT_S (A, i, DI_BITS, UDItype);
80003208:	00b567b3          	or	a5,a0,a1
8000320c:	10078263          	beqz	a5,80003310 <__floatundisf+0x124>
80003210:	00050413          	mv	s0,a0
80003214:	00058a13          	mv	s4,a1
80003218:	06058063          	beqz	a1,80003278 <__floatundisf+0x8c>
8000321c:	00058513          	mv	a0,a1
80003220:	250000ef          	jal	80003470 <__clzsi2>
80003224:	00050493          	mv	s1,a0
80003228:	0be00993          	li	s3,190
8000322c:	409989b3          	sub	s3,s3,s1
80003230:	09600793          	li	a5,150
80003234:	0537c863          	blt	a5,s3,80003284 <__floatundisf+0x98>
80003238:	02800793          	li	a5,40
8000323c:	0ef48063          	beq	s1,a5,8000331c <__floatundisf+0x130>
80003240:	fd848493          	add	s1,s1,-40
80003244:	00941433          	sll	s0,s0,s1
  FP_PACK_RAW_S (a, A);
80003248:	00941413          	sll	s0,s0,0x9
8000324c:	01799513          	sll	a0,s3,0x17
80003250:	00945413          	srl	s0,s0,0x9
  FP_HANDLE_EXCEPTIONS;

  return a;
}
80003254:	01c12083          	lw	ra,28(sp)
80003258:	00856533          	or	a0,a0,s0
8000325c:	01812403          	lw	s0,24(sp)
80003260:	01412483          	lw	s1,20(sp)
80003264:	01012903          	lw	s2,16(sp)
80003268:	00c12983          	lw	s3,12(sp)
8000326c:	00812a03          	lw	s4,8(sp)
80003270:	02010113          	add	sp,sp,32
80003274:	00008067          	ret
  FP_FROM_INT_S (A, i, DI_BITS, UDItype);
80003278:	1f8000ef          	jal	80003470 <__clzsi2>
8000327c:	02050493          	add	s1,a0,32
80003280:	fa9ff06f          	j	80003228 <__floatundisf+0x3c>
80003284:	09900793          	li	a5,153
80003288:	0737de63          	bge	a5,s3,80003304 <__floatundisf+0x118>
8000328c:	01b48613          	add	a2,s1,27
80003290:	00040513          	mv	a0,s0
80003294:	000a0593          	mv	a1,s4
80003298:	1a0000ef          	jal	80003438 <__ashldi3>
8000329c:	00b56533          	or	a0,a0,a1
800032a0:	02500613          	li	a2,37
800032a4:	00a03933          	snez	s2,a0
800032a8:	40960633          	sub	a2,a2,s1
800032ac:	00040513          	mv	a0,s0
800032b0:	000a0593          	mv	a1,s4
800032b4:	14c000ef          	jal	80003400 <__lshrdi3>
800032b8:	00a96533          	or	a0,s2,a0
800032bc:	fc0007b7          	lui	a5,0xfc000
800032c0:	fff78793          	add	a5,a5,-1 # fbffffff <__stack_base+0x3bffffff>
800032c4:	00757713          	and	a4,a0,7
800032c8:	00f577b3          	and	a5,a0,a5
800032cc:	00070a63          	beqz	a4,800032e0 <__floatundisf+0xf4>
800032d0:	00f57513          	and	a0,a0,15
800032d4:	00400713          	li	a4,4
800032d8:	00e50463          	beq	a0,a4,800032e0 <__floatundisf+0xf4>
800032dc:	00478793          	add	a5,a5,4
800032e0:	00579713          	sll	a4,a5,0x5
800032e4:	00075c63          	bgez	a4,800032fc <__floatundisf+0x110>
800032e8:	fc000737          	lui	a4,0xfc000
800032ec:	fff70713          	add	a4,a4,-1 # fbffffff <__stack_base+0x3bffffff>
800032f0:	0bf00993          	li	s3,191
800032f4:	00e7f7b3          	and	a5,a5,a4
800032f8:	409989b3          	sub	s3,s3,s1
800032fc:	0037d413          	srl	s0,a5,0x3
80003300:	f49ff06f          	j	80003248 <__floatundisf+0x5c>
80003304:	fdb48513          	add	a0,s1,-37
80003308:	00a41533          	sll	a0,s0,a0
8000330c:	fb1ff06f          	j	800032bc <__floatundisf+0xd0>
80003310:	00000413          	li	s0,0
80003314:	00000993          	li	s3,0
80003318:	f31ff06f          	j	80003248 <__floatundisf+0x5c>
8000331c:	09600993          	li	s3,150
80003320:	f29ff06f          	j	80003248 <__floatundisf+0x5c>

80003324 <__extendsfdf2>:
  FP_DECL_S (A);
  FP_DECL_D (R);
  DFtype r;

  FP_INIT_EXCEPTIONS;
  FP_UNPACK_RAW_S (A, a);
80003324:	01755713          	srl	a4,a0,0x17
80003328:	0ff77713          	zext.b	a4,a4
{
8000332c:	ff010113          	add	sp,sp,-16
#if _FP_W_TYPE_SIZE < _FP_FRACBITS_D
  FP_EXTEND (D, S, 2, 1, R, A);
80003330:	00170793          	add	a5,a4,1
{
80003334:	00812423          	sw	s0,8(sp)
80003338:	00912223          	sw	s1,4(sp)
  FP_UNPACK_RAW_S (A, a);
8000333c:	00951413          	sll	s0,a0,0x9
{
80003340:	00112623          	sw	ra,12(sp)
  FP_EXTEND (D, S, 2, 1, R, A);
80003344:	0fe7f793          	and	a5,a5,254
  FP_UNPACK_RAW_S (A, a);
80003348:	00945413          	srl	s0,s0,0x9
8000334c:	01f55493          	srl	s1,a0,0x1f
  FP_EXTEND (D, S, 2, 1, R, A);
80003350:	04078263          	beqz	a5,80003394 <__extendsfdf2+0x70>
80003354:	00345793          	srl	a5,s0,0x3
80003358:	38070713          	add	a4,a4,896
8000335c:	01d41413          	sll	s0,s0,0x1d
#else
  FP_EXTEND (D, S, 1, 1, R, A);
#endif
  FP_PACK_RAW_D (r, R);
80003360:	00c79793          	sll	a5,a5,0xc
80003364:	00c7d793          	srl	a5,a5,0xc
80003368:	01471713          	sll	a4,a4,0x14
8000336c:	01f49513          	sll	a0,s1,0x1f
80003370:	00f76733          	or	a4,a4,a5
  FP_HANDLE_EXCEPTIONS;

  return r;
}
80003374:	00c12083          	lw	ra,12(sp)
  FP_PACK_RAW_D (r, R);
80003378:	00a767b3          	or	a5,a4,a0
}
8000337c:	00040513          	mv	a0,s0
80003380:	00812403          	lw	s0,8(sp)
80003384:	00412483          	lw	s1,4(sp)
80003388:	00078593          	mv	a1,a5
8000338c:	01010113          	add	sp,sp,16
80003390:	00008067          	ret
  FP_EXTEND (D, S, 2, 1, R, A);
80003394:	04071663          	bnez	a4,800033e0 <__extendsfdf2+0xbc>
80003398:	00000793          	li	a5,0
8000339c:	fc0402e3          	beqz	s0,80003360 <__extendsfdf2+0x3c>
800033a0:	00040513          	mv	a0,s0
800033a4:	0cc000ef          	jal	80003470 <__clzsi2>
800033a8:	00a00793          	li	a5,10
800033ac:	02a7c263          	blt	a5,a0,800033d0 <__extendsfdf2+0xac>
800033b0:	00b00793          	li	a5,11
800033b4:	40a787b3          	sub	a5,a5,a0
800033b8:	01550713          	add	a4,a0,21
800033bc:	00f457b3          	srl	a5,s0,a5
800033c0:	00e41433          	sll	s0,s0,a4
800033c4:	38900713          	li	a4,905
800033c8:	40a70733          	sub	a4,a4,a0
800033cc:	f95ff06f          	j	80003360 <__extendsfdf2+0x3c>
800033d0:	ff550793          	add	a5,a0,-11
800033d4:	00f417b3          	sll	a5,s0,a5
800033d8:	00000413          	li	s0,0
800033dc:	fe9ff06f          	j	800033c4 <__extendsfdf2+0xa0>
800033e0:	00000793          	li	a5,0
800033e4:	00040a63          	beqz	s0,800033f8 <__extendsfdf2+0xd4>
800033e8:	00345793          	srl	a5,s0,0x3
800033ec:	00080737          	lui	a4,0x80
800033f0:	01d41413          	sll	s0,s0,0x1d
800033f4:	00e7e7b3          	or	a5,a5,a4
800033f8:	7ff00713          	li	a4,2047
800033fc:	f65ff06f          	j	80003360 <__extendsfdf2+0x3c>

80003400 <__lshrdi3>:
  if (b == 0)
80003400:	02060063          	beqz	a2,80003420 <__lshrdi3+0x20>
  const shift_count_type bm = W_TYPE_SIZE - b;
80003404:	02000793          	li	a5,32
80003408:	40c787b3          	sub	a5,a5,a2
  if (bm <= 0)
8000340c:	00f04c63          	bgtz	a5,80003424 <__lshrdi3+0x24>
      w.s.low = (UWtype) uu.s.high >> -bm;
80003410:	fe060613          	add	a2,a2,-32
80003414:	00c5d533          	srl	a0,a1,a2
80003418:	00000713          	li	a4,0
  return w.ll;
8000341c:	00070593          	mv	a1,a4
}
80003420:	00008067          	ret
      w.s.high = (UWtype) uu.s.high >> b;
80003424:	00c5d733          	srl	a4,a1,a2
      w.s.low = ((UWtype) uu.s.low >> b) | carries;
80003428:	00c55533          	srl	a0,a0,a2
      const UWtype carries = (UWtype) uu.s.high << bm;
8000342c:	00f595b3          	sll	a1,a1,a5
      w.s.low = ((UWtype) uu.s.low >> b) | carries;
80003430:	00b56533          	or	a0,a0,a1
80003434:	fe9ff06f          	j	8000341c <__lshrdi3+0x1c>

80003438 <__ashldi3>:
  if (b == 0)
80003438:	02060063          	beqz	a2,80003458 <__ashldi3+0x20>
  const shift_count_type bm = W_TYPE_SIZE - b;
8000343c:	02000793          	li	a5,32
80003440:	40c787b3          	sub	a5,a5,a2
  if (bm <= 0)
80003444:	00f04c63          	bgtz	a5,8000345c <__ashldi3+0x24>
      w.s.high = (UWtype) uu.s.low << -bm;
80003448:	fe060613          	add	a2,a2,-32
8000344c:	00c515b3          	sll	a1,a0,a2
80003450:	00000713          	li	a4,0
  return w.ll;
80003454:	00070513          	mv	a0,a4
}
80003458:	00008067          	ret
      w.s.low = (UWtype) uu.s.low << b;
8000345c:	00c51733          	sll	a4,a0,a2
      w.s.high = ((UWtype) uu.s.high << b) | carries;
80003460:	00c595b3          	sll	a1,a1,a2
      const UWtype carries = (UWtype) uu.s.low >> bm;
80003464:	00f55533          	srl	a0,a0,a5
      w.s.high = ((UWtype) uu.s.high << b) | carries;
80003468:	00a5e5b3          	or	a1,a1,a0
8000346c:	fe9ff06f          	j	80003454 <__ashldi3+0x1c>

80003470 <__clzsi2>:
  count_leading_zeros (ret, x);
80003470:	000107b7          	lui	a5,0x10
80003474:	02f57a63          	bgeu	a0,a5,800034a8 <__clzsi2+0x38>
80003478:	10053793          	sltiu	a5,a0,256
8000347c:	0017b793          	seqz	a5,a5
80003480:	00379793          	sll	a5,a5,0x3
80003484:	a0000737          	lui	a4,0xa0000
80003488:	02000693          	li	a3,32
8000348c:	40f686b3          	sub	a3,a3,a5
80003490:	00f55533          	srl	a0,a0,a5
80003494:	07870793          	add	a5,a4,120 # a0000078 <__clz_tab>
80003498:	00a787b3          	add	a5,a5,a0
8000349c:	0007c503          	lbu	a0,0(a5) # 10000 <__stack_size+0xc000>
}
800034a0:	40a68533          	sub	a0,a3,a0
800034a4:	00008067          	ret
  count_leading_zeros (ret, x);
800034a8:	01000737          	lui	a4,0x1000
800034ac:	01800793          	li	a5,24
800034b0:	fce57ae3          	bgeu	a0,a4,80003484 <__clzsi2+0x14>
800034b4:	01000793          	li	a5,16
800034b8:	fcdff06f          	j	80003484 <__clzsi2+0x14>

800034bc <uart_init>:
800034bc:	00b52023          	sw	a1,0(a0)
800034c0:	00008067          	ret

800034c4 <uart_put_char>:
800034c4:	00052783          	lw	a5,0(a0)
800034c8:	00b7a023          	sw	a1,0(a5)
800034cc:	00008067          	ret

800034d0 <_out_null>:
800034d0:	00008067          	ret

800034d4 <_out_rev>:
800034d4:	fd010113          	add	sp,sp,-48
800034d8:	02812423          	sw	s0,40(sp)
800034dc:	01312e23          	sw	s3,28(sp)
800034e0:	01412c23          	sw	s4,24(sp)
800034e4:	01512a23          	sw	s5,20(sp)
800034e8:	01612823          	sw	s6,16(sp)
800034ec:	01712623          	sw	s7,12(sp)
800034f0:	01812423          	sw	s8,8(sp)
800034f4:	01912223          	sw	s9,4(sp)
800034f8:	02112623          	sw	ra,44(sp)
800034fc:	00088c93          	mv	s9,a7
80003500:	02912223          	sw	s1,36(sp)
80003504:	03212023          	sw	s2,32(sp)
80003508:	0038f893          	and	a7,a7,3
8000350c:	00050993          	mv	s3,a0
80003510:	00058a13          	mv	s4,a1
80003514:	00060b13          	mv	s6,a2
80003518:	00068a93          	mv	s5,a3
8000351c:	00070b93          	mv	s7,a4
80003520:	00078413          	mv	s0,a5
80003524:	00080c13          	mv	s8,a6
80003528:	0c089263          	bnez	a7,800035ec <_out_rev+0x118>
8000352c:	40f80933          	sub	s2,a6,a5
80003530:	00c90933          	add	s2,s2,a2
80003534:	00060493          	mv	s1,a2
80003538:	0d07f263          	bgeu	a5,a6,800035fc <_out_rev+0x128>
8000353c:	00048613          	mv	a2,s1
80003540:	000a8693          	mv	a3,s5
80003544:	00148493          	add	s1,s1,1
80003548:	000a0593          	mv	a1,s4
8000354c:	02000513          	li	a0,32
80003550:	000980e7          	jalr	s3
80003554:	ff2494e3          	bne	s1,s2,8000353c <_out_rev+0x68>
80003558:	04040e63          	beqz	s0,800035b4 <_out_rev+0xe0>
8000355c:	00890933          	add	s2,s2,s0
80003560:	40890633          	sub	a2,s2,s0
80003564:	fff40413          	add	s0,s0,-1
80003568:	008b87b3          	add	a5,s7,s0
8000356c:	0007c503          	lbu	a0,0(a5)
80003570:	000a8693          	mv	a3,s5
80003574:	000a0593          	mv	a1,s4
80003578:	00090493          	mv	s1,s2
8000357c:	000980e7          	jalr	s3
80003580:	fe0410e3          	bnez	s0,80003560 <_out_rev+0x8c>
80003584:	002cfc93          	and	s9,s9,2
80003588:	020c8663          	beqz	s9,800035b4 <_out_rev+0xe0>
8000358c:	41648b33          	sub	s6,s1,s6
80003590:	038b7263          	bgeu	s6,s8,800035b4 <_out_rev+0xe0>
80003594:	00048613          	mv	a2,s1
80003598:	000a8693          	mv	a3,s5
8000359c:	000a0593          	mv	a1,s4
800035a0:	02000513          	li	a0,32
800035a4:	001b0b13          	add	s6,s6,1
800035a8:	00148493          	add	s1,s1,1
800035ac:	000980e7          	jalr	s3
800035b0:	ff8b62e3          	bltu	s6,s8,80003594 <_out_rev+0xc0>
800035b4:	02c12083          	lw	ra,44(sp)
800035b8:	02812403          	lw	s0,40(sp)
800035bc:	02012903          	lw	s2,32(sp)
800035c0:	01c12983          	lw	s3,28(sp)
800035c4:	01812a03          	lw	s4,24(sp)
800035c8:	01412a83          	lw	s5,20(sp)
800035cc:	01012b03          	lw	s6,16(sp)
800035d0:	00c12b83          	lw	s7,12(sp)
800035d4:	00812c03          	lw	s8,8(sp)
800035d8:	00412c83          	lw	s9,4(sp)
800035dc:	00048513          	mv	a0,s1
800035e0:	02412483          	lw	s1,36(sp)
800035e4:	03010113          	add	sp,sp,48
800035e8:	00008067          	ret
800035ec:	00060913          	mv	s2,a2
800035f0:	00060493          	mv	s1,a2
800035f4:	f60794e3          	bnez	a5,8000355c <_out_rev+0x88>
800035f8:	f8dff06f          	j	80003584 <_out_rev+0xb0>
800035fc:	00060913          	mv	s2,a2
80003600:	f4079ee3          	bnez	a5,8000355c <_out_rev+0x88>
80003604:	fb1ff06f          	j	800035b4 <_out_rev+0xe0>

80003608 <_ntoa_format>:
80003608:	00812383          	lw	t2,8(sp)
8000360c:	00012283          	lw	t0,0(sp)
80003610:	00412f83          	lw	t6,4(sp)
80003614:	0023f313          	and	t1,t2,2
80003618:	00080f13          	mv	t5,a6
8000361c:	06031463          	bnez	t1,80003684 <_ntoa_format+0x7c>
80003620:	100f9c63          	bnez	t6,80003738 <_ntoa_format+0x130>
80003624:	0657f063          	bgeu	a5,t0,80003684 <_ntoa_format+0x7c>
80003628:	02000313          	li	t1,32
8000362c:	0013f813          	and	a6,t2,1
80003630:	2e678063          	beq	a5,t1,80003910 <_ntoa_format+0x308>
80003634:	03000e13          	li	t3,48
80003638:	02000e93          	li	t4,32
8000363c:	0080006f          	j	80003644 <_ntoa_format+0x3c>
80003640:	15d78a63          	beq	a5,t4,80003794 <_ntoa_format+0x18c>
80003644:	00178793          	add	a5,a5,1
80003648:	00f70333          	add	t1,a4,a5
8000364c:	ffc30fa3          	sb	t3,-1(t1)
80003650:	fe57e8e3          	bltu	a5,t0,80003640 <_ntoa_format+0x38>
80003654:	02080863          	beqz	a6,80003684 <_ntoa_format+0x7c>
80003658:	03f7f663          	bgeu	a5,t6,80003684 <_ntoa_format+0x7c>
8000365c:	02000813          	li	a6,32
80003660:	03000e13          	li	t3,48
80003664:	02000e93          	li	t4,32
80003668:	01079663          	bne	a5,a6,80003674 <_ntoa_format+0x6c>
8000366c:	1300006f          	j	8000379c <_ntoa_format+0x194>
80003670:	07d78663          	beq	a5,t4,800036dc <_ntoa_format+0xd4>
80003674:	00178793          	add	a5,a5,1
80003678:	00f70333          	add	t1,a4,a5
8000367c:	ffc30fa3          	sb	t3,-1(t1)
80003680:	fff798e3          	bne	a5,t6,80003670 <_ntoa_format+0x68>
80003684:	0103f813          	and	a6,t2,16
80003688:	08080e63          	beqz	a6,80003724 <_ntoa_format+0x11c>
8000368c:	4003f813          	and	a6,t2,1024
80003690:	06081463          	bnez	a6,800036f8 <_ntoa_format+0xf0>
80003694:	04079e63          	bnez	a5,800036f0 <_ntoa_format+0xe8>
80003698:	01000793          	li	a5,16
8000369c:	22f88863          	beq	a7,a5,800038cc <_ntoa_format+0x2c4>
800036a0:	00200793          	li	a5,2
800036a4:	24f88663          	beq	a7,a5,800038f0 <_ntoa_format+0x2e8>
800036a8:	03000793          	li	a5,48
800036ac:	00f70023          	sb	a5,0(a4) # 1000000 <__stack_size+0xffc000>
800036b0:	00100793          	li	a5,1
800036b4:	100f1a63          	bnez	t5,800037c8 <_ntoa_format+0x1c0>
800036b8:	0043f813          	and	a6,t2,4
800036bc:	1c080c63          	beqz	a6,80003894 <_ntoa_format+0x28c>
800036c0:	00f70833          	add	a6,a4,a5
800036c4:	02b00893          	li	a7,43
800036c8:	01180023          	sb	a7,0(a6)
800036cc:	00178793          	add	a5,a5,1
800036d0:	00038893          	mv	a7,t2
800036d4:	000f8813          	mv	a6,t6
800036d8:	dfdff06f          	j	800034d4 <_out_rev>
800036dc:	0103f813          	and	a6,t2,16
800036e0:	02000793          	li	a5,32
800036e4:	fe0806e3          	beqz	a6,800036d0 <_ntoa_format+0xc8>
800036e8:	4003f813          	and	a6,t2,1024
800036ec:	00081663          	bnez	a6,800036f8 <_ntoa_format+0xf0>
800036f0:	14f28263          	beq	t0,a5,80003834 <_ntoa_format+0x22c>
800036f4:	15f78063          	beq	a5,t6,80003834 <_ntoa_format+0x22c>
800036f8:	01000813          	li	a6,16
800036fc:	17088a63          	beq	a7,a6,80003870 <_ntoa_format+0x268>
80003700:	00200813          	li	a6,2
80003704:	11088a63          	beq	a7,a6,80003818 <_ntoa_format+0x210>
80003708:	02000813          	li	a6,32
8000370c:	fd0782e3          	beq	a5,a6,800036d0 <_ntoa_format+0xc8>
80003710:	00078813          	mv	a6,a5
80003714:	00178793          	add	a5,a5,1
80003718:	01070833          	add	a6,a4,a6
8000371c:	03000893          	li	a7,48
80003720:	01180023          	sb	a7,0(a6)
80003724:	02000813          	li	a6,32
80003728:	f90796e3          	bne	a5,a6,800036b4 <_ntoa_format+0xac>
8000372c:	00038893          	mv	a7,t2
80003730:	000f8813          	mv	a6,t6
80003734:	da1ff06f          	j	800034d4 <_out_rev>
80003738:	0013f813          	and	a6,t2,1
8000373c:	0a080463          	beqz	a6,800037e4 <_ntoa_format+0x1dc>
80003740:	120f1463          	bnez	t5,80003868 <_ntoa_format+0x260>
80003744:	00c3f313          	and	t1,t2,12
80003748:	12031063          	bnez	t1,80003868 <_ntoa_format+0x260>
8000374c:	f057f6e3          	bgeu	a5,t0,80003658 <_ntoa_format+0x50>
80003750:	02000313          	li	t1,32
80003754:	ee6790e3          	bne	a5,t1,80003634 <_ntoa_format+0x2c>
80003758:	05f7e263          	bltu	a5,t6,8000379c <_ntoa_format+0x194>
8000375c:	0103f813          	and	a6,t2,16
80003760:	02000793          	li	a5,32
80003764:	f60806e3          	beqz	a6,800036d0 <_ntoa_format+0xc8>
80003768:	4003f813          	and	a6,t2,1024
8000376c:	04081663          	bnez	a6,800037b8 <_ntoa_format+0x1b0>
80003770:	00f28463          	beq	t0,a5,80003778 <_ntoa_format+0x170>
80003774:	f8ff92e3          	bne	t6,a5,800036f8 <_ntoa_format+0xf0>
80003778:	01f00813          	li	a6,31
8000377c:	01000313          	li	t1,16
80003780:	18688c63          	beq	a7,t1,80003918 <_ntoa_format+0x310>
80003784:	00200793          	li	a5,2
80003788:	1af88863          	beq	a7,a5,80003938 <_ntoa_format+0x330>
8000378c:	00180793          	add	a5,a6,1
80003790:	f89ff06f          	j	80003718 <_ntoa_format+0x110>
80003794:	1a080c63          	beqz	a6,8000394c <_ntoa_format+0x344>
80003798:	f5f7f2e3          	bgeu	a5,t6,800036dc <_ntoa_format+0xd4>
8000379c:	0103f813          	and	a6,t2,16
800037a0:	02000793          	li	a5,32
800037a4:	f20806e3          	beqz	a6,800036d0 <_ntoa_format+0xc8>
800037a8:	4003f813          	and	a6,t2,1024
800037ac:	00081663          	bnez	a6,800037b8 <_ntoa_format+0x1b0>
800037b0:	fcf284e3          	beq	t0,a5,80003778 <_ntoa_format+0x170>
800037b4:	fcff82e3          	beq	t6,a5,80003778 <_ntoa_format+0x170>
800037b8:	01000813          	li	a6,16
800037bc:	f1089ae3          	bne	a7,a6,800036d0 <_ntoa_format+0xc8>
800037c0:	02000793          	li	a5,32
800037c4:	f0dff06f          	j	800036d0 <_ntoa_format+0xc8>
800037c8:	00f70833          	add	a6,a4,a5
800037cc:	02d00893          	li	a7,45
800037d0:	01180023          	sb	a7,0(a6)
800037d4:	00178793          	add	a5,a5,1
800037d8:	00038893          	mv	a7,t2
800037dc:	000f8813          	mv	a6,t6
800037e0:	cf5ff06f          	j	800034d4 <_out_rev>
800037e4:	ea57f0e3          	bgeu	a5,t0,80003684 <_ntoa_format+0x7c>
800037e8:	02000313          	li	t1,32
800037ec:	e46794e3          	bne	a5,t1,80003634 <_ntoa_format+0x2c>
800037f0:	0103f793          	and	a5,t2,16
800037f4:	fc0786e3          	beqz	a5,800037c0 <_ntoa_format+0x1b8>
800037f8:	4003f793          	and	a5,t2,1024
800037fc:	fc0792e3          	bnez	a5,800037c0 <_ntoa_format+0x1b8>
80003800:	02000793          	li	a5,32
80003804:	00f28463          	beq	t0,a5,8000380c <_ntoa_format+0x204>
80003808:	faff9ce3          	bne	t6,a5,800037c0 <_ntoa_format+0x1b8>
8000380c:	02000793          	li	a5,32
80003810:	01f00813          	li	a6,31
80003814:	f69ff06f          	j	8000377c <_ntoa_format+0x174>
80003818:	02000813          	li	a6,32
8000381c:	eb078ae3          	beq	a5,a6,800036d0 <_ntoa_format+0xc8>
80003820:	00f70833          	add	a6,a4,a5
80003824:	06200893          	li	a7,98
80003828:	01180023          	sb	a7,0(a6)
8000382c:	00178793          	add	a5,a5,1
80003830:	ed9ff06f          	j	80003708 <_ntoa_format+0x100>
80003834:	fff78813          	add	a6,a5,-1
80003838:	f40812e3          	bnez	a6,8000377c <_ntoa_format+0x174>
8000383c:	01000793          	li	a5,16
80003840:	e6f890e3          	bne	a7,a5,800036a0 <_ntoa_format+0x98>
80003844:	0203f793          	and	a5,t2,32
80003848:	0c078063          	beqz	a5,80003908 <_ntoa_format+0x300>
8000384c:	05800793          	li	a5,88
80003850:	00f70023          	sb	a5,0(a4)
80003854:	03000793          	li	a5,48
80003858:	00f700a3          	sb	a5,1(a4)
8000385c:	00200793          	li	a5,2
80003860:	e40f0ce3          	beqz	t5,800036b8 <_ntoa_format+0xb0>
80003864:	f65ff06f          	j	800037c8 <_ntoa_format+0x1c0>
80003868:	ffff8f93          	add	t6,t6,-1
8000386c:	ee1ff06f          	j	8000374c <_ntoa_format+0x144>
80003870:	0203f813          	and	a6,t2,32
80003874:	02081e63          	bnez	a6,800038b0 <_ntoa_format+0x2a8>
80003878:	02000813          	li	a6,32
8000387c:	f50782e3          	beq	a5,a6,800037c0 <_ntoa_format+0x1b8>
80003880:	00f70833          	add	a6,a4,a5
80003884:	07800893          	li	a7,120
80003888:	01180023          	sb	a7,0(a6)
8000388c:	00178793          	add	a5,a5,1
80003890:	e79ff06f          	j	80003708 <_ntoa_format+0x100>
80003894:	0083f813          	and	a6,t2,8
80003898:	e2080ce3          	beqz	a6,800036d0 <_ntoa_format+0xc8>
8000389c:	00f70833          	add	a6,a4,a5
800038a0:	02000893          	li	a7,32
800038a4:	01180023          	sb	a7,0(a6)
800038a8:	00178793          	add	a5,a5,1
800038ac:	e25ff06f          	j	800036d0 <_ntoa_format+0xc8>
800038b0:	02000813          	li	a6,32
800038b4:	f10786e3          	beq	a5,a6,800037c0 <_ntoa_format+0x1b8>
800038b8:	00f70833          	add	a6,a4,a5
800038bc:	05800893          	li	a7,88
800038c0:	01180023          	sb	a7,0(a6)
800038c4:	00178793          	add	a5,a5,1
800038c8:	e41ff06f          	j	80003708 <_ntoa_format+0x100>
800038cc:	0203f793          	and	a5,t2,32
800038d0:	02078c63          	beqz	a5,80003908 <_ntoa_format+0x300>
800038d4:	05800793          	li	a5,88
800038d8:	00f70023          	sb	a5,0(a4)
800038dc:	03000793          	li	a5,48
800038e0:	00f700a3          	sb	a5,1(a4)
800038e4:	00200793          	li	a5,2
800038e8:	dc0f08e3          	beqz	t5,800036b8 <_ntoa_format+0xb0>
800038ec:	eddff06f          	j	800037c8 <_ntoa_format+0x1c0>
800038f0:	06200793          	li	a5,98
800038f4:	00f70023          	sb	a5,0(a4)
800038f8:	03000793          	li	a5,48
800038fc:	00f700a3          	sb	a5,1(a4)
80003900:	00200793          	li	a5,2
80003904:	f5dff06f          	j	80003860 <_ntoa_format+0x258>
80003908:	07800793          	li	a5,120
8000390c:	fe9ff06f          	j	800038f4 <_ntoa_format+0x2ec>
80003910:	e40816e3          	bnez	a6,8000375c <_ntoa_format+0x154>
80003914:	eddff06f          	j	800037f0 <_ntoa_format+0x1e8>
80003918:	ffe78813          	add	a6,a5,-2
8000391c:	0203f893          	and	a7,t2,32
80003920:	01070833          	add	a6,a4,a6
80003924:	fff78793          	add	a5,a5,-1
80003928:	00089c63          	bnez	a7,80003940 <_ntoa_format+0x338>
8000392c:	07800893          	li	a7,120
80003930:	01180023          	sb	a7,0(a6)
80003934:	dddff06f          	j	80003710 <_ntoa_format+0x108>
80003938:	00080793          	mv	a5,a6
8000393c:	ee5ff06f          	j	80003820 <_ntoa_format+0x218>
80003940:	05800893          	li	a7,88
80003944:	01180023          	sb	a7,0(a6)
80003948:	dc9ff06f          	j	80003710 <_ntoa_format+0x108>
8000394c:	0103f813          	and	a6,t2,16
80003950:	d80800e3          	beqz	a6,800036d0 <_ntoa_format+0xc8>
80003954:	4003f813          	and	a6,t2,1024
80003958:	e60810e3          	bnez	a6,800037b8 <_ntoa_format+0x1b0>
8000395c:	d9f79ee3          	bne	a5,t6,800036f8 <_ntoa_format+0xf0>
80003960:	ed5ff06f          	j	80003834 <_ntoa_format+0x22c>

80003964 <_ntoa_long>:
80003964:	fc010113          	add	sp,sp,-64
80003968:	02812c23          	sw	s0,56(sp)
8000396c:	02112e23          	sw	ra,60(sp)
80003970:	00080e93          	mv	t4,a6
80003974:	04412403          	lw	s0,68(sp)
80003978:	00070e13          	mv	t3,a4
8000397c:	00078813          	mv	a6,a5
80003980:	00071863          	bnez	a4,80003990 <_ntoa_long+0x2c>
80003984:	40047793          	and	a5,s0,1024
80003988:	fef47413          	and	s0,s0,-17
8000398c:	08079a63          	bnez	a5,80003a20 <_ntoa_long+0xbc>
80003990:	00545713          	srl	a4,s0,0x5
80003994:	00177713          	and	a4,a4,1
80003998:	06100293          	li	t0,97
8000399c:	06071e63          	bnez	a4,80003a18 <_ntoa_long+0xb4>
800039a0:	00000793          	li	a5,0
800039a4:	01010713          	add	a4,sp,16
800039a8:	00900393          	li	t2,9
800039ac:	ff628293          	add	t0,t0,-10
800039b0:	02000093          	li	ra,32
800039b4:	00c0006f          	j	800039c0 <_ntoa_long+0x5c>
800039b8:	02178c63          	beq	a5,ra,800039f0 <_ntoa_long+0x8c>
800039bc:	00030e13          	mv	t3,t1
800039c0:	03de7f33          	remu	t5,t3,t4
800039c4:	0fff7313          	zext.b	t1,t5
800039c8:	03030f93          	add	t6,t1,48
800039cc:	00530333          	add	t1,t1,t0
800039d0:	0ff37313          	zext.b	t1,t1
800039d4:	01e3e463          	bltu	t2,t5,800039dc <_ntoa_long+0x78>
800039d8:	0ffff313          	zext.b	t1,t6
800039dc:	00178793          	add	a5,a5,1
800039e0:	00f70f33          	add	t5,a4,a5
800039e4:	fe6f0fa3          	sb	t1,-1(t5)
800039e8:	03de5333          	divu	t1,t3,t4
800039ec:	fdde76e3          	bgeu	t3,t4,800039b8 <_ntoa_long+0x54>
800039f0:	04012303          	lw	t1,64(sp)
800039f4:	00812423          	sw	s0,8(sp)
800039f8:	01112023          	sw	a7,0(sp)
800039fc:	00612223          	sw	t1,4(sp)
80003a00:	000e8893          	mv	a7,t4
80003a04:	c05ff0ef          	jal	80003608 <_ntoa_format>
80003a08:	03c12083          	lw	ra,60(sp)
80003a0c:	03812403          	lw	s0,56(sp)
80003a10:	04010113          	add	sp,sp,64
80003a14:	00008067          	ret
80003a18:	04100293          	li	t0,65
80003a1c:	f85ff06f          	j	800039a0 <_ntoa_long+0x3c>
80003a20:	00000793          	li	a5,0
80003a24:	01010713          	add	a4,sp,16
80003a28:	fc9ff06f          	j	800039f0 <_ntoa_long+0x8c>

80003a2c <_ntoa_long_long>:
80003a2c:	f7010113          	add	sp,sp,-144
80003a30:	06812c23          	sw	s0,120(sp)
80003a34:	06912a23          	sw	s1,116(sp)
80003a38:	07612023          	sw	s6,96(sp)
80003a3c:	05812c23          	sw	s8,88(sp)
80003a40:	05912a23          	sw	s9,84(sp)
80003a44:	05a12823          	sw	s10,80(sp)
80003a48:	05b12623          	sw	s11,76(sp)
80003a4c:	00078c13          	mv	s8,a5
80003a50:	06112e23          	sw	ra,124(sp)
80003a54:	07312623          	sw	s3,108(sp)
80003a58:	05712e23          	sw	s7,92(sp)
80003a5c:	09112623          	sw	a7,140(sp)
80003a60:	00f767b3          	or	a5,a4,a5
80003a64:	00a12a23          	sw	a0,20(sp)
80003a68:	00b12c23          	sw	a1,24(sp)
80003a6c:	00c12e23          	sw	a2,28(sp)
80003a70:	09012c83          	lw	s9,144(sp)
80003a74:	09c12b03          	lw	s6,156(sp)
80003a78:	00070413          	mv	s0,a4
80003a7c:	00068d13          	mv	s10,a3
80003a80:	00080d93          	mv	s11,a6
80003a84:	00088493          	mv	s1,a7
80003a88:	00079863          	bnez	a5,80003a98 <_ntoa_long_long+0x6c>
80003a8c:	400b7793          	and	a5,s6,1024
80003a90:	fefb7b13          	and	s6,s6,-17
80003a94:	10079c63          	bnez	a5,80003bac <_ntoa_long_long+0x180>
80003a98:	005b5793          	srl	a5,s6,0x5
80003a9c:	07212823          	sw	s2,112(sp)
80003aa0:	07412423          	sw	s4,104(sp)
80003aa4:	07512223          	sw	s5,100(sp)
80003aa8:	0017f793          	and	a5,a5,1
80003aac:	06100913          	li	s2,97
80003ab0:	0e079a63          	bnez	a5,80003ba4 <_ntoa_long_long+0x178>
80003ab4:	00000b93          	li	s7,0
80003ab8:	02010993          	add	s3,sp,32
80003abc:	00900a13          	li	s4,9
80003ac0:	ff690913          	add	s2,s2,-10
80003ac4:	02000a93          	li	s5,32
80003ac8:	000c8693          	mv	a3,s9
80003acc:	00048613          	mv	a2,s1
80003ad0:	00040513          	mv	a0,s0
80003ad4:	000c0593          	mv	a1,s8
80003ad8:	b9dfc0ef          	jal	80000674 <__umoddi3>
80003adc:	0ff57513          	zext.b	a0,a0
80003ae0:	01250833          	add	a6,a0,s2
80003ae4:	03050693          	add	a3,a0,48
80003ae8:	0ff87813          	zext.b	a6,a6
80003aec:	00aa6463          	bltu	s4,a0,80003af4 <_ntoa_long_long+0xc8>
80003af0:	0ff6f813          	zext.b	a6,a3
80003af4:	001b8b93          	add	s7,s7,1
80003af8:	017988b3          	add	a7,s3,s7
80003afc:	00048613          	mv	a2,s1
80003b00:	000c8693          	mv	a3,s9
80003b04:	00040513          	mv	a0,s0
80003b08:	000c0593          	mv	a1,s8
80003b0c:	ff088fa3          	sb	a6,-1(a7) # ffff <__stack_size+0xbfff>
80003b10:	f34fc0ef          	jal	80000244 <__udivdi3>
80003b14:	019c6e63          	bltu	s8,s9,80003b30 <_ntoa_long_long+0x104>
80003b18:	018c8a63          	beq	s9,s8,80003b2c <_ntoa_long_long+0x100>
80003b1c:	015b8a63          	beq	s7,s5,80003b30 <_ntoa_long_long+0x104>
80003b20:	00050413          	mv	s0,a0
80003b24:	00058c13          	mv	s8,a1
80003b28:	fa1ff06f          	j	80003ac8 <_ntoa_long_long+0x9c>
80003b2c:	fe9478e3          	bgeu	s0,s1,80003b1c <_ntoa_long_long+0xf0>
80003b30:	07012903          	lw	s2,112(sp)
80003b34:	06812a03          	lw	s4,104(sp)
80003b38:	06412a83          	lw	s5,100(sp)
80003b3c:	09812703          	lw	a4,152(sp)
80003b40:	01c12603          	lw	a2,28(sp)
80003b44:	01812583          	lw	a1,24(sp)
80003b48:	00e12223          	sw	a4,4(sp)
80003b4c:	09412703          	lw	a4,148(sp)
80003b50:	01412503          	lw	a0,20(sp)
80003b54:	01612423          	sw	s6,8(sp)
80003b58:	00e12023          	sw	a4,0(sp)
80003b5c:	00048893          	mv	a7,s1
80003b60:	000d8813          	mv	a6,s11
80003b64:	000b8793          	mv	a5,s7
80003b68:	00098713          	mv	a4,s3
80003b6c:	000d0693          	mv	a3,s10
80003b70:	a99ff0ef          	jal	80003608 <_ntoa_format>
80003b74:	07c12083          	lw	ra,124(sp)
80003b78:	07812403          	lw	s0,120(sp)
80003b7c:	07412483          	lw	s1,116(sp)
80003b80:	06c12983          	lw	s3,108(sp)
80003b84:	06012b03          	lw	s6,96(sp)
80003b88:	05c12b83          	lw	s7,92(sp)
80003b8c:	05812c03          	lw	s8,88(sp)
80003b90:	05412c83          	lw	s9,84(sp)
80003b94:	05012d03          	lw	s10,80(sp)
80003b98:	04c12d83          	lw	s11,76(sp)
80003b9c:	09010113          	add	sp,sp,144
80003ba0:	00008067          	ret
80003ba4:	04100913          	li	s2,65
80003ba8:	f0dff06f          	j	80003ab4 <_ntoa_long_long+0x88>
80003bac:	00000b93          	li	s7,0
80003bb0:	02010993          	add	s3,sp,32
80003bb4:	f89ff06f          	j	80003b3c <_ntoa_long_long+0x110>

80003bb8 <_etoa>:
80003bb8:	f8010113          	add	sp,sp,-128
80003bbc:	07212823          	sw	s2,112(sp)
80003bc0:	07312623          	sw	s3,108(sp)
80003bc4:	07412423          	sw	s4,104(sp)
80003bc8:	07512223          	sw	s5,100(sp)
80003bcc:	00050993          	mv	s3,a0
80003bd0:	00058a13          	mv	s4,a1
80003bd4:	00060913          	mv	s2,a2
80003bd8:	00068a93          	mv	s5,a3
80003bdc:	00070613          	mv	a2,a4
80003be0:	00078693          	mv	a3,a5
80003be4:	00070513          	mv	a0,a4
80003be8:	00078593          	mv	a1,a5
80003bec:	06812c23          	sw	s0,120(sp)
80003bf0:	06912a23          	sw	s1,116(sp)
80003bf4:	07612023          	sw	s6,96(sp)
80003bf8:	05812c23          	sw	s8,88(sp)
80003bfc:	05912a23          	sw	s9,84(sp)
80003c00:	06112e23          	sw	ra,124(sp)
80003c04:	08012c83          	lw	s9,128(sp)
80003c08:	00070413          	mv	s0,a4
80003c0c:	00078493          	mv	s1,a5
80003c10:	00080c13          	mv	s8,a6
80003c14:	00088b13          	mv	s6,a7
80003c18:	cb1fd0ef          	jal	800018c8 <__eqdf2>
80003c1c:	4e051c63          	bnez	a0,80004114 <_etoa+0x55c>
80003c20:	a00016b7          	lui	a3,0xa0001
80003c24:	9d86a603          	lw	a2,-1576(a3) # a00009d8 <pow10.0+0x50>
80003c28:	9dc6a683          	lw	a3,-1572(a3)
80003c2c:	00040513          	mv	a0,s0
80003c30:	00048593          	mv	a1,s1
80003c34:	d21fd0ef          	jal	80001954 <__gedf2>
80003c38:	4ca04e63          	bgtz	a0,80004114 <_etoa+0x55c>
80003c3c:	a00016b7          	lui	a3,0xa0001
80003c40:	9e06a603          	lw	a2,-1568(a3) # a00009e0 <pow10.0+0x58>
80003c44:	9e46a683          	lw	a3,-1564(a3)
80003c48:	00040513          	mv	a0,s0
80003c4c:	00048593          	mv	a1,s1
80003c50:	de1fd0ef          	jal	80001a30 <__ledf2>
80003c54:	4c054063          	bltz	a0,80004114 <_etoa+0x55c>
80003c58:	00040513          	mv	a0,s0
80003c5c:	00048593          	mv	a1,s1
80003c60:	00000613          	li	a2,0
80003c64:	00000693          	li	a3,0
80003c68:	05712e23          	sw	s7,92(sp)
80003c6c:	05a12823          	sw	s10,80(sp)
80003c70:	05b12623          	sw	s11,76(sp)
80003c74:	80000bb7          	lui	s7,0x80000
80003c78:	db9fd0ef          	jal	80001a30 <__ledf2>
80003c7c:	02812223          	sw	s0,36(sp)
80003c80:	009bcbb3          	xor	s7,s7,s1
80003c84:	00054463          	bltz	a0,80003c8c <_etoa+0xd4>
80003c88:	00048b93          	mv	s7,s1
80003c8c:	400cf793          	and	a5,s9,1024
80003c90:	02f12e23          	sw	a5,60(sp)
80003c94:	00079463          	bnez	a5,80003c9c <_etoa+0xe4>
80003c98:	00600c13          	li	s8,6
80003c9c:	014bd513          	srl	a0,s7,0x14
80003ca0:	7ff57513          	and	a0,a0,2047
80003ca4:	c0150513          	add	a0,a0,-1023
80003ca8:	cf9fe0ef          	jal	800029a0 <__floatsidf>
80003cac:	a00017b7          	lui	a5,0xa0001
80003cb0:	9e87a603          	lw	a2,-1560(a5) # a00009e8 <pow10.0+0x60>
80003cb4:	9ec7a683          	lw	a3,-1556(a5)
80003cb8:	e55fd0ef          	jal	80001b0c <__muldf3>
80003cbc:	a00017b7          	lui	a5,0xa0001
80003cc0:	9f07a603          	lw	a2,-1552(a5) # a00009f0 <pow10.0+0x68>
80003cc4:	9f47a683          	lw	a3,-1548(a5)
80003cc8:	d91fc0ef          	jal	80000a58 <__adddf3>
80003ccc:	00cb9693          	sll	a3,s7,0xc
80003cd0:	00c6d693          	srl	a3,a3,0xc
80003cd4:	3ff007b7          	lui	a5,0x3ff00
80003cd8:	00d7e7b3          	or	a5,a5,a3
80003cdc:	a00016b7          	lui	a3,0xa0001
80003ce0:	9f86a603          	lw	a2,-1544(a3) # a00009f8 <pow10.0+0x70>
80003ce4:	9fc6a683          	lw	a3,-1540(a3)
80003ce8:	00050d93          	mv	s11,a0
80003cec:	00058d13          	mv	s10,a1
80003cf0:	00040513          	mv	a0,s0
80003cf4:	00078593          	mv	a1,a5
80003cf8:	c04fe0ef          	jal	800020fc <__subdf3>
80003cfc:	a00017b7          	lui	a5,0xa0001
80003d00:	a007a603          	lw	a2,-1536(a5) # a0000a00 <pow10.0+0x78>
80003d04:	a047a683          	lw	a3,-1532(a5)
80003d08:	e05fd0ef          	jal	80001b0c <__muldf3>
80003d0c:	00050613          	mv	a2,a0
80003d10:	00058693          	mv	a3,a1
80003d14:	000d8513          	mv	a0,s11
80003d18:	000d0593          	mv	a1,s10
80003d1c:	d3dfc0ef          	jal	80000a58 <__adddf3>
80003d20:	b85fe0ef          	jal	800028a4 <__fixdfsi>
80003d24:	00050d13          	mv	s10,a0
80003d28:	c79fe0ef          	jal	800029a0 <__floatsidf>
80003d2c:	a00017b7          	lui	a5,0xa0001
80003d30:	a087a603          	lw	a2,-1528(a5) # a0000a08 <pow10.0+0x80>
80003d34:	a0c7a683          	lw	a3,-1524(a5)
80003d38:	00058d93          	mv	s11,a1
80003d3c:	00a12c23          	sw	a0,24(sp)
80003d40:	dcdfd0ef          	jal	80001b0c <__muldf3>
80003d44:	a0001737          	lui	a4,0xa0001
80003d48:	a1072603          	lw	a2,-1520(a4) # a0000a10 <pow10.0+0x88>
80003d4c:	a1472683          	lw	a3,-1516(a4)
80003d50:	d09fc0ef          	jal	80000a58 <__adddf3>
80003d54:	b51fe0ef          	jal	800028a4 <__fixdfsi>
80003d58:	01812783          	lw	a5,24(sp)
80003d5c:	a00016b7          	lui	a3,0xa0001
80003d60:	a186a603          	lw	a2,-1512(a3) # a0000a18 <pow10.0+0x90>
80003d64:	a1c6a683          	lw	a3,-1508(a3)
80003d68:	00050713          	mv	a4,a0
80003d6c:	000d8593          	mv	a1,s11
80003d70:	00078513          	mv	a0,a5
80003d74:	00070d93          	mv	s11,a4
80003d78:	d95fd0ef          	jal	80001b0c <__muldf3>
80003d7c:	00050793          	mv	a5,a0
80003d80:	000d8513          	mv	a0,s11
80003d84:	00f12c23          	sw	a5,24(sp)
80003d88:	03b12423          	sw	s11,40(sp)
80003d8c:	00058d93          	mv	s11,a1
80003d90:	c11fe0ef          	jal	800029a0 <__floatsidf>
80003d94:	a0001737          	lui	a4,0xa0001
80003d98:	a2072603          	lw	a2,-1504(a4) # a0000a20 <pow10.0+0x98>
80003d9c:	a2472683          	lw	a3,-1500(a4)
80003da0:	d6dfd0ef          	jal	80001b0c <__muldf3>
80003da4:	01812783          	lw	a5,24(sp)
80003da8:	00050613          	mv	a2,a0
80003dac:	00058693          	mv	a3,a1
80003db0:	00078513          	mv	a0,a5
80003db4:	000d8593          	mv	a1,s11
80003db8:	b44fe0ef          	jal	800020fc <__subdf3>
80003dbc:	00050613          	mv	a2,a0
80003dc0:	00058693          	mv	a3,a1
80003dc4:	02a12623          	sw	a0,44(sp)
80003dc8:	00b12c23          	sw	a1,24(sp)
80003dcc:	d41fd0ef          	jal	80001b0c <__muldf3>
80003dd0:	01812783          	lw	a5,24(sp)
80003dd4:	02c12703          	lw	a4,44(sp)
80003dd8:	00050d93          	mv	s11,a0
80003ddc:	00078693          	mv	a3,a5
80003de0:	00070613          	mv	a2,a4
80003de4:	00070513          	mv	a0,a4
80003de8:	00058813          	mv	a6,a1
80003dec:	00078593          	mv	a1,a5
80003df0:	02e12c23          	sw	a4,56(sp)
80003df4:	02f12a23          	sw	a5,52(sp)
80003df8:	01012c23          	sw	a6,24(sp)
80003dfc:	c5dfc0ef          	jal	80000a58 <__adddf3>
80003e00:	a00016b7          	lui	a3,0xa0001
80003e04:	00058893          	mv	a7,a1
80003e08:	a286a603          	lw	a2,-1496(a3) # a0000a28 <pow10.0+0xa0>
80003e0c:	01812583          	lw	a1,24(sp)
80003e10:	a2c6a683          	lw	a3,-1492(a3)
80003e14:	00050313          	mv	t1,a0
80003e18:	000d8513          	mv	a0,s11
80003e1c:	02612823          	sw	t1,48(sp)
80003e20:	03112623          	sw	a7,44(sp)
80003e24:	bc8fd0ef          	jal	800011ec <__divdf3>
80003e28:	a0001837          	lui	a6,0xa0001
80003e2c:	a3082603          	lw	a2,-1488(a6) # a0000a30 <pow10.0+0xa8>
80003e30:	a3482683          	lw	a3,-1484(a6)
80003e34:	c25fc0ef          	jal	80000a58 <__adddf3>
80003e38:	00058693          	mv	a3,a1
80003e3c:	01812583          	lw	a1,24(sp)
80003e40:	00050613          	mv	a2,a0
80003e44:	000d8513          	mv	a0,s11
80003e48:	ba4fd0ef          	jal	800011ec <__divdf3>
80003e4c:	a00016b7          	lui	a3,0xa0001
80003e50:	a386a603          	lw	a2,-1480(a3) # a0000a38 <pow10.0+0xb0>
80003e54:	a3c6a683          	lw	a3,-1476(a3)
80003e58:	c01fc0ef          	jal	80000a58 <__adddf3>
80003e5c:	00058693          	mv	a3,a1
80003e60:	01812583          	lw	a1,24(sp)
80003e64:	00050613          	mv	a2,a0
80003e68:	000d8513          	mv	a0,s11
80003e6c:	b80fd0ef          	jal	800011ec <__divdf3>
80003e70:	03812703          	lw	a4,56(sp)
80003e74:	03412783          	lw	a5,52(sp)
80003e78:	a00016b7          	lui	a3,0xa0001
80003e7c:	00050e13          	mv	t3,a0
80003e80:	00058d93          	mv	s11,a1
80003e84:	a406a503          	lw	a0,-1472(a3) # a0000a40 <pow10.0+0xb8>
80003e88:	a446a583          	lw	a1,-1468(a3)
80003e8c:	00070613          	mv	a2,a4
80003e90:	00078693          	mv	a3,a5
80003e94:	01c12c23          	sw	t3,24(sp)
80003e98:	a64fe0ef          	jal	800020fc <__subdf3>
80003e9c:	01812e03          	lw	t3,24(sp)
80003ea0:	00050613          	mv	a2,a0
80003ea4:	00058693          	mv	a3,a1
80003ea8:	000e0513          	mv	a0,t3
80003eac:	000d8593          	mv	a1,s11
80003eb0:	ba9fc0ef          	jal	80000a58 <__adddf3>
80003eb4:	03012303          	lw	t1,48(sp)
80003eb8:	02c12883          	lw	a7,44(sp)
80003ebc:	00050613          	mv	a2,a0
80003ec0:	00058693          	mv	a3,a1
80003ec4:	00030513          	mv	a0,t1
80003ec8:	00088593          	mv	a1,a7
80003ecc:	b20fd0ef          	jal	800011ec <__divdf3>
80003ed0:	a00017b7          	lui	a5,0xa0001
80003ed4:	a487a603          	lw	a2,-1464(a5) # a0000a48 <pow10.0+0xc0>
80003ed8:	a4c7a683          	lw	a3,-1460(a5)
80003edc:	b7dfc0ef          	jal	80000a58 <__adddf3>
80003ee0:	02812783          	lw	a5,40(sp)
80003ee4:	00000613          	li	a2,0
80003ee8:	3ff78793          	add	a5,a5,1023
80003eec:	01479793          	sll	a5,a5,0x14
80003ef0:	00078693          	mv	a3,a5
80003ef4:	c19fd0ef          	jal	80001b0c <__muldf3>
80003ef8:	00040613          	mv	a2,s0
80003efc:	000b8693          	mv	a3,s7
80003f00:	00050d93          	mv	s11,a0
80003f04:	00b12c23          	sw	a1,24(sp)
80003f08:	a4dfd0ef          	jal	80001954 <__gedf2>
80003f0c:	a0001837          	lui	a6,0xa0001
80003f10:	24a04c63          	bgtz	a0,80004168 <_etoa+0x5b0>
80003f14:	01812783          	lw	a5,24(sp)
80003f18:	000d8713          	mv	a4,s11
80003f1c:	0c600693          	li	a3,198
80003f20:	063d0d93          	add	s11,s10,99
80003f24:	01b6bdb3          	sltu	s11,a3,s11
80003f28:	014c9693          	sll	a3,s9,0x14
80003f2c:	004d8d93          	add	s11,s11,4
80003f30:	0606d263          	bgez	a3,80003f94 <_etoa+0x3dc>
80003f34:	a00016b7          	lui	a3,0xa0001
80003f38:	a506a603          	lw	a2,-1456(a3) # a0000a50 <pow10.0+0xc8>
80003f3c:	a546a683          	lw	a3,-1452(a3)
80003f40:	00040513          	mv	a0,s0
80003f44:	000b8593          	mv	a1,s7
80003f48:	00e12c23          	sw	a4,24(sp)
80003f4c:	00f12e23          	sw	a5,28(sp)
80003f50:	a05fd0ef          	jal	80001954 <__gedf2>
80003f54:	01812703          	lw	a4,24(sp)
80003f58:	01c12783          	lw	a5,28(sp)
80003f5c:	02054463          	bltz	a0,80003f84 <_etoa+0x3cc>
80003f60:	a00016b7          	lui	a3,0xa0001
80003f64:	a586a603          	lw	a2,-1448(a3) # a0000a58 <pow10.0+0xd0>
80003f68:	a5c6a683          	lw	a3,-1444(a3)
80003f6c:	00040513          	mv	a0,s0
80003f70:	000b8593          	mv	a1,s7
80003f74:	abdfd0ef          	jal	80001a30 <__ledf2>
80003f78:	01812703          	lw	a4,24(sp)
80003f7c:	01c12783          	lw	a5,28(sp)
80003f80:	20054663          	bltz	a0,8000418c <_etoa+0x5d4>
80003f84:	000c0863          	beqz	s8,80003f94 <_etoa+0x3dc>
80003f88:	03c12683          	lw	a3,60(sp)
80003f8c:	00d036b3          	snez	a3,a3
80003f90:	40dc0c33          	sub	s8,s8,a3
80003f94:	00000893          	li	a7,0
80003f98:	016df463          	bgeu	s11,s6,80003fa0 <_etoa+0x3e8>
80003f9c:	41bb08b3          	sub	a7,s6,s11
80003fa0:	002cf693          	and	a3,s9,2
80003fa4:	02d12423          	sw	a3,40(sp)
80003fa8:	00068863          	beqz	a3,80003fb8 <_etoa+0x400>
80003fac:	001db693          	seqz	a3,s11
80003fb0:	40d006b3          	neg	a3,a3
80003fb4:	00d8f8b3          	and	a7,a7,a3
80003fb8:	020d0463          	beqz	s10,80003fe0 <_etoa+0x428>
80003fbc:	000b8593          	mv	a1,s7
80003fc0:	00040513          	mv	a0,s0
80003fc4:	00070613          	mv	a2,a4
80003fc8:	00078693          	mv	a3,a5
80003fcc:	01112c23          	sw	a7,24(sp)
80003fd0:	a1cfd0ef          	jal	800011ec <__divdf3>
80003fd4:	01812883          	lw	a7,24(sp)
80003fd8:	02a12223          	sw	a0,36(sp)
80003fdc:	00058b93          	mv	s7,a1
80003fe0:	00040513          	mv	a0,s0
80003fe4:	00048593          	mv	a1,s1
80003fe8:	00000613          	li	a2,0
80003fec:	00000693          	li	a3,0
80003ff0:	01112c23          	sw	a7,24(sp)
80003ff4:	a3dfd0ef          	jal	80001a30 <__ledf2>
80003ff8:	01812883          	lw	a7,24(sp)
80003ffc:	00055663          	bgez	a0,80004008 <_etoa+0x450>
80004000:	800007b7          	lui	a5,0x80000
80004004:	0177cbb3          	xor	s7,a5,s7
80004008:	02412683          	lw	a3,36(sp)
8000400c:	fffff7b7          	lui	a5,0xfffff
80004010:	7ff78793          	add	a5,a5,2047 # fffff7ff <__stack_base+0x3ffff7ff>
80004014:	00fcf7b3          	and	a5,s9,a5
80004018:	00f12023          	sw	a5,0(sp)
8000401c:	00068713          	mv	a4,a3
80004020:	000c0813          	mv	a6,s8
80004024:	000b8793          	mv	a5,s7
80004028:	000a8693          	mv	a3,s5
8000402c:	00090613          	mv	a2,s2
80004030:	000a0593          	mv	a1,s4
80004034:	00098513          	mv	a0,s3
80004038:	178000ef          	jal	800041b0 <_ftoa>
8000403c:	00050413          	mv	s0,a0
80004040:	080d8a63          	beqz	s11,800040d4 <_etoa+0x51c>
80004044:	fffcc513          	not	a0,s9
80004048:	02057513          	and	a0,a0,32
8000404c:	00040613          	mv	a2,s0
80004050:	000a8693          	mv	a3,s5
80004054:	000a0593          	mv	a1,s4
80004058:	04550513          	add	a0,a0,69
8000405c:	000980e7          	jalr	s3
80004060:	41fd5713          	sra	a4,s10,0x1f
80004064:	00140413          	add	s0,s0,1
80004068:	01a746b3          	xor	a3,a4,s10
8000406c:	00500793          	li	a5,5
80004070:	fffd8d93          	add	s11,s11,-1
80004074:	00f12223          	sw	a5,4(sp)
80004078:	40e68733          	sub	a4,a3,a4
8000407c:	01fd5793          	srl	a5,s10,0x1f
80004080:	00040613          	mv	a2,s0
80004084:	01b12023          	sw	s11,0(sp)
80004088:	00000893          	li	a7,0
8000408c:	00a00813          	li	a6,10
80004090:	000a8693          	mv	a3,s5
80004094:	000a0593          	mv	a1,s4
80004098:	00098513          	mv	a0,s3
8000409c:	8c9ff0ef          	jal	80003964 <_ntoa_long>
800040a0:	02812783          	lw	a5,40(sp)
800040a4:	00050413          	mv	s0,a0
800040a8:	02078663          	beqz	a5,800040d4 <_etoa+0x51c>
800040ac:	41250933          	sub	s2,a0,s2
800040b0:	03697263          	bgeu	s2,s6,800040d4 <_etoa+0x51c>
800040b4:	00040613          	mv	a2,s0
800040b8:	000a8693          	mv	a3,s5
800040bc:	000a0593          	mv	a1,s4
800040c0:	02000513          	li	a0,32
800040c4:	00190913          	add	s2,s2,1
800040c8:	00140413          	add	s0,s0,1
800040cc:	000980e7          	jalr	s3
800040d0:	ff6962e3          	bltu	s2,s6,800040b4 <_etoa+0x4fc>
800040d4:	07c12083          	lw	ra,124(sp)
800040d8:	00040513          	mv	a0,s0
800040dc:	07812403          	lw	s0,120(sp)
800040e0:	05c12b83          	lw	s7,92(sp)
800040e4:	05012d03          	lw	s10,80(sp)
800040e8:	04c12d83          	lw	s11,76(sp)
800040ec:	07412483          	lw	s1,116(sp)
800040f0:	07012903          	lw	s2,112(sp)
800040f4:	06c12983          	lw	s3,108(sp)
800040f8:	06812a03          	lw	s4,104(sp)
800040fc:	06412a83          	lw	s5,100(sp)
80004100:	06012b03          	lw	s6,96(sp)
80004104:	05812c03          	lw	s8,88(sp)
80004108:	05412c83          	lw	s9,84(sp)
8000410c:	08010113          	add	sp,sp,128
80004110:	00008067          	ret
80004114:	00040713          	mv	a4,s0
80004118:	07812403          	lw	s0,120(sp)
8000411c:	09912023          	sw	s9,128(sp)
80004120:	07c12083          	lw	ra,124(sp)
80004124:	05412c83          	lw	s9,84(sp)
80004128:	00048793          	mv	a5,s1
8000412c:	000b0893          	mv	a7,s6
80004130:	07412483          	lw	s1,116(sp)
80004134:	06012b03          	lw	s6,96(sp)
80004138:	000c0813          	mv	a6,s8
8000413c:	000a8693          	mv	a3,s5
80004140:	05812c03          	lw	s8,88(sp)
80004144:	06412a83          	lw	s5,100(sp)
80004148:	00090613          	mv	a2,s2
8000414c:	000a0593          	mv	a1,s4
80004150:	07012903          	lw	s2,112(sp)
80004154:	06812a03          	lw	s4,104(sp)
80004158:	00098513          	mv	a0,s3
8000415c:	06c12983          	lw	s3,108(sp)
80004160:	08010113          	add	sp,sp,128
80004164:	04c0006f          	j	800041b0 <_ftoa>
80004168:	a3082603          	lw	a2,-1488(a6) # a0000a30 <pow10.0+0xa8>
8000416c:	a3482683          	lw	a3,-1484(a6)
80004170:	01812583          	lw	a1,24(sp)
80004174:	000d8513          	mv	a0,s11
80004178:	fffd0d13          	add	s10,s10,-1
8000417c:	870fd0ef          	jal	800011ec <__divdf3>
80004180:	00050713          	mv	a4,a0
80004184:	00058793          	mv	a5,a1
80004188:	d95ff06f          	j	80003f1c <_etoa+0x364>
8000418c:	018d5e63          	bge	s10,s8,800041a8 <_etoa+0x5f0>
80004190:	41ac0d33          	sub	s10,s8,s10
80004194:	fffd0c13          	add	s8,s10,-1
80004198:	400cec93          	or	s9,s9,1024
8000419c:	00000d93          	li	s11,0
800041a0:	00000d13          	li	s10,0
800041a4:	df1ff06f          	j	80003f94 <_etoa+0x3dc>
800041a8:	00000c13          	li	s8,0
800041ac:	fedff06f          	j	80004198 <_etoa+0x5e0>

800041b0 <_ftoa>:
800041b0:	f8010113          	add	sp,sp,-128
800041b4:	07312623          	sw	s3,108(sp)
800041b8:	05812c23          	sw	s8,88(sp)
800041bc:	05912a23          	sw	s9,84(sp)
800041c0:	05a12823          	sw	s10,80(sp)
800041c4:	00050993          	mv	s3,a0
800041c8:	00058c13          	mv	s8,a1
800041cc:	00060c93          	mv	s9,a2
800041d0:	00068d13          	mv	s10,a3
800041d4:	00070613          	mv	a2,a4
800041d8:	00078693          	mv	a3,a5
800041dc:	00070513          	mv	a0,a4
800041e0:	00078593          	mv	a1,a5
800041e4:	06812c23          	sw	s0,120(sp)
800041e8:	06912a23          	sw	s1,116(sp)
800041ec:	07212823          	sw	s2,112(sp)
800041f0:	07612023          	sw	s6,96(sp)
800041f4:	05b12623          	sw	s11,76(sp)
800041f8:	06112e23          	sw	ra,124(sp)
800041fc:	08012d83          	lw	s11,128(sp)
80004200:	00070493          	mv	s1,a4
80004204:	00078413          	mv	s0,a5
80004208:	00080b13          	mv	s6,a6
8000420c:	00088913          	mv	s2,a7
80004210:	eb8fd0ef          	jal	800018c8 <__eqdf2>
80004214:	20051063          	bnez	a0,80004414 <_ftoa+0x264>
80004218:	a00017b7          	lui	a5,0xa0001
8000421c:	9e07a603          	lw	a2,-1568(a5) # a00009e0 <pow10.0+0x58>
80004220:	9e47a683          	lw	a3,-1564(a5)
80004224:	00048513          	mv	a0,s1
80004228:	00040593          	mv	a1,s0
8000422c:	805fd0ef          	jal	80001a30 <__ledf2>
80004230:	2c054463          	bltz	a0,800044f8 <_ftoa+0x348>
80004234:	a00017b7          	lui	a5,0xa0001
80004238:	9d87a603          	lw	a2,-1576(a5) # a00009d8 <pow10.0+0x50>
8000423c:	9dc7a683          	lw	a3,-1572(a5)
80004240:	00048513          	mv	a0,s1
80004244:	00040593          	mv	a1,s0
80004248:	f0cfd0ef          	jal	80001954 <__gedf2>
8000424c:	1aa04463          	bgtz	a0,800043f4 <_ftoa+0x244>
80004250:	07412423          	sw	s4,104(sp)
80004254:	a0001a37          	lui	s4,0xa0001
80004258:	a60a2603          	lw	a2,-1440(s4) # a0000a60 <pow10.0+0xd8>
8000425c:	a64a2683          	lw	a3,-1436(s4)
80004260:	00048513          	mv	a0,s1
80004264:	00040593          	mv	a1,s0
80004268:	eecfd0ef          	jal	80001954 <__gedf2>
8000426c:	22a04a63          	bgtz	a0,800044a0 <_ftoa+0x2f0>
80004270:	a00017b7          	lui	a5,0xa0001
80004274:	a687a603          	lw	a2,-1432(a5) # a0000a68 <pow10.0+0xe0>
80004278:	a6c7a683          	lw	a3,-1428(a5)
8000427c:	00048513          	mv	a0,s1
80004280:	00040593          	mv	a1,s0
80004284:	facfd0ef          	jal	80001a30 <__ledf2>
80004288:	20054c63          	bltz	a0,800044a0 <_ftoa+0x2f0>
8000428c:	00048513          	mv	a0,s1
80004290:	00040593          	mv	a1,s0
80004294:	00000613          	li	a2,0
80004298:	00000693          	li	a3,0
8000429c:	07512223          	sw	s5,100(sp)
800042a0:	05712e23          	sw	s7,92(sp)
800042a4:	f8cfd0ef          	jal	80001a30 <__ledf2>
800042a8:	1c054863          	bltz	a0,80004478 <_ftoa+0x2c8>
800042ac:	00012c23          	sw	zero,24(sp)
800042b0:	400dfa93          	and	s5,s11,1024
800042b4:	3c0a8a63          	beqz	s5,80004688 <_ftoa+0x4d8>
800042b8:	00900793          	li	a5,9
800042bc:	4d67f063          	bgeu	a5,s6,8000477c <_ftoa+0x5cc>
800042c0:	ff7b0a93          	add	s5,s6,-9
800042c4:	00000693          	li	a3,0
800042c8:	02010b93          	add	s7,sp,32
800042cc:	03000513          	li	a0,48
800042d0:	02000593          	li	a1,32
800042d4:	00168693          	add	a3,a3,1
800042d8:	00db8633          	add	a2,s7,a3
800042dc:	fea60fa3          	sb	a0,-1(a2)
800042e0:	40db0333          	sub	t1,s6,a3
800042e4:	3eb68c63          	beq	a3,a1,800046dc <_ftoa+0x52c>
800042e8:	ff5696e3          	bne	a3,s5,800042d4 <_ftoa+0x124>
800042ec:	a60a2783          	lw	a5,-1440(s4)
800042f0:	a64a2803          	lw	a6,-1436(s4)
800042f4:	00f12023          	sw	a5,0(sp)
800042f8:	01012223          	sw	a6,4(sp)
800042fc:	00040593          	mv	a1,s0
80004300:	00048513          	mv	a0,s1
80004304:	00612a23          	sw	t1,20(sp)
80004308:	d9cfe0ef          	jal	800028a4 <__fixdfsi>
8000430c:	00050a13          	mv	s4,a0
80004310:	e90fe0ef          	jal	800029a0 <__floatsidf>
80004314:	00050613          	mv	a2,a0
80004318:	00058693          	mv	a3,a1
8000431c:	00048513          	mv	a0,s1
80004320:	00040593          	mv	a1,s0
80004324:	dd9fd0ef          	jal	800020fc <__subdf3>
80004328:	00012603          	lw	a2,0(sp)
8000432c:	00412683          	lw	a3,4(sp)
80004330:	fdcfd0ef          	jal	80001b0c <__muldf3>
80004334:	00058b13          	mv	s6,a1
80004338:	00a12823          	sw	a0,16(sp)
8000433c:	de8fe0ef          	jal	80002924 <__fixunsdfsi>
80004340:	00a12623          	sw	a0,12(sp)
80004344:	f04fe0ef          	jal	80002a48 <__floatunsidf>
80004348:	01012783          	lw	a5,16(sp)
8000434c:	00050613          	mv	a2,a0
80004350:	00058693          	mv	a3,a1
80004354:	00078513          	mv	a0,a5
80004358:	000b0593          	mv	a1,s6
8000435c:	da1fd0ef          	jal	800020fc <__subdf3>
80004360:	a0001b37          	lui	s6,0xa0001
80004364:	a10b2603          	lw	a2,-1520(s6) # a0000a10 <pow10.0+0x88>
80004368:	a14b2683          	lw	a3,-1516(s6)
8000436c:	00a12823          	sw	a0,16(sp)
80004370:	00b12e23          	sw	a1,28(sp)
80004374:	de0fd0ef          	jal	80001954 <__gedf2>
80004378:	00c12883          	lw	a7,12(sp)
8000437c:	01412303          	lw	t1,20(sp)
80004380:	2ca05863          	blez	a0,80004650 <_ftoa+0x4a0>
80004384:	00188893          	add	a7,a7,1
80004388:	00088513          	mv	a0,a7
8000438c:	00612823          	sw	t1,16(sp)
80004390:	01112623          	sw	a7,12(sp)
80004394:	eb4fe0ef          	jal	80002a48 <__floatunsidf>
80004398:	00012603          	lw	a2,0(sp)
8000439c:	00412683          	lw	a3,4(sp)
800043a0:	db4fd0ef          	jal	80001954 <__gedf2>
800043a4:	00c12883          	lw	a7,12(sp)
800043a8:	01012303          	lw	t1,16(sp)
800043ac:	00054663          	bltz	a0,800043b8 <_ftoa+0x208>
800043b0:	001a0a13          	add	s4,s4,1
800043b4:	00000893          	li	a7,0
800043b8:	14030c63          	beqz	t1,80004510 <_ftoa+0x360>
800043bc:	02000513          	li	a0,32
800043c0:	00a00613          	li	a2,10
800043c4:	00900e13          	li	t3,9
800043c8:	30aa8663          	beq	s5,a0,800046d4 <_ftoa+0x524>
800043cc:	02c8f6b3          	remu	a3,a7,a2
800043d0:	001a8a93          	add	s5,s5,1
800043d4:	015b85b3          	add	a1,s7,s5
800043d8:	fff30313          	add	t1,t1,-1
800043dc:	03068693          	add	a3,a3,48
800043e0:	fed58fa3          	sb	a3,-1(a1)
800043e4:	02c8d6b3          	divu	a3,a7,a2
800043e8:	2d1e7063          	bgeu	t3,a7,800046a8 <_ftoa+0x4f8>
800043ec:	00068893          	mv	a7,a3
800043f0:	fd9ff06f          	j	800043c8 <_ftoa+0x218>
800043f4:	004df793          	and	a5,s11,4
800043f8:	06079863          	bnez	a5,80004468 <_ftoa+0x2b8>
800043fc:	a0000737          	lui	a4,0xa0000
80004400:	18070713          	add	a4,a4,384 # a0000180 <__clz_tab+0x108>
80004404:	00300793          	li	a5,3
80004408:	000d8893          	mv	a7,s11
8000440c:	00090813          	mv	a6,s2
80004410:	0180006f          	j	80004428 <_ftoa+0x278>
80004414:	a0000737          	lui	a4,0xa0000
80004418:	000d8893          	mv	a7,s11
8000441c:	00090813          	mv	a6,s2
80004420:	00300793          	li	a5,3
80004424:	18470713          	add	a4,a4,388 # a0000184 <__clz_tab+0x10c>
80004428:	07812403          	lw	s0,120(sp)
8000442c:	07c12083          	lw	ra,124(sp)
80004430:	07412483          	lw	s1,116(sp)
80004434:	07012903          	lw	s2,112(sp)
80004438:	06012b03          	lw	s6,96(sp)
8000443c:	04c12d83          	lw	s11,76(sp)
80004440:	000d0693          	mv	a3,s10
80004444:	000c8613          	mv	a2,s9
80004448:	05012d03          	lw	s10,80(sp)
8000444c:	05412c83          	lw	s9,84(sp)
80004450:	000c0593          	mv	a1,s8
80004454:	00098513          	mv	a0,s3
80004458:	05812c03          	lw	s8,88(sp)
8000445c:	06c12983          	lw	s3,108(sp)
80004460:	08010113          	add	sp,sp,128
80004464:	870ff06f          	j	800034d4 <_out_rev>
80004468:	a0000737          	lui	a4,0xa0000
8000446c:	17870713          	add	a4,a4,376 # a0000178 <__clz_tab+0x100>
80004470:	00400793          	li	a5,4
80004474:	f95ff06f          	j	80004408 <_ftoa+0x258>
80004478:	00048613          	mv	a2,s1
8000447c:	00040693          	mv	a3,s0
80004480:	00000513          	li	a0,0
80004484:	00000593          	li	a1,0
80004488:	c75fd0ef          	jal	800020fc <__subdf3>
8000448c:	00100793          	li	a5,1
80004490:	00050493          	mv	s1,a0
80004494:	00058413          	mv	s0,a1
80004498:	00f12c23          	sw	a5,24(sp)
8000449c:	e15ff06f          	j	800042b0 <_ftoa+0x100>
800044a0:	00040793          	mv	a5,s0
800044a4:	07812403          	lw	s0,120(sp)
800044a8:	09b12023          	sw	s11,128(sp)
800044ac:	06812a03          	lw	s4,104(sp)
800044b0:	07c12083          	lw	ra,124(sp)
800044b4:	04c12d83          	lw	s11,76(sp)
800044b8:	00048713          	mv	a4,s1
800044bc:	00090893          	mv	a7,s2
800044c0:	07412483          	lw	s1,116(sp)
800044c4:	07012903          	lw	s2,112(sp)
800044c8:	000b0813          	mv	a6,s6
800044cc:	000d0693          	mv	a3,s10
800044d0:	06012b03          	lw	s6,96(sp)
800044d4:	05012d03          	lw	s10,80(sp)
800044d8:	000c8613          	mv	a2,s9
800044dc:	000c0593          	mv	a1,s8
800044e0:	05412c83          	lw	s9,84(sp)
800044e4:	05812c03          	lw	s8,88(sp)
800044e8:	00098513          	mv	a0,s3
800044ec:	06c12983          	lw	s3,108(sp)
800044f0:	08010113          	add	sp,sp,128
800044f4:	ec4ff06f          	j	80003bb8 <_etoa>
800044f8:	a0000737          	lui	a4,0xa0000
800044fc:	000d8893          	mv	a7,s11
80004500:	00090813          	mv	a6,s2
80004504:	00400793          	li	a5,4
80004508:	18870713          	add	a4,a4,392 # a0000188 <__clz_tab+0x110>
8000450c:	f1dff06f          	j	80004428 <_ftoa+0x278>
80004510:	000a0513          	mv	a0,s4
80004514:	c8cfe0ef          	jal	800029a0 <__floatsidf>
80004518:	00050613          	mv	a2,a0
8000451c:	00058693          	mv	a3,a1
80004520:	00048513          	mv	a0,s1
80004524:	00040593          	mv	a1,s0
80004528:	bd5fd0ef          	jal	800020fc <__subdf3>
8000452c:	a10b2603          	lw	a2,-1520(s6)
80004530:	a14b2683          	lw	a3,-1516(s6)
80004534:	cfcfd0ef          	jal	80001a30 <__ledf2>
80004538:	00054663          	bltz	a0,80004544 <_ftoa+0x394>
8000453c:	001a7693          	and	a3,s4,1
80004540:	00da0a33          	add	s4,s4,a3
80004544:	02000513          	li	a0,32
80004548:	00a00613          	li	a2,10
8000454c:	0aaa8a63          	beq	s5,a0,80004600 <_ftoa+0x450>
80004550:	02ca66b3          	rem	a3,s4,a2
80004554:	001a8a93          	add	s5,s5,1
80004558:	015b85b3          	add	a1,s7,s5
8000455c:	02ca4a33          	div	s4,s4,a2
80004560:	03068693          	add	a3,a3,48
80004564:	fed58fa3          	sb	a3,-1(a1)
80004568:	fe0a12e3          	bnez	s4,8000454c <_ftoa+0x39c>
8000456c:	003df693          	and	a3,s11,3
80004570:	00100613          	li	a2,1
80004574:	22c68c63          	beq	a3,a2,800047ac <_ftoa+0x5fc>
80004578:	02000693          	li	a3,32
8000457c:	02da8263          	beq	s5,a3,800045a0 <_ftoa+0x3f0>
80004580:	01812783          	lw	a5,24(sp)
80004584:	16078c63          	beqz	a5,800046fc <_ftoa+0x54c>
80004588:	020a8793          	add	a5,s5,32
8000458c:	02010713          	add	a4,sp,32
80004590:	00e786b3          	add	a3,a5,a4
80004594:	02d00613          	li	a2,45
80004598:	fec68023          	sb	a2,-32(a3)
8000459c:	001a8a93          	add	s5,s5,1
800045a0:	000d8893          	mv	a7,s11
800045a4:	00090813          	mv	a6,s2
800045a8:	000a8793          	mv	a5,s5
800045ac:	000b8713          	mv	a4,s7
800045b0:	000d0693          	mv	a3,s10
800045b4:	000c8613          	mv	a2,s9
800045b8:	000c0593          	mv	a1,s8
800045bc:	00098513          	mv	a0,s3
800045c0:	f15fe0ef          	jal	800034d4 <_out_rev>
800045c4:	07c12083          	lw	ra,124(sp)
800045c8:	07812403          	lw	s0,120(sp)
800045cc:	06812a03          	lw	s4,104(sp)
800045d0:	06412a83          	lw	s5,100(sp)
800045d4:	05c12b83          	lw	s7,92(sp)
800045d8:	07412483          	lw	s1,116(sp)
800045dc:	07012903          	lw	s2,112(sp)
800045e0:	06c12983          	lw	s3,108(sp)
800045e4:	06012b03          	lw	s6,96(sp)
800045e8:	05812c03          	lw	s8,88(sp)
800045ec:	05412c83          	lw	s9,84(sp)
800045f0:	05012d03          	lw	s10,80(sp)
800045f4:	04c12d83          	lw	s11,76(sp)
800045f8:	08010113          	add	sp,sp,128
800045fc:	00008067          	ret
80004600:	003df693          	and	a3,s11,3
80004604:	00100613          	li	a2,1
80004608:	f8c69ce3          	bne	a3,a2,800045a0 <_ftoa+0x3f0>
8000460c:	f8090ae3          	beqz	s2,800045a0 <_ftoa+0x3f0>
80004610:	01812783          	lw	a5,24(sp)
80004614:	14079e63          	bnez	a5,80004770 <_ftoa+0x5c0>
80004618:	00cdf693          	and	a3,s11,12
8000461c:	14069a63          	bnez	a3,80004770 <_ftoa+0x5c0>
80004620:	0d2afa63          	bgeu	s5,s2,800046f4 <_ftoa+0x544>
80004624:	02000693          	li	a3,32
80004628:	03000613          	li	a2,48
8000462c:	02000593          	li	a1,32
80004630:	00da8c63          	beq	s5,a3,80004648 <_ftoa+0x498>
80004634:	001a8a93          	add	s5,s5,1
80004638:	015b86b3          	add	a3,s7,s5
8000463c:	fec68fa3          	sb	a2,-1(a3)
80004640:	f3590ce3          	beq	s2,s5,80004578 <_ftoa+0x3c8>
80004644:	feba98e3          	bne	s5,a1,80004634 <_ftoa+0x484>
80004648:	02000a93          	li	s5,32
8000464c:	f55ff06f          	j	800045a0 <_ftoa+0x3f0>
80004650:	a00017b7          	lui	a5,0xa0001
80004654:	01012503          	lw	a0,16(sp)
80004658:	01c12583          	lw	a1,28(sp)
8000465c:	a107a603          	lw	a2,-1520(a5) # a0000a10 <pow10.0+0x88>
80004660:	a147a683          	lw	a3,-1516(a5)
80004664:	00612623          	sw	t1,12(sp)
80004668:	01112023          	sw	a7,0(sp)
8000466c:	bc4fd0ef          	jal	80001a30 <__ledf2>
80004670:	00012883          	lw	a7,0(sp)
80004674:	00c12303          	lw	t1,12(sp)
80004678:	d40540e3          	bltz	a0,800043b8 <_ftoa+0x208>
8000467c:	0e089263          	bnez	a7,80004760 <_ftoa+0x5b0>
80004680:	00188893          	add	a7,a7,1
80004684:	d35ff06f          	j	800043b8 <_ftoa+0x208>
80004688:	a0001737          	lui	a4,0xa0001
8000468c:	a5872783          	lw	a5,-1448(a4) # a0000a58 <pow10.0+0xd0>
80004690:	a5c72803          	lw	a6,-1444(a4)
80004694:	00600313          	li	t1,6
80004698:	00f12023          	sw	a5,0(sp)
8000469c:	01012223          	sw	a6,4(sp)
800046a0:	02010b93          	add	s7,sp,32
800046a4:	c59ff06f          	j	800042fc <_ftoa+0x14c>
800046a8:	02aa8663          	beq	s5,a0,800046d4 <_ftoa+0x524>
800046ac:	01530533          	add	a0,t1,s5
800046b0:	03000593          	li	a1,48
800046b4:	02000613          	li	a2,32
800046b8:	00031663          	bnez	t1,800046c4 <_ftoa+0x514>
800046bc:	06c0006f          	j	80004728 <_ftoa+0x578>
800046c0:	06aa8463          	beq	s5,a0,80004728 <_ftoa+0x578>
800046c4:	001a8a93          	add	s5,s5,1
800046c8:	015b86b3          	add	a3,s7,s5
800046cc:	feb68fa3          	sb	a1,-1(a3)
800046d0:	feca98e3          	bne	s5,a2,800046c0 <_ftoa+0x510>
800046d4:	02000a93          	li	s5,32
800046d8:	e6dff06f          	j	80004544 <_ftoa+0x394>
800046dc:	a60a2783          	lw	a5,-1440(s4)
800046e0:	a64a2803          	lw	a6,-1436(s4)
800046e4:	02000a93          	li	s5,32
800046e8:	00f12023          	sw	a5,0(sp)
800046ec:	01012223          	sw	a6,4(sp)
800046f0:	c0dff06f          	j	800042fc <_ftoa+0x14c>
800046f4:	02000693          	li	a3,32
800046f8:	eada84e3          	beq	s5,a3,800045a0 <_ftoa+0x3f0>
800046fc:	004df693          	and	a3,s11,4
80004700:	04069263          	bnez	a3,80004744 <_ftoa+0x594>
80004704:	008df693          	and	a3,s11,8
80004708:	e8068ce3          	beqz	a3,800045a0 <_ftoa+0x3f0>
8000470c:	020a8793          	add	a5,s5,32
80004710:	02010713          	add	a4,sp,32
80004714:	00e786b3          	add	a3,a5,a4
80004718:	02000613          	li	a2,32
8000471c:	fec68023          	sb	a2,-32(a3)
80004720:	001a8a93          	add	s5,s5,1
80004724:	e7dff06f          	j	800045a0 <_ftoa+0x3f0>
80004728:	020a8793          	add	a5,s5,32
8000472c:	02010713          	add	a4,sp,32
80004730:	00e786b3          	add	a3,a5,a4
80004734:	02e00613          	li	a2,46
80004738:	fec68023          	sb	a2,-32(a3)
8000473c:	001a8a93          	add	s5,s5,1
80004740:	e05ff06f          	j	80004544 <_ftoa+0x394>
80004744:	020a8793          	add	a5,s5,32
80004748:	02010713          	add	a4,sp,32
8000474c:	00e786b3          	add	a3,a5,a4
80004750:	02b00613          	li	a2,43
80004754:	fec68023          	sb	a2,-32(a3)
80004758:	001a8a93          	add	s5,s5,1
8000475c:	e45ff06f          	j	800045a0 <_ftoa+0x3f0>
80004760:	0018f693          	and	a3,a7,1
80004764:	c4068ae3          	beqz	a3,800043b8 <_ftoa+0x208>
80004768:	00188893          	add	a7,a7,1
8000476c:	c4dff06f          	j	800043b8 <_ftoa+0x208>
80004770:	fff90913          	add	s2,s2,-1
80004774:	eb2ae8e3          	bltu	s5,s2,80004624 <_ftoa+0x474>
80004778:	e01ff06f          	j	80004578 <_ftoa+0x3c8>
8000477c:	a00017b7          	lui	a5,0xa0001
80004780:	003b1713          	sll	a4,s6,0x3
80004784:	98878793          	add	a5,a5,-1656 # a0000988 <pow10.0>
80004788:	00e787b3          	add	a5,a5,a4
8000478c:	0047a803          	lw	a6,4(a5)
80004790:	0007a783          	lw	a5,0(a5)
80004794:	000b0313          	mv	t1,s6
80004798:	01012223          	sw	a6,4(sp)
8000479c:	00f12023          	sw	a5,0(sp)
800047a0:	00000a93          	li	s5,0
800047a4:	02010b93          	add	s7,sp,32
800047a8:	b55ff06f          	j	800042fc <_ftoa+0x14c>
800047ac:	dc0906e3          	beqz	s2,80004578 <_ftoa+0x3c8>
800047b0:	e61ff06f          	j	80004610 <_ftoa+0x460>

800047b4 <_out_char>:
800047b4:	00051463          	bnez	a0,800047bc <_out_char+0x8>
800047b8:	00008067          	ret
800047bc:	19d0006f          	j	80005158 <_putchar>

800047c0 <_vsnprintf>:
800047c0:	f9010113          	add	sp,sp,-112
800047c4:	07212023          	sw	s2,96(sp)
800047c8:	05312e23          	sw	s3,92(sp)
800047cc:	05412c23          	sw	s4,88(sp)
800047d0:	05712623          	sw	s7,76(sp)
800047d4:	03b12e23          	sw	s11,60(sp)
800047d8:	06112623          	sw	ra,108(sp)
800047dc:	06812423          	sw	s0,104(sp)
800047e0:	05a12023          	sw	s10,64(sp)
800047e4:	00058993          	mv	s3,a1
800047e8:	00060913          	mv	s2,a2
800047ec:	00068b93          	mv	s7,a3
800047f0:	00070d93          	mv	s11,a4
800047f4:	00050a13          	mv	s4,a0
800047f8:	4e058863          	beqz	a1,80004ce8 <_vsnprintf+0x528>
800047fc:	000bc503          	lbu	a0,0(s7) # 80000000 <__start>
80004800:	00000d13          	li	s10,0
80004804:	4e050c63          	beqz	a0,80004cfc <_vsnprintf+0x53c>
80004808:	a00017b7          	lui	a5,0xa0001
8000480c:	05512a23          	sw	s5,84(sp)
80004810:	82c78793          	add	a5,a5,-2004 # a000082c <__clz_tab+0x7b4>
80004814:	a0000ab7          	lui	s5,0xa0000
80004818:	06912223          	sw	s1,100(sp)
8000481c:	05612823          	sw	s6,80(sp)
80004820:	05812423          	sw	s8,72(sp)
80004824:	05912223          	sw	s9,68(sp)
80004828:	01000493          	li	s1,16
8000482c:	7e8a8a93          	add	s5,s5,2024 # a00007e8 <__clz_tab+0x770>
80004830:	00900b13          	li	s6,9
80004834:	02f12223          	sw	a5,36(sp)
80004838:	0200006f          	j	80004858 <_vsnprintf+0x98>
8000483c:	000d0613          	mv	a2,s10
80004840:	00090693          	mv	a3,s2
80004844:	00098593          	mv	a1,s3
80004848:	001d0d13          	add	s10,s10,1
8000484c:	000a00e7          	jalr	s4
80004850:	000bc503          	lbu	a0,0(s7)
80004854:	16050863          	beqz	a0,800049c4 <_vsnprintf+0x204>
80004858:	02500793          	li	a5,37
8000485c:	001b8b93          	add	s7,s7,1
80004860:	fcf51ee3          	bne	a0,a5,8000483c <_vsnprintf+0x7c>
80004864:	00000413          	li	s0,0
80004868:	000bc503          	lbu	a0,0(s7)
8000486c:	001b8713          	add	a4,s7,1
80004870:	fe050793          	add	a5,a0,-32
80004874:	0ff7f793          	zext.b	a5,a5
80004878:	00f4ea63          	bltu	s1,a5,8000488c <_vsnprintf+0xcc>
8000487c:	00279793          	sll	a5,a5,0x2
80004880:	015787b3          	add	a5,a5,s5
80004884:	0007a783          	lw	a5,0(a5)
80004888:	00078067          	jr	a5
8000488c:	fd050793          	add	a5,a0,-48
80004890:	0ff7f793          	zext.b	a5,a5
80004894:	0cfb7263          	bgeu	s6,a5,80004958 <_vsnprintf+0x198>
80004898:	02a00793          	li	a5,42
8000489c:	00000e93          	li	t4,0
800048a0:	1ef50e63          	beq	a0,a5,80004a9c <_vsnprintf+0x2dc>
800048a4:	02e00793          	li	a5,46
800048a8:	00000c93          	li	s9,0
800048ac:	0ef50463          	beq	a0,a5,80004994 <_vsnprintf+0x1d4>
800048b0:	f9850793          	add	a5,a0,-104
800048b4:	0ff7f793          	zext.b	a5,a5
800048b8:	01200693          	li	a3,18
800048bc:	06f6e063          	bltu	a3,a5,8000491c <_vsnprintf+0x15c>
800048c0:	02412683          	lw	a3,36(sp)
800048c4:	00279793          	sll	a5,a5,0x2
800048c8:	00d787b3          	add	a5,a5,a3
800048cc:	0007a783          	lw	a5,0(a5)
800048d0:	00078067          	jr	a5
800048d4:	00146413          	or	s0,s0,1
800048d8:	00070b93          	mv	s7,a4
800048dc:	f8dff06f          	j	80004868 <_vsnprintf+0xa8>
800048e0:	00246413          	or	s0,s0,2
800048e4:	00070b93          	mv	s7,a4
800048e8:	f81ff06f          	j	80004868 <_vsnprintf+0xa8>
800048ec:	00446413          	or	s0,s0,4
800048f0:	00070b93          	mv	s7,a4
800048f4:	f75ff06f          	j	80004868 <_vsnprintf+0xa8>
800048f8:	01046413          	or	s0,s0,16
800048fc:	00070b93          	mv	s7,a4
80004900:	f69ff06f          	j	80004868 <_vsnprintf+0xa8>
80004904:	00846413          	or	s0,s0,8
80004908:	00070b93          	mv	s7,a4
8000490c:	f5dff06f          	j	80004868 <_vsnprintf+0xa8>
80004910:	001bc503          	lbu	a0,1(s7)
80004914:	10046413          	or	s0,s0,256
80004918:	00170713          	add	a4,a4,1
8000491c:	06700793          	li	a5,103
80004920:	00070b93          	mv	s7,a4
80004924:	10a7e063          	bltu	a5,a0,80004a24 <_vsnprintf+0x264>
80004928:	02400793          	li	a5,36
8000492c:	f0a7f8e3          	bgeu	a5,a0,8000483c <_vsnprintf+0x7c>
80004930:	fdb50793          	add	a5,a0,-37
80004934:	0ff7f793          	zext.b	a5,a5
80004938:	04200713          	li	a4,66
8000493c:	f0f760e3          	bltu	a4,a5,8000483c <_vsnprintf+0x7c>
80004940:	a0001737          	lui	a4,0xa0001
80004944:	00279793          	sll	a5,a5,0x2
80004948:	87870713          	add	a4,a4,-1928 # a0000878 <__clz_tab+0x800>
8000494c:	00e787b3          	add	a5,a5,a4
80004950:	0007a783          	lw	a5,0(a5)
80004954:	00078067          	jr	a5
80004958:	00000e93          	li	t4,0
8000495c:	002e9793          	sll	a5,t4,0x2
80004960:	01d787b3          	add	a5,a5,t4
80004964:	00179793          	sll	a5,a5,0x1
80004968:	00a787b3          	add	a5,a5,a0
8000496c:	00074503          	lbu	a0,0(a4)
80004970:	fd078e93          	add	t4,a5,-48
80004974:	00070b93          	mv	s7,a4
80004978:	fd050793          	add	a5,a0,-48
8000497c:	0ff7f793          	zext.b	a5,a5
80004980:	00170713          	add	a4,a4,1
80004984:	fcfb7ce3          	bgeu	s6,a5,8000495c <_vsnprintf+0x19c>
80004988:	02e00793          	li	a5,46
8000498c:	00000c93          	li	s9,0
80004990:	f2f510e3          	bne	a0,a5,800048b0 <_vsnprintf+0xf0>
80004994:	001bc503          	lbu	a0,1(s7)
80004998:	00900613          	li	a2,9
8000499c:	00070693          	mv	a3,a4
800049a0:	fd050793          	add	a5,a0,-48
800049a4:	0ff7f793          	zext.b	a5,a5
800049a8:	40046413          	or	s0,s0,1024
800049ac:	34f67e63          	bgeu	a2,a5,80004d08 <_vsnprintf+0x548>
800049b0:	02a00793          	li	a5,42
800049b4:	3af50863          	beq	a0,a5,80004d64 <_vsnprintf+0x5a4>
800049b8:	00070b93          	mv	s7,a4
800049bc:	00170713          	add	a4,a4,1
800049c0:	ef1ff06f          	j	800048b0 <_vsnprintf+0xf0>
800049c4:	06412483          	lw	s1,100(sp)
800049c8:	05412a83          	lw	s5,84(sp)
800049cc:	05012b03          	lw	s6,80(sp)
800049d0:	04812c03          	lw	s8,72(sp)
800049d4:	04412c83          	lw	s9,68(sp)
800049d8:	000d0413          	mv	s0,s10
800049dc:	012d6463          	bltu	s10,s2,800049e4 <_vsnprintf+0x224>
800049e0:	fff90d13          	add	s10,s2,-1
800049e4:	00090693          	mv	a3,s2
800049e8:	000d0613          	mv	a2,s10
800049ec:	00098593          	mv	a1,s3
800049f0:	00000513          	li	a0,0
800049f4:	000a00e7          	jalr	s4
800049f8:	06c12083          	lw	ra,108(sp)
800049fc:	00040513          	mv	a0,s0
80004a00:	06812403          	lw	s0,104(sp)
80004a04:	06012903          	lw	s2,96(sp)
80004a08:	05c12983          	lw	s3,92(sp)
80004a0c:	05812a03          	lw	s4,88(sp)
80004a10:	04c12b83          	lw	s7,76(sp)
80004a14:	04012d03          	lw	s10,64(sp)
80004a18:	03c12d83          	lw	s11,60(sp)
80004a1c:	07010113          	add	sp,sp,112
80004a20:	00008067          	ret
80004a24:	f9750793          	add	a5,a0,-105
80004a28:	0ff7f793          	zext.b	a5,a5
80004a2c:	00f00713          	li	a4,15
80004a30:	e0f766e3          	bltu	a4,a5,8000483c <_vsnprintf+0x7c>
80004a34:	00009737          	lui	a4,0x9
80004a38:	00100c13          	li	s8,1
80004a3c:	00fc1c33          	sll	s8,s8,a5
80004a40:	04170713          	add	a4,a4,65 # 9041 <__stack_size+0x5041>
80004a44:	00ec7c33          	and	s8,s8,a4
80004a48:	2e0c1c63          	bnez	s8,80004d40 <_vsnprintf+0x580>
80004a4c:	00a00713          	li	a4,10
80004a50:	06e78463          	beq	a5,a4,80004ab8 <_vsnprintf+0x2f8>
80004a54:	00700713          	li	a4,7
80004a58:	dee792e3          	bne	a5,a4,8000483c <_vsnprintf+0x7c>
80004a5c:	000da703          	lw	a4,0(s11)
80004a60:	00800793          	li	a5,8
80004a64:	02146413          	or	s0,s0,33
80004a68:	00f12023          	sw	a5,0(sp)
80004a6c:	000d0613          	mv	a2,s10
80004a70:	00812223          	sw	s0,4(sp)
80004a74:	000c8893          	mv	a7,s9
80004a78:	01000813          	li	a6,16
80004a7c:	00000793          	li	a5,0
80004a80:	00090693          	mv	a3,s2
80004a84:	00098593          	mv	a1,s3
80004a88:	000a0513          	mv	a0,s4
80004a8c:	ed9fe0ef          	jal	80003964 <_ntoa_long>
80004a90:	004d8d93          	add	s11,s11,4
80004a94:	00050d13          	mv	s10,a0
80004a98:	db9ff06f          	j	80004850 <_vsnprintf+0x90>
80004a9c:	000dae83          	lw	t4,0(s11)
80004aa0:	004d8d93          	add	s11,s11,4
80004aa4:	0c0ecc63          	bltz	t4,80004b7c <_vsnprintf+0x3bc>
80004aa8:	001bc503          	lbu	a0,1(s7)
80004aac:	00070b93          	mv	s7,a4
80004ab0:	00170713          	add	a4,a4,1
80004ab4:	df1ff06f          	j	800048a4 <_vsnprintf+0xe4>
80004ab8:	000da783          	lw	a5,0(s11)
80004abc:	004d8713          	add	a4,s11,4
80004ac0:	02e12623          	sw	a4,44(sp)
80004ac4:	0007c683          	lbu	a3,0(a5)
80004ac8:	02f12023          	sw	a5,32(sp)
80004acc:	00068513          	mv	a0,a3
80004ad0:	2a0c9c63          	bnez	s9,80004d88 <_vsnprintf+0x5c8>
80004ad4:	02068863          	beqz	a3,80004b04 <_vsnprintf+0x344>
80004ad8:	ffe00c13          	li	s8,-2
80004adc:	02012783          	lw	a5,32(sp)
80004ae0:	001c0c13          	add	s8,s8,1
80004ae4:	01878c33          	add	s8,a5,s8
80004ae8:	0080006f          	j	80004af0 <_vsnprintf+0x330>
80004aec:	3afc0463          	beq	s8,a5,80004e94 <_vsnprintf+0x6d4>
80004af0:	0017c703          	lbu	a4,1(a5)
80004af4:	00178793          	add	a5,a5,1
80004af8:	fe071ae3          	bnez	a4,80004aec <_vsnprintf+0x32c>
80004afc:	02012703          	lw	a4,32(sp)
80004b00:	40e78c33          	sub	s8,a5,a4
80004b04:	40047d93          	and	s11,s0,1024
80004b08:	000d8663          	beqz	s11,80004b14 <_vsnprintf+0x354>
80004b0c:	018cf463          	bgeu	s9,s8,80004b14 <_vsnprintf+0x354>
80004b10:	000c8c13          	mv	s8,s9
80004b14:	00247793          	and	a5,s0,2
80004b18:	02f12423          	sw	a5,40(sp)
80004b1c:	38078863          	beqz	a5,80004eac <_vsnprintf+0x6ec>
80004b20:	32068263          	beqz	a3,80004e44 <_vsnprintf+0x684>
80004b24:	000d0413          	mv	s0,s10
80004b28:	000d8863          	beqz	s11,80004b38 <_vsnprintf+0x378>
80004b2c:	fffc8793          	add	a5,s9,-1
80004b30:	020c8c63          	beqz	s9,80004b68 <_vsnprintf+0x3a8>
80004b34:	00078c93          	mv	s9,a5
80004b38:	01d12e23          	sw	t4,28(sp)
80004b3c:	00040613          	mv	a2,s0
80004b40:	00090693          	mv	a3,s2
80004b44:	00098593          	mv	a1,s3
80004b48:	000a00e7          	jalr	s4
80004b4c:	02012783          	lw	a5,32(sp)
80004b50:	00140413          	add	s0,s0,1
80004b54:	41a40733          	sub	a4,s0,s10
80004b58:	00e78733          	add	a4,a5,a4
80004b5c:	00074503          	lbu	a0,0(a4)
80004b60:	01c12e83          	lw	t4,28(sp)
80004b64:	fc0512e3          	bnez	a0,80004b28 <_vsnprintf+0x368>
80004b68:	02812783          	lw	a5,40(sp)
80004b6c:	2c079a63          	bnez	a5,80004e40 <_vsnprintf+0x680>
80004b70:	02c12d83          	lw	s11,44(sp)
80004b74:	00040d13          	mv	s10,s0
80004b78:	cd9ff06f          	j	80004850 <_vsnprintf+0x90>
80004b7c:	001bc503          	lbu	a0,1(s7)
80004b80:	00246413          	or	s0,s0,2
80004b84:	00070b93          	mv	s7,a4
80004b88:	41d00eb3          	neg	t4,t4
80004b8c:	00170713          	add	a4,a4,1
80004b90:	d15ff06f          	j	800048a4 <_vsnprintf+0xe4>
80004b94:	001bc503          	lbu	a0,1(s7)
80004b98:	06c00793          	li	a5,108
80004b9c:	d6f51ce3          	bne	a0,a5,80004914 <_vsnprintf+0x154>
80004ba0:	002bc503          	lbu	a0,2(s7)
80004ba4:	30046413          	or	s0,s0,768
80004ba8:	003b8713          	add	a4,s7,3
80004bac:	d71ff06f          	j	8000491c <_vsnprintf+0x15c>
80004bb0:	001bc503          	lbu	a0,1(s7)
80004bb4:	20046413          	or	s0,s0,512
80004bb8:	00170713          	add	a4,a4,1
80004bbc:	d61ff06f          	j	8000491c <_vsnprintf+0x15c>
80004bc0:	001bc503          	lbu	a0,1(s7)
80004bc4:	06800793          	li	a5,104
80004bc8:	2af50e63          	beq	a0,a5,80004e84 <_vsnprintf+0x6c4>
80004bcc:	08046413          	or	s0,s0,128
80004bd0:	00170713          	add	a4,a4,1
80004bd4:	d49ff06f          	j	8000491c <_vsnprintf+0x15c>
80004bd8:	06700793          	li	a5,103
80004bdc:	1cf50063          	beq	a0,a5,80004d9c <_vsnprintf+0x5dc>
80004be0:	04700793          	li	a5,71
80004be4:	28f50663          	beq	a0,a5,80004e70 <_vsnprintf+0x6b0>
80004be8:	04500793          	li	a5,69
80004bec:	28f50863          	beq	a0,a5,80004e7c <_vsnprintf+0x6bc>
80004bf0:	007d8d93          	add	s11,s11,7
80004bf4:	ff8dfd93          	and	s11,s11,-8
80004bf8:	000da703          	lw	a4,0(s11)
80004bfc:	004da783          	lw	a5,4(s11)
80004c00:	000d0613          	mv	a2,s10
80004c04:	000e8893          	mv	a7,t4
80004c08:	00812023          	sw	s0,0(sp)
80004c0c:	000c8813          	mv	a6,s9
80004c10:	00090693          	mv	a3,s2
80004c14:	00098593          	mv	a1,s3
80004c18:	000a0513          	mv	a0,s4
80004c1c:	f9dfe0ef          	jal	80003bb8 <_etoa>
80004c20:	008d8d93          	add	s11,s11,8
80004c24:	00050d13          	mv	s10,a0
80004c28:	c29ff06f          	j	80004850 <_vsnprintf+0x90>
80004c2c:	04600793          	li	a5,70
80004c30:	16f50263          	beq	a0,a5,80004d94 <_vsnprintf+0x5d4>
80004c34:	007d8d93          	add	s11,s11,7
80004c38:	ff8dfd93          	and	s11,s11,-8
80004c3c:	000da703          	lw	a4,0(s11)
80004c40:	004da783          	lw	a5,4(s11)
80004c44:	000d0613          	mv	a2,s10
80004c48:	000e8893          	mv	a7,t4
80004c4c:	00812023          	sw	s0,0(sp)
80004c50:	000c8813          	mv	a6,s9
80004c54:	00090693          	mv	a3,s2
80004c58:	00098593          	mv	a1,s3
80004c5c:	000a0513          	mv	a0,s4
80004c60:	d50ff0ef          	jal	800041b0 <_ftoa>
80004c64:	008d8d93          	add	s11,s11,8
80004c68:	00050d13          	mv	s10,a0
80004c6c:	be5ff06f          	j	80004850 <_vsnprintf+0x90>
80004c70:	000d0613          	mv	a2,s10
80004c74:	00090693          	mv	a3,s2
80004c78:	00098593          	mv	a1,s3
80004c7c:	02500513          	li	a0,37
80004c80:	001d0d13          	add	s10,s10,1
80004c84:	000a00e7          	jalr	s4
80004c88:	bc9ff06f          	j	80004850 <_vsnprintf+0x90>
80004c8c:	00247413          	and	s0,s0,2
80004c90:	001d0c93          	add	s9,s10,1
80004c94:	004d8c13          	add	s8,s11,4
80004c98:	26040063          	beqz	s0,80004ef8 <_vsnprintf+0x738>
80004c9c:	000dc503          	lbu	a0,0(s11)
80004ca0:	01d12e23          	sw	t4,28(sp)
80004ca4:	000d0613          	mv	a2,s10
80004ca8:	00090693          	mv	a3,s2
80004cac:	00098593          	mv	a1,s3
80004cb0:	000a00e7          	jalr	s4
80004cb4:	01c12e83          	lw	t4,28(sp)
80004cb8:	00100793          	li	a5,1
80004cbc:	01dd0d33          	add	s10,s10,t4
80004cc0:	2bd7f663          	bgeu	a5,t4,80004f6c <_vsnprintf+0x7ac>
80004cc4:	000c8613          	mv	a2,s9
80004cc8:	00090693          	mv	a3,s2
80004ccc:	001c8c93          	add	s9,s9,1
80004cd0:	00098593          	mv	a1,s3
80004cd4:	02000513          	li	a0,32
80004cd8:	000a00e7          	jalr	s4
80004cdc:	ff9d14e3          	bne	s10,s9,80004cc4 <_vsnprintf+0x504>
80004ce0:	000c0d93          	mv	s11,s8
80004ce4:	b6dff06f          	j	80004850 <_vsnprintf+0x90>
80004ce8:	000bc503          	lbu	a0,0(s7)
80004cec:	80003a37          	lui	s4,0x80003
80004cf0:	4d0a0a13          	add	s4,s4,1232 # 800034d0 <_out_null>
80004cf4:	00000d13          	li	s10,0
80004cf8:	b00518e3          	bnez	a0,80004808 <_vsnprintf+0x48>
80004cfc:	00000413          	li	s0,0
80004d00:	cf2d62e3          	bltu	s10,s2,800049e4 <_vsnprintf+0x224>
80004d04:	cddff06f          	j	800049e0 <_vsnprintf+0x220>
80004d08:	00900713          	li	a4,9
80004d0c:	002c9793          	sll	a5,s9,0x2
80004d10:	019787b3          	add	a5,a5,s9
80004d14:	00168693          	add	a3,a3,1
80004d18:	00179793          	sll	a5,a5,0x1
80004d1c:	00a787b3          	add	a5,a5,a0
80004d20:	0006c503          	lbu	a0,0(a3)
80004d24:	fd078c93          	add	s9,a5,-48
80004d28:	fd050793          	add	a5,a0,-48
80004d2c:	0ff7f793          	zext.b	a5,a5
80004d30:	fcf77ee3          	bgeu	a4,a5,80004d0c <_vsnprintf+0x54c>
80004d34:	00068b93          	mv	s7,a3
80004d38:	00168713          	add	a4,a3,1
80004d3c:	b75ff06f          	j	800048b0 <_vsnprintf+0xf0>
80004d40:	06f00793          	li	a5,111
80004d44:	06f50463          	beq	a0,a5,80004dac <_vsnprintf+0x5ec>
80004d48:	28a7f063          	bgeu	a5,a0,80004fc8 <_vsnprintf+0x808>
80004d4c:	07800793          	li	a5,120
80004d50:	01000813          	li	a6,16
80004d54:	04f50e63          	beq	a0,a5,80004db0 <_vsnprintf+0x5f0>
80004d58:	fef47413          	and	s0,s0,-17
80004d5c:	00a00813          	li	a6,10
80004d60:	0500006f          	j	80004db0 <_vsnprintf+0x5f0>
80004d64:	000dac83          	lw	s9,0(s11)
80004d68:	002bc503          	lbu	a0,2(s7)
80004d6c:	002b8b93          	add	s7,s7,2
80004d70:	fffcc793          	not	a5,s9
80004d74:	41f7d793          	sra	a5,a5,0x1f
80004d78:	00fcfcb3          	and	s9,s9,a5
80004d7c:	004d8d93          	add	s11,s11,4
80004d80:	001b8713          	add	a4,s7,1
80004d84:	b2dff06f          	j	800048b0 <_vsnprintf+0xf0>
80004d88:	d6068ee3          	beqz	a3,80004b04 <_vsnprintf+0x344>
80004d8c:	fffc8c13          	add	s8,s9,-1
80004d90:	d4dff06f          	j	80004adc <_vsnprintf+0x31c>
80004d94:	02046413          	or	s0,s0,32
80004d98:	e9dff06f          	j	80004c34 <_vsnprintf+0x474>
80004d9c:	000017b7          	lui	a5,0x1
80004da0:	80078793          	add	a5,a5,-2048 # 800 <__stack_size-0x3800>
80004da4:	00f46433          	or	s0,s0,a5
80004da8:	e49ff06f          	j	80004bf0 <_vsnprintf+0x430>
80004dac:	00800813          	li	a6,8
80004db0:	40047713          	and	a4,s0,1024
80004db4:	ff347793          	and	a5,s0,-13
80004db8:	00070463          	beqz	a4,80004dc0 <_vsnprintf+0x600>
80004dbc:	ff247793          	and	a5,s0,-14
80004dc0:	2007f713          	and	a4,a5,512
80004dc4:	1a071a63          	bnez	a4,80004f78 <_vsnprintf+0x7b8>
80004dc8:	1007f713          	and	a4,a5,256
80004dcc:	004d8413          	add	s0,s11,4
80004dd0:	2e071063          	bnez	a4,800050b0 <_vsnprintf+0x8f0>
80004dd4:	0407f713          	and	a4,a5,64
80004dd8:	16071c63          	bnez	a4,80004f50 <_vsnprintf+0x790>
80004ddc:	0807f713          	and	a4,a5,128
80004de0:	2e070c63          	beqz	a4,800050d8 <_vsnprintf+0x918>
80004de4:	000dd703          	lhu	a4,0(s11)
80004de8:	00f12223          	sw	a5,4(sp)
80004dec:	01d12023          	sw	t4,0(sp)
80004df0:	000c8893          	mv	a7,s9
80004df4:	00000793          	li	a5,0
80004df8:	000d0613          	mv	a2,s10
80004dfc:	00090693          	mv	a3,s2
80004e00:	00098593          	mv	a1,s3
80004e04:	000a0513          	mv	a0,s4
80004e08:	b5dfe0ef          	jal	80003964 <_ntoa_long>
80004e0c:	00050d13          	mv	s10,a0
80004e10:	00040d93          	mv	s11,s0
80004e14:	a3dff06f          	j	80004850 <_vsnprintf+0x90>
80004e18:	05800793          	li	a5,88
80004e1c:	08f50263          	beq	a0,a5,80004ea0 <_vsnprintf+0x6e0>
80004e20:	06200793          	li	a5,98
80004e24:	00200813          	li	a6,2
80004e28:	f8f504e3          	beq	a0,a5,80004db0 <_vsnprintf+0x5f0>
80004e2c:	40047793          	and	a5,s0,1024
80004e30:	fee47693          	and	a3,s0,-18
80004e34:	1a079663          	bnez	a5,80004fe0 <_vsnprintf+0x820>
80004e38:	fef47693          	and	a3,s0,-17
80004e3c:	1a40006f          	j	80004fe0 <_vsnprintf+0x820>
80004e40:	00040d13          	mv	s10,s0
80004e44:	0bdc7663          	bgeu	s8,t4,80004ef0 <_vsnprintf+0x730>
80004e48:	01ae87b3          	add	a5,t4,s10
80004e4c:	41878433          	sub	s0,a5,s8
80004e50:	000d0613          	mv	a2,s10
80004e54:	00090693          	mv	a3,s2
80004e58:	001d0d13          	add	s10,s10,1
80004e5c:	00098593          	mv	a1,s3
80004e60:	02000513          	li	a0,32
80004e64:	000a00e7          	jalr	s4
80004e68:	ffa414e3          	bne	s0,s10,80004e50 <_vsnprintf+0x690>
80004e6c:	d05ff06f          	j	80004b70 <_vsnprintf+0x3b0>
80004e70:	000017b7          	lui	a5,0x1
80004e74:	80078793          	add	a5,a5,-2048 # 800 <__stack_size-0x3800>
80004e78:	00f46433          	or	s0,s0,a5
80004e7c:	02046413          	or	s0,s0,32
80004e80:	d71ff06f          	j	80004bf0 <_vsnprintf+0x430>
80004e84:	002bc503          	lbu	a0,2(s7)
80004e88:	0c046413          	or	s0,s0,192
80004e8c:	003b8713          	add	a4,s7,3
80004e90:	a8dff06f          	j	8000491c <_vsnprintf+0x15c>
80004e94:	02012783          	lw	a5,32(sp)
80004e98:	40fc0c33          	sub	s8,s8,a5
80004e9c:	c69ff06f          	j	80004b04 <_vsnprintf+0x344>
80004ea0:	02046413          	or	s0,s0,32
80004ea4:	01000813          	li	a6,16
80004ea8:	f09ff06f          	j	80004db0 <_vsnprintf+0x5f0>
80004eac:	23dc7a63          	bgeu	s8,t4,800050e0 <_vsnprintf+0x920>
80004eb0:	01ae87b3          	add	a5,t4,s10
80004eb4:	41878c33          	sub	s8,a5,s8
80004eb8:	01d12e23          	sw	t4,28(sp)
80004ebc:	000d0613          	mv	a2,s10
80004ec0:	00090693          	mv	a3,s2
80004ec4:	00098593          	mv	a1,s3
80004ec8:	02000513          	li	a0,32
80004ecc:	000a00e7          	jalr	s4
80004ed0:	001d0d13          	add	s10,s10,1
80004ed4:	01c12e83          	lw	t4,28(sp)
80004ed8:	ffac10e3          	bne	s8,s10,80004eb8 <_vsnprintf+0x6f8>
80004edc:	02012783          	lw	a5,32(sp)
80004ee0:	001e8c13          	add	s8,t4,1
80004ee4:	0007c683          	lbu	a3,0(a5)
80004ee8:	00068513          	mv	a0,a3
80004eec:	c2069ce3          	bnez	a3,80004b24 <_vsnprintf+0x364>
80004ef0:	000d0413          	mv	s0,s10
80004ef4:	c7dff06f          	j	80004b70 <_vsnprintf+0x3b0>
80004ef8:	00100793          	li	a5,1
80004efc:	05d7fe63          	bgeu	a5,t4,80004f58 <_vsnprintf+0x798>
80004f00:	fffd0413          	add	s0,s10,-1
80004f04:	01d40433          	add	s0,s0,t4
80004f08:	000d0c93          	mv	s9,s10
80004f0c:	01d12e23          	sw	t4,28(sp)
80004f10:	000c8613          	mv	a2,s9
80004f14:	00090693          	mv	a3,s2
80004f18:	00098593          	mv	a1,s3
80004f1c:	02000513          	li	a0,32
80004f20:	000a00e7          	jalr	s4
80004f24:	001c8c93          	add	s9,s9,1
80004f28:	01c12e83          	lw	t4,28(sp)
80004f2c:	ff9410e3          	bne	s0,s9,80004f0c <_vsnprintf+0x74c>
80004f30:	000dc503          	lbu	a0,0(s11)
80004f34:	00090693          	mv	a3,s2
80004f38:	00040613          	mv	a2,s0
80004f3c:	00098593          	mv	a1,s3
80004f40:	01dd0d33          	add	s10,s10,t4
80004f44:	000c0d93          	mv	s11,s8
80004f48:	000a00e7          	jalr	s4
80004f4c:	905ff06f          	j	80004850 <_vsnprintf+0x90>
80004f50:	000dc703          	lbu	a4,0(s11)
80004f54:	e95ff06f          	j	80004de8 <_vsnprintf+0x628>
80004f58:	000dc503          	lbu	a0,0(s11)
80004f5c:	00090693          	mv	a3,s2
80004f60:	000d0613          	mv	a2,s10
80004f64:	00098593          	mv	a1,s3
80004f68:	000a00e7          	jalr	s4
80004f6c:	000c8d13          	mv	s10,s9
80004f70:	000c0d93          	mv	s11,s8
80004f74:	8ddff06f          	j	80004850 <_vsnprintf+0x90>
80004f78:	007d8d93          	add	s11,s11,7
80004f7c:	ff8dfd93          	and	s11,s11,-8
80004f80:	000da603          	lw	a2,0(s11)
80004f84:	004da683          	lw	a3,4(s11)
80004f88:	00080893          	mv	a7,a6
80004f8c:	00f12623          	sw	a5,12(sp)
80004f90:	01d12423          	sw	t4,8(sp)
80004f94:	01912223          	sw	s9,4(sp)
80004f98:	00012023          	sw	zero,0(sp)
80004f9c:	00000813          	li	a6,0
80004fa0:	00060713          	mv	a4,a2
80004fa4:	00068793          	mv	a5,a3
80004fa8:	000d0613          	mv	a2,s10
80004fac:	00090693          	mv	a3,s2
80004fb0:	00098593          	mv	a1,s3
80004fb4:	000a0513          	mv	a0,s4
80004fb8:	a75fe0ef          	jal	80003a2c <_ntoa_long_long>
80004fbc:	008d8d93          	add	s11,s11,8
80004fc0:	00050d13          	mv	s10,a0
80004fc4:	88dff06f          	j	80004850 <_vsnprintf+0x90>
80004fc8:	06900793          	li	a5,105
80004fcc:	fef47693          	and	a3,s0,-17
80004fd0:	10f51c63          	bne	a0,a5,800050e8 <_vsnprintf+0x928>
80004fd4:	40047793          	and	a5,s0,1024
80004fd8:	00078463          	beqz	a5,80004fe0 <_vsnprintf+0x820>
80004fdc:	fee47693          	and	a3,s0,-18
80004fe0:	2006f793          	and	a5,a3,512
80004fe4:	02079c63          	bnez	a5,8000501c <_vsnprintf+0x85c>
80004fe8:	1006f793          	and	a5,a3,256
80004fec:	004d8413          	add	s0,s11,4
80004ff0:	08079c63          	bnez	a5,80005088 <_vsnprintf+0x8c8>
80004ff4:	0406f793          	and	a5,a3,64
80004ff8:	06078663          	beqz	a5,80005064 <_vsnprintf+0x8a4>
80004ffc:	000dc783          	lbu	a5,0(s11)
80005000:	00078713          	mv	a4,a5
80005004:	00d12223          	sw	a3,4(sp)
80005008:	01d12023          	sw	t4,0(sp)
8000500c:	000c8893          	mv	a7,s9
80005010:	00a00813          	li	a6,10
80005014:	01f7d793          	srl	a5,a5,0x1f
80005018:	de1ff06f          	j	80004df8 <_vsnprintf+0x638>
8000501c:	007d8d93          	add	s11,s11,7
80005020:	ff8dfd93          	and	s11,s11,-8
80005024:	004da803          	lw	a6,4(s11)
80005028:	000da783          	lw	a5,0(s11)
8000502c:	00a00893          	li	a7,10
80005030:	41f85613          	sra	a2,a6,0x1f
80005034:	00f647b3          	xor	a5,a2,a5
80005038:	40c78733          	sub	a4,a5,a2
8000503c:	010645b3          	xor	a1,a2,a6
80005040:	00e7b7b3          	sltu	a5,a5,a4
80005044:	40c58633          	sub	a2,a1,a2
80005048:	00d12623          	sw	a3,12(sp)
8000504c:	01d12423          	sw	t4,8(sp)
80005050:	01912223          	sw	s9,4(sp)
80005054:	00012023          	sw	zero,0(sp)
80005058:	01f85813          	srl	a6,a6,0x1f
8000505c:	40f607b3          	sub	a5,a2,a5
80005060:	f49ff06f          	j	80004fa8 <_vsnprintf+0x7e8>
80005064:	0806f793          	and	a5,a3,128
80005068:	04078e63          	beqz	a5,800050c4 <_vsnprintf+0x904>
8000506c:	000d9783          	lh	a5,0(s11)
80005070:	40f7d613          	sra	a2,a5,0xf
80005074:	00c7c733          	xor	a4,a5,a2
80005078:	40c70733          	sub	a4,a4,a2
8000507c:	01071713          	sll	a4,a4,0x10
80005080:	01075713          	srl	a4,a4,0x10
80005084:	f81ff06f          	j	80005004 <_vsnprintf+0x844>
80005088:	000da783          	lw	a5,0(s11)
8000508c:	00d12223          	sw	a3,4(sp)
80005090:	000c8893          	mv	a7,s9
80005094:	41f7d713          	sra	a4,a5,0x1f
80005098:	00f746b3          	xor	a3,a4,a5
8000509c:	01d12023          	sw	t4,0(sp)
800050a0:	00a00813          	li	a6,10
800050a4:	01f7d793          	srl	a5,a5,0x1f
800050a8:	40e68733          	sub	a4,a3,a4
800050ac:	d4dff06f          	j	80004df8 <_vsnprintf+0x638>
800050b0:	000da703          	lw	a4,0(s11)
800050b4:	000c8893          	mv	a7,s9
800050b8:	00f12223          	sw	a5,4(sp)
800050bc:	01d12023          	sw	t4,0(sp)
800050c0:	d35ff06f          	j	80004df4 <_vsnprintf+0x634>
800050c4:	000da783          	lw	a5,0(s11)
800050c8:	41f7d613          	sra	a2,a5,0x1f
800050cc:	00f64733          	xor	a4,a2,a5
800050d0:	40c70733          	sub	a4,a4,a2
800050d4:	f31ff06f          	j	80005004 <_vsnprintf+0x844>
800050d8:	000da703          	lw	a4,0(s11)
800050dc:	d0dff06f          	j	80004de8 <_vsnprintf+0x628>
800050e0:	001c0c13          	add	s8,s8,1
800050e4:	e05ff06f          	j	80004ee8 <_vsnprintf+0x728>
800050e8:	00068413          	mv	s0,a3
800050ec:	00a00813          	li	a6,10
800050f0:	cc1ff06f          	j	80004db0 <_vsnprintf+0x5f0>

800050f4 <printf_>:
800050f4:	fc010113          	add	sp,sp,-64
800050f8:	02410313          	add	t1,sp,36
800050fc:	02d12623          	sw	a3,44(sp)
80005100:	00050693          	mv	a3,a0
80005104:	80004537          	lui	a0,0x80004
80005108:	02b12223          	sw	a1,36(sp)
8000510c:	02c12423          	sw	a2,40(sp)
80005110:	02e12823          	sw	a4,48(sp)
80005114:	00810593          	add	a1,sp,8
80005118:	00030713          	mv	a4,t1
8000511c:	fff00613          	li	a2,-1
80005120:	7b450513          	add	a0,a0,1972 # 800047b4 <_out_char>
80005124:	00112e23          	sw	ra,28(sp)
80005128:	02f12a23          	sw	a5,52(sp)
8000512c:	03012c23          	sw	a6,56(sp)
80005130:	03112e23          	sw	a7,60(sp)
80005134:	00612623          	sw	t1,12(sp)
80005138:	e88ff0ef          	jal	800047c0 <_vsnprintf>
8000513c:	01c12083          	lw	ra,28(sp)
80005140:	04010113          	add	sp,sp,64
80005144:	00008067          	ret

80005148 <to_host>:
80005148:	c00007b7          	lui	a5,0xc0000
8000514c:	00100713          	li	a4,1
80005150:	00e7a023          	sw	a4,0(a5) # c0000000 <__stack_base>
80005154:	00008067          	ret

80005158 <_putchar>:
80005158:	00050593          	mv	a1,a0
8000515c:	a0001537          	lui	a0,0xa0001
80005160:	aa450513          	add	a0,a0,-1372 # a0000aa4 <uart>
80005164:	b60fe06f          	j	800034c4 <uart_put_char>

80005168 <Proc_1>:
80005168:	ff010113          	add	sp,sp,-16
8000516c:	01212023          	sw	s2,0(sp)
80005170:	a0001937          	lui	s2,0xa0001
80005174:	aa092783          	lw	a5,-1376(s2) # a0000aa0 <Ptr_Glob>
80005178:	00812423          	sw	s0,8(sp)
8000517c:	00052403          	lw	s0,0(a0)
80005180:	0007a703          	lw	a4,0(a5)
80005184:	0047af83          	lw	t6,4(a5)
80005188:	0087af03          	lw	t5,8(a5)
8000518c:	0107ae83          	lw	t4,16(a5)
80005190:	0147ae03          	lw	t3,20(a5)
80005194:	0187a303          	lw	t1,24(a5)
80005198:	01c7a883          	lw	a7,28(a5)
8000519c:	0207a803          	lw	a6,32(a5)
800051a0:	02c7a603          	lw	a2,44(a5)
800051a4:	0287a583          	lw	a1,40(a5)
800051a8:	00112623          	sw	ra,12(sp)
800051ac:	00912223          	sw	s1,4(sp)
800051b0:	00050493          	mv	s1,a0
800051b4:	0247a503          	lw	a0,36(a5)
800051b8:	00e42023          	sw	a4,0(s0)
800051bc:	0004a683          	lw	a3,0(s1)
800051c0:	00500713          	li	a4,5
800051c4:	01f42223          	sw	t6,4(s0)
800051c8:	01e42423          	sw	t5,8(s0)
800051cc:	01d42823          	sw	t4,16(s0)
800051d0:	01c42a23          	sw	t3,20(s0)
800051d4:	00642c23          	sw	t1,24(s0)
800051d8:	01142e23          	sw	a7,28(s0)
800051dc:	03042023          	sw	a6,32(s0)
800051e0:	02a42223          	sw	a0,36(s0)
800051e4:	02c42623          	sw	a2,44(s0)
800051e8:	02b42423          	sw	a1,40(s0)
800051ec:	00e4a623          	sw	a4,12(s1)
800051f0:	00d42023          	sw	a3,0(s0)
800051f4:	0007a783          	lw	a5,0(a5)
800051f8:	a00016b7          	lui	a3,0xa0001
800051fc:	a986a583          	lw	a1,-1384(a3) # a0000a98 <Int_Glob>
80005200:	00f42023          	sw	a5,0(s0)
80005204:	aa092603          	lw	a2,-1376(s2)
80005208:	00e42623          	sw	a4,12(s0)
8000520c:	00a00513          	li	a0,10
80005210:	00c60613          	add	a2,a2,12
80005214:	20d000ef          	jal	80005c20 <Proc_7>
80005218:	00442783          	lw	a5,4(s0)
8000521c:	08078063          	beqz	a5,8000529c <Proc_1+0x134>
80005220:	0004a783          	lw	a5,0(s1)
80005224:	00c12083          	lw	ra,12(sp)
80005228:	00812403          	lw	s0,8(sp)
8000522c:	0007af83          	lw	t6,0(a5)
80005230:	0047af03          	lw	t5,4(a5)
80005234:	0087ae83          	lw	t4,8(a5)
80005238:	00c7ae03          	lw	t3,12(a5)
8000523c:	0107a303          	lw	t1,16(a5)
80005240:	0147a883          	lw	a7,20(a5)
80005244:	0187a803          	lw	a6,24(a5)
80005248:	01c7a583          	lw	a1,28(a5)
8000524c:	0207a603          	lw	a2,32(a5)
80005250:	0247a683          	lw	a3,36(a5)
80005254:	0287a703          	lw	a4,40(a5)
80005258:	02c7a783          	lw	a5,44(a5)
8000525c:	01f4a023          	sw	t6,0(s1)
80005260:	01e4a223          	sw	t5,4(s1)
80005264:	01d4a423          	sw	t4,8(s1)
80005268:	01c4a623          	sw	t3,12(s1)
8000526c:	0064a823          	sw	t1,16(s1)
80005270:	0114aa23          	sw	a7,20(s1)
80005274:	0104ac23          	sw	a6,24(s1)
80005278:	00b4ae23          	sw	a1,28(s1)
8000527c:	02c4a023          	sw	a2,32(s1)
80005280:	02d4a223          	sw	a3,36(s1)
80005284:	02e4a423          	sw	a4,40(s1)
80005288:	02f4a623          	sw	a5,44(s1)
8000528c:	00012903          	lw	s2,0(sp)
80005290:	00412483          	lw	s1,4(sp)
80005294:	01010113          	add	sp,sp,16
80005298:	00008067          	ret
8000529c:	0084a503          	lw	a0,8(s1)
800052a0:	00600793          	li	a5,6
800052a4:	00f42623          	sw	a5,12(s0)
800052a8:	00840593          	add	a1,s0,8
800052ac:	121000ef          	jal	80005bcc <Proc_6>
800052b0:	aa092783          	lw	a5,-1376(s2)
800052b4:	00c42503          	lw	a0,12(s0)
800052b8:	00c40613          	add	a2,s0,12
800052bc:	0007a783          	lw	a5,0(a5)
800052c0:	00c12083          	lw	ra,12(sp)
800052c4:	00412483          	lw	s1,4(sp)
800052c8:	00f42023          	sw	a5,0(s0)
800052cc:	00812403          	lw	s0,8(sp)
800052d0:	00012903          	lw	s2,0(sp)
800052d4:	00a00593          	li	a1,10
800052d8:	01010113          	add	sp,sp,16
800052dc:	1450006f          	j	80005c20 <Proc_7>

800052e0 <main>:
800052e0:	a0001537          	lui	a0,0xa0001
800052e4:	f4010113          	add	sp,sp,-192
800052e8:	c00015b7          	lui	a1,0xc0001
800052ec:	aa450513          	add	a0,a0,-1372 # a0000aa4 <uart>
800052f0:	0a112e23          	sw	ra,188(sp)
800052f4:	0a812c23          	sw	s0,184(sp)
800052f8:	0b512223          	sw	s5,164(sp)
800052fc:	09712e23          	sw	s7,156(sp)
80005300:	0a912a23          	sw	s1,180(sp)
80005304:	0b212823          	sw	s2,176(sp)
80005308:	0b312623          	sw	s3,172(sp)
8000530c:	0b412423          	sw	s4,168(sp)
80005310:	0b612023          	sw	s6,160(sp)
80005314:	09812c23          	sw	s8,152(sp)
80005318:	09912a23          	sw	s9,148(sp)
8000531c:	09a12823          	sw	s10,144(sp)
80005320:	09b12623          	sw	s11,140(sp)
80005324:	998fe0ef          	jal	800034bc <uart_init>
80005328:	a00007b7          	lui	a5,0xa0000
8000532c:	76878793          	add	a5,a5,1896 # a0000768 <__clz_tab+0x6f0>
80005330:	a0000737          	lui	a4,0xa0000
80005334:	78870713          	add	a4,a4,1928 # a0000788 <__clz_tab+0x710>
80005338:	0007a283          	lw	t0,0(a5)
8000533c:	0047af83          	lw	t6,4(a5)
80005340:	0087af03          	lw	t5,8(a5)
80005344:	00c7ae83          	lw	t4,12(a5)
80005348:	0107ae03          	lw	t3,16(a5)
8000534c:	0147a303          	lw	t1,20(a5)
80005350:	0187a883          	lw	a7,24(a5)
80005354:	01c7d803          	lhu	a6,28(a5)
80005358:	01e7c583          	lbu	a1,30(a5)
8000535c:	a00016b7          	lui	a3,0xa0001
80005360:	a00017b7          	lui	a5,0xa0001
80005364:	aa878793          	add	a5,a5,-1368 # a0000aa8 <Ptr_Glob_inst>
80005368:	00072603          	lw	a2,0(a4)
8000536c:	a00013b7          	lui	t2,0xa0001
80005370:	ad868693          	add	a3,a3,-1320 # a0000ad8 <Next_Ptr_Glob_inst>
80005374:	a8d3ae23          	sw	a3,-1380(t2) # a0000a9c <Next_Ptr_Glob>
80005378:	00472503          	lw	a0,4(a4)
8000537c:	00d7a023          	sw	a3,0(a5)
80005380:	00200693          	li	a3,2
80005384:	00d7a423          	sw	a3,8(a5)
80005388:	a0001ab7          	lui	s5,0xa0001
8000538c:	02800693          	li	a3,40
80005390:	0057a823          	sw	t0,16(a5)
80005394:	01f7aa23          	sw	t6,20(a5)
80005398:	01e7ac23          	sw	t5,24(a5)
8000539c:	01d7ae23          	sw	t4,28(a5)
800053a0:	03c7a023          	sw	t3,32(a5)
800053a4:	00d7a623          	sw	a3,12(a5)
800053a8:	0267a223          	sw	t1,36(a5)
800053ac:	0317a423          	sw	a7,40(a5)
800053b0:	03079623          	sh	a6,44(a5)
800053b4:	02b78723          	sb	a1,46(a5)
800053b8:	aafaa023          	sw	a5,-1376(s5) # a0000aa0 <Ptr_Glob>
800053bc:	0007a223          	sw	zero,4(a5)
800053c0:	04c12023          	sw	a2,64(sp)
800053c4:	00872303          	lw	t1,8(a4)
800053c8:	00c72883          	lw	a7,12(a4)
800053cc:	01072803          	lw	a6,16(a4)
800053d0:	01472583          	lw	a1,20(a4)
800053d4:	01872603          	lw	a2,24(a4)
800053d8:	04a12223          	sw	a0,68(sp)
800053dc:	01e74783          	lbu	a5,30(a4)
800053e0:	01c75683          	lhu	a3,28(a4)
800053e4:	a0000437          	lui	s0,0xa0000
800053e8:	a0001bb7          	lui	s7,0xa0001
800053ec:	b08b8713          	add	a4,s7,-1272 # a0000b08 <Arr_2_Glob>
800053f0:	04f10f23          	sb	a5,94(sp)
800053f4:	19040513          	add	a0,s0,400 # a0000190 <__clz_tab+0x118>
800053f8:	00a00793          	li	a5,10
800053fc:	64f72e23          	sw	a5,1628(a4)
80005400:	04612423          	sw	t1,72(sp)
80005404:	05112623          	sw	a7,76(sp)
80005408:	05012823          	sw	a6,80(sp)
8000540c:	04b12a23          	sw	a1,84(sp)
80005410:	04c12c23          	sw	a2,88(sp)
80005414:	04d11e23          	sh	a3,92(sp)
80005418:	cddff0ef          	jal	800050f4 <printf_>
8000541c:	a0000537          	lui	a0,0xa0000
80005420:	19450513          	add	a0,a0,404 # a0000194 <__clz_tab+0x11c>
80005424:	cd1ff0ef          	jal	800050f4 <printf_>
80005428:	19040513          	add	a0,s0,400
8000542c:	cc9ff0ef          	jal	800050f4 <printf_>
80005430:	a00017b7          	lui	a5,0xa0001
80005434:	a8c7a783          	lw	a5,-1396(a5) # a0000a8c <Reg>
80005438:	76078c63          	beqz	a5,80005bb0 <main+0x8d0>
8000543c:	a0000537          	lui	a0,0xa0000
80005440:	1c450513          	add	a0,a0,452 # a00001c4 <__clz_tab+0x14c>
80005444:	cb1ff0ef          	jal	800050f4 <printf_>
80005448:	19040513          	add	a0,s0,400
8000544c:	ca9ff0ef          	jal	800050f4 <printf_>
80005450:	a0000537          	lui	a0,0xa0000
80005454:	3e800593          	li	a1,1000
80005458:	22050513          	add	a0,a0,544 # a0000220 <__clz_tab+0x1a8>
8000545c:	c99ff0ef          	jal	800050f4 <printf_>
80005460:	b00027f3          	csrr	a5,mcycle
80005464:	02f12423          	sw	a5,40(sp)
80005468:	b80027f3          	csrr	a5,mcycleh
8000546c:	02f12623          	sw	a5,44(sp)
80005470:	c02027f3          	rdinstret	a5
80005474:	02f12223          	sw	a5,36(sp)
80005478:	c03027f3          	csrr	a5,hpmcounter3
8000547c:	02f12023          	sw	a5,32(sp)
80005480:	a00007b7          	lui	a5,0xa0000
80005484:	7a878793          	add	a5,a5,1960 # a00007a8 <__clz_tab+0x730>
80005488:	0047a703          	lw	a4,4(a5)
8000548c:	0007ad83          	lw	s11,0(a5)
80005490:	a0000837          	lui	a6,0xa0000
80005494:	00e12023          	sw	a4,0(sp)
80005498:	0087a703          	lw	a4,8(a5)
8000549c:	00100493          	li	s1,1
800054a0:	a0001937          	lui	s2,0xa0001
800054a4:	00e12223          	sw	a4,4(sp)
800054a8:	00c7a703          	lw	a4,12(a5)
800054ac:	a00019b7          	lui	s3,0xa0001
800054b0:	a0001437          	lui	s0,0xa0001
800054b4:	00e12423          	sw	a4,8(sp)
800054b8:	0107a703          	lw	a4,16(a5)
800054bc:	a0003b37          	lui	s6,0xa0003
800054c0:	a0001a37          	lui	s4,0xa0001
800054c4:	00e12623          	sw	a4,12(sp)
800054c8:	0147a703          	lw	a4,20(a5)
800054cc:	7c880c13          	add	s8,a6,1992 # a00007c8 <__clz_tab+0x750>
800054d0:	00e12823          	sw	a4,16(sp)
800054d4:	0187a703          	lw	a4,24(a5)
800054d8:	00e12a23          	sw	a4,20(sp)
800054dc:	01c7d703          	lhu	a4,28(a5)
800054e0:	01e7c783          	lbu	a5,30(a5)
800054e4:	00e12c23          	sw	a4,24(sp)
800054e8:	00f12e23          	sw	a5,28(sp)
800054ec:	04100713          	li	a4,65
800054f0:	a8e908a3          	sb	a4,-1391(s2) # a0000a91 <Ch_1_Glob>
800054f4:	04200713          	li	a4,66
800054f8:	a8e40823          	sb	a4,-1392(s0) # a0000a90 <Ch_2_Glob>
800054fc:	00012703          	lw	a4,0(sp)
80005500:	00100793          	li	a5,1
80005504:	06010593          	add	a1,sp,96
80005508:	06e12223          	sw	a4,100(sp)
8000550c:	00412703          	lw	a4,4(sp)
80005510:	04010513          	add	a0,sp,64
80005514:	a8f9aa23          	sw	a5,-1388(s3) # a0000a94 <Bool_Glob>
80005518:	06e12423          	sw	a4,104(sp)
8000551c:	00812703          	lw	a4,8(sp)
80005520:	02f12e23          	sw	a5,60(sp)
80005524:	07b12023          	sw	s11,96(sp)
80005528:	06e12623          	sw	a4,108(sp)
8000552c:	00c12703          	lw	a4,12(sp)
80005530:	06e12823          	sw	a4,112(sp)
80005534:	01012703          	lw	a4,16(sp)
80005538:	06e12a23          	sw	a4,116(sp)
8000553c:	01412703          	lw	a4,20(sp)
80005540:	06e12c23          	sw	a4,120(sp)
80005544:	01812703          	lw	a4,24(sp)
80005548:	06e11e23          	sh	a4,124(sp)
8000554c:	01c12703          	lw	a4,28(sp)
80005550:	06e10f23          	sb	a4,126(sp)
80005554:	768000ef          	jal	80005cbc <Func_2>
80005558:	00153793          	seqz	a5,a0
8000555c:	03810613          	add	a2,sp,56
80005560:	00300593          	li	a1,3
80005564:	a8f9aa23          	sw	a5,-1388(s3)
80005568:	00200513          	li	a0,2
8000556c:	00700793          	li	a5,7
80005570:	02f12c23          	sw	a5,56(sp)
80005574:	6ac000ef          	jal	80005c20 <Proc_7>
80005578:	03812683          	lw	a3,56(sp)
8000557c:	00300613          	li	a2,3
80005580:	b08b8593          	add	a1,s7,-1272
80005584:	218b0513          	add	a0,s6,536 # a0003218 <Arr_1_Glob>
80005588:	6a8000ef          	jal	80005c30 <Proc_8>
8000558c:	aa0aa503          	lw	a0,-1376(s5)
80005590:	bd9ff0ef          	jal	80005168 <Proc_1>
80005594:	a9044703          	lbu	a4,-1392(s0)
80005598:	04000793          	li	a5,64
8000559c:	60e7f663          	bgeu	a5,a4,80005ba8 <main+0x8c8>
800055a0:	04100d13          	li	s10,65
800055a4:	00300c93          	li	s9,3
800055a8:	0140006f          	j	800055bc <main+0x2dc>
800055ac:	a9044783          	lbu	a5,-1392(s0)
800055b0:	001d0d13          	add	s10,s10,1
800055b4:	0ffd7d13          	zext.b	s10,s10
800055b8:	09a7e263          	bltu	a5,s10,8000563c <main+0x35c>
800055bc:	04300593          	li	a1,67
800055c0:	000d0513          	mv	a0,s10
800055c4:	6d4000ef          	jal	80005c98 <Func_1>
800055c8:	03c12783          	lw	a5,60(sp)
800055cc:	fef510e3          	bne	a0,a5,800055ac <main+0x2cc>
800055d0:	03c10593          	add	a1,sp,60
800055d4:	00000513          	li	a0,0
800055d8:	5f4000ef          	jal	80005bcc <Proc_6>
800055dc:	01ec4783          	lbu	a5,30(s8)
800055e0:	000c2303          	lw	t1,0(s8)
800055e4:	004c2883          	lw	a7,4(s8)
800055e8:	008c2803          	lw	a6,8(s8)
800055ec:	00cc2503          	lw	a0,12(s8)
800055f0:	010c2583          	lw	a1,16(s8)
800055f4:	014c2603          	lw	a2,20(s8)
800055f8:	018c2683          	lw	a3,24(s8)
800055fc:	01cc5703          	lhu	a4,28(s8)
80005600:	06f10f23          	sb	a5,126(sp)
80005604:	a9044783          	lbu	a5,-1392(s0)
80005608:	001d0d13          	add	s10,s10,1
8000560c:	06612023          	sw	t1,96(sp)
80005610:	07112223          	sw	a7,100(sp)
80005614:	07012423          	sw	a6,104(sp)
80005618:	06a12623          	sw	a0,108(sp)
8000561c:	06b12823          	sw	a1,112(sp)
80005620:	06c12a23          	sw	a2,116(sp)
80005624:	06d12c23          	sw	a3,120(sp)
80005628:	06e11e23          	sh	a4,124(sp)
8000562c:	a89a2c23          	sw	s1,-1384(s4) # a0000a98 <Int_Glob>
80005630:	0ffd7d13          	zext.b	s10,s10
80005634:	00048c93          	mv	s9,s1
80005638:	f9a7f2e3          	bgeu	a5,s10,800055bc <main+0x2dc>
8000563c:	001c9793          	sll	a5,s9,0x1
80005640:	019787b3          	add	a5,a5,s9
80005644:	03812303          	lw	t1,56(sp)
80005648:	a9194603          	lbu	a2,-1391(s2)
8000564c:	04100693          	li	a3,65
80005650:	0267c8b3          	div	a7,a5,t1
80005654:	00088713          	mv	a4,a7
80005658:	00d61863          	bne	a2,a3,80005668 <main+0x388>
8000565c:	a98a2683          	lw	a3,-1384(s4)
80005660:	00988713          	add	a4,a7,9
80005664:	40d70733          	sub	a4,a4,a3
80005668:	00148493          	add	s1,s1,1
8000566c:	3e900693          	li	a3,1001
80005670:	e6d49ee3          	bne	s1,a3,800054ec <main+0x20c>
80005674:	00612623          	sw	t1,12(sp)
80005678:	01112423          	sw	a7,8(sp)
8000567c:	00e12223          	sw	a4,4(sp)
80005680:	00f12023          	sw	a5,0(sp)
80005684:	c0202cf3          	rdinstret	s9
80005688:	b00024f3          	csrr	s1,mcycle
8000568c:	b8002c73          	csrr	s8,mcycleh
80005690:	c0302bf3          	csrr	s7,hpmcounter3
80005694:	a0000537          	lui	a0,0xa0000
80005698:	25050513          	add	a0,a0,592 # a0000250 <__clz_tab+0x1d8>
8000569c:	a59ff0ef          	jal	800050f4 <printf_>
800056a0:	a0000d37          	lui	s10,0xa0000
800056a4:	190d0513          	add	a0,s10,400 # a0000190 <__clz_tab+0x118>
800056a8:	a4dff0ef          	jal	800050f4 <printf_>
800056ac:	a0000537          	lui	a0,0xa0000
800056b0:	26050513          	add	a0,a0,608 # a0000260 <__clz_tab+0x1e8>
800056b4:	a41ff0ef          	jal	800050f4 <printf_>
800056b8:	190d0513          	add	a0,s10,400
800056bc:	a39ff0ef          	jal	800050f4 <printf_>
800056c0:	a98a2583          	lw	a1,-1384(s4)
800056c4:	a0000537          	lui	a0,0xa0000
800056c8:	29850513          	add	a0,a0,664 # a0000298 <__clz_tab+0x220>
800056cc:	a0000a37          	lui	s4,0xa0000
800056d0:	a25ff0ef          	jal	800050f4 <printf_>
800056d4:	00500593          	li	a1,5
800056d8:	2b4a0513          	add	a0,s4,692 # a00002b4 <__clz_tab+0x23c>
800056dc:	a19ff0ef          	jal	800050f4 <printf_>
800056e0:	a949a583          	lw	a1,-1388(s3)
800056e4:	a0000537          	lui	a0,0xa0000
800056e8:	2d050513          	add	a0,a0,720 # a00002d0 <__clz_tab+0x258>
800056ec:	a09ff0ef          	jal	800050f4 <printf_>
800056f0:	00100593          	li	a1,1
800056f4:	2b4a0513          	add	a0,s4,692
800056f8:	9fdff0ef          	jal	800050f4 <printf_>
800056fc:	a9194583          	lbu	a1,-1391(s2)
80005700:	a0000537          	lui	a0,0xa0000
80005704:	2ec50513          	add	a0,a0,748 # a00002ec <__clz_tab+0x274>
80005708:	9edff0ef          	jal	800050f4 <printf_>
8000570c:	a0000937          	lui	s2,0xa0000
80005710:	04100593          	li	a1,65
80005714:	30890513          	add	a0,s2,776 # a0000308 <__clz_tab+0x290>
80005718:	9ddff0ef          	jal	800050f4 <printf_>
8000571c:	a9044583          	lbu	a1,-1392(s0)
80005720:	a0000537          	lui	a0,0xa0000
80005724:	32450513          	add	a0,a0,804 # a0000324 <__clz_tab+0x2ac>
80005728:	9cdff0ef          	jal	800050f4 <printf_>
8000572c:	04200593          	li	a1,66
80005730:	30890513          	add	a0,s2,776
80005734:	9c1ff0ef          	jal	800050f4 <printf_>
80005738:	218b0b13          	add	s6,s6,536
8000573c:	020b2583          	lw	a1,32(s6)
80005740:	a0000537          	lui	a0,0xa0000
80005744:	34050513          	add	a0,a0,832 # a0000340 <__clz_tab+0x2c8>
80005748:	9adff0ef          	jal	800050f4 <printf_>
8000574c:	00700593          	li	a1,7
80005750:	2b4a0513          	add	a0,s4,692
80005754:	9a1ff0ef          	jal	800050f4 <printf_>
80005758:	a00017b7          	lui	a5,0xa0001
8000575c:	b0878793          	add	a5,a5,-1272 # a0000b08 <Arr_2_Glob>
80005760:	65c7a583          	lw	a1,1628(a5)
80005764:	a0000537          	lui	a0,0xa0000
80005768:	35c50513          	add	a0,a0,860 # a000035c <__clz_tab+0x2e4>
8000576c:	989ff0ef          	jal	800050f4 <printf_>
80005770:	a0000537          	lui	a0,0xa0000
80005774:	37850513          	add	a0,a0,888 # a0000378 <__clz_tab+0x300>
80005778:	97dff0ef          	jal	800050f4 <printf_>
8000577c:	a0000537          	lui	a0,0xa0000
80005780:	3a450513          	add	a0,a0,932 # a00003a4 <__clz_tab+0x32c>
80005784:	971ff0ef          	jal	800050f4 <printf_>
80005788:	aa0aa683          	lw	a3,-1376(s5)
8000578c:	a0000db7          	lui	s11,0xa0000
80005790:	3b0d8513          	add	a0,s11,944 # a00003b0 <__clz_tab+0x338>
80005794:	0006a583          	lw	a1,0(a3)
80005798:	a0000d37          	lui	s10,0xa0000
8000579c:	a0000b37          	lui	s6,0xa0000
800057a0:	955ff0ef          	jal	800050f4 <printf_>
800057a4:	a0000537          	lui	a0,0xa0000
800057a8:	3cc50513          	add	a0,a0,972 # a00003cc <__clz_tab+0x354>
800057ac:	949ff0ef          	jal	800050f4 <printf_>
800057b0:	aa0aa683          	lw	a3,-1376(s5)
800057b4:	400d0513          	add	a0,s10,1024 # a0000400 <__clz_tab+0x388>
800057b8:	a00009b7          	lui	s3,0xa0000
800057bc:	0046a583          	lw	a1,4(a3)
800057c0:	a0000937          	lui	s2,0xa0000
800057c4:	a0000437          	lui	s0,0xa0000
800057c8:	92dff0ef          	jal	800050f4 <printf_>
800057cc:	00000593          	li	a1,0
800057d0:	2b4a0513          	add	a0,s4,692
800057d4:	921ff0ef          	jal	800050f4 <printf_>
800057d8:	aa0aa683          	lw	a3,-1376(s5)
800057dc:	41cb0513          	add	a0,s6,1052 # a000041c <__clz_tab+0x3a4>
800057e0:	0086a583          	lw	a1,8(a3)
800057e4:	911ff0ef          	jal	800050f4 <printf_>
800057e8:	00200593          	li	a1,2
800057ec:	2b4a0513          	add	a0,s4,692
800057f0:	905ff0ef          	jal	800050f4 <printf_>
800057f4:	aa0aa683          	lw	a3,-1376(s5)
800057f8:	43898513          	add	a0,s3,1080 # a0000438 <__clz_tab+0x3c0>
800057fc:	00c6a583          	lw	a1,12(a3)
80005800:	8f5ff0ef          	jal	800050f4 <printf_>
80005804:	01100593          	li	a1,17
80005808:	2b4a0513          	add	a0,s4,692
8000580c:	8e9ff0ef          	jal	800050f4 <printf_>
80005810:	aa0aa583          	lw	a1,-1376(s5)
80005814:	45490513          	add	a0,s2,1108 # a0000454 <__clz_tab+0x3dc>
80005818:	a0001ab7          	lui	s5,0xa0001
8000581c:	01058593          	add	a1,a1,16 # c0001010 <__stack_base+0x1010>
80005820:	8d5ff0ef          	jal	800050f4 <printf_>
80005824:	47040513          	add	a0,s0,1136 # a0000470 <__clz_tab+0x3f8>
80005828:	8cdff0ef          	jal	800050f4 <printf_>
8000582c:	a0000537          	lui	a0,0xa0000
80005830:	4a850513          	add	a0,a0,1192 # a00004a8 <__clz_tab+0x430>
80005834:	8c1ff0ef          	jal	800050f4 <printf_>
80005838:	a9caa683          	lw	a3,-1380(s5) # a0000a9c <Next_Ptr_Glob>
8000583c:	3b0d8513          	add	a0,s11,944
80005840:	0006a583          	lw	a1,0(a3)
80005844:	8b1ff0ef          	jal	800050f4 <printf_>
80005848:	a0000537          	lui	a0,0xa0000
8000584c:	4bc50513          	add	a0,a0,1212 # a00004bc <__clz_tab+0x444>
80005850:	8a5ff0ef          	jal	800050f4 <printf_>
80005854:	a9caa683          	lw	a3,-1380(s5)
80005858:	400d0513          	add	a0,s10,1024
8000585c:	a0000d37          	lui	s10,0xa0000
80005860:	0046a583          	lw	a1,4(a3)
80005864:	891ff0ef          	jal	800050f4 <printf_>
80005868:	00000593          	li	a1,0
8000586c:	2b4a0513          	add	a0,s4,692
80005870:	885ff0ef          	jal	800050f4 <printf_>
80005874:	a9caa683          	lw	a3,-1380(s5)
80005878:	41cb0513          	add	a0,s6,1052
8000587c:	0086a583          	lw	a1,8(a3)
80005880:	875ff0ef          	jal	800050f4 <printf_>
80005884:	00100593          	li	a1,1
80005888:	2b4a0513          	add	a0,s4,692
8000588c:	869ff0ef          	jal	800050f4 <printf_>
80005890:	a9caa683          	lw	a3,-1380(s5)
80005894:	43898513          	add	a0,s3,1080
80005898:	00c6a583          	lw	a1,12(a3)
8000589c:	859ff0ef          	jal	800050f4 <printf_>
800058a0:	01200593          	li	a1,18
800058a4:	2b4a0513          	add	a0,s4,692
800058a8:	84dff0ef          	jal	800050f4 <printf_>
800058ac:	a9caa583          	lw	a1,-1380(s5)
800058b0:	45490513          	add	a0,s2,1108
800058b4:	000d0a93          	mv	s5,s10
800058b8:	01058593          	add	a1,a1,16
800058bc:	839ff0ef          	jal	800050f4 <printf_>
800058c0:	47040513          	add	a0,s0,1136
800058c4:	831ff0ef          	jal	800050f4 <printf_>
800058c8:	00412703          	lw	a4,4(sp)
800058cc:	a0000537          	lui	a0,0xa0000
800058d0:	4fc50513          	add	a0,a0,1276 # a00004fc <__clz_tab+0x484>
800058d4:	00070593          	mv	a1,a4
800058d8:	81dff0ef          	jal	800050f4 <printf_>
800058dc:	00500593          	li	a1,5
800058e0:	2b4a0513          	add	a0,s4,692
800058e4:	811ff0ef          	jal	800050f4 <printf_>
800058e8:	00c12303          	lw	t1,12(sp)
800058ec:	00012783          	lw	a5,0(sp)
800058f0:	00812883          	lw	a7,8(sp)
800058f4:	a0000537          	lui	a0,0xa0000
800058f8:	406787b3          	sub	a5,a5,t1
800058fc:	00379593          	sll	a1,a5,0x3
80005900:	40f585b3          	sub	a1,a1,a5
80005904:	411585b3          	sub	a1,a1,a7
80005908:	51850513          	add	a0,a0,1304 # a0000518 <__clz_tab+0x4a0>
8000590c:	fe8ff0ef          	jal	800050f4 <printf_>
80005910:	00d00593          	li	a1,13
80005914:	2b4a0513          	add	a0,s4,692
80005918:	fdcff0ef          	jal	800050f4 <printf_>
8000591c:	03812583          	lw	a1,56(sp)
80005920:	a0000537          	lui	a0,0xa0000
80005924:	53450513          	add	a0,a0,1332 # a0000534 <__clz_tab+0x4bc>
80005928:	fccff0ef          	jal	800050f4 <printf_>
8000592c:	00700593          	li	a1,7
80005930:	2b4a0513          	add	a0,s4,692
80005934:	fc0ff0ef          	jal	800050f4 <printf_>
80005938:	03c12583          	lw	a1,60(sp)
8000593c:	a0000537          	lui	a0,0xa0000
80005940:	55050513          	add	a0,a0,1360 # a0000550 <__clz_tab+0x4d8>
80005944:	fb0ff0ef          	jal	800050f4 <printf_>
80005948:	00100593          	li	a1,1
8000594c:	2b4a0513          	add	a0,s4,692
80005950:	fa4ff0ef          	jal	800050f4 <printf_>
80005954:	a0000537          	lui	a0,0xa0000
80005958:	04010593          	add	a1,sp,64
8000595c:	56c50513          	add	a0,a0,1388 # a000056c <__clz_tab+0x4f4>
80005960:	f94ff0ef          	jal	800050f4 <printf_>
80005964:	a0000537          	lui	a0,0xa0000
80005968:	58850513          	add	a0,a0,1416 # a0000588 <__clz_tab+0x510>
8000596c:	f88ff0ef          	jal	800050f4 <printf_>
80005970:	a0000537          	lui	a0,0xa0000
80005974:	06010593          	add	a1,sp,96
80005978:	5c050513          	add	a0,a0,1472 # a00005c0 <__clz_tab+0x548>
8000597c:	f78ff0ef          	jal	800050f4 <printf_>
80005980:	a0000537          	lui	a0,0xa0000
80005984:	5dc50513          	add	a0,a0,1500 # a00005dc <__clz_tab+0x564>
80005988:	f6cff0ef          	jal	800050f4 <printf_>
8000598c:	190d0513          	add	a0,s10,400 # a0000190 <__clz_tab+0x118>
80005990:	f64ff0ef          	jal	800050f4 <printf_>
80005994:	02412703          	lw	a4,36(sp)
80005998:	02812b03          	lw	s6,40(sp)
8000599c:	02c12d03          	lw	s10,44(sp)
800059a0:	40ec89b3          	sub	s3,s9,a4
800059a4:	41648933          	sub	s2,s1,s6
800059a8:	a0000537          	lui	a0,0xa0000
800059ac:	00070593          	mv	a1,a4
800059b0:	0124b7b3          	sltu	a5,s1,s2
800059b4:	00098693          	mv	a3,s3
800059b8:	41ac0433          	sub	s0,s8,s10
800059bc:	000c8613          	mv	a2,s9
800059c0:	61450513          	add	a0,a0,1556 # a0000614 <__clz_tab+0x59c>
800059c4:	40f40433          	sub	s0,s0,a5
800059c8:	02012c83          	lw	s9,32(sp)
800059cc:	f28ff0ef          	jal	800050f4 <printf_>
800059d0:	a0000537          	lui	a0,0xa0000
800059d4:	000b0613          	mv	a2,s6
800059d8:	000d0593          	mv	a1,s10
800059dc:	64450513          	add	a0,a0,1604 # a0000644 <__clz_tab+0x5cc>
800059e0:	f14ff0ef          	jal	800050f4 <printf_>
800059e4:	a0000537          	lui	a0,0xa0000
800059e8:	00048613          	mv	a2,s1
800059ec:	000c0593          	mv	a1,s8
800059f0:	66850513          	add	a0,a0,1640 # a0000668 <__clz_tab+0x5f0>
800059f4:	f00ff0ef          	jal	800050f4 <printf_>
800059f8:	a0000537          	lui	a0,0xa0000
800059fc:	00090613          	mv	a2,s2
80005a00:	00040593          	mv	a1,s0
80005a04:	68850513          	add	a0,a0,1672 # a0000688 <__clz_tab+0x610>
80005a08:	eecff0ef          	jal	800050f4 <printf_>
80005a0c:	00098513          	mv	a0,s3
80005a10:	f00fd0ef          	jal	80003110 <__floatunsisf>
80005a14:	00050493          	mv	s1,a0
80005a18:	00040593          	mv	a1,s0
80005a1c:	00090513          	mv	a0,s2
80005a20:	fccfd0ef          	jal	800031ec <__floatundisf>
80005a24:	00050993          	mv	s3,a0
80005a28:	00050593          	mv	a1,a0
80005a2c:	00048513          	mv	a0,s1
80005a30:	898fd0ef          	jal	80002ac8 <__divsf3>
80005a34:	8f1fd0ef          	jal	80003324 <__extendsfdf2>
80005a38:	00050613          	mv	a2,a0
80005a3c:	a0000537          	lui	a0,0xa0000
80005a40:	00058693          	mv	a3,a1
80005a44:	6a850513          	add	a0,a0,1704 # a00006a8 <__clz_tab+0x630>
80005a48:	eacff0ef          	jal	800050f4 <printf_>
80005a4c:	a00017b7          	lui	a5,0xa0001
80005a50:	a787a503          	lw	a0,-1416(a5) # a0000a78 <pow10.0+0xf0>
80005a54:	00098593          	mv	a1,s3
80005a58:	a00019b7          	lui	s3,0xa0001
80005a5c:	86cfd0ef          	jal	80002ac8 <__divsf3>
80005a60:	a00017b7          	lui	a5,0xa0001
80005a64:	a7c7a583          	lw	a1,-1412(a5) # a0000a7c <pow10.0+0xf4>
80005a68:	419b8a33          	sub	s4,s7,s9
80005a6c:	b88fd0ef          	jal	80002df4 <__mulsf3>
80005a70:	a00017b7          	lui	a5,0xa0001
80005a74:	a807a583          	lw	a1,-1408(a5) # a0000a80 <pow10.0+0xf8>
80005a78:	850fd0ef          	jal	80002ac8 <__divsf3>
80005a7c:	8a9fd0ef          	jal	80003324 <__extendsfdf2>
80005a80:	00050613          	mv	a2,a0
80005a84:	a0000537          	lui	a0,0xa0000
80005a88:	00058693          	mv	a3,a1
80005a8c:	6b450513          	add	a0,a0,1716 # a00006b4 <__clz_tab+0x63c>
80005a90:	e64ff0ef          	jal	800050f4 <printf_>
80005a94:	00018637          	lui	a2,0x18
80005a98:	6a060613          	add	a2,a2,1696 # 186a0 <__stack_size+0x146a0>
80005a9c:	00000693          	li	a3,0
80005aa0:	00090513          	mv	a0,s2
80005aa4:	00040593          	mv	a1,s0
80005aa8:	f9cfa0ef          	jal	80000244 <__udivdi3>
80005aac:	00050793          	mv	a5,a0
80005ab0:	05f5e537          	lui	a0,0x5f5e
80005ab4:	00090613          	mv	a2,s2
80005ab8:	00040693          	mv	a3,s0
80005abc:	10050513          	add	a0,a0,256 # 5f5e100 <__stack_size+0x5f5a100>
80005ac0:	00000593          	li	a1,0
80005ac4:	a8f9a423          	sw	a5,-1400(s3) # a0000a88 <Microseconds>
80005ac8:	f7cfa0ef          	jal	80000244 <__udivdi3>
80005acc:	3e800793          	li	a5,1000
80005ad0:	02a787b3          	mul	a5,a5,a0
80005ad4:	a0000537          	lui	a0,0xa0000
80005ad8:	000a0693          	mv	a3,s4
80005adc:	000b8613          	mv	a2,s7
80005ae0:	000c8593          	mv	a1,s9
80005ae4:	a0001937          	lui	s2,0xa0001
80005ae8:	6c450513          	add	a0,a0,1732 # a00006c4 <__clz_tab+0x64c>
80005aec:	a0000437          	lui	s0,0xa0000
80005af0:	a8f92223          	sw	a5,-1404(s2) # a0000a84 <Dhrystones_Per_Second>
80005af4:	e00ff0ef          	jal	800050f4 <printf_>
80005af8:	000a0513          	mv	a0,s4
80005afc:	e14fd0ef          	jal	80003110 <__floatunsisf>
80005b00:	00048593          	mv	a1,s1
80005b04:	fc5fc0ef          	jal	80002ac8 <__divsf3>
80005b08:	81dfd0ef          	jal	80003324 <__extendsfdf2>
80005b0c:	a00017b7          	lui	a5,0xa0001
80005b10:	a707a603          	lw	a2,-1424(a5) # a0000a70 <pow10.0+0xe8>
80005b14:	a747a683          	lw	a3,-1420(a5)
80005b18:	ff5fb0ef          	jal	80001b0c <__muldf3>
80005b1c:	00050613          	mv	a2,a0
80005b20:	a0000537          	lui	a0,0xa0000
80005b24:	00058693          	mv	a3,a1
80005b28:	6f450513          	add	a0,a0,1780 # a00006f4 <__clz_tab+0x67c>
80005b2c:	dc8ff0ef          	jal	800050f4 <printf_>
80005b30:	a0000537          	lui	a0,0xa0000
80005b34:	70050513          	add	a0,a0,1792 # a0000700 <__clz_tab+0x688>
80005b38:	dbcff0ef          	jal	800050f4 <printf_>
80005b3c:	a889a583          	lw	a1,-1400(s3)
80005b40:	73040513          	add	a0,s0,1840 # a0000730 <__clz_tab+0x6b8>
80005b44:	db0ff0ef          	jal	800050f4 <printf_>
80005b48:	a0000537          	lui	a0,0xa0000
80005b4c:	73850513          	add	a0,a0,1848 # a0000738 <__clz_tab+0x6c0>
80005b50:	da4ff0ef          	jal	800050f4 <printf_>
80005b54:	a8492583          	lw	a1,-1404(s2)
80005b58:	73040513          	add	a0,s0,1840
80005b5c:	d98ff0ef          	jal	800050f4 <printf_>
80005b60:	190a8513          	add	a0,s5,400
80005b64:	d90ff0ef          	jal	800050f4 <printf_>
80005b68:	0bc12083          	lw	ra,188(sp)
80005b6c:	0b812403          	lw	s0,184(sp)
80005b70:	0b412483          	lw	s1,180(sp)
80005b74:	0b012903          	lw	s2,176(sp)
80005b78:	0ac12983          	lw	s3,172(sp)
80005b7c:	0a812a03          	lw	s4,168(sp)
80005b80:	0a412a83          	lw	s5,164(sp)
80005b84:	0a012b03          	lw	s6,160(sp)
80005b88:	09c12b83          	lw	s7,156(sp)
80005b8c:	09812c03          	lw	s8,152(sp)
80005b90:	09412c83          	lw	s9,148(sp)
80005b94:	09012d03          	lw	s10,144(sp)
80005b98:	08c12d83          	lw	s11,140(sp)
80005b9c:	00000513          	li	a0,0
80005ba0:	0c010113          	add	sp,sp,192
80005ba4:	00008067          	ret
80005ba8:	00900793          	li	a5,9
80005bac:	a99ff06f          	j	80005644 <main+0x364>
80005bb0:	a0000537          	lui	a0,0xa0000
80005bb4:	1f050513          	add	a0,a0,496 # a00001f0 <__clz_tab+0x178>
80005bb8:	d3cff0ef          	jal	800050f4 <printf_>
80005bbc:	a00007b7          	lui	a5,0xa0000
80005bc0:	19078513          	add	a0,a5,400 # a0000190 <__clz_tab+0x118>
80005bc4:	d30ff0ef          	jal	800050f4 <printf_>
80005bc8:	889ff06f          	j	80005450 <main+0x170>

80005bcc <Proc_6>:
80005bcc:	00200793          	li	a5,2
80005bd0:	02f50e63          	beq	a0,a5,80005c0c <Proc_6+0x40>
80005bd4:	00300713          	li	a4,3
80005bd8:	00e5a023          	sw	a4,0(a1)
80005bdc:	00100713          	li	a4,1
80005be0:	00e50a63          	beq	a0,a4,80005bf4 <Proc_6+0x28>
80005be4:	00400713          	li	a4,4
80005be8:	02e50863          	beq	a0,a4,80005c18 <Proc_6+0x4c>
80005bec:	00050c63          	beqz	a0,80005c04 <Proc_6+0x38>
80005bf0:	00008067          	ret
80005bf4:	a00017b7          	lui	a5,0xa0001
80005bf8:	a987a703          	lw	a4,-1384(a5) # a0000a98 <Int_Glob>
80005bfc:	06400793          	li	a5,100
80005c00:	fee7d8e3          	bge	a5,a4,80005bf0 <Proc_6+0x24>
80005c04:	0005a023          	sw	zero,0(a1)
80005c08:	00008067          	ret
80005c0c:	00100793          	li	a5,1
80005c10:	00f5a023          	sw	a5,0(a1)
80005c14:	00008067          	ret
80005c18:	00f5a023          	sw	a5,0(a1)
80005c1c:	00008067          	ret

80005c20 <Proc_7>:
80005c20:	00250513          	add	a0,a0,2
80005c24:	00b505b3          	add	a1,a0,a1
80005c28:	00b62023          	sw	a1,0(a2)
80005c2c:	00008067          	ret

80005c30 <Proc_8>:
80005c30:	00560713          	add	a4,a2,5
80005c34:	0c800813          	li	a6,200
80005c38:	03070833          	mul	a6,a4,a6
80005c3c:	00261613          	sll	a2,a2,0x2
80005c40:	00271793          	sll	a5,a4,0x2
80005c44:	00f50533          	add	a0,a0,a5
80005c48:	00d52023          	sw	a3,0(a0)
80005c4c:	06e52c23          	sw	a4,120(a0)
80005c50:	00d52223          	sw	a3,4(a0)
80005c54:	00c807b3          	add	a5,a6,a2
80005c58:	00f587b3          	add	a5,a1,a5
80005c5c:	0107a683          	lw	a3,16(a5)
80005c60:	00e7aa23          	sw	a4,20(a5)
80005c64:	00e7ac23          	sw	a4,24(a5)
80005c68:	00168713          	add	a4,a3,1
80005c6c:	00e7a823          	sw	a4,16(a5)
80005c70:	00052703          	lw	a4,0(a0)
80005c74:	010585b3          	add	a1,a1,a6
80005c78:	00c585b3          	add	a1,a1,a2
80005c7c:	000017b7          	lui	a5,0x1
80005c80:	00b787b3          	add	a5,a5,a1
80005c84:	fae7aa23          	sw	a4,-76(a5) # fb4 <__stack_size-0x304c>
80005c88:	a00017b7          	lui	a5,0xa0001
80005c8c:	00500713          	li	a4,5
80005c90:	a8e7ac23          	sw	a4,-1384(a5) # a0000a98 <Int_Glob>
80005c94:	00008067          	ret

80005c98 <Func_1>:
80005c98:	0ff57513          	zext.b	a0,a0
80005c9c:	0ff5f593          	zext.b	a1,a1
80005ca0:	00b50663          	beq	a0,a1,80005cac <Func_1+0x14>
80005ca4:	00000513          	li	a0,0
80005ca8:	00008067          	ret
80005cac:	a00017b7          	lui	a5,0xa0001
80005cb0:	a8a788a3          	sb	a0,-1391(a5) # a0000a91 <Ch_1_Glob>
80005cb4:	00100513          	li	a0,1
80005cb8:	00008067          	ret

80005cbc <Func_2>:
80005cbc:	ff010113          	add	sp,sp,-16
80005cc0:	00112623          	sw	ra,12(sp)
80005cc4:	00254703          	lbu	a4,2(a0)
80005cc8:	0035c783          	lbu	a5,3(a1)
80005ccc:	a00016b7          	lui	a3,0xa0001
80005cd0:	02e78863          	beq	a5,a4,80005d00 <Func_2+0x44>
80005cd4:	bf4fa0ef          	jal	800000c8 <strcmp>
80005cd8:	00000793          	li	a5,0
80005cdc:	00a05a63          	blez	a0,80005cf0 <Func_2+0x34>
80005ce0:	a00017b7          	lui	a5,0xa0001
80005ce4:	00a00713          	li	a4,10
80005ce8:	a8e7ac23          	sw	a4,-1384(a5) # a0000a98 <Int_Glob>
80005cec:	00100793          	li	a5,1
80005cf0:	00c12083          	lw	ra,12(sp)
80005cf4:	00078513          	mv	a0,a5
80005cf8:	01010113          	add	sp,sp,16
80005cfc:	00008067          	ret
80005d00:	a8f688a3          	sb	a5,-1391(a3) # a0000a91 <Ch_1_Glob>
80005d04:	fcdff06f          	j	80005cd0 <Func_2+0x14>
