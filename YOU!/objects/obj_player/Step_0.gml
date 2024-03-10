if ((variable_global_exists("pause") && global.pause == true) 
	|| (variable_global_exists("choosing") && global.choosing == true)) {
	sprite_index = spr_player_hidden
	image_index = 4
	exit;
}

depth = -7

if (variable_global_exists("stats") && global.stats.life <= 0) {
	instance_destroy()
	exit;
}

state()

if (!instance_exists(obj_cone)) {
	cone = instance_create_layer(x, y, "Instances", obj_cone)
}