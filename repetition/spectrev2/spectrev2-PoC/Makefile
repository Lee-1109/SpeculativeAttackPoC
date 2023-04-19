SRC  = $(wildcard *.c)
OBJ = $(patsubst %.c, %,$(SRC))

all: $(OBJ)

%:%.c  
	gcc -o $@ $^

.PHONY: clean
# fuck the spectrev2
clean:
	-rm -f $(OBJ)
