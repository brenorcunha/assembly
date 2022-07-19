;#include <stdio.h>
;int num;
;int main(void) {
;for (num = 0; num <= 100; num++){
;    if (num % 3 == 0) {
;         printf("Fizz %d", num);
;    }
;
;    else if (num % 5 == 0) {
;         printf("Buzz %d", num);
;   }
;
;    else if (num % 3 == 0 && num % 5 == 0) {
;         printf("FizzBuzz %d", num);
;    } else {
;        printf("%d", num);
;    }
;}
;return 0;
;}
;------------------------------------------------
.LC0:
  .string "Fizz %d"
.LC1:
  .string "Buzz %d"
.LC2:
  .string "FizzBuzz %d"
.LC3:
  .string "%d"
main:
  push rbp
  mov rbp, rsp
  mov DWORD PTR num[rip], 0
  jmp .L2
.L7:
  mov ecx, DWORD PTR num[rip]
  mov edx, 1431655766
  mov eax, ecx
  imul edx
  mov eax, ecx
  sar eax, 31
  sub edx, eax
  mov eax, edx
  mov edx, eax
  add edx, edx
  add edx, eax
  mov eax, ecx
  sub eax, edx
  test eax, eax
  jne .L3
  mov eax, DWORD PTR num[rip]
  mov esi, eax
  mov edi, OFFSET FLAT:.LC0
  mov eax, 0
  call printf
  jmp .L4
.L3:
  mov ecx, DWORD PTR num[rip]
  mov edx, 1717986919
  mov eax, ecx
  imul edx
  sar edx
  mov eax, ecx
  sar eax, 31
  sub edx, eax
  mov eax, edx
  mov edx, eax
  sal edx, 2
  add edx, eax
  mov eax, ecx
  sub eax, edx
  test eax, eax
  jne .L5
  mov eax, DWORD PTR num[rip]
  mov esi, eax
  mov edi, OFFSET FLAT:.LC1
  mov eax, 0
  call printf
  jmp .L4
.L5:
  mov ecx, DWORD PTR num[rip]
  mov edx, 1431655766
  mov eax, ecx
  imul edx
  mov eax, ecx
  sar eax, 31
  sub edx, eax
  mov eax, edx
  mov edx, eax
  add edx, edx
  add edx, eax
  mov eax, ecx
  sub eax, edx
  test eax, eax
  jne .L6
  mov ecx, DWORD PTR num[rip]
  mov edx, 1717986919
  mov eax, ecx
  imul edx
  sar edx
  mov eax, ecx
  sar eax, 31
  sub edx, eax
  mov eax, edx
  mov edx, eax
  sal edx, 2
  add edx, eax
  mov eax, ecx
  sub eax, edx
  test eax, eax
  jne .L6
  mov eax, DWORD PTR num[rip]
  mov esi, eax
  mov edi, OFFSET FLAT:.LC2
  mov eax, 0
  call printf
  jmp .L4
.L6:
  mov eax, DWORD PTR num[rip]
  mov esi, eax
  mov edi, OFFSET FLAT:.LC3
  mov eax, 0
  call printf
.L4:
  mov eax, DWORD PTR num[rip]
  add eax, 1
  mov DWORD PTR num[rip], eax
.L2:
  mov eax, DWORD PTR num[rip]
  cmp eax, 100
  jle .L7
  mov eax, 0
  pop rbp
  ret