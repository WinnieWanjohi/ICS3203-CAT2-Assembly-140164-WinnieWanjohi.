section .data
    sensorValue db 50
    motorStatus db 0
    alarmStatus db 0

section .text
    global _start
    extern ExitProcess

_start:
    mov al, [sensorValue]

    cmp al, 100
    jae trigger_alarm
    cmp al, 50
    ja start_motor
    jmp stop_motor

trigger_alarm:
    mov byte [alarmStatus], 1
    jmp end_program

start_motor:
    mov byte [motorStatus], 1
    jmp end_program

stop_motor:
    mov byte [motorStatus], 0

end_program:
    xor ecx, ecx
    call ExitProcess
