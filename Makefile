CFLAGS=-std=c11 -g -static

soe-c: soe-c.c

test: soe-c
	./test.sh

clean:
	rm -f soe-c *.o *~ tmp*

.PHONY: test clean
