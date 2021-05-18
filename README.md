# Polish special letters for any keyboard layout

This scripts inserts Polish accents when you press a hotkey.

Useful when you have multiple latin keyboards (spanish and polish, e.g.) and want to keep only one of them

This script provides two types of using strategy (edit script to keep only one if needed):

* Serial input - default hotkey is Win+z
    1) press the hotkey
    2) press the key (letter can be capitalized) you want to accent OR press the spacebar - the previous letter will then magically become "accented".

* Simultaneous input - default hotkey is AltGr (AltGr+Shift for capitalized)
    1) Press hotkey and letter (capitalized or not) simultaneously

Letters: `ą Ą ó Ó ż Ż ń Ń ł Ł ę Ę Ź ź ś Ś ć Ć`

```
hotkey +"a" = "ą"
hotkey + "A" = "Ą"
hotkey + "c" = "ć"
hotkey + "C" = "Ć"
hotkey + "z" = "ź"
hotkey + "x" = "ż"
...etc.
```

## How to change the special key

1. Read autohotkey docs for special characters
2. For Serial input you need to change `#z::` to what you want
3. For Simultaneous input change - replace every `*>^` with your own definition

## Installation

1) Install https://www.autohotkey.com/
2) Add the script to the `C:\Users\<username>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`
    1) Additionally, you can just double-click the script to test it out
3. Voilà!
