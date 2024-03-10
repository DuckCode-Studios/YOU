if ((variable_global_exists("pause") && global.pause == true) 
	|| (variable_global_exists("choosing") && global.choosing == true)) exit;

if (instance_exists(flash_light)) {
	flash_light.x = x + 8 * image_xscale;
	flash_light.y = y + 10 * image_yscale;
}