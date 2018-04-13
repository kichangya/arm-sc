all: shellcode.h exploit

exploit: exploit.c shellcode.h
	cc -o $@ $< -g

shellcode.o: shellcode.s
	as $< -o $@ 

shellcode.bin: shellcode.o
	objcopy -O binary $< $@

shellcode.h: shellcode.bin
	xxd -i $< $@

clean:
	rm -f exploit shellcode.o shellcode.h shellcode.bin
