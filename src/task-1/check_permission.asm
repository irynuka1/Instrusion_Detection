%include "../include/io.mac"

extern ant_permissions

extern printf
global check_permission

section .text

check_permission:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     eax, [ebp + 8]  ; id and permission
    mov     ebx, [ebp + 12] ; address to return the result
    ;; DO NOT MODIFY

    ; Getting the ant's id
    mov     ecx, eax
    shr     ecx, 24 ; the 8 most significant bits are the id
    ; Getting the permission
    and     eax, 0xFFFFFF ; the 24 least significant bits are the permission

    ; Getting the ant_permission
    mov     edx, dword [ant_permissions + ecx * 4] ; id * 4 is the position in the array

    ; Checking the ant's permissions
    and     edx, eax ; if the ant has permission for all rooms, edx will not change
    cmp     edx, eax
    jne     not_allowed
    mov     dword [ebx], 1
    jmp     end

not_allowed:
    mov dword [ebx], 0

end:
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY