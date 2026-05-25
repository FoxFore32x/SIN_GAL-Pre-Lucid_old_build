draw_set_font(FOT);

if(!global.arcadeMode){
    // Total fighters in match
    var total = global.players + global.cpus;
    
    // Vertical spacing start
    var vSpacing = 250;
    
    // Loop only the number of fighters
    for (var i = 0; i < total; i++) {
    
        // rank index: last index is 1st place
        var place_num = total - i;
    
        var label = string(place_num) + " Place: " + string(global.winId[i]);
    
        // Color cycling (optional)
        var col;
        switch (i mod 4) {
            case 0: col = c_red;    break;
            case 1: col = c_blue;   break;
            case 2: col = c_yellow; break;
            case 3: col = c_green;  break;
        }
    
        draw_text_transformed_colour(
            220, vSpacing, string_hash_to_newline(label),
            0.3333, 0.3333, 0,
            col, col, col, col, 1
        );
    
        vSpacing -= 32;
    }
} else {
	if(global.uLostLmao) {
		draw_text_transformed_colour(
	        150, 200, string_hash_to_newline("YOU LOST LMAAAAAAAOOOOOOOOOOOOOOO"),
	        0.3333, 0.3333, 0,
	        c_white, c_white, c_white, c_white, 1
	    );
	}
	else {
	    draw_text_transformed_colour(
	        200, 200, string_hash_to_newline("YOU WON!!"),
	        0.3333, 0.3333, 0,
	        c_white, c_white, c_white, c_white, 1
	    );
	}
}



    draw_text_transformed_colour(
        130, 330, string_hash_to_newline("Press Start or 1 to 4\n(Keyboard) to exit to \nmenu"),
        0.3333, 0.3333, 0,
        c_white, c_white, c_white, c_white, 1
    );
