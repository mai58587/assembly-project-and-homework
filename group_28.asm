INCLUDE Irvine32.inc

main          EQU start@0


void_print proto,
	source:PTR BYTE

win_or_lose proto ,
    p_i:DWORD,
	p_j:DWORD,
	hunter1_x:DWORD,
	hunter1_y:DWORD,
	hunter2_x:DWORD,
	hunter2_y:DWORD,
	hunter3_x:DWORD,
	hunter3_y:DWORD,
	win_string:PTR BYTE,
	lose_string:PTR BYTE

	
.data
	count DWORD 0
	test1 BYTE "test1",0
	notrun BYTE "not run",0
	win_string BYTE "You Win",0
	lose_string BYTE "You Lose",0
	
	;doungoen1 BYTE "###########p       ##        ##  # #   ##  # #   ##  # #   ##  # #   ##        ##        ##       h###########",0
	dungeon0 BYTE "##########",
				  "#p      z#",
				  "#        #",
				  "#  # #   #",
				  "#  # #   #",
				  "#  # #   #",
				  "#  # #   #",
				  "#        #",
				  "#        #",
				  "#H      h#",
				  "##########",0
				   
	dungeon BYTE	"####################",
					"#      #z          #",
					"#      #           #",
					"#  # #      #### # #",
					"#       ##  # H# # #",
					"#       ##  # ## # #",
					"#  ###  ##  #    # #",
					"#  #        ###### #",
					"#  #######         #",
					"#                  #",
					"#  #### #   ###### #",
					"#  # p# #   #      #",
					"#  # ## #   #      #",
					"#  #    #   #h     #",
					"####################",0
					;寬度20，長度15，
					;p_i:11 p_j:5 
				   ; hunter1_x:13 hunter2_y:13 
					;hunter2_x:4 hunter2_y:14 
					; hunter3_x:1 hunter3_y:8
				   
	dungeon2 BYTE 	"####################",
					"#   #       #    #H#",
					"##   #  #    #  #  #",
					"#p#    # #  #  #   #",
					"#  #  #   #   #    #",
					"#   #  #   # #     #",
					"#    #  #   #     ##",
					"#  #  #  #       # #",
					"# ###  #  #     #  #",
					"#  #  #  #  #  #   #",
					"##  #    #   #   # #",
					"#       #   # # #  #",
					"# # #  #   #   #   #",
					"#z# # #      #    h#",
					"####################",0
				   
				   ;寬度20，長度20，p_i:16 p_j:5 ； hunter1_x:18 hunter2_y:13 ； hunter2_x:8 hunter2_y:14 ； hunter3_x:1 hunter3_y:8未修座標
				   
	dungeon3 BYTE  "####################",
				   "#    # # # #       #",
				   "#   ## ### ##      #",
				   "#  ###  p  ###     #",
				   "#    ##   ##       #",
				   "#  ###  z  ###    ##",
				   "#   ## ### ##    # #",
				   "#    # # # #    #  #",
				   "#    #             #",
				   "#   ###   ###  #  ##",
				   "#  ## ##   #    #  #",
				   "#   ###  # #     # #",
				   "#    #  #   #     ##",
				   "#     # H # h #    #",
				   "####################",0

				;p_i:4 p_j:8 ； hunter1_x:18 hunter1_y:8 ； hunter2_x:18 hunter2_y:12 ； hunter3_x:8 hunter3_y:8未修座標

				   
						   
	p_i DWORD 11
	p_j	DWORD 5
	hunter1_x DWORD 13
	hunter1_y DWORD 13
	hunter2_x DWORD 4
	hunter2_y DWORD 14
	hunter3_x DWORD 1
	hunter3_y DWORD 8
	
	
	tag_lose BYTE 0
	
.code

main PROC
	INVOKE void_print,			
	  ADDR dungeon
	
GameStart:
	mov eax,0
	mov ebx,0
	mov edx,0
	
	mov eax,count
	.IF	eax==40
		mov edx,offset win_string 
		call WriteString
		jmp L_End
	.ENdIF
	
	call ReadChar
	.IF ax==011Bh
		jmp L_End
	.ENdIF
	
	push eax
	
	call Clrscr
	;call WriteInt
	;call crlf
	;mov eax,0
	mov esi,offset dungeon

	

