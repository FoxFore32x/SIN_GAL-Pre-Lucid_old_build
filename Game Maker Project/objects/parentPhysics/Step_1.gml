/// @description collision
var h, v;
var _subPixel = .5;

// Handle sub-pixel movement
hCounter += xSpeed;
vCounter += ySpeed;
h = round(hCounter);
v = round(vCounter);
hCounter -= h;
vCounter -= v;

repeat(abs(v)){
    if(ySpeed <= 0){
        var inst = instance_place(x, y + sign(v), parentBlocker);
        if(inst != noone && is_blocking(inst)){
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
    var inst = instance_place(x + sign(h), y, parentBlocker);      
    if(inst == noone || !is_blocking(inst)){
        x += sign(h) * god.gameSpeed;
    }else{
        if((xSpeed >= 2 || xSpeed <= -2) && hitStun > 0){
            xSpeed = (abs(xSpeed) / (1.5 * facing));
            if(xSpeed >= 4){
                xSpeed = 4;
            }
            hitStun -= 30;
            if(ySpeed >= 0) ySpeed = ySpeed * 1.75;
        } else {
            x_collide();
        }
        break;
    }
}

