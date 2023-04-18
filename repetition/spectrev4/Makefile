SRC = $(wildcard *.cpp)
OBJ = $(patsubst %.cpp,%,$(SRC))

all:$(OBJ)

%:%.cpp
	gcc -o $@ $^

.PHONY:clean
clean:
	-rm -f $(OBJ)