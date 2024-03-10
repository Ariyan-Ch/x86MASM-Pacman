INCLUDE Irvine32.inc
includelib Winmm.lib

PlaySound PROTO,
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD

.data
deathSound db ".\sound\deathSound2.wav",0
coinSound db ".\sound\coinSound2.wav",0

startingScreen db 13, 10, 13, 10, 13, 10, 13, 10
db "                                      +=+=+=+=+=+=+=+=+   +=+=+=+=+=+=+=+=+=+= ", 13, 10
db "                                      | '_ \ / _` |/ __| '_ ` _ \ / _` | '_ \ ", 13, 10
db "                                      | |_) | (_| | (__| | | | | | (_| | | | |", 13, 10
db "                                      | .__/ \__,_|\___|_| |_| |_|\__,_|_| |_|", 13, 10
db "                                      |_|", 13, 10
db "+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=", 13, 10, 13, 10, 13, 10, 13, 10
db "                                            ,##.                   ,==.", 13, 10
db "                                          ,#    #.                 \ o ',", 13, 10
db "                                         #        #     _     _     \    \ ", 13, 10
db "                                         #        #    ( )   ( )    /    ; ", 13, 10
db "                                          `#    #'      ^     ^    /   .'  ", 13, 10
db "                                            `##'                   '=='", 13, 10, 13, 10, 13, 10
db "                                             Enter your name to start: ", 0

playerName db 10 DUP(? ), 0
pName db "Player Name: ", 0
PacMan db "<"

instruct     db "         |INSTRUCTIONS|",0
instruct1    db "1: Press P to Pause.", 0
instruct2    db "2: Press X to exist.", 0
instruct3    db "3: Avoid Ghosts using W,A,S,D!", 0
instruct4    db "4: Eat dots to clear level!", 0
instruct5    db "5: Enjoy!", 0

pausePrompt1 db "Game Paused!",0
pausePrompt2 db "Press Any Key to Continue!",0
pausePrompts1 db "            ",0
pausePrompts2 db "                          ",0

EndingMsg  db "                              CONGRATS YOU HAVE WON!                                ",0
livesEndedMsg db "                              AWWWWW! YOU HAVE LOST!                                ",0
livesEndedBoard db "            Name:                                                                   ",13,10
                db "            Score:                                                                  ",13,10
                db "                            Press any Key to Exit!                                  ",0
spaceLevel db "                                                                                    ",0
level1  db "(==================================================================================)",13,10
        db "I.....................................I      I.....................................I",13,10
        db "I=============).(=====================>      <=====================).(=============I",13,10
        db "I             I.I                                                  I.I             I",13,10
        db "I             I.I                                                  I.I             I",13,10
        db "I             I.I                                                  I.I             I",13,10
        db "I             I.I                                                  I.I             I",13,10
        db "I             I.I                                                  I.I             I",13,10
        db "I             I.I   (==========================================)   I.I             I",13,10
        db "I             I.I   I..........................................I   I.I             I",13,10
        db "I             I.I   I.=====.(=====)             (=====).======.I   I.I             I",13,10
        db "I             I.I   I.=====.I                         I.======.I   I.I             I",13,10
        db "I             I.I   I.=====.I                         I.======.I   I.I             I",13,10
        db "I             I.I   I.=====.I                         I.======.I   I.I             I",13,10
        db "I             I.I   I.=====.<=========================>.======.I   I.I             I",13,10
        db "I             I.I   I.=====.............................======.I   I.I             I",13,10
        db "I=============>.I   I.=====.(==========)...(==========).======.I   I.<=============I",13,10
        db "I...............<===>.=====.I          <===>          I.======.<===>...............I",13,10
        db "I=============).............I                         I..............(=============I",13,10
        db "I             I.(===========>                         <============).I             I",13,10
        db "I             I.I                                                  I.I             I",13,10
        db "I             I.I     (=)                                  (=)     I.I             I",13,10
        db "I             I.I     I I                                  I I     I.I             I",13,10
        db "I             I.I     I I                                  I I     I.I             I",13,10
        db "I             I.I     I I                                  I I     I.I             I",13,10
        db "I             I.I     <=>                                  <=>     I.I             I",13,10
        db "I             I.I                                                  I.I             I",13,10
        db "I=============>.<==================================================>.<=============I",13,10
        db "I..................................................................................I",13,10
        db "<==================================================================================>",0

