// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información

//Keyboard inputs
function BindKB(_name, _key) constructor {
	bindName = _name;
	key = _key;
	
	pressed = false;
	held = false;
	released = false;
	
	pressedFn = function() {
		pressed = keyboard_check_pressed(key);
	}
	
	heldFn = function() {
		held = keyboard_check(key);
	}
	
	releasedFn = function() {
		released = keyboard_check_released(key);
	}
	
}

//Mouse buttons inputs
function BindMB(_name, _key) constructor {
	bindName = _name;
	key = _key;
	
	pressed = false;
	held = false;
	released = false;
	
	pressedFn = function() {
		pressed = mouse_check_button_pressed(key);
	}
	
	heldFn = function() {
		held = mouse_check_button(key);
	}
	
	releasedFn = function() {
		released = mouse_check_button_released(key);
	}
	
}

//Mouse wheel inputs
function BindMW(_name, _dir) constructor {
	bindName = _name;
	dir = sign(_dir);
	
	pressed = false;
	held = false;
	released = false;
	
	pressedFn = function() {
		if(dir < 0){
			pressed = mouse_wheel_up();
		} else if (dir > 0){
			pressed = mouse_wheel_down();
		} else {
			pressed = false;
		}
	}
	
	//USELESS SINCE U CAN'T HELD OR RELEASE MOUSE WHEEL
	heldFn = function() {
		held = false;
	}
	
	releasedFn = function() {
		released = false;
	}
	
}

//Gamepad inputs
function BindGPB(_name, _dvc, _key) constructor {
	bindName = _name;
	key = _key;
	device = _dvc;
	
	pressed = false;
	held = false;
	released = false;
	
	pressedFn = function() {
		if(os_type == os_switch || os_type == os_switch2)
			pressed = gamepad_button_check_pressed(global.plInput[device], key);
		else pressed = gamepad_button_check_pressed(device, key);
	}
	
	heldFn = function() {
		if(os_type == os_switch || os_type == os_switch2)
			held = gamepad_button_check(global.plInput[device], key);
		else held = gamepad_button_check(device, key);
	}
	
	releasedFn = function() {
		if(os_type == os_switch || os_type == os_switch2)
			released = gamepad_button_check_released(global.plInput[device], key);
		else released = gamepad_button_check_released(device, key);
	}
	
}

//Axis inputs
function BindGPA(_name, _dvc, _axis, _value) constructor {
	bindName = _name;
	axis = _axis;
	device = _dvc;
	value = _value;
	
	pressed = false;
	held = false;
	lastHeld = false;
	released = false;
	
	pressedFn = function(){
		if (lastHeld == false && held == true){
			pressed = true;
		} else {
			pressed = false;
		}
	}
	
	heldFn = function() {
		lastHeld = held;
		if(value < 0) {
			if(os_type == os_switch || os_type == os_switch2)
				held = (gamepad_axis_value(global.plInput[device], axis) < value);
			else held = (gamepad_axis_value(device, axis) < value);
		} else if (value > 0){
			if(os_type == os_switch || os_type == os_switch2)
				held = (gamepad_axis_value(global.plInput[device], axis) > value);
			else held = (gamepad_axis_value(device, axis) > value);
		} else {
			held = false;
		}
	}
	
	releasedFn = function() {
		if(lastHeld == true && held == false){
			released = true;
		} else {
			released = false;
		}
	}
}

function addKeybind(_bind)
{
    array_push(keybinds, _bind);

    if (!variable_struct_exists(keybindMap, _bind.bindName))
    {
        keybindMap[$ _bind.bindName] = [];
    }

    array_push(keybindMap[$ _bind.bindName], _bind);
}

function inputUpdate(){
	with (oInput){
		for(var i = 0; i < array_length(keybinds); i++){
			keybinds[i].heldFn();
			keybinds[i].pressedFn();
			keybinds[i].releasedFn();
		}
	}
}

function inputCheckHeld(_name)
{
    var binds = oInput.keybindMap[$ _name];

    if (is_undefined(binds))
        return false;

    for (var i = 0; i < array_length(binds); i++)
    {
        if (binds[i].held)
            return true;
    }

    return false;
}

function inputCheckPressed(_name)
{
    var binds = oInput.keybindMap[$ _name];

    if (is_undefined(binds))
        return false;

    for (var i = 0; i < array_length(binds); i++)
    {
        if (binds[i].pressed)
            return true;
    }

    return false;
}

function inputCheckReleased(_name)
{
    var binds = oInput.keybindMap[$ _name];

    if (is_undefined(binds))
        return false;

    for (var i = 0; i < array_length(binds); i++)
    {
        if (binds[i].released)
            return true;
    }

    return false;
}

function inputReplace(_name, _newKeybind) {
    // Replace in keybinds array
    for (var i = 0; i < array_length(oInput.keybinds); i++) {
        if (oInput.keybinds[i].bindName == _name) {
            oInput.keybinds[i] = _newKeybind;
            break;
        }
    }

    // Replace in keybindMap
    if (variable_struct_exists(oInput.keybindMap, _name)) {
        var _binds = oInput.keybindMap[$ _name];

        for (var i = 0; i < array_length(_binds); i++) {
            if (_binds[i].bindName == _name) {
                _binds[i] = _newKeybind;
                return;
            }
        }
    }
}