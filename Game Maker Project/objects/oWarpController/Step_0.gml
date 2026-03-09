/// @description  @description Inserte aquí la descripción
// Puede escribir su código en este editor

if(currentPlayer.player < 0 && !pitBool){
	instance_destroy();
	exit;
}

if (room != newRoom) {
    fadeLevel += 0.050;
    if (fadeLevel >= 1) {
        room_goto(newRoom);
        oPlayer.x = newX;
        oPlayer.y = newY;
    }
}
else {
    fadeLevel -= 0.050;
}

if(pitBool && room == newRoom){
    currentPlayer.x = newX;
    currentPlayer.y = newY;
}

if (fadeLevel <= 0) {
    instance_destroy();
}
