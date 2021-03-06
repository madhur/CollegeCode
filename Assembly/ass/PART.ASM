;             PROGRAM FOR DISPLAYING PARTITION TABLE OF HARD DISK

;                           MANDAR JOSHI
PRINT MACRO MES
        PUSH DX
        PUSH AX
        MOV AH,09H
        LEA DX,MES
        INT 21H
        POP DX
        POP AX
ENDM
.MODEL SMALL
.STACK 100
.486
.DATA
        CONTENT DB 512 DUP(0)
        CHAR    DB 0
        CHAR1    DB 0
        CHAR2    DB 0
        CHAR3    DB 0
        TIMES   DB 4
        PARTITION DB 4
        MES0  DB 10,13,10,13,10,13,9,9,"PARTITION INFO. FOR PRIMARY PARTITION $"
        MES1  DB 10,13,10,13,10,13," ACTIVE FLAG STATUS                 :80H  =>BOOTABLE$"
        MES2  DB 10,13,10,13,10,13," ACTIVE FLAG STATUS                 :00H  =>NON-BOOTABLE$"
        MES3  DB 10,13," STARTING HEAD                      :$"
        MES4  DB 10,13," STARTING CYLINDER / TRACK          :$"
        MES5  DB 10,13," PARTITION TYPE                     :$"
        MES6  DB 10,13," ENDING HEAD                        :$"
        MES7  DB 10,13," ENDING CYLINDER / TRACK            :$"
        MES8  DB 10,13," STARTING SECTOR FOR PARTITION      :$"
        MES9  DB 10,13," LEGTH OF PARTITION (NO. OF SECTORS):$"
        MES10 DB 10,13,10,13,10,13," SIGNATURE WORD                   :$"
        MES11 DB 9,9," UNUSED$"
        MES12 DB 9,9," FAT12$"
        MES13 DB 9,9," FAT16$"
        MES14 DB 9,9," EXTENDED$"
        MES15 DB 9,9," HUGE$"
        MES16 DB 9,9," UNKNOWN$"
        MES17 DB 9,9," FAT32$"
        MES18 DB 9,9," EXTENDED32$"

.CODE
        MOV AX,@DATA
        MOV DS,AX
        MOV ES,AX

        MOV AH,02H
        MOV AL,01
        LEA BX,CONTENT
        MOV CH,0
        MOV CL,1
        MOV DH,0
        MOV DL,80H
        INT 13H                  ;READ MASTER BOOT RECORD

        LEA SI,CONTENT
        ADD SI,1BEH
NXT:
        MOV  AH,06H
        MOV  AL,00H
        MOV  BH,35H
        MOV  CX,0000H
        MOV  DX,184FH
        INT  10H                  ;CLEAR SCREEN

        MOV  AH,02H
        MOV  BH,00H
        MOV  DH,0
        MOV  DL,0
        INT  10H                 ;SET CURSOR

        PRINT MES0
        MOV AH,PARTITION
        MOV AL,4
        SUB AL,AH
        INC AL
        MOV CHAR,AL
        MOV TIMES,1
        CALL DIS                 ;PRINT PARTITION NO.

        CMP BYTE PTR[SI],00H     ;CHECK ACTIVE FLAG
        JNZ NOACTIVE
        PRINT MES2
NOACTIVE:
        CMP BYTE PTR[SI],80H
        JNZ A0
        PRINT MES1
A0:
        PRINT MES3               ;STARTING HEAD
        MOV AL,[SI+1]
        MOV CHAR,AL
        MOV TIMES,1
        CALL DIS

        PRINT MES4
        MOV AX,WORD PTR[SI+2]    ;STARTING CYLINDER/TRACK
        MOV CHAR,AH
        MOV CHAR1,AL
        MOV TIMES,2
        CALL DIS

        PRINT MES5               ;PARTITION TYPE
        MOV AH,[SI+4]
        MOV CHAR,AH
        MOV TIMES,1
        CALL DIS

        MOV AH,[SI+4]
        CMP AH,00                ;UNUSED
        JNZ A1
        PRINT MES11
        JMP ENDHEAD
A1:     CMP AH,01
        JNZ A2
        PRINT MES12              ;FAT12
        JMP ENDHEAD
A2:     CMP AH,04
        JNZ A3
        PRINT MES13              ;FAT16
        JMP ENDHEAD
A3:     CMP AH,05
        JNZ A4
        PRINT MES14              ;EXTENDED
        JMP ENDHEAD
A4:     CMP AH,06
        JNZ A5
        PRINT MES15              ;HUGE
        JMP ENDHEAD
A5:     CMP AH,0CH
        JNZ A6
        PRINT MES17              ;FAT32
        JMP ENDHEAD
A6:     CMP AH,0FH
        JNZ A7
        PRINT MES18              ;EXTENDED32
        JMP ENDHEAD
A7:     PRINT MES16              ;UNKNOWN
ENDHEAD:
        PRINT MES6               ;ENDING HEAD 
        MOV AL,[SI+05]
        MOV CHAR,AL
        MOV TIMES,1
        CALL DIS

        PRINT MES7              ;ENDING CYLINDER /TRACK
        MOV AX,WORD PTR[SI+6]
        MOV CHAR,AH
        MOV CHAR1,AL
        MOV TIMES,2
        CALL DIS

        PRINT MES8              ;STARTING SECTOR
        MOV AX,WORD PTR[SI+08]
        MOV CHAR2,AH
        MOV CHAR3,AL
        MOV AX,WORD PTR[SI+0AH]
        MOV CHAR,AH
        MOV CHAR1,AL
        MOV TIMES,4
        CALL DIS

        PRINT MES9              ;LENGTH IN BYTES
        MOV AX,WORD PTR[SI+0CH]
        MOV CHAR2,AH
        MOV CHAR3,AL
        MOV AX,WORD PTR[SI+0EH]
        MOV CHAR,AH
        MOV CHAR1,AL
        MOV TIMES,4
        CALL DIS

        MOV AH,01H
        INT 21H
        ADD SI,16
        DEC PARTITION
        JNZ NXT

        LEA SI,CONTENT
        PRINT MES10              ;SIGNATURE WORD
        MOV AX,WORD PTR[SI+1FEH]
        MOV CHAR,AH
        MOV CHAR1,AL
        MOV TIMES,2
        CALL DIS
        MOV AX,4C00H
        INT 21H

PROC DIS NEAR
        LEA DI,CHAR
LP:     MOV DL,[DI]
        AND DL,0F0H
        MOV CL,4
        SHR DL,CL
        ADD DL,30H
        CMP DL,39H
        JBE LP1
        ADD DL,07H
LP1:    MOV AH,02H
        INT 21H
        MOV DL,[DI]
        AND DL,0FH
        ADD DL,30H
        CMP DL,39H
        JBE LP2
        ADD DL,07H
LP2:    MOV AH,02H
        INT 21H
        MOV BYTE PTR[DI],00H
        INC DI
        DEC TIMES
        JNZ LP
        RET
DIS ENDP
END


                                                                                                                                                                                                                                                                                                             
