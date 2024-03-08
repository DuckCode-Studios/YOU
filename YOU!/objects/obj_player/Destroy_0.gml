instance_destroy(cone)

if (instance_exists(flash_light)) {
	instance_destroy(flash_light);
}


instance_create_layer(x, y, "Instances", obj_dead)