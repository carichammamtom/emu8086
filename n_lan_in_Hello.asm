.data
b db "So lan in: $"
a db "hello$"
nhap db 3h
     db 1h
     db 3 dup(2)
.code
start:
;khai bao con tro x:hang,y:cot
contro macro x,y
    mov dh,x
    mov dl,y
    mov ah,2
    int 10h
    endm
;In so lan in
mov ax,@data
mov ds, ax
mov ah,9
int 21h
;nhap
mov ah,0ah
mov dx,offset nhap
int 21h
;chuyen chu->so
mov bx,2
biendoi1:
mov ah,[nhap+bx]
cmp ah,0dh
jz thoat
sub ah,"0"
mov [bx+nhap],ah
inc bx
jmp biendoi1

thoat:
cmp bl,3h
jnz so2
jz so1
so1:
   mov al,[nhap+2]
   jmp kt
so2:
mov ah,0
mov al,[nhap+2]
mov ch,10
mul ch
mov bl,[nhap+3]
add al,bl
jmp kt
kt:
mov cl,al
dem:
cmp cl,0
jz thoat1
contro cl,0
dec cl
call hamin
jmp dem
hamin proc
	mov dx,offset a
	mov ah,9h
	int 21h
	ret
hamin endp
thoat1:

end start