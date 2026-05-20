/// @description Get Controller ID from System
/*var type = async_load[? "event_type"];
var pad_index = async_load[? "pad_index"];

// Please read 3) in a section below before copy&pasting this code.

switch (type)
{
	case "gamepad discovered":
	{
		//global.nxgp = pad_index;
		//gamepad_set_axis_deadzone(global.nxgp[i],0.6);
		
		for(var i = 0; i < 5; i++){
			if(gamepad_is_connected(i)){
				global.plInput[0] = i;
			}
			
			if(gamepad_is_connected(i) && global.plInput[0] != i){
				global.plInput[1] = i;
			}
			
			if(gamepad_is_connected(i) && global.plInput[1] != i){
				global.plInput[2] = i;
			}
			
			if(gamepad_is_connected(i) && global.plInput[2] != i){
				global.plInput[3] = i;
			}
		}
		break;
	}
	
	case "gamepad lost":
	{
		// Switch guidelines say that here you should pause your game
                // and display a little pop-up that waits for a controller.
                // so we do *nothing here*
		break;
	}
	default: break;
}*/