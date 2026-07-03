int 10h
mov ax,0B800h
mov es,ax

mov ax,4420h    ; AH=44h (attribute), AL=' '
mov cx,40*25

rep stosw