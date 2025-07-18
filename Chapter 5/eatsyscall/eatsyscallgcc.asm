;  Executable name : eatsyscallgcc (For linking with gcc)
;  Version         : 1.0
;  Created date    : 4/25/2022    
;  Last update     : 4/10/2023     
;  Author          : Jeff Duntemann          
;  Architecture    : x64    
;  From            : x64 Assembly Language Step By Step, 4th Edition
;  Description     : A simple program in assembly for x64 Linux, using NASM 2.14,
;                  : demonstrating the use of the syscall instruction to display text.
;
;                  : Build using the default build configuration in SASM
;  
 
SECTION .data           ; Section containing initialized dat
 EatMsg: db "Eat at Joe's!",10
 EatLen: equ $-EatMsg
 
SECTION .bss            ; Section containing uninitialized data       
SECTION .text           ; Section containing code           

global   main           ; Linker needs this to find the entry point!

main:
 mov rbp,rsp            ; SASM may add another copy of this in debug mode!
 
  mov rax,1             ; 1 = sys_write for syscall    
  mov rdi,1             ; 1 = fd for stdout
                        ; write to theterminal window
  mov rsi,EatMsg        ; Put address of the message string in rsi
  mov rdx,EatLen        ; Length of string to be written in rdx
  syscall               ; Make the system call

  mov rax,60            ; 60 = exit the program 
  mov rdi,0             ; Return value in rdi 0 = nothing to return
  syscall               ; Call syscall to exit             
