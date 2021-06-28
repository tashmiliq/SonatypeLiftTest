CC=clang
CFLAGS=-g -O0

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

foo.o: foo.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -rf foo *.o

.PHONY: clean
