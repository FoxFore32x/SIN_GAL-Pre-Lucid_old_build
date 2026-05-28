/// Reset
for (var p = 0; p < 5; p++)
{
    global.plInput[p] = -1;
}

var playerIndex = 0;
var isSwitch = (os_version == os_switch || os_version == os_switch2);

/// Add handheld FIRST if in handheld mode
if (isSwitch && switch_get_operation_mode() == "handheld" && gamepad_is_connected(0) && playerIndex < 5)
{
    global.plInput[playerIndex] = 0;
    playerIndex++;
}

/// Then add real controllers (skip index 0 — that's handheld/Joy-Con pair)
for (var i = 1; i < 8; i++)
{
    if (gamepad_is_connected(i) && playerIndex < 5)
    {
        global.plInput[playerIndex] = i;
        playerIndex++;
    }
}