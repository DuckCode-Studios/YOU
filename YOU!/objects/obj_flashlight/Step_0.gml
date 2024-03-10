if (global.stats.life <= 0) {
	instance_destroy()
}

if ((variable_global_exists("pause") && global.pause == true) 
	|| (variable_global_exists("choosing") && global.choosing == true)) {
	visible = false 
	exit;
} else {
	visible = true
}

x = obj_player.x;
y = obj_player.y;

var _dire = point_direction(x, y, mouse_x, mouse_y);

image_angle = _dire;

depth = -8;