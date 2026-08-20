function scr_bindKey(_name, _dvc = -1, _setValVar){
	if (readingKeybind == true){
		_setValVar = "...";
		var _newKeybind = inputChangeKeybind(_name, _dvc);
		if(_newKeybind != -1){
			inputReplace(_name, _newKeybind);
			_setValVar = chr(oInput.keybindMap[$ _name][0].key);
			readingKeybind = false;
		}
	}
}