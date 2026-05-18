/// @description Get Controller ID from System
var type = async_load[? "event_type"];
var pad_index = async_load[? "pad_index"];

// Please read 3) in a section below before copy&pasting this code.

switch (type)
{
	case "gamepad discovered":
	{
		for(var i = 0; i < 5; i++){
			if(global.nxgp[i] == 0){
				global.nxgp[i] = pad_index;
				//gamepad_set_axis_deadzone(global.nxgp[i],0.6);
				break;
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
}