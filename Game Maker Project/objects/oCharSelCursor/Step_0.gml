xMov = (global.keyRight[player] - global.keyLeft[player]) * spd;
yMov = (global.keyDown[player] - global.keyUp[player]) * spd;

x += xMov;
y += yMov;