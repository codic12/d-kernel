#!/usr/bin/sh
ldc -betterC -m32 -c src/kernel.d -of=kernel.o -g
nasm -f elf -o boot.o boot.s
ld -m elf_i386 -T linker.ld -o kernel boot.o kernel.o
