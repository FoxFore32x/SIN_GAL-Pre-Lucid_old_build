/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

//keychange
if (keyboard_check_pressed(vk_escape)) {
	readingKeybind = true;
}

if (readingKeybind == true){
	text = "Reading...";
	var _newKeybind = inputChangeKeybind("right", player);
	if(_newKeybind != -1){
		inputReplace("right", _newKeybind);
		readingKeybind = false;
	}
} else {
	text = "";
}