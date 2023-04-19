SRC = $(wildcard *.c)
OBJ = $(patsubst %.c,%,$(SRC))

all:$(OBJ)

%:%.c
	gcc -o $@ $^
	
#使得所有文件生成.s文件
%.s:%.c
	gcc -S $< -o $@
 
.PHONY:clean
clean:
	-rm -f $(OBJ)