/*
Author: Roman Fursov, fursovroman95@gmail.com

Insert Polish accents when you pressing a hotkey.
Useful when you have multiple latin keyboards (spanish and polish, e.g.) and want to keep only one of them

This script provides two types of using strategy (edit script to keep only one if needed):
a) Serial input - default hotkey is Win+z
    1) press the hotkey
    2) press the key (letter can be capitalized) you want to accent OR press the spacebar - the previous letter will then magically become "accented".
b) Simultaneous input - default hotkey is AltGr (AltGr+Shift for capitalized)
    1) Press hotkey and letter (capitalized or not) simultaneously

Letters:
ą Ą ó Ó ż Ż ń Ń ł Ł ę Ę Ź ź ś Ś ć Ć

hotkey +"a" = "ą"
hotkey + "A" = "Ą"
hotkey + "c" = "ć"
hotkey + "C" = "Ć"
hotkey + "z" = "ź"
hotkey + "x" = "ż"
...etc.

Unicode codes map:
ą   U+0105  Ą   U+0104
ć   U+0107  Ć   U+0106
ę   U+0119  Ę   U+0118
ł   U+0142  Ł   U+0141
ń   U+0144  Ń   U+0143
ó   U+00f3  Ó   U+00d3
ś   U+015b  Ś   U+015a
ź   U+017a  Ź   U+0179
ż   U+017c  Ż   U+017b
*/

; Serial input BEGIN
#z::
StringCaseSense, On
; After pressing the hotkey, capture next typed letter (L1 = length 1) to key variable.
; T3 = Timeout 3 sec. C = case sensitive
; Only letters in the end terminates the Input
; See Input function documentation for additional info
Input key, L1 T3 C, {Space}, a,A,e,E,n,N,o,O,l,L,s,S,z,Z,x,X
If ErrorLevel = EndKey:Space
{
   ClipSaved := ClipboardAll
   Clipboard=
   Send +{Left}^c
   key = %Clipboard%
   Replace(key)
   Clipboard = %ClipSaved%
   ClipSaved=
   Return
}
If ErrorLevel <> Match
   Return
Replace(key)
Return

Replace(key)
{
    IfEqual key, a, Send {U+0105}
    IfEqual key, A, Send {U+0104}
    IfEqual key, c, Send {U+0107}
    IfEqual key, C, Send {U+0106}
    IfEqual key, e, Send {U+0119}
    IfEqual key, E, Send {U+0118}
    IfEqual key, l, Send {U+0142}
    IfEqual key, L, Send {U+0141}
    IfEqual key, n, Send {U+0144}
    IfEqual key, N, Send {U+0143}
    IfEqual key, o, Send {U+00f3}
    IfEqual key, O, Send {U+00d3}
    IfEqual key, s, Send {U+015b}
    IfEqual key, S, Send {U+015a}
    IfEqual key, z, Send {U+017a}
    IfEqual key, Z, Send {U+0179}
    IfEqual key, x, Send {U+017c}
    IfEqual key, X, Send {U+017b}
}

; Serial input END


; Simultaneous input BEGIN
*>^a::ReplaceKeySimultaneously("U+0105", "U+104")
*>^c::ReplaceKeySimultaneously("U+0107", "U+106")
*>^e::ReplaceKeySimultaneously("U+0119", "U+118")
*>^l::ReplaceKeySimultaneously("U+0142", "U+141")
*>^n::ReplaceKeySimultaneously("U+0144", "U+143")
*>^o::ReplaceKeySimultaneously("U+00f3", "U+00d3")
*>^s::ReplaceKeySimultaneously("U+015b", "U+015a")
*>^x::ReplaceKeySimultaneously("U+017a", "U+0179")
*>^z::ReplaceKeySimultaneously("U+017c", "U+017b")

ReplaceKeySimultaneously(LowerKey, UpperKey)
{
    if GetKeyState("Shift")
        Send, {%UpperKey%}
    else
        Send, {%LowerKey%}
    Return
}

; Simultaneous input END