if(global.buttPress == true) buttOpen = true;
if(global.hasKey == true) keyOpen = true;

//if ((open && (!butt || !key)) || (buttOpen || keyOpen)) instance_destroy(self);

if(key){
if(keyOpen) instance_destroy(self);
} else if (butt){
if(buttOpen) instance_destroy(self);
} else {
if(open) instance_destroy(self);
}

var is_created = ds_map_find_value(global.enemies_created_check, room_get_name(room));

if(is_created){
    befOp = false;
}
