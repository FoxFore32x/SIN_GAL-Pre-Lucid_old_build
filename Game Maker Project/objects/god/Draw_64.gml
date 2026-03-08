if(room != results && room != title && room != init ){
	if(global.opHp){
	    draw_set_font(FOT);
	    var vSpacing = 32;
    
	    for (var i = 0; i < global.players + global.cpus; i++) {
    
	        var inst = global.playerId[i];
    
	        if (instance_exists(inst) && variable_instance_exists(inst, "hp")) {
    
	            // --- Pick color based on index (0,1,2,3...)
	            var col;
	            switch (i mod 4) {
	                case 0: col = c_red;    break;
	                case 1: col = c_blue;   break;
	                case 2: col = c_yellow; break;
	                case 3: col = c_green;  break;
	            }
    
	            draw_text_transformed_colour(
	                32, vSpacing,
	                string_hash_to_newline(string_hash_to_newline(string(inst.hp))),
	                0.3333, 0.3333, 0,
	                col, col, col, col, 1
	            );
	        }
    
	        vSpacing += 32;
	    }
	}

	if(global.opTimer){
	    var col = c_purple;
	    draw_text_transformed_colour(
	                320, 32,
	                string_hash_to_newline(string_hash_to_newline(string( floor(timer / room_speed) ))),
	                0.3333, 0.3333, 0,
	                col, col, col, col, 1
	            );
	}
    
	if(showBox){
	    _c1 = c_red;
	    draw_set_font(FONT_builtin);
	    draw_set_color(c_red);
	    draw_text_colour(450,32,string_hash_to_newline("onGround = " + string(parentPhysics.onGround)), _c1, _c1, _c1, _c1, 1);
	    draw_text_colour(450,48,string_hash_to_newline("canJump = " + string(parentPhysics.canJump)), _c1, _c1, _c1, _c1, 1);
	    draw_text_colour(450,64,string_hash_to_newline("wallGrabTimer = " + string(parentPhysics.wallGrabTimer)), _c1, _c1, _c1, _c1, 1);
	    draw_text_colour(450,80,string_hash_to_newline("isJumping = " + string(parentPhysics.isJump)), _c1, _c1, _c1, _c1, 1);
	    draw_text_colour(450,96,string_hash_to_newline("Combo Counter = " + string(parentPhysics.comboCnt)), _c1, _c1, _c1, _c1, 1);
	    draw_text_colour(450,112,string_hash_to_newline("Combo Timer = " + string(parentPhysics.comboTimer)), _c1, _c1, _c1, _c1, 1);
	    draw_text_colour(450,128,string_hash_to_newline("Jab Counter = " + string(parentPhysics.jabCnt)), _c1, _c1, _c1, _c1, 1);
	    draw_text_colour(450,144,string_hash_to_newline("invFrames = " + string(parentPhysics.invFrames)), _c1, _c1, _c1, _c1, 1);
	    draw_text_colour(450,160,string_hash_to_newline("isDash = " + string(parentPhysics.isDash)), _c1, _c1, _c1, _c1, 1);
	    draw_text_colour(450,176,string_hash_to_newline("currentPlayers = " + string(global.existentPl)), _c1, _c1, _c1, _c1, 1);
	    draw_text_colour(450,192,string_hash_to_newline("coyoteHangTimer = " + string(parentPhysics.coyoteHangTimer)), _c1, _c1, _c1, _c1, 1);
	}

}