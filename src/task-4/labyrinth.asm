%include "../include/io.mac"

extern printf
extern position
global solve_labyrinth

section .data
    no_lines dd 0
    no_columns dd 0

section .text

; void solve_labyrinth(int *out_line, int *out_col, int m, int n, char **labyrinth);
solve_labyrinth:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     eax, [ebp + 8]  ; unsigned int *out_line, pointer to structure containing exit position
    mov     ebx, [ebp + 12] ; unsigned int *out_col, pointer to structure containing exit position
    mov     ecx, [ebp + 16] ; unsigned int m, number of lines in the labyrinth
    mov     edx, [ebp + 20] ; unsigned int n, number of colons in the labyrinth
    mov     esi, [ebp + 24] ; char **a, matrix represantation of the labyrinth
    ;; DO NOT MODIFY

    dec     ecx ; decrement number of lines to acomodate 0 - based indexing
    dec     edx ; decrement number of columns to acomodate 0 - based indexing
    mov     [no_lines], ecx
    mov     [no_columns], edx
    
    ; Setting current line and column counters to 0
    mov     ecx, 0
    mov     edx, 0

    ; Pushing to stack to preserve it's value before the loop
    push    eax

check_position:
    cmp     ecx, [no_lines] ; check if current line is equal to m - 1
    je      found_exit
    cmp     edx, [no_columns] ; check if current column is equal to n - 1
    je      found_exit

    ; Setting the current position value to 1
    mov     eax, [esi + 4 * ecx]
    mov     byte [eax + edx], 1

    ; Check down
    inc     ecx
    mov     eax, [esi + 4 * ecx]
    cmp     byte [eax + edx], '0'
    je      check_position
    dec     ecx

    ; Check right
    inc     edx
    mov     eax, [esi + 4 * ecx]
    cmp     byte [eax + edx], '0'
    je      check_position
    dec     edx

    ; Check left
    dec     edx
    mov     eax, [esi + 4 * ecx]
    cmp     byte [eax + edx], '0'
    je      check_position
    inc     edx

    ; Check up
    dec     ecx
    mov     eax, [esi + 4 * ecx]
    cmp     byte [eax + edx], '0'
    je      check_position
    inc     ecx

; Put the result in eax and ebx registers
found_exit:
    pop     eax
    mov     [eax], ecx
    mov     [ebx], edx

end:
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY

