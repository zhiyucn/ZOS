; 实模式下x86汇编引导扇区示例
; 使用NASM汇编器语法

org 0x7c00 ; BIOS将引导扇区加载到0x7c00地址

; 初始化堆栈
mov ax, 0x0000
mov ss, ax
mov sp, 0x0000
mov ax, 0x07C0
mov ds, ax

; 清除屏幕
mov ax, 0x0600
mov bh, 0x07
mov cx, 0x0000
int 0x10

; 打印消息到屏幕
mov si, msg
call print_string

; 加载内核到内存（这里省略了实际的加载代码）

; 跳转到内核入口点（这里假设内核已经加载到0x1000:0x0000）
jmp 0x1000:0x0000

; 打印字符串的函数
print_string:
    lodsb ; 加载字符串的下一个字节到al
    test al, al ; 检查是否为0（字符串结束）
    jz .done ; 如果是0，结束
    mov ah, 0x0e ; 准备打印字符
    int 0x10 ; 调用BIOS视频服务
    jmp print_string ; 继续打印下一个字符
.done:
    ret

; 数据段
msg db 'Loading OS...', 0

; 填充引导扇区剩余部分到510字节
times 510-($-$$) db 0

; 引导扇区的结束标志
dw 0xAA55