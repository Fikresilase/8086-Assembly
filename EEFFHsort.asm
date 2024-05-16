;Eyerusalem Desalegn
;Eyuel Mulugeta
;Feven Yohannes
;Fikresilase Wondmeneh
;Haymanot sleshi
org 100h

; Display prompt for user to enter 10 numbers
lea dx, input_msg
mov ah, 9
int 21h

; Take 10 inputs separated by space
mov cx, 0
lea si, numbers

take_input:
    mov ah, 1
    int 21h
    mov [si], al

    mov ah, 0eh
    mov al, ' '
    int 10h

    inc si
    inc cx
    cmp cx, 10
    jne take_input

; Bubble sort to arrange numbers in ascending order
mov dh, 0
outer_loop:
    lea si, numbers
    lea di, numbers
    mov cx, 0
    inc dh
    cmp dh, 10
    je print_output

    inner_loop:
        inc di
        mov bl, [si]

        cmp bl, [di]
        jna continue_sort

        mov dl, [di]
        mov [si], dl
        mov [di], bl

    continue_sort:
        inc cx
        inc si

        cmp cx, 9
        jne inner_loop
        je outer_loop

; Print result
print_output:
lea dx, output_msg
mov ah, 9
int 21h

lea si, numbers
mov cx, 0

print_numbers:
mov ah, 0eh
mov al, ' '
int 10h

mov al, [si]
int 10h

inc si
inc cx
cmp cx, 10
jne print_numbers

end_program:
ret

input_msg db "Enter 10 Numbers separated by space: $"
output_msg db "Sorted (ASC): $"
numbers db 10 dup(?)
