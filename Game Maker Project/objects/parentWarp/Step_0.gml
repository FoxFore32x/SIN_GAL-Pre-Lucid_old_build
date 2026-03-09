var _pl = instance_place(x, y, oPlayer)

if(_pl != noone){
    warp = instance_create(x, y, oWarpController);
    warp.pitBool = pit;
    warp.newX = xPosition;
    warp.newY = yPosition;
    warp.newRoom = roomName;
	warp.currentPlayer = _pl;
}
