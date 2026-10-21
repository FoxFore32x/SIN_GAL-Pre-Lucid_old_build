/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
var hDist = 20;

for(var i = 0; i < 4; i++){

	draw_text_transformed_colour(
		hDist,
		20,
		string_hash_to_newline(char[sel[i]]),
		0.2,0.2,0,
		pCol[i],pCol[i],pCol[i],pCol[i],1
	);

	draw_sprite_ext(charImg[sel[i]], 0, hDist - 30, 120, 0.75, 0.75, 0, c_white, 1);

	hDist += 170;
}

hDist = 20;
for(var i = 0; i < 4; i++){
	if(isPCPU[i]) draw_text_transformed_colour(hDist,60,"CPU", 0.2, 0.2, 0, pCol[i], pCol[i], pCol[i], pCol[i], 1);
	hDist += 170;
}

for(var i = 0; i < 4; i++){

	var slotX = 20 + (pos[i] * 170);
	var slotY = 100 + (i * 12);

	draw_text_transformed_colour(
		slotX,
		slotY,
		"VVV",
		0.2,0.2,0,
		pCol[i],pCol[i],pCol[i],pCol[i],1
	);
}

if(ready) draw_text_transformed_colour(120,420,"PRESS START TO FIGHT", 0.3333, 0.3333, 0, c_black, c_black, c_black, c_black, 1);

