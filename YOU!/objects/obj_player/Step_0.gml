if (variable_global_exists("pause") && global.pause == true) exit;

depth = -7

state();

if (!instance_exists(obj_cone)) {
	instance_create_layer(x, y, "Instances", obj_cone)
}