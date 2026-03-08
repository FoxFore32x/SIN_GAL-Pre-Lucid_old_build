/// @description  is_blocking(inst)
/// @param inst
function is_blocking(argument0) {
	var inst = argument0;

	// Safety
	if (inst == noone) return false;

	// Door logic
	if (inst.object_index == oDoor) {
	    return !inst.befOp;
	}

	// Any other parentBlocker blocks
	return true;




}