;--------------以下是hunter1移動-------------------
		;push edx
		;mov edx,offset notrun
		;call WriteString
		;call crlf
		;pop edx

		mov eax,4
		call RandomRange
		cmp eax,0;01
		je case1
		jmp wait1
		
case1:		
		mov eax,hunter1_x
		mov edx,20
		mul edx	;hunter1_x*10+hunter1_y+1
		add eax,hunter1_y
		add eax,1
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			
			mov eax,hunter1_x
			
			mov edx,20
			mul edx	;hunter1_x*10+hunter1_y
			add eax,hunter1_y
			mov BYTE PTR[esi+eax],0d
			
			
			mov eax,hunter1_x
			mov edx,20
			mul edx	;hunter1_x*10+hunter1_y+1
			add eax,hunter1_y
			add eax,1
			
			
			mov BYTE PTR[esi+eax],'h'
		
			inc hunter1_y
		
		.EndIF
	
	jmp L_Hunter2
	

wait1:
	

		cmp eax,1
		je case2
		jmp wait2
		
case2:	
		mov eax,hunter1_x
	
		mov edx,20
		mul edx	;(hunter1_x+1)*10+hunter1_y
		add eax,20
		add eax,hunter1_y
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
		
		.else				;沒有遇到柵欄，可以跑
			
			mov eax,hunter1_x
			mov edx,20
			mul edx	;hunter1_x*10+hunter1_y
			add eax,hunter1_y
			mov BYTE PTR[esi+eax]," "
			
			
			mov eax,hunter1_x
			add eax,1
			mov edx,20
			mul edx	;(hunter1_x+1)*10+hunter1_y
			add eax,hunter1_y
	
			
			mov BYTE PTR[esi+eax],'h'
		
			inc hunter1_x
		.EndIF
	
	jmp L_Hunter2
	
wait2:
	
	
	
	
		cmp eax,2
		je case3
		jmp wait3
	
case3:
	
		mov eax,hunter1_x
		mov edx,20
		mul edx	;hunter1_x*10+hunter1_y-1
		add eax,hunter1_y
		sub eax,1
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			
			mov eax,hunter1_x
			mov edx,20
			mul edx	;hunter1_x*10+hunter1_y
			add eax,hunter1_y
			mov BYTE PTR[esi+eax]," "
			
			
			mov eax,hunter1_x
			mov edx,20
			mul edx	;hunter1_x*10+hunter1_y-1
			add eax,hunter1_y
			sub eax,1
		
			
			mov BYTE PTR[esi+eax],'h'
			sub hunter1_y,1
		.EndIF
	
	jmp L_Hunter2
	
wait3:	
	
		cmp eax,3
		je case4
		jmp wait4
case4:	
	
		mov eax,hunter1_x
		
		mov edx,20
		mul edx	;(hunter1_x-1)*10+hunter1_y
		sub eax,20
		add eax,hunter1_y
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			mov eax,hunter1_x
			mov edx,20
			mul edx	;hunter1_x*10+hunter1_y
			add eax,hunter1_y
			mov BYTE PTR[esi+eax]," "
			
			
			mov eax,hunter1_x
			sub eax,1
			mov edx,20
			mul edx	;(hunter1_x-1)*10+hunter1_y
			add eax,hunter1_y

			
			mov BYTE PTR[esi+eax],'h'
			sub hunter1_x,1
		.EndIF
	
	jmp L_Hunter2	

	
wait4:

L_Hunter2:
	;--------------以下是獵人2移動---------
	
		mov eax,4
		call RandomRange
	
		cmp eax,0;01
		je case9
		jmp wait9
		
