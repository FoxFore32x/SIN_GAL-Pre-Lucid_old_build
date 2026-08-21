/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

//keychange
if (keyboard_check_pressed("7")) {
	readingKeybind = true;
}

if (readingKeybind == true){
	text = "Reading...";
	var _newKeybind = inputChangeKeybind("right1", player);
	if(_newKeybind != -1){
		inputReplace("right1", _newKeybind);
		readingKeybind = false;
	}
} else {
	text = "";
}