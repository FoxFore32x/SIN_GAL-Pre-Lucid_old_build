/// @description createTrain(x, y, xDir, yDir, xScale, yScale, speed, distance, time, xhit, yhit, dissapears);
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
/// @param  dissapears
function createTrain(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11){
	if(!instance_exists(oTrain)){
		var inst = instance_create(argument0, argument1, oTrain);
		inst.xDir = argument2;
		inst.yDir = argument3;
		inst.image_xscale = argument4;
		inst.image_yscale = argument5;
		inst.spd = argument6;
		if(argument6 != 0) inst.distLimit = ceil(set_targetX(argument7, inst.xDir) / inst.spd);
		else inst.distLimit = ceil(set_targetX(argument7, inst.xDir));
		inst.dist = inst.distLimit
		inst.timeLimit = argument8;
		inst.trainTime = inst.timeLimit;
		inst.xHit = argument9;
		inst.yHit = argument10;
		inst.dissapears = argument11;
	}
}