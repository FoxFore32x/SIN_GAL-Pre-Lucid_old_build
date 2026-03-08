var is_cleared = ds_map_find_value(global.room_status_map, room_get_name(room));

if(is_cleared && place_meeting(x, y, oPlayer)){
	global.hasKey = true;
	instance_destroy(self);
}
