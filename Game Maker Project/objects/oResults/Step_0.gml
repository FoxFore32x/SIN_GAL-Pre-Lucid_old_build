if(global.keyPauseAll || keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space)){
    audio_stop_all();
    room_goto(rm_menu);
}
