SRC=$(wildcard *.c) #得到所有的.c文件
OBJ=$(patsubst %.c,%,$(SRC))  #把所有的.c替换成.o文件
 
#格式
#目标：依赖
#	规则命令  （gcc -o 目标 依赖）
 
#  $@：目标
#  $^：全部依赖
#  $<：第一个依赖
#  $?：第一个变化
 
all:$(OBJ)
 
#使所有的.c文件分别生成对应的.o文件
%:%.c
	gcc -o $@ $^ 
#使得所有文件生成.s文件
%.s:%.c
	gcc -S $^ -o $@
 
#  -I./include(指定包含的头文件路径)
#  -lpthread(编译线程时需要)
#  -g(调试时需要)
 
.PHONY:clean #防止有歧义
 
#清理
clean:
	-rm -f $(OBJ)


	
# SRC=$(wildcard *.c)  #获取所有的 .c 文件

# OBJ=$(patsubst %.c,%.o,$(SRC))  #将所有的 .c 文件转化为对应的 .o 文件

# ASM=$(patsubst %.c,%.s,$(SRC))  #将所有的 .c 文件转化为对应的 .s 文件

# #  $@：目标
# #  $^：全部依赖
# #  $<：第一个依赖

# # 编译所有 .c 文件为对应的 .s 文件
# %.s:%.c
# 	gcc -S $^ -o $@

# # 编译所有 .c 文件为对应的 .o 文件
# %.o:%.c
# 	gcc -c $^ -o $@


# .PHONY:clean

# # 清理
# clean:
# 	-rm -f $(OBJ) $(ASM)
