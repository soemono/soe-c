CFLAGS=-std=c11 -g -static
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)

soe-c: $(OBJS)
	$(CC) -o soe-c $(OBJS) $(LDFLAGS)

$(OBJS): soe-c.h

test: soe-c
	./test.sh

clean:
	rm -f soe-c *.o *~ tmp*

.PHONY: test clean
