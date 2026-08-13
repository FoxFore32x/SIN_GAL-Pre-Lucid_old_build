/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if(player != -1 && player.isWallGrabbing && player.wallTrain == id){
	player.x += xSpeed;
	player.y += ySpeed;
	player.ySpeed = 0;
}