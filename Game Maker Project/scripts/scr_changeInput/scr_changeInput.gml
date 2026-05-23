// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function inputChangeKeyboard(_name){
	//keyboard check
	if (keyboard_check_pressed(vk_anykey)){
		if(keyboard_lastkey != vk_escape) {
			var _struct = new BindKB(_name, keyboard_lastkey);
			return(_struct);
		}
	}
}

//VIDEO: Keybinding System Tutorial in Gamemaker (Part 2/2) || Time: 9:43