.equ libc, 0xb6e74000
.arm
_start:
   push {lr}

   adr r0,func
   blx r0
   
_exit:
   pop {pc}

func:
   push {lr}
   mov r0, #1
   adr r1, HELLO
   mov r2, #sz
   mov r7, #4	@ write()
   swi #0
   pop {pc}

HELLO: .asciz "Hello, World!\n"	@ .asciz adds a null-byte to the end of the string
sz = . - HELLO
