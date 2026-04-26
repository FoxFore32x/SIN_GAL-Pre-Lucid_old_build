/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
var initHSpd = hSpd;
var initVSpd = vSpd;

x += hSpd * god.gameSpeed;
y += vSpd * god.gameSpeed;

limitCnt -= god.gameSpeed;

if(limitCnt <= 0){
	limitCnt = limitCntMax;
	
	hSpd = -hSpd;
	vSpd = -vSpd;
}

xDir = initHSpd / hSpd;
yDir = initVSpd / vSpd;