case9:		
		mov eax,hunter2_x
		mov edx,20
		mul edx	;hunter2_x*10+hunter2_y+1
		add eax,hunter2_y
		add eax,1
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			
			mov eax,hunter2_x
			
			mov edx,20
			mul edx	;hunter2_x*10+hunter2_y
			add eax,hunter2_y
			mov BYTE PTR[esi+eax],0d
			
			
			mov eax,hunter2_x
			mov edx,20
			mul edx	;hunter2_x*10+hunter2_y+1
			add eax,hunter2_y
			add eax,1
			
			
			mov BYTE PTR[esi+eax],'H'
		
			inc hunter2_y
		
		.EndIF
	
	jmp L_Hunter3
	

wait9:

		cmp eax,1
		je case10
		jmp wait10
		
case10:	
		mov eax,hunter2_x
	
		mov edx,20
		mul edx	;(hunter2_x+1)*10+hunter2_y
		add eax,20
		add eax,hunter2_y
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			
			mov eax,hunter2_x
			mov edx,20
			mul edx	;hunter2_x*10+hunter2_y
			add eax,hunter2_y
			mov BYTE PTR[esi+eax]," "
			
			
			mov eax,hunter2_x
			add eax,1
			mov edx,20
			mul edx	;(hunter2_x+1)*10+hunter2_y
			add eax,hunter2_y
	
			
			mov BYTE PTR[esi+eax],'H'
		
			inc hunter2_x
		.EndIF
	
	jmp L_Hunter3
	
wait10:
	
	
		cmp eax,2
		je case11
		jmp wait11
	
case11:
	
		mov eax,hunter2_x
		mov edx,20
		mul edx	;hunter2_x*10+hunter2_y-1
		add eax,hunter2_y
		sub eax,1
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			
			mov eax,hunter2_x
			mov edx,20
			mul edx	;hunter2_x*10+hunter2_y
			add eax,hunter2_y
			mov BYTE PTR[esi+eax]," "
			
			
			mov eax,hunter2_x
			mov edx,20
			mul edx	;hunter2_x*10+hunter2_y-1
			add eax,hunter2_y
			sub eax,1
		
			
			mov BYTE PTR[esi+eax],'H'
			sub hunter2_y,1
		.EndIF
	
	jmp L_Hunter3
	
wait11:	
	
		cmp eax,3
		je case12
		jmp wait12
case12:	
	
		mov eax,hunter2_x
		
		mov edx,20
		mul edx	;(hunter2_x-1)*10+hunter2_y
		sub eax,20
		add eax,hunter2_y
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			mov eax,hunter2_x
			mov edx,20
			mul edx	;hunter2_x*10+hunter2_y
			add eax,hunter2_y
			mov BYTE PTR[esi+eax]," "
			
			
			mov eax,hunter2_x
			sub eax,1
			mov edx,20
			mul edx	;(hunter2_x-1)*10+hunter2_y
			add eax,hunter2_y

			
			mov BYTE PTR[esi+eax],'H'
			sub hunter2_x,1
		.EndIF
	
	jmp L_Hunter3	

	
wait12:
	
L_Hunter3:
	;--------------以下是獵人3移動---------
	
		mov eax,4
		call RandomRange
		cmp eax,0;01
		je case13
		jmp wait13
		
case13:		
		mov eax,hunter3_x
		mov edx,20
		mul edx	;hunter3_x*10+hunter3_y+1
		add eax,hunter3_y
		add eax,1
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			
			mov eax,hunter3_x
			
			mov edx,20
			mul edx	;hunter3_x*10+hunter3_y
			add eax,hunter3_y
			mov BYTE PTR[esi+eax],0d
			
			
			mov eax,hunter3_x
			mov edx,20
			mul edx	;hunter3_x*10+hunter3_y+1
			add eax,hunter3_y
			add eax,1
			
			
			mov BYTE PTR[esi+eax],'z'
		
			inc hunter3_y
		
		.EndIF
	
	jmp L_player
	

wait13:
	

		cmp eax,1
		je case14
		jmp wait14
		
