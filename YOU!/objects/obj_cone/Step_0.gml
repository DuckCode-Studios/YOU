if (variable_global_exists("pause") && global.pause == true) exit;

x = obj_flashlight.x
y = obj_flashlight.y

depth = -11

var _dire = point_direction(x, y, mouse_x, mouse_y)

image_angle_= _dire

angle=clamp(degrees, 0,360);
