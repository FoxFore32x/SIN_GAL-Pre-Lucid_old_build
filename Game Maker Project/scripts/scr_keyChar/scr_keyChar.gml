function scr_keyChar(_keyInput){
	var output;
	
	switch(_keyInput){
		case vk_add: output = "Add" break;
		case vk_alt: output = "Alt" break;
		case vk_backspace: output = "Backspace" break;
		case vk_control: output = "Ctrl" break;
		case vk_delete: output = "Delete" break;
		case vk_decimal: output = "Decimal" break;
		case vk_divide: output = "Devide" break;
		case vk_down: output = "Down" break;
		case vk_end: output = "End" break;
		case vk_enter: output = "Enter" break;
		case vk_escape: output = "Escape" break;
		case vk_f1: output = "F1" break;
		case vk_f2: output = "F2" break;
		case vk_f3: output = "F3" break;
		case vk_f4: output = "F4" break;
		case vk_f5: output = "F5" break;
		case vk_f6: output = "F6" break;
		case vk_f7: output = "F7" break;
		case vk_f8: output = "F8" break;
		case vk_f9: output = "F9" break;
		case vk_f10: output = "F10" break;
		case vk_f11: output = "F11" break;
		case vk_home: output = "Home" break;
		case vk_insert: output = "Insert" break;
		case vk_lalt: output = "Left Alt" break;
		case vk_lcontrol: output = "Left Ctrl" break;
		case vk_left: output = "Left" break;
		case vk_lshift: output = "Left Shift" break;
		case vk_multiply: output = "Multiply" break;
		case vk_nokey: output = "N/A" break;
		case vk_numpad0: output = "NumPad 0" break;
		case vk_numpad1: output = "NumPad 1" break;
		case vk_numpad2: output = "NumPad 2" break;
		case vk_numpad3: output = "NumPad 3" break;
		case vk_numpad4: output = "NumPad 4" break;
		case vk_numpad5: output = "NumPad 5" break;
		case vk_numpad6: output = "NumPad 6" break;
		case vk_numpad7: output = "NumPad 7" break;
		case vk_numpad8: output = "NumPad 8" break;
		case vk_numpad9: output = "NumPad 9" break;
		case vk_pagedown: output = "Page Down" break;
		case vk_pageup: output = "Page Up" break;
		case vk_pause: output = "Pause" break;
		case vk_printscreen: output = "Print Screen" break;
		case vk_ralt: output = "Right Alt" break;
		case vk_rcontrol: output = "Right Control" break;
		case vk_return: output = "Return" break;
		case vk_right: output = "Right" break;
		case vk_rshift: output = "Right Shift" break;
		case vk_shift: output = "Shift" break;
		case vk_space: output = "Space" break;
		case vk_subtract: output = "Subtract" break;
		case vk_tab: output = "Tab" break;
		case vk_up: output = "Up" break;
		default: output = chr(_keyInput) break;
	}
	
	return output;
}