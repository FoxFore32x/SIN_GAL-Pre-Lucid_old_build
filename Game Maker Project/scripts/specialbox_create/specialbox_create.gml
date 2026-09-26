/// @description specialbox_create( xOffset, yOffset, xScale, yScale, duration, hits, xhit, yhit, hit stun, damage);
/// @param  xOffset
/// @param  yOffset
/// @param  xScale
/// @param  yScale
/// @param  duration
/// @param  hits
/// @param  xhit
/// @param  yhit
/// @param  hit stun
/// @param  damage
function specialbox_create(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

	//create the specialbox object, assign the owner to the creator, set offset and scale
	_spbox = instance_create(x + argument0, y + argument1, oSpecialbox);
	_spbox.owner = id;
	_spbox.xOffset = argument0;
	_spbox.yOffset = argument1;
	_spbox.xScale  = argument2;
	_spbox.yScale  = argument3;

	//the rest of the stats an attack needs
	_spbox.dur     = argument4; //number of frames the specialbox is active
	if(argument5 == true){
		_spbox.xHit    = argument6; //horizontal knock back
		_spbox.yHit    = argument7; //vertical knock back
		_spbox.hitStun = argument8; //hit stun duration
		_spbox.damage  = argument9; //damage dealt
		_spbox.obstacle = true;
	}

	spbox = _spbox;
}
