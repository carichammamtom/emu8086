.data  
 msg db "Enter number 1: $" 
 msg1 db "Enter number 2: $"
.code
start:
;khai bao con tro
contro macro x,y
    mov dh,x
    mov dl,y
    mov ah,2
    int 10h
    endm 
; In nhap so 1
    mov ax, @data
    mov ds, ax
    mov ah,9
    int 21h
    ;tao mang 1
    bf db 4h
       db ?
       db 4 dup(?)
   ;nhap so 1       
    mov ah,0ah  
    lea dx,bf
    mov cx,713h
    mov ds,cx 
    int 21h 
   ;xuong dong
    contro 1,0
; In nhap so 2 
    mov dx,11h
    mov ax, @data
    mov ds, ax 
    mov ah,9
    int 21h
    ;tao mang 2 
    af db 4h
       db ?
       db 4 dup(?)
     ;nhap so 2  
    mov ah,0ah
    lea dx,af
    mov cx,713h
    mov ds,cx
    int 21h
    ;xuong dong
    contro 2,0 
    ;tinh toan
    mov si,0ffffh
    mov di,0ffffh
    ;do chieu dai
    mov bx,0bh ;vi tri so 1
    inc si
    cmp [si+bx],0dh
    jnz $-7
    mov bx,31h;vi tri so 2
    inc di
    cmp [di+bx],0dh
    jnz $-7
    mov ah,2h ;dieu chinh interrupt
    ;nho hon
    cmp si,di    
    jc end1 
    ;lon hon     
    cmp si,di
    jnz end2
    ;bang nhau
    cmp si,di
    jz end3 
end1:
    mov bx,31h
    mov dl,[bx]
    inc bx
    int 21h
    cmp [bx],0dh
    jnz $-8
    jmp kt
end2:
    mov bx,0bh
    mov dl,[bx]
    inc bx
    int 21h
    cmp [bx],0dh
    jnz $-8
    jmp kt
end3:
    mov si,0bh
    mov di,31h
    mov bx,0ffffh
    inc bx
    cmp [bx+si],0dh
    jz end1
    mov al,[si+bx]
    ;nho hon
    cmp al,[di+bx]  
    jc end1 
    ;lon hon
    cmp al,[di+bx]    
    jnz end2      
    jmp $-16
kt:
end start
 