case14:	
		mov eax,hunter3_x
	
		mov edx,20
		mul edx	;(hunter3_x+1)*10+hunter3_y
		add eax,20
		add eax,hunter3_y
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			
			mov eax,hunter3_x
			mov edx,20
			mul edx	;hunter3_x*10+hunter3_y
			add eax,hunter3_y
			mov BYTE PTR[esi+eax]," "
			
			
			mov eax,hunter3_x
			add eax,1
			mov edx,20
			mul edx	;(hunter3_x+1)*10+hunter3_y
			add eax,hunter3_y
	
			
			mov BYTE PTR[esi+eax],'z'
		
			inc hunter3_x
		.EndIF
	
	jmp L_player
	
wait14:
		cmp eax,2
		je case15
		jmp wait15
	
case15:
	
		mov eax,hunter3_x
		mov edx,20
		mul edx	;hunter3_x*10+hunter3_y-1
		add eax,hunter3_y
		sub eax,1
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			
			mov eax,hunter3_x
			mov edx,20
			mul edx	;hunter3_x*10+hunter3_y
			add eax,hunter3_y
			mov BYTE PTR[esi+eax]," "
			
			
			mov eax,hunter3_x
			mov edx,20
			mul edx	;hunter3_x*10+hunter3_y-1
			add eax,hunter3_y
			sub eax,1
		
			
			mov BYTE PTR[esi+eax],'z'
			sub hunter3_y,1
		.EndIF
	
	jmp L_player
	
wait15:	
	
		cmp eax,3
		je case16
		jmp wait16
case16:	
	
		mov eax,hunter3_x
		
		mov edx,20
		mul edx	;(hunter3_x-1)*10+hunter3_y
		sub eax,20
		add eax,hunter3_y
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			mov eax,hunter3_x
			mov edx,20
			mul edx	;hunter3_x*10+hunter3_y
			add eax,hunter3_y
			mov BYTE PTR[esi+eax]," "
			
			
			mov eax,hunter3_x
			sub eax,1
			mov edx,20
			mul edx	;(hunter3_x-1)*10+hunter3_y
			add eax,hunter3_y

			
			mov BYTE PTR[esi+eax],'z'
			sub hunter3_x,1
		.EndIF
	
	jmp L_player	

wait16:

L_player:
	;-----------以下是角色移動-----------;
	pop eax

		cmp eax,4D00h;01
		je case5
		jmp wait5
		
case5:		
		mov eax,p_i
		mov edx,20
		mul edx	;p_i*10+p_j+1
		add eax,p_j
		add eax,1
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			
			mov eax,p_i
			
			mov edx,20
			mul edx	;p_i*10+p_j
			add eax,p_j
			mov BYTE PTR[esi+eax],0d
			
			
			mov eax,p_i
			mov edx,20
			mul edx	;p_i*10+p_j+1
			add eax,p_j
			add eax,1
			
			
			mov BYTE PTR[esi+eax],'p'
		
			inc p_j
		
		.EndIF
	
	jmp L_Hunter_End
	

wait5:
	

		cmp eax,5000h
		je case6
		jmp wait6
		
case6:	
		mov eax,p_i
	
		mov edx,20
		mul edx	;(p_i+1)*10+p_j
		add eax,20
		add eax,p_j
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			
			mov eax,p_i
			mov edx,20
			mul edx	;p_i*10+p_j
			add eax,p_j
			mov BYTE PTR[esi+eax]," "
			
			
			mov eax,p_i
			add eax,1
			mov edx,20
			mul edx	;(p_i+1)*10+p_j
			add eax,p_j
	
			
			mov BYTE PTR[esi+eax],'p'
		
			inc p_i
		.EndIF
	
	jmp L_Hunter_End
	
wait6:
	
	
	
	
		cmp eax,4B00h
		je case7
		jmp wait7
	
case7:
	
		mov eax,p_i
		mov edx,20
		mul edx	;p_i*10+p_j-1
		add eax,p_j
		sub eax,1
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			
			mov eax,p_i
			mov edx,20
			mul edx	;p_i*10+p_j
			add eax,p_j
			mov BYTE PTR[esi+eax]," "
			
			
			mov eax,p_i
			mov edx,20
			mul edx	;p_i*10+p_j-1
			add eax,p_j
			sub eax,1
		
			
			mov BYTE PTR[esi+eax],'p'
			sub p_j,1
		.EndIF
	
	jmp L_Hunter_End
	
