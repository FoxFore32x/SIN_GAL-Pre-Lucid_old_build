// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información

function inputChangeKeybind(_name, _dvc = -1){
	var _keybind = inputChangeKeyboard(_name);
	if (_keybind == -1 && _dvc != -1){
		_keybind = inputChangeGamepad(_dvc, _name);
	}
	
	return(_keybind);
}

function inputChangeKeyboard(_name){
	//keyboard check
	if (keyboard_check_pressed(vk_anykey)){
		if(keyboard_lastkey != vk_escape) {
			var _struct = new BindKB(_name, keyboard_lastkey);
			return(_struct);
		}
	}
	
	//mouse check
	if(mouse_check_button_pressed(mb_any)){
		var _struct = new BindMB(_name, mouse_lastbutton);
		return (_struct);
	}
	
	//mouse wheel up
	if(mouse_wheel_up()){
		var _struct = new BindMW(_name, -1);
		return (_struct);
	}
	
	//mouse wheel down
	if(mouse_wheel_down()){
		var _struct = new BindMW(_name, 1);
		return (_struct);
	}
	
	return(-1);
}

function inputChangeGamepad(_dvc, _name) {
	// Gamepad buttons
	if (gamepad_button_check_pressed(_dvc, gp_padr)){ return (new BindGPB(_name, _dvc, gp_padr))}; //right
	if (gamepad_button_check_pressed(_dvc, gp_padl)){ return (new BindGPB(_name, _dvc, gp_padl))}; //left
	if (gamepad_button_check_pressed(_dvc, gp_padd)){ return (new BindGPB(_name, _dvc, gp_padd))}; //down
	if (gamepad_button_check_pressed(_dvc, gp_padu)){ return (new BindGPB(_name, _dvc, gp_padu))}; //up
	if (gamepad_button_check_pressed(_dvc, gp_face1)){ return (new BindGPB(_name, _dvc, gp_face1))}; //face 1
	if (gamepad_button_check_pressed(_dvc, gp_face2)){ return (new BindGPB(_name, _dvc, gp_face2))}; //face 2
	if (gamepad_button_check_pressed(_dvc, gp_face3)){ return (new BindGPB(_name, _dvc, gp_face3))}; //face 3
	if (gamepad_button_check_pressed(_dvc, gp_face4)){ return (new BindGPB(_name, _dvc, gp_face4))}; //face 4
	if (gamepad_button_check_pressed(_dvc, gp_shoulderl)){ return (new BindGPB(_name, _dvc, gp_shoulderl))}; //shoulder L
	if (gamepad_button_check_pressed(_dvc, gp_shoulderr)){ return (new BindGPB(_name, _dvc, gp_shoulderr))}; //shoulder R
	if (gamepad_button_check_pressed(_dvc, gp_shoulderlb)){ return (new BindGPB(_name, _dvc, gp_shoulderlb))}; //trigger L
	if (gamepad_button_check_pressed(_dvc, gp_shoulderrb)){ return (new BindGPB(_name, _dvc, gp_shoulderrb))}; //trigger R
	if (gamepad_button_check_pressed(_dvc, gp_stickl)){ return (new BindGPB(_name, _dvc, gp_stickl))}; //stick L
	if (gamepad_button_check_pressed(_dvc, gp_stickr)){ return (new BindGPB(_name, _dvc, gp_stickr))}; //stick R
	if (gamepad_button_check_pressed(_dvc, gp_touchpadbutton)){ return (new BindGPB(_name, _dvc, gp_touchpadbutton))}; //Touchpad
	if (gamepad_button_check_pressed(_dvc, gp_start)){ return (new BindGPB(_name, _dvc, gp_start))}; //start
	if (gamepad_button_check_pressed(_dvc, gp_select)){ return (new BindGPB(_name, _dvc, gp_select))}; //select
	
	//Gamepad axis
	if(gamepad_axis_value(_dvc, gp_axislh)) > 0.8 {return (new BindGPA(_name, _dvc, gp_axislh, 0.5))};
	if(gamepad_axis_value(_dvc, gp_axislh)) > -0.8 {return (new BindGPA(_name, _dvc, gp_axislh, -0.5))};
	if(gamepad_axis_value(_dvc, gp_axislv)) > 0.8 {return (new BindGPA(_name, _dvc, gp_axislh, 0.5))};
	if(gamepad_axis_value(_dvc, gp_axislv)) > -0.8 {return (new BindGPA(_name, _dvc, gp_axislh, -0.5))};
	
	if(gamepad_axis_value(_dvc, gp_axisrh)) > 0.8 {return (new BindGPA(_name, _dvc, gp_axisrh, 0.5))};
	if(gamepad_axis_value(_dvc, gp_axisrh)) > -0.8 {return (new BindGPA(_name, _dvc, gp_axisrh, -0.5))};
	if(gamepad_axis_value(_dvc, gp_axisrv)) > 0.8 {return (new BindGPA(_name, _dvc, gp_axisrh, 0.5))};
	if(gamepad_axis_value(_dvc, gp_axisrv)) > -0.8 {return (new BindGPA(_name, _dvc, gp_axisrh, -0.5))};
	
	return(-1);
}