/// Reset
for (var p = 0; p < 5; p++)
{
    global.plInput[p] = -1;
}

var playerIndex = 0;

/// Add handheld LAST if connected
if (((os_version == os_switch || os_version == os_switch2) && switch_get_operation_mode() == "handheld") && gamepad_is_connected(0) && playerIndex < 5)
{
    global.plInput[playerIndex] = 0;
	playerIndex++;
}

/// First add real controllers
for (var i = 1; i < 8; i++)
{
    if (gamepad_is_connected(i))
    {
        global.plInput[playerIndex] = i;
        playerIndex++;
		
		if (playerIndex >= 5)
        {
            break;
        }
    }
}