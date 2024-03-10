if (global.stats.life <= 0) {
	instance_destroy()
}

if ((variable_global_exists("pause") && global.pause == true) 
	|| (variable_global_exists("choosing") && global.choosing == true)) exit;
if (!instance_exists(obj_flashlight)) exit;


x = obj_flashlight.x	
y = obj_flashlight.y

depth = -11

var _dire = point_direction(x, y, mouse_x, mouse_y)

image_angle_= _dire

if (variable_global_exists("stats")) {

	degrees = global.stats.light_range
}

angle=clamp(degrees, 0,360);
