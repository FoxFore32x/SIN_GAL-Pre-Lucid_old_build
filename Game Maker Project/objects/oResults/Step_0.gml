if(keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(0, gp_start)){
    audio_stop_all();
    room_goto(title);
}