wait7:	
	
		cmp eax,4800h
		je case8
		jmp wait8
case8:	
	
		mov eax,p_i
		
		mov edx,20
		mul edx	;(p_i-1)*10+p_j
		sub eax,20
		add eax,p_j
		
		mov ebx,[esi+eax]
		.IF bl == 35d		;if 
			
		.else				;沒有遇到柵欄，可以跑
			mov eax,p_i
			mov edx,20
			mul edx	;p_i*10+p_j
			add eax,p_j
			mov BYTE PTR[esi+eax]," "
			
			
			mov eax,p_i
			sub eax,1
			mov edx,20
			mul edx	;(p_i-1)*10+p_j
			add eax,p_j

			
			mov BYTE PTR[esi+eax],'p'
			sub p_i,1
		.EndIF
	
	jmp L_Hunter_End	

	
wait8:
	
	
L_Hunter_End:

;------------------------獵人和角色移動部分結束-----------------------------;

;------------------------比較輸贏-----------------------------;
	push ebx
	mov ebx,count
	inc ebx
	mov count,ebx
	pop ebx
	
	mov al,1

	
	INVOKE win_or_lose,
	p_i,
	p_j,
	hunter1_x,
	hunter1_y,
	hunter2_x,
	hunter2_y,
	hunter3_x,
	hunter3_y,
	OFFSET win_string,
	OFFSET lose_string
	
	
	
	;call crlf
	cmp al,0
	jne to_ptint
	je has_lost

;------------------------列印迷宮-----------------------------;
to_ptint:	
	INVOKE void_print,			; copy string_1 to string_2
	  ADDR dungeon
	  
	call crlf
	jmp GameStart

	
has_lost:
	push edx
	mov edx,offset lose_string
	call WriteString
	pop edx
	call crlf
	;call WaitMsg

L_End:	

	call crlf
	call WaitMsg
    exit

main ENDP

;--------函式庫-------------
;--------列印函式-------------
void_print PROC ,
	source:PTR BYTE
	
	
	;push ebx
	
	;mov ecx,10
	;push ecx
	mov ecx,15
	mov esi,source
	
loop_i:
	push ecx
	
	mov ecx,20
	loop_j:
		mov eax,[esi]
		call WriteChar 
		add esi,1
	
	loop loop_j
	call Crlf
	pop ecx
		
loop loop_i
	
	ret

void_print ENDP
;-----輸贏函式-------
win_or_lose proc USES ebx ecx,
    px:DWORD,
	py:DWORD,
	h1x:DWORD,
	h1y:DWORD,
	h2x:DWORD,
	h2y:DWORD,
	h3x:DWORD,
	h3y:DWORD,
	win:PTR BYTE,
	lose:PTR BYTE,

	
	mov eax,0
	mov ebx,0
p_h1_x:
	mov eax,px
	mov ebx,h1x
	cmp eax,h1x
	je p_h1_y
	jne p_h2_x
p_h1_y:

	mov eax,py
	mov ebx,h1y
	cmp eax,h1y
	je islose
	jne p_h2_x

p_h2_x:
	mov eax,px
	mov ebx,h2x
	cmp eax,h2x
	je p_h2_y
	jne p_h3_x
p_h2_y:
	mov eax,py
	mov ebx,h2y
	cmp eax,h2y
	je islose
	jne p_h3_x
	
p_h3_x:
	mov eax,px
	mov ebx,h3x
	cmp eax,h3x
	je p_h3_y
	jne no_lose
	
p_h3_y:
	mov eax,py
	mov ebx,h3y
	cmp eax,h3y
	je islose
	jne no_lose

islose:
	mov al,0
	jmp end_win_or_lose
	
no_lose:
	;mov edx,win
	;call WriteString
	;call crlf
	mov al,1

end_win_or_lose:
	
	ret
win_or_lose ENDP





END main

