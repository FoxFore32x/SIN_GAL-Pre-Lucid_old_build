var is_cleared = ds_map_find_value(global.room_status_map, room_get_name(room));
	
if(is_cleared){
	draw_sprite(sprKey, 0, x, y);
}