level2  db "(==================================================================================)",13,10
        db "I.....................................I      I......................O..............I",13,10
        db "I=============).(===).(===============>      <===============).(===).(=============I",13,10
        db "I             I.I   I.I                                      I.I   I.I             I",13,10
        db "I             I.I   I.I                                      I.I   I.I             I",13,10
        db "I             I.I   I.I                                      I.I   I.I             I",13,10
        db "I             I.I   I.I                                      I.I   I.I             I",13,10
        db "I             I.I   I.I                                      I.I   I.I             I",13,10
        db "I             I.I   I.<======================================>.I   I.I             I",13,10
        db "I             I.I   I..........................................I   I.I             I",13,10
        db "I             I.I   I.=====.(=====)             (=====).======.I   I.I             I",13,10
        db "I             I.I   I.=====.I                         I.======.I   I.I             I",13,10
        db "I             I.I   I.=====.I                         I.======.I   I.I             I",13,10
        db "I             I.I   I.=====.I                         I.======.I   I.I             I",13,10
        db "I             I.I   I.=====.<=========================>.======.I   I.I             I",13,10
        db "I             I.I   I.=====.............................======.I   I.I             I",13,10
        db "I=============>.I   I.=====.(==========)...(==========).======.I   I.<=============I",13,10
        db "I...............<===>.=====.I          <===>          I.======.<===>...............I",13,10
        db "I=============).............I                         I..............(=============I",13,10
        db "I             I.(=====).(===>                         <====).(=====).I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I=============>.<=====>O<==================================>O<=====>.<=============I",13,10
        db "I..................................................................................I",13,10
        db "<==================================================================================>",0

level3  db "(==================================================================================)",13,10
        db "I.....................................I      I.....................................I",13,10
        db "I=============).(===).(===============>      <===============).(===).(=============I",13,10
        db "I             I.I   I.I                                      I.I   I.I             I",13,10
        db "I             I.I   I.I                                      I.I   I.I             I",13,10
        db "I             I.I   I.I                                      I.I   I.I             I",13,10
        db "I             I.I   I.I                                      I.I   I.I             I",13,10
        db "I             I.I   I.I                                      I.I   I.I             I",13,10
        db "I=============>.<===>.<======================================>.<===>.<=============I",13,10
        db "I..............O....................................................O..............I",13,10
        db "I=============).(===).=====.(=====)             (=====).======.(===).(=============I",13,10
        db "I             I.I   I.=====.I                         I.======.I   I.I             I",13,10
        db "I             I.I   I.=====.I                         I.======.I   I.I             I",13,10
        db "I             I.I   I.=====.I                         I.======.I   I.I             I",13,10
        db "I             I.I   I.=====.<=========================>.======.I   I.I             I",13,10
        db "I             I.I   I.=====.............................======.I   I.I             I",13,10
        db "I=============>.I   I.=====.(==========)...(==========).======.I   I.<=============I",13,10
        db "I...............<===>.=====.I          <===>          I.======.<===>...............I",13,10
        db "I=============).............I                         I..............(=============I",13,10
        db "I             I.(=====).(===>                         <====).(=====).I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I             I.I     I.I                                  I.I     I.I             I",13,10
        db "I=============>.<=====>.<==================================>.<=====>.<=============I",13,10
        db "I..............O....................................................O..............I",13,10
        db "<==================================================================================>",0

temp byte 0

direction db "s" ;stores s if player is going down, stores w for up, d for next, and a for back
strScore BYTE "Current Score: ", 0
score dw 0
levelCap dw 364
levelNumber db 0
AllLevelCompleted db 0
LivesNum db 3
LivesPrompt db "Current Lives: ",0

xPos BYTE 1
yPos BYTE 1

GhostChar db "M"
ghost1XPos db 40
ghost1YPos db 13 
GhostDirection1 db 0
ghost2XPos db 41
ghost2YPos db 13 
GhostDirection2 db 0
ghost3XPos db 42
ghost3YPos db 13 
GhostDirection3 db 0
ghost4XPos db 43
ghost4YPos db 13 
GhostDirection4 db 0

inputChar BYTE ?

.code
main PROC

mov eax, red(black * 16)
call SetTextColor

mov edx, offset startingScreen
call writeString

mov dl, 72
mov dh, 21
call gotoxy

mov eax, white(black * 16)
call SetTextColor

mov ecx, 10
mov edx, offset playerName
call readString ;reads username and starts the game

;clears the screen by first printing _ and then with space. better visuals than simple clearing.
mov dx, 0
call gotoxy
mov ecx, 3600
clearingStart:
    mov eax, '_'
    call writeChar
    loop clearingStart
mov dx, 0
call gotoxy
mov ecx, 3600
clearingStart2:
    mov eax, ' '
    call writeChar
    loop clearingStart2

call drawRightSide  ;instructions and score board is drawn in this function.

;function to draw the level.

push offset level1
mov edx, 0
mov eax, lengthof level1
mov ebx, 30
mul ebx
sub eax, 2
push eax
call drawLevel

call DrawPlayer

mov dl, 95
mov dh, 19
call gotoxy

call Randomize

;The game runs in this loop
gameLoop:

mov ax, levelCap
cmp score, ax
jne dontClearLevel
call LevelChange
dontClearLevel:


mov eax, white(black * 16)
call SetTextColor

; draw score
mov dl, 102
mov dh, 16
call Gotoxy
mov ax, score
call WriteInt

