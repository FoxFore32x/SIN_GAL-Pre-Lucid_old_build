function scr_bindKey(_name, _dvc = -1, _setValVar){
	/*if (readingKeybind == true){
		_setValVar = "...";
		var _newKeybind = inputChangeKeybind(_name, _dvc);
		if(_newKeybind != -1){
			inputReplace(_name, _newKeybind);
			_setValVar = chr(oInput.keybindMap[$ _name][0].key);
			readingKeybind = false;
		}
	}*/
	
	if (global.keyJump2All && !readingKeybind){
		readingKeybind = true;
		keybindWaitRelease = true;
	}
				
	if (readingKeybind == true){
		_setValVar = "...";
					
		if (keybindWaitRelease) {
			if (jumpRel) {
				keybindWaitRelease = false;
			}
		} else {
			if(keyboard_check_pressed(vk_anykey)){
				var _newKeybind = inputChangeKeybind(_name, _dvc);
				if(_newKeybind != -1){
					inputReplace(_name, _newKeybind);
					_setValVar = chr(oInput.keybindMap[$ _name][0].key);
					readingKeybind = false;
					keybindFinished = true;
				}
			}
		}
	}
}