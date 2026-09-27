/// @description collision
var h, v;
var _subPixel = .5;

gSpeed = gSpeedMax * gravityActive;

// Handle sub-pixel movement
hCounter += xSpeed;
vCounter += ySpeed;
h = round(hCounter);
v = round(vCounter);
hCounter -= h;
vCounter -= v;

/*repeat(abs(v)){
    if(ySpeed <= 0){
        if(place_meeting(x,y+sign(v),parentBlocker)){
            y_collide();
            break;
        }else{
            y += sign(v) * god.gameSpeed;
        }
    }else if (check_below()){
        y_collide();
        break;
    }else{
        y += sign(v) * god.gameSpeed;
    }
}

repeat(abs(h)) {        
    if(!place_meeting(x+sign(h),y,parentBlocker)){
        x += sign(h) * god.gameSpeed;
    }else{
        x_collide();
        break;
    }
}*/

// X Movement and slopes
if (h != 0){
    var _dirX = sign(h);
    // X Collision
    if (place_meeting(x + h, y, parentBlocker)){
        // Go up slopes
        if (!place_meeting(x + h, y - abs(h) - 1, parentBlocker)){
            while (place_meeting(x + h, y, parentBlocker)){
                y -= _subPixel;
            }
        }

        // Go down slopes
        else if (!place_meeting(x + h, y + abs(h) + 1, parentBlocker)){
            while (place_meeting(x + h, y, parentBlocker)){
                y += _subPixel;
            }
        }

        // Normal wall
        else{
            x_collide();
            
            // Don't move through the wall.
            h = 0;
            hCounter = 0;
        }
    }


    // Go down slopes
    if (h != 0 && ySpeed >= 0){
        if (!place_meeting(x + h, y + 1, parentBlocker) && place_meeting(x + h, y + abs(h) + 1, parentBlocker)){
            while (!place_meeting(x + h, y + _subPixel, parentBlocker)){
                y += _subPixel;
            }
        }
    }

    // Actual X Movement
    x += h * god.gameSpeed;
}

// Y Movement

repeat(abs(v)){
    var _dirY = sign(v);

    // Moving Up

    if (_dirY < 0){
        if (place_meeting(x, y + _dirY, parentBlocker)){
            y_collide();
            break;
        }

        y += _dirY * god.gameSpeed;
    }
    // Moving Down
    else{
        // Check ground before moving
        if (check_below()){
            y_collide();
            break;
        }

        if (place_meeting(x, y + _dirY, parentBlocker)){
            y_collide();
            break;
        }

        y += _dirY * god.gameSpeed;
    }
}