; draw lives
mov dl, 102
mov dh, 18
call gotoxy
movzx ax, livesNum
call WriteInt

mov al, AllLevelCompleted   ;checks if this is 1. if it is, that means all 3 levels were compelted, so it also ends the game
cmp al, 1
je exitGame

;------------------------------ ghosts
call checkGhostCollision1
call GhostOne

call chechGhostCollision2
call GhostTwo

cmp levelNumber, 2
jl skipGhostThree

call chechGhostCollision3
call GhostThree


call chechGhostCollision4
call GhostFour
skipGhostThree:

;----------------------------- ghosts





; get user key input :
call ReadKey

cmp al, "p"
jne noPause
call pauseScreen

noPause:

cmp al, "x"; exit game if user types 'x':
je exitGame

cmp al, ";"
jne noCheat
call LevelChange
noCheat:


cmp al, "w"
jne checkdown
mov direction, al

jmp movement
checkdown:
cmp al, "s" 
jne checkLeft
mov direction, al

jmp movement
checkLeft:
cmp al, "a"
jne checkRight
mov direction, al

jmp movement
checkRight:
cmp al, "d"
jne movement
mov direction, al

movement:
mov bl, direction
mov inputChar, bl

mov eax, 60
call Delay

cmp inputChar, "w"
je moveUp

cmp inputChar, "s"
je moveDown

cmp inputChar, "a"
je moveLeft

cmp inputChar, "d"
je moveRight
;---------------------------------- UP
moveUp :
mov PacMan, "v"
movzx eax, yPos
movzx ebx, xPos
call chkUP
call returnCharacterOnMap
cmp al, '.' 
jne noDotUp
call removeDotAndIncreaseScore
jmp canGoUp
noDotUp:
    cmp al, ' ' 
    jne noSpaceUp
    jmp canGoUp
noSpaceUp:
    cmp al, 'O'
    jne gameLoop
    call removeFRUITAndIncreaseScore

canGoUp:
call UpdatePlayer
dec yPos
call DrawPlayer
mov eax, 10
call Delay
jmp gameLoop
;---------------------------------- UP

;---------------------------------- DOWN
moveDown:
mov PacMan, 239
movzx eax, yPos
movzx ebx, xPos
call chkDown
call returnCharacterOnMap
cmp al, '.' 
jne noDotDown
call removeDotAndIncreaseScore
jmp canGoDown
noDotDown:
    cmp al, ' ' 
    jne noSpaceDown
    jmp canGoDown
noSpaceDown:
    cmp al, 'O'
    jne gameLoop
    call removeFRUITAndIncreaseScore

canGoDown:
call UpdatePlayer
inc yPos
call DrawPlayer
mov eax, 10
call Delay
jmp gameLoop
;---------------------------------- DOWN

;---------------------------------- LEFT
moveLeft:
mov PacMan, ">"
movzx eax, yPos
movzx ebx, xPos
call chkBack
call returnCharacterOnMap
cmp al, '.' 
jne noDotBack
call removeDotAndIncreaseScore
jmp canGoBack
noDotBack:
    cmp al, ' ' 
    jne noSpaceBack
    jmp canGoBack
noSpaceBack:
    cmp al, 'O'
    jne gameLoop
    call removeFRUITAndIncreaseScore

canGoBack:
call UpdatePlayer
dec xPos
call DrawPlayer
jmp gameLoop
;---------------------------------- LEFT

;---------------------------------- RIGHT
moveRight:
mov PacMan, "<"
movzx eax, yPos
movzx ebx, xPos
call chkNext
call returnCharacterOnMap
cmp al, '.' 
jne noDotNext
call removeDotAndIncreaseScore
jmp canGoNext
noDotNext:
    cmp al, ' ' 
    jne noSpaceNext
    jmp canGoNext
noSpaceNext:
    cmp al, 'O'
    jne gameLoop
    call removeFRUITAndIncreaseScore

canGoNext:
call UpdatePlayer
inc xPos
call DrawPlayer
;---------------------------------- NEXT

jmp gameLoop

exitGame :
call clrscr
exit
main ENDP

