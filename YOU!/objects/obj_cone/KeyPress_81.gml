/// @description Change light color

if (variable_global_exists("pause") && global.pause == true) exit;

if (index == 2) {
	index = 0
} else {
	index++
}


if (variable_global_exists("all_enemies")) {
	for (var i = 0; i < ds_list_size(global.all_enemies); i++) {	
		global.all_enemies[| i].visible = false
	}
}