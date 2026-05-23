// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function initialize_Keybinds(){
	with (oInput){
		keybinds = [
			new BindKB("up", ord("W")),
			new BindKB("down", ord("S")),
			new BindKB("left", ord("A")),
			new BindKB("right", ord("D")),
		];
	}
}

function globalKeys() {
	global.keyUp = inputCheckHeld("up");
	global.keyDown = inputCheckHeld("down");
	global.keyLeft = inputCheckHeld("left");
	global.keyRight = inputCheckHeld("right");
}