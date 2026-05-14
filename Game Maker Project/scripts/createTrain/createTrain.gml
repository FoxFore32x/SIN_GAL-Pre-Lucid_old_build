/// @description createTrain(x, y, xDir, yDir, xScale, yScale, speed, distance, time, xhit, yhit);
/// @param  x
/// @param  y
/// @param  xDir
/// @param  yDir
/// @param  xScale
/// @param  yScale
/// @param  speed
/// @param  distance
/// @param  time
/// @param  xhit
/// @param  yhit
function createTrain(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10){
	var inst = instance_create(argument0, argument1, oTrain);
	inst.xDir = argument2;
	inst.yDir = argument3;
	inst.image_xscale = argument4;
	inst.image_yscale = argument5;
	inst.spd = argument6;
	inst.distLimit = ceil(set_targetX(argument7, xDir) / spd);
	inst.timeLimit = argument8;
	inst.trainTime = timeLimit;
	inst.xHit = argument9;
	inst.yHit = argument10;
}