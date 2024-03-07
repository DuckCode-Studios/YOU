if (variable_global_exists("pause") && global.pause == true) exit;

if (instance_exists(_helditem)) {
	_helditem.x = x + 8 * image_xscale;
	_helditem.y = y + 10 * image_yscale;
}