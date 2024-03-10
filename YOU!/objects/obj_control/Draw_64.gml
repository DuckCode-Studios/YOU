var scale = 4
var gui = display_get_gui_height()
var healthOutline = sprite_get_height(spr_health) * scale
var height = healthOutline


if (variable_global_exists("stats")) {
	//HUD
	draw_sprite_ext(spr_health, 0, 100, height, scale, scale, 0, c_white, 1)
	

	//HealthBar
	draw_sprite_ext(spr_health_bar, 0, 100, height, (global.stats.life/global.stats.maxLife) * scale, scale, 0, c_white, 1)

	
	//Room Level
	draw_text_color(50, height + 50, "Room: " + string(global.level), c_black, c_black, c_green, c_green, 1)


}