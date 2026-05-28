/// @description Get Controller ID from System
/*var type = async_load[? "event_type"];
var pad_index = async_load[? "pad_index"];

switch (type)
{
    case "gamepad discovered":
    {
        // Find the first empty slot and assign it
        for (var p = 0; p < 5; p++)
        {
            if (global.plInput[p] == -1)
            {
                global.plInput[p] = pad_index;
                break;
            }
        }
        break;
    }
    case "gamepad lost":
    {
        // Clear whichever slot had this pad
        for (var p = 0; p < 5; p++)
        {
            if (global.plInput[p] == pad_index)
            {
                global.plInput[p] = -1;
                break;
            }
        }
        break;
    }
    default: break;
}*/