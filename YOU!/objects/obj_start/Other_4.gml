if (instance_exists(obj_menu)) {
	obj_menu.persistent = true
} else {
	instance_create_layer(x, y, "Instances", obj_menu)
}