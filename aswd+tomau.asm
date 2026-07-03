int 10h
st:
mov ah,1h
int 21h
jmp chung

huong:
mov ah,1h
int 21h

cmp al,'d'
jz phai

cmp al,'a'
jz trai

cmp al,'w'
jz len

cmp al,'s'
jz xuong

chung:
mov ah,2h
int 10h
mov ah,9h
cmp al,'r'
jz r
cmp al,'b'
jz b
cmp al,'y'
jz y
jmp st
;do
r:
mov al," "
mov bl,44h
mov cx,1h
int 10h
jmp huong
;xanh
b:
mov al," "
mov bl,11h
mov cx,1h
int 10h
jmp huong
;vang
y:
mov al," "
mov bl,0eeh
mov cx,1h
int 10h
jmp huong

phai:
inc dl
jmp capnhap
trai:
dec dl
jmp capnhap

len:

dec dh
jmp capnhap

xuong:
inc dh
jmp capnhap

capnhap:
mov ah,2h
int 10h
jmp st