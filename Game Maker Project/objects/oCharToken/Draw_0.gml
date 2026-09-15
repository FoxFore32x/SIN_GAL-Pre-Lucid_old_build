var slot = instance_place(x, y, oCharSlot);
var hDist = 0;

switch(asigndPlSlot){
	case 0: hDist = 20; break;
	case 1: hDist = 190; break;
	case 2: hDist = 360; break;
	case 3: hDist = 530; break;
}

switch (player){
	case 0:
		sprite_index = selectorP1_PH;
	break;
	case 1:
		sprite_index = selectorP2_PH;
	break;
	case 2:
		sprite_index = selectorP3_PH;
	break;
	case 3:
		sprite_index = selectorP4_PH;
	break;
	default:
		sprite_index = selectorPC_PH;
	break;
}

if (slot != noone && char >= 0 && char < array_length(charImg)) draw_sprite_ext(charImg[char], 0, hDist - 30, 120, 0.75, 0.75, 0, c_white, 1);

if(canStart) draw_text_transformed_colour(120,420,"PRESS START TO FIGHT", 0.3333, 0.3333, 0, c_aqua, c_aqua, c_aqua, c_aqua, 1);

draw_self();