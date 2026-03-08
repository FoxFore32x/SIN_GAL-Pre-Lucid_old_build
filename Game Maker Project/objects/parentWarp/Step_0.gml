var _pl = instance_place(x, y, oPlayer)

if(_pl != noone && _pl.player >= 0){
    warp = instance_create(x, y, oWarpController);
    warp.pitBool = pit;
    warp.newX = xPosition;
    warp.newY = yPosition;
    warp.newRoom = roomName;
	warp.currentPlayer = _pl;
}
