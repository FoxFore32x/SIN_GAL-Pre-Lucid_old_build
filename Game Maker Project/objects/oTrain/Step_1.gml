/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

hit_check();
pl_freeze();

if(facing == 0){
	if(xDir != 0) facing =  xDir;
	else facing = 1;
}