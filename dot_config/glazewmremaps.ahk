#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Remap Win+Shift+Arrow keys to Alt+Shift+Arrow keys

#IfWinActive ; This will make the hotkeys work in all windows

; Remap Win+Arrows
#Left::Send !h
#Right::Send !;
#Up::Send !k
#Down::Send !j

; Remap Win+Shift+Arrows to Alt+Shift+hjk;     !=alt  +=shift
#+Left::Send !+h
#+Right::Send !+;
#+Up::Send !+k
#+Down::Send !+j

; Remap Win+Shift+a to Alt+Shift+a to move workspaces across monitors
#+a::Send !+a
#+f::Send !+f


; Remap Win+1..9 to Alt+1..9

#1::Send !1
#2::Send !2
#3::Send !3
#4::Send !4
#5::Send !5
#6::Send !6
#7::Send !7
#8::Send !8
#9::Send !9
#0::Send !5

; Remap Win+Shift+1..9 to Alt+Shift+1..9
#+1::Send !+1
#+2::Send !+2
#+3::Send !+3
#+4::Send !+4
#+5::Send !+5
#+6::Send !+6
#+7::Send !+7
#+8::Send !+8
#+9::Send !+9

; Remap Win+Enter
#Enter::Send !c

; Remap Win+Shit+p   pause glaze
#+p::Send !+p 

; Remap Win+d to workspace back and forth
#d::Send !d

; Remap Win+f to fullscreen
#f::Send !f

; Remap Win+shift+r to alt+r   Enter rezise mode
#+t::Send !r

; Force quit
#+q::Send !+q

; Reload config
#+r::Send !+r

#IfWinActive