; draws player at xPos and yPos with character stored in PacMan variable
    DrawPlayer PROC
    mov eax, black (yellow * 16)
    call SetTextColor
    mov dl, xPos
    mov dh, yPos
    call Gotoxy
    mov al, PacMan  ;whatever character is stored in this will be drawn
    call WriteChar
    ret
    DrawPlayer ENDP

    UpdatePlayer PROC
    mov dl, xPos
    mov dh, yPos
    call Gotoxy
    mov al, " "
    call WriteChar
    ret
    UpdatePlayer ENDP

    ;==--==--== changes the level by removing the previous map and creating the new one.
    LevelChange proc
    inc levelNumber
    mov xPos, 1 ;resets the player
    mov yPos, 1
    mov direction, "d"
    ;reseting the ghosts
    mov ghost1XPos, 40
    mov ghost1YPos, 13 
    mov ghost2XPos, 41
    mov ghost2YPos, 13 
    mov ghost3XPos, 42
    mov ghost3YPos, 13 
    mov ghost4XPos, 43
    mov ghost4YPos, 13 

    mov eax, white(black*16)
    call setTextColor
    mov dx, 0
    call gotoxy
    mov al, 0
    mov ecx, 30
    loop1:
        mov edx, offset spaceLevel
        call WriteString
        cmp ecx, 1
        je skip
        mov dl, 0
        inc al
        mov dh, al
        call gotoxy
        skip:
        loop loop1

    cmp levelNumber, 1
    jne createLevel3
    push offset level2
    mov edx, 0
    mov eax, lengthof level2
    mov ebx, 30
    mul ebx
    sub eax, 2
    push eax
    call drawLevel
    mov levelCap, 1057
    jmp here

    createLevel3:
    cmp levelNumber,2
    jne CongratsScreen
    push offset level3
    mov edx, 0
    mov eax, lengthof level3
    mov ebx, 30
    mul ebx
    sub eax, 2
    push eax
    call drawLevel
    mov levelCap, 1887
    jmp here

    CongratsScreen:
    call EndingScreen

    here:

    ret
    LevelChange endp
    ;==--==--== changes the level by removing the previous map and creating the new one.

    LivesEndedScreen proc
    mov dl, 0
    mov dh, 14
    call gotoxy
    mov ecx, 15
    mov bl, 14
    mov edx, offset livesEndedMsg
    call WriteString

    L1:
       mov eax, 150
       call delay
       mov dl, 0
       mov dh, bl
       call gotoxy
       mov edx, offset spaceLevel
       call writeString

       mov dl, 0
       cmp bl, 14
       je change1
       mov eax, green(black*16)
       call settextcolor
       mov bl, 14
       mov dh, 14
       jmp next
       change1:
       mov eax, yellow(black*16)
       call settextcolor
       mov bl, 15
       mov dh, 15

       next:
            call gotoxy
            mov edx, offset livesEndedMsg
            call writeString
      loop L1
      mov dl, 0
      mov dh, 14
      call gotoxy
      mov edx, offset livesEndedBoard
      call writeString
      mov dl, 18
      mov dh, 14
      call gotoxy
      mov edx, offset playerName
      call writeString
      mov dl, 19
      mov dh, 15
      call gotoxy
      movzx eax, score
      call writeInt

      ;---------- Write name wagera here.
      call readChar
      mov AllLevelCompleted, 1 ; althought levels might not be completed, this will end the game so it works : D
    ret
    LivesEndedScreen endp

    EndingScreen proc
    mov dl, 0
    mov dh, 14
    call gotoxy
    mov ecx, 10
    mov bl, 14
    mov edx, offset EndingMsg
    call WriteString

    L1:
       mov eax, 150
       call delay
       mov dl, 0
       mov dh, bl
       call gotoxy
       mov edx, offset spaceLevel
       call writeString

       mov dl, 0
       cmp bl, 14
       je change1
       mov eax, green(black*16)
       call settextcolor
       mov bl, 14
       mov dh, 14
       jmp next
       change1:
       mov eax, yellow(black*16)
       call settextcolor
       mov bl, 15
       mov dh, 15

       next:
            call gotoxy
            mov edx, offset EndingMsg
            call writeString
      loop L1

    mov dx, 0
    call gotoxy
    mov ecx, 3600
    mov eax, blue(blue*16)
    call settextcolor
    mov eax, " "
    L2:
       call writeChar
       loop L2
    mov dx, 0
    call gotoxy
    mov ecx, 3600
    mov eax, Red(Red*16)
    call settextcolor
    mov eax, " "
    L3:
       call writeChar
       loop L3
    mov dx, 0
    call gotoxy
    mov ecx, 3600
    mov eax, Green(Green*16)
    call settextcolor
    mov eax, " "
    L4:
       call writeChar
       loop L4

    mov dx, 0
    call gotoxy
    mov ecx, 3600
    mov eax, black(black*16)
    call settextcolor
    mov eax, " "
    L5:
       call writeChar
       loop L5
    mov AllLevelCompleted, 1

    ret
    EndingScreen endp

    checkGhostCollision proc
    mov bl, xPos
    cmp bl, ghost1XPos
    jne noCollision

    mov bl, yPos
    cmp bl, ghost1YPos
    jne noCollision

    mov bl, livesNum
    cmp bl, 0
    jne dontCall
    call LivesEndedScreen
    dontCall:
    dec livesNum
    INVOKE PlaySound, OFFSET deathSound, 0,11h
    mov xPos, 1
    mov yPos, 1
    mov direction, "d"

    noCollision:
    ret
    checkGhostCollision endp

    chkNext proc
    inc ebx
    ret
    chkNext endp

    chkBack proc
    dec ebx
    ret
    chkBack endp

    chkUp proc
    dec eax
    ret
    chkUp endp

    chkDown proc
    inc eax
    ret
    chkDown endp

    ;returns the character on map so i can place conditions on everything=========
    returnCharacterOnMap proc   
    cmp levelNumber, 0
    jne check2
    mov ecx, lengthof level1
    mov esi, offset level1
    jmp function

    check2:
    cmp levelNumber, 1
    jne check3
    mov ecx, lengthof level2
    mov esi, offset level2
    jmp function
    
    check3:
    mov ecx, lengthof level3
    mov esi, offset level3


    function:
    mul ecx
    add eax, ebx
    add esi, eax
    mov al, [esi]

    ret
    returnCharacterOnMap endp
    ;returns the character on map so i can place conditions on everything=========

    removeDotAndIncreaseScore proc
    mov ah, ' '     ;if the levelarray has '.' stored in it, that means we have to remove it now. 
    mov [esi], ah
    INVOKE PlaySound, OFFSET coinSound, 0,11h
    inc score       ;also, eating dots mean increasing the score so yay!
    ret
    removeDotAndIncreaseScore endp

    removeFRUITAndIncreaseScore proc
    mov ah, ' '     ;if the levelarray has '.' stored in it, that means we have to remove it now. 
    mov [esi], ah
    add score, 100  ;it was the fruit, so we get 100 points instead!
    ret
    removeFRUITAndIncreaseScore endp


    ;translates the array levels and draws it with asccii characters that makes it looks nicerd=====
    drawLevel proc
    mov dx, 0
    call gotoxy

    push ebp
    mov ebp, esp
    mov ecx, dword ptr [ebp+8]

    cmp levelNumber, 0
    jne level2Color
    mov ebx, blue(black*16)
    jmp forward

    level2Color:
    cmp levelNumber, 1
    jne level3Color
    mov ebx, green(black*16)
    jmp forward

    level3Color:
    mov ebx, red(black*16)

    forward:
    mov esi, [ebp+12]
    mov eax, ebx
    call SetTextColor
    loop1:
        mov al, [esi]
        cmp al, "("
        jne tryCloseBrack
        mov eax, 201
        call writeChar

        jmp chkLoop
        tryCloseBrack:
        cmp al, ")"
        jne tryEqualSign
        mov eax, 187
        call writeChar

        jmp chkLoop
        tryEqualSign:
        cmp al, "="
        jne tryAngleLeft
        mov eax, 205
        call writeChar

        jmp chkLoop
        tryAngleLeft:
        cmp al, "<"
        jne tryAngleRight
        mov eax, 200
        call writeChar

        jmp chkLoop
        tryAngleRight:
        cmp al, ">"
        jne checkI
        mov eax, 188
        call writeChar

        jmp chkLoop
        checkI:
        cmp al, "I"
        jne tryDots
        mov eax, 186
        call writeChar

        jmp chkLoop
        tryDots:
        cmp al, "."
        jne chkSpace
        mov eax, white(black * 16)
        call SetTextColor
        mov eax, "."
        call writeChar
        jmp chkLoop

        chkSpace:
        cmp al, " "
        jne chkFruit
        mov eax, " "
        call writeChar
        jmp chkLoop

        chkFruit:
        cmp al, "O"
        jne notAnything
        mov eax, yellow(black*16)
        call settextcolor
        mov eax, 254
        call writeChar
        jmp chkLoop

        notAnything:
        inc dh
        call gotoxy
        inc esi
        dec ecx
        
        chkLoop:
        mov eax, ebx
        call SetTextColor
        inc esi
        dec ecx
        jne loop1

    pop ebp
    ret 8
    drawLevel endp
    ;translates the array levels and draws it with asccii characters that makes it looks nicerd=====

    ;Creates the board drawn on the right of the screeen. Includes, instructions, name, and score board.=====
    drawRightSide proc
    mov eax, '*'
    mov dl, 85
    mov dh, 0
    call gotoxy
    mov ecx, 35
    loopy:
        call writeChar
        loop loopy

    mov ecx, 28
    loopyy:
        mov dh, cl
        call gotoxy
        call writeChar
        loop loopyy

    mov dl, 119
    mov ecx, 28
    loopyyy:
        mov dh, cl
        call gotoxy
        call writeChar
        loop loopyyy

    mov dl, 85
    mov dh, 29
    call gotoxy
    mov ecx, 35
    loopyyyy:
        call writeChar
        loop loopyyyy

    mov dl, 87
    mov dh, 2
    call gotoxy

    mov edx, offset instruct
    call WriteString
    mov dl, 87
    mov dh, 5
    call gotoxy
    mov edx, offset instruct1
    call WriteString
    mov dl, 87
    mov dh, 6
    call gotoxy
    mov edx, offset instruct2
    call WriteString
    mov dl, 87
    mov dh, 7
    call gotoxy
    mov edx, offset instruct3
    call WriteString
    mov dl, 87
    mov dh, 8
    call gotoxy
    mov edx, offset instruct4
    call WriteString
    mov dl, 87
    mov dh, 9
    call gotoxy
    mov edx, offset instruct5
    call WriteString

    mov dl, 86
    mov dh, 12
    call gotoxy
    mov ecx, 34
    mov eax, '*'
    divider:
        call WriteChar
        loop divider

    mov dl, 87
    mov dh, 14
    call gotoxy
    mov edx, offset pName
    call writeString
    mov edx, offset playerName
    call writeString

    mov dl, 87
    mov dh, 16
    call Gotoxy
    mov edx, OFFSET strScore
    call writeString

    mov dl, 87
    mov dh, 18
    call gotoxy
    mov edx, offset LivesPrompt
    call writeString

    mov dx, 0
    call gotoxy
    ret
    drawRightSide endp
    ;Creates the board drawn on the right of the screeen. Includes, instructions, name, and score board.=====

    ;-------------------------GHOSTS
    updateGhost1 proc uses eax
    mov eax, white(black*16)
    call settextcolor
    mov dl, ghost1XPos
    mov dh, ghost1YPos
    call gotoxy
    movzx eax, ghost1YPos
    movzx ebx, ghost1XPos
    call returnCharacterOnMap
    call writeChar
    ret
    updateGhost1 endp

    DrawGhost1 proc
    mov eax, black(green*16)
    call settextcolor
    mov dl, ghost1XPos
    mov dh, ghost1YPos
    call gotoxy
    mov al, GhostChar
    call writeChar

    mov eax, white(black*16)
    call settextcolor

    ret
    DrawGhost1 endp

    GhostOne proc

    DecideGhostMovement:
    mov eax, 4
    call randomRange
    mov GhostDirection1, al

    cmp GhostDirection1, 0   ;if 0, then move ghost to left
    jne ghostUp
    movzx eax, ghost1YPos
    movzx ebx, ghost1XPos
    dec ebx
    call returnCharacterOnMap   
    cmp al, "."
    jne checkSpaceLeft4Ghost
    jmp LeftFinalized
    checkSpaceLeft4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    LeftFinalized:
    call updateGhost1
    dec ghost1XPos
    jmp checkedDirection

    ghostUp:
    cmp GhostDirection1, 1   ;if 1, then move ghost up
    jne ghostRight
    movzx eax, ghost1YPos
    movzx ebx, ghost1XPos
    dec eax
    call returnCharacterOnMap
    cmp al, "."
    jne checkSpaceUp4Ghost
    jmp UpFinalized
    checkSpaceUp4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    UpFinalized:
    call updateGhost1
    dec ghost1YPos
    jmp checkedDirection 

    ghostRight:
    cmp GhostDirection1, 2   ;if 2, then move ghost to the right
    jne ghostDown
    movzx eax, ghost1YPos
    movzx ebx, ghost1XPos
    inc ebx
    call returnCharacterOnMap
    cmp al, "."
    jne checkSpaceRight4Ghost
    jmp RightFinalized
    checkSpaceRight4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    RightFinalized:
    call updateGhost1
    inc Ghost1XPos
    jmp checkedDirection

    ghostDown:
    movzx eax, ghost1YPos
    movzx ebx, ghost1XPos
    inc eax
    call returnCharacterOnMap
    cmp al, "."
    jne checkSpaceDown4Ghost
    jmp DownFinalized
    checkSpaceDown4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    DownFinalized:
    call updateGhost1
    inc Ghost1YPos


    checkedDirection:
    call DrawGhost1
    ret
    GhostOne endp

    checkGhostCollision1 proc
    mov bl, xPos
    cmp bl, ghost1XPos
    jne noCollision

    mov bl, yPos
    cmp bl, ghost1YPos
    jne noCollision

    mov bl, livesNum
    cmp bl, 0
    jne dontCall
    call LivesEndedScreen
    dontCall:
    dec livesNum
    INVOKE PlaySound, OFFSET deathSound, 0,0
    mov xPos, 1
    mov yPos, 1
    mov direction, "d"

    noCollision:
    ret
    checkGhostCollision1 endp

    ;-----------GHOST 1

    ;-----------GHOST 2
    updateGhost2 proc uses eax
    mov eax, white(black*16)
    call settextcolor
    mov dl, ghost2XPos
    mov dh, ghost2YPos
    call gotoxy
    movzx eax, ghost2YPos
    movzx ebx, ghost2XPos
    call returnCharacterOnMap
    call writeChar
    ret
    updateGhost2 endp

    DrawGhost2 proc
    mov eax, black(blue*16)
    call settextcolor
    mov dl, ghost2XPos
    mov dh, ghost2YPos
    call gotoxy
    mov al, GhostChar
    call writeChar

    mov eax, white(black*16)
    call settextcolor

    ret
    DrawGhost2 endp

    GhostTwo proc

    DecideGhostMovement:
    mov eax, 4
    call randomRange
    mov GhostDirection2, al

    cmp GhostDirection2, 0   ;if 0, then move ghost to left
    jne ghostUp
    movzx eax, ghost2YPos
    movzx ebx, ghost2XPos
    dec ebx
    call returnCharacterOnMap   
    cmp al, "."
    jne checkSpaceLeft4Ghost
    jmp LeftFinalized
    checkSpaceLeft4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    LeftFinalized:
    call updateGhost2
    dec ghost2XPos
    jmp checkedDirection

    ghostUp:
    cmp GhostDirection2, 1   ;if 1, then move ghost up
    jne ghostRight
    movzx eax, ghost2YPos
    movzx ebx, ghost2XPos
    dec eax
    call returnCharacterOnMap
    cmp al, "."
    jne checkSpaceUp4Ghost
    jmp UpFinalized
    checkSpaceUp4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    UpFinalized:
    call updateGhost2
    dec ghost2YPos
    jmp checkedDirection 

    ghostRight:
    cmp GhostDirection2, 2   ;if 2, then move ghost to the right
    jne ghostDown
    movzx eax, ghost2YPos
    movzx ebx, ghost2XPos
    inc ebx
    call returnCharacterOnMap
    cmp al, "."
    jne checkSpaceRight4Ghost
    jmp RightFinalized
    checkSpaceRight4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    RightFinalized:
    call updateGhost2
    inc Ghost2XPos
    jmp checkedDirection

    ghostDown:
    movzx eax, ghost2YPos
    movzx ebx, ghost2XPos
    inc eax
    call returnCharacterOnMap
    cmp al, "."
    jne checkSpaceDown4Ghost
    jmp DownFinalized
    checkSpaceDown4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    DownFinalized:
    call updateGhost2
    inc Ghost2YPos


    checkedDirection:
    call DrawGhost2
    ret
    GhostTwo endp

    chechGhostCollision2 proc
    mov bl, xPos
    cmp bl, ghost2XPos
    jne noCollision

    mov bl, yPos
    cmp bl, ghost2YPos
    jne noCollision

    mov bl, livesNum
    cmp bl, 0
    jne dontCall
    call LivesEndedScreen
    dontCall:
    dec livesNum
    INVOKE PlaySound, OFFSET deathSound, 0,0
    mov xPos, 1
    mov yPos, 1
    mov direction, "d"

    noCollision:
    ret
    chechGhostCollision2 endp
    ;-----------GHOST 2

    ;-----------GHOST 3
    updateGhost3 proc uses eax
    mov eax, white(black*16)
    call settextcolor
    mov dl, ghost3XPos
    mov dh, ghost3YPos
    call gotoxy
    movzx eax, ghost3YPos
    movzx ebx, ghost3XPos
    call returnCharacterOnMap
    call writeChar
    ret
    updateGhost3 endp

    DrawGhost3 proc
    mov eax, black(Red*16)
    call settextcolor
    mov dl, ghost3XPos
    mov dh, ghost3YPos
    call gotoxy
    mov al, GhostChar
    call writeChar

    mov eax, white(black*16)
    call settextcolor

    ret
    DrawGhost3 endp

    GhostThree proc

    DecideGhostMovement:
    mov eax, 4
    call randomRange
    mov GhostDirection3, al

    cmp GhostDirection3, 0   ;if 0, then move ghost to left
    jne ghostUp
    movzx eax, ghost3YPos
    movzx ebx, ghost3XPos
    dec ebx
    call returnCharacterOnMap   
    cmp al, "."
    jne checkSpaceLeft4Ghost
    jmp LeftFinalized
    checkSpaceLeft4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    LeftFinalized:
    call updateGhost3
    dec ghost3XPos
    jmp checkedDirection

    ghostUp:
    cmp GhostDirection3, 1   ;if 1, then move ghost up
    jne ghostRight
    movzx eax, ghost3YPos
    movzx ebx, ghost3XPos
    dec eax
    call returnCharacterOnMap
    cmp al, "."
    jne checkSpaceUp4Ghost
    jmp UpFinalized
    checkSpaceUp4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    UpFinalized:
    call updateGhost3
    dec ghost3YPos
    jmp checkedDirection 

    ghostRight:
    cmp GhostDirection3, 2   ;if 2, then move ghost to the right
    jne ghostDown
    movzx eax, ghost3YPos
    movzx ebx, ghost3XPos
    inc ebx
    call returnCharacterOnMap
    cmp al, "."
    jne checkSpaceRight4Ghost
    jmp RightFinalized
    checkSpaceRight4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    RightFinalized:
    call updateGhost3
    inc Ghost3XPos
    jmp checkedDirection

    ghostDown:
    movzx eax, ghost3YPos
    movzx ebx, ghost3XPos
    inc eax
    call returnCharacterOnMap
    cmp al, "."
    jne checkSpaceDown4Ghost
    jmp DownFinalized
    checkSpaceDown4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    DownFinalized:
    call updateGhost3
    inc Ghost3YPos


    checkedDirection:
    call DrawGhost3
    ret
    GhostThree endp

    chechGhostCollision3 proc
    mov bl, xPos
    cmp bl, ghost3XPos
    jne noCollision

    mov bl, yPos
    cmp bl, ghost3YPos
    jne noCollision

    mov bl, livesNum
    cmp bl, 0
    jne dontCall
    call LivesEndedScreen
    dontCall:
    dec livesNum
    INVOKE PlaySound, OFFSET deathSound, 0,0
    mov xPos, 1
    mov yPos, 1
    mov direction, "d"

    noCollision:
    ret
    chechGhostCollision3 endp
    ;-----------GHOST 3

    ;-----------GHOST 4
    updateGhost4 proc uses eax
    mov eax, white(black*16)
    call settextcolor
    mov dl, ghost4XPos
    mov dh, ghost4YPos
    call gotoxy
    movzx eax, ghost4YPos
    movzx ebx, ghost4XPos
    call returnCharacterOnMap
    call writeChar
    ret
    updateGhost4 endp

    DrawGhost4 proc
    mov eax, black(gray*16)
    call settextcolor
    mov dl, ghost4XPos
    mov dh, ghost4YPos
    call gotoxy
    mov al, GhostChar
    call writeChar

    mov eax, white(black*16)
    call settextcolor

    ret
    DrawGhost4 endp

    GhostFour proc

    DecideGhostMovement:
    mov eax, 4
    call randomRange
    mov GhostDirection4, al

    cmp GhostDirection4, 0   ;if 0, then move ghost to left
    jne ghostUp
    movzx eax, ghost4YPos
    movzx ebx, ghost4XPos
    dec ebx
    call returnCharacterOnMap   
    cmp al, "."
    jne checkSpaceLeft4Ghost
    jmp LeftFinalized
    checkSpaceLeft4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    LeftFinalized:
    call updateGhost4
    dec ghost4XPos
    jmp checkedDirection

    ghostUp:
    cmp GhostDirection4, 1   ;if 1, then move ghost up
    jne ghostRight
    movzx eax, ghost4YPos
    movzx ebx, ghost4XPos
    dec eax
    call returnCharacterOnMap
    cmp al, "."
    jne checkSpaceUp4Ghost
    jmp UpFinalized
    checkSpaceUp4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    UpFinalized:
    call updateGhost4
    dec ghost4YPos
    jmp checkedDirection 

    ghostRight:
    cmp GhostDirection4, 2   ;if 2, then move ghost to the right
    jne ghostDown
    movzx eax, ghost4YPos
    movzx ebx, ghost4XPos
    inc ebx
    call returnCharacterOnMap
    cmp al, "."
    jne checkSpaceRight4Ghost
    jmp RightFinalized
    checkSpaceRight4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    RightFinalized:
    call updateGhost4
    inc Ghost4XPos
    jmp checkedDirection

    ghostDown:
    movzx eax, ghost4YPos
    movzx ebx, ghost4XPos
    inc eax
    call returnCharacterOnMap
    cmp al, "."
    jne checkSpaceDown4Ghost
    jmp DownFinalized
    checkSpaceDown4Ghost:
    cmp al, " "
    jne DecideGhostMovement

    DownFinalized:
    call updateGhost4
    inc Ghost4YPos


    checkedDirection:
    call DrawGhost4
    ret
    GhostFour endp

    chechGhostCollision4 proc
    mov bl, xPos
    cmp bl, ghost4XPos
    jne noCollision

    mov bl, yPos
    cmp bl, ghost4YPos
    jne noCollision

    mov bl, livesNum
    cmp bl, 0
    jne dontCall
    call LivesEndedScreen
    dontCall:
    dec livesNum
    INVOKE PlaySound, OFFSET deathSound, 0,0
    mov xPos, 1
    mov yPos, 1
    mov direction, "d"

    noCollision:
    ret
    chechGhostCollision4 endp
    ;-----------GHOST 4
    ;-------------------------GHOSTS

    pauseScreen proc
    mov dl, 87
    mov dh, 27
    call gotoxy
    mov edx, offset pausePrompt1
    call writeString
    mov dl, 87
    mov dh, 28
    call gotoxy
    mov edx, offset pausePrompt2
    call writeString

    call ReadChar

    mov dl, 87
    mov dh, 27
    call gotoxy
    mov edx, offset pausePrompts1
    call writeString
    mov dl, 87
    mov dh, 28
    call gotoxy
    mov edx, offset pausePrompts2
    call writeString


    ret
    pauseScreen endp

    END main