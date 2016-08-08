#UseHook
!VKC0SC029::Return 	; grave -> the grave ` accent gave some probs, used the virtualkey + scancode instead
!e::Return         	; acute
!i::Return				 	; circumflex
!n::Return         	; tilde
!u::Return				 	; umlaut

;                  1 2 3 4 5 6 7 8 9 1
;                                    0
;              r   g G a A c C t T u U
*a::diacritic("a","�,�,�,�,�,�,�,�,�,�")
*e::diacritic("e","�,�,�,�,�,�,e,E,�,�")
*i::diacritic("i","�,�,�,�,�,�,i,I,�,�")
*o::diacritic("o","�,�,�,�,�,�,�,�,�,�")
*u::diacritic("u","�,�,�,�,�,�,u,U,�,�")
*n::diacritic("n","n,N,n,N,n,N,�,�,n,N")
*y::diacritic("y","y,Y,y,Y,y,Y,y,Y,�,?")

diacritic(regular,accentedCharacters) {
	StringSplit, char, accentedCharacters, `,
	graveOption            := char1
	graveShiftOption       := char2
	acuteOption      			 := char3
	acuteShiftOption       := char4
	circumflexOption       := char5
	circumflexShiftOption  := char6
	tildeOption            := char7
	tildeShiftOption       := char8
	umlautOption           := char9
	umlautShiftOption      := char10

	if (A_PriorHotKey = "!VKC0SC029" && A_TimeSincePriorHotkey < 2000) {
		if (GetKeyState("Shift")) {
			SendInput % graveShiftOption
		} else {
			SendInput % graveOption
		}
	} else if (A_PriorHotKey = "!e" && A_TimeSincePriorHotkey < 2000) {
		if (GetKeyState("Shift")) {
			SendInput % acuteShiftOption
		} else {
			SendInput % acuteOption
		}
	} else if (A_PriorHotKey = "!i" && A_TimeSincePriorHotkey < 2000) {
		if (GetKeyState("Shift")) {
			SendInput % circumflexShiftOption
		} else {
			SendInput % circumflexOption
		}
	} else if (A_PriorHotKey = "!n" && A_TimeSincePriorHotkey < 2000) {
		if (GetKeyState("Shift")) {
			SendInput % tildeShiftOption
		} else {
			SendInput % tildeOption
		}
	} else if (A_PriorHotKey = "!u" && A_TimeSincePriorHotkey < 2000) {
		if (GetKeyState("Shift")) {
			SendInput % umlautShiftOption
		} else {
			SendInput % umlautOption
		}
	} else {
		Pressed := ""

		if (GetKeyState("Shift", "P")) {
			Pressed := Pressed . "+"
		}

		if (GetKeyState("LAlt")) {
			Pressed := Pressed . "<!"
		}

		if (GetKeyState("RAlt")) {
			Pressed := Pressed . ">!"
		}

		if (GetKeyState("RCtrl")) {
			Pressed := Pressed . "^"
		}

		if (GetKeyState("LCtrl")) {
			Pressed := Pressed . "^"
		}

		Pressed := Pressed . regular
		SendInput %Pressed%
	}
}
