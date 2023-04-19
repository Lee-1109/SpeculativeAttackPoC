SRC = $(wildcard *.c)
OBJ = $(patsubst %.c,%,$(SRC))

all:$(OBJ)

%:%.cpp
	gcc -o $@ $^

.PHONY:clean
clean:
	-rm -f $(OBJ)