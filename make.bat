@echo off
setlocal

set PINK_HOME=%~dp0\dist
set PINK_OS=windows
  
dist\bin\pink.exe -o src\c\out_pink.c src/pink

md dist\bin

gcc -Ofast -flto -march=native -w -c src\c\pink.c -o src\c\pink.o
gcc -Ofast -flto -march=native -w -static-libgcc -o dist\bin\pink.exe src\c\pink.o -lkernel32

endlocal
