section .data
    prompt db "Enter a number: ", 0              ; Prompt message
    posMsg db "POSITIVE", 0                     ; Positive message
    negMsg db "NEGATIVE", 0                     ; Negative message
    zeroMsg db "ZERO", 0                        ; Zero message
    input db 0, 0, 0, 0                         ; Buffer for user input (4 bytes)
    bytesRead dq 0                              ; Number of bytes read (for ReadConsole)
    bytesWritten dq 0                           ; Number of bytes written (for WriteConsole)

section .bss

section .text
    global _start
    extern GetStdHandle, ReadConsoleA, WriteConsoleA, ExitProcess

_start:
    ; Step 1: Get handle to standard input (stdin)
    mov rcx, -10                                 ; STD_INPUT_HANDLE = -10
    call GetStdHandle                            ; Returns handle in RAX
    mov rbx, rax                                 ; Store stdin handle in RBX

    ; Step 2: Write the prompt to stdout
    mov rcx, -11                                 ; STD_OUTPUT_HANDLE = -11
    call GetStdHandle                            ; Returns handle in RAX
    mov r8, rax                                  ; Store stdout handle in R8
    lea rdx, [prompt]                            ; Address of prompt message
    mov r9, 17                                   ; Length of the message
    lea rax, [bytesWritten]                      ; Address to store number of bytes written
    call WriteConsoleA                           ; Write the prompt to console

    ; Step 3: Read user input
    lea rdx, [input]                             ; Address of input buffer
    mov r9, 4                                    ; Maximum bytes to read
    lea rax, [bytesRead]                         ; Address to store number of bytes read
    call ReadConsoleA                            ; Read user input into buffer

    ; Step 4: Convert input to integer
    lea rsi, [input]                             ; Address of input buffer
    call str_to_int                              ; Convert input to integer
    mov rbx, rax                                 ; Store the integer in RBX

    ; Step 5: Conditional checks
    cmp rbx, 0                                   ; Compare integer to 0
    je print_zero                                ; If number == 0, jump to print_zero
    jl print_neg                                 ; If number < 0, jump to print_neg
    jmp print_pos                                ; Otherwise, jump to print_pos

print_pos:
    lea rdx, [posMsg]                            ; Address of "POSITIVE" message
    jmp print_result

print_neg:
    lea rdx, [negMsg]                            ; Address of "NEGATIVE" message
    jmp print_result

print_zero:
    lea rdx, [zeroMsg]                           ; Address of "ZERO" message

print_result:
    mov rcx, r8                                  ; Handle to stdout
    mov r9, 8                                    ; Length of message
    lea rax, [bytesWritten]                      ; Address to store number of bytes written
    call WriteConsoleA                           ; Write result message to console

    ; Step 6: Exit the program
    xor ecx, ecx                                 ; Exit code 0
    call ExitProcess                             ; Terminate the program

str_to_int:
    ; Convert string in [rsi] to an integer in RAX
    xor rax, rax                                 ; Clear RAX (result accumulator)
    xor rcx, rcx                                 ; Clear RCX (temporary register)
.next_digit:
    movzx rdx, byte [rsi]                        ; Load the next byte
    test rdx, rdx                                ; Check for null terminator
    je .done                                     ; If null, we're done
    sub rdx, '0'                                 ; Convert ASCII to numeric digit
    imul rax, rax, 10                            ; Multiply result by 10
    add rax, rdx                                 ; Add the current digit
    inc rsi                                      ; Move to the next character
    jmp .next_digit                              ; Repeat for the next digit
.done:
    ret                                          ; Return with result in RAX
