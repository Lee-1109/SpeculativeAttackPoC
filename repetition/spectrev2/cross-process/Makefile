MYCFLAGS = -g
CFLAGS = -Wall -std=gnu99 -D_GNU_SOURCE -no-pie $(MYCFLAGS) 
LDFLAGS = -pthread 


EXES = victim attack train
OBJS = $(EXES:=.o)

all: $(EXES)
clean:
	-rm $(EXES)
