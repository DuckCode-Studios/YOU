
//Death Message

if (!instance_exists(obj_player)) {

	draw_set_font(ft_menu);

	draw_set_alpha(0.8)
	draw_set_color(c_black)
	draw_rectangle(0,0, room_width, room_height, false)


	var gui_height = display_get_gui_height()
	var gui_width = display_get_gui_width()
	var margin = 50

	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	draw_text_transformed_color(display_get_gui_width()/2 , display_get_gui_height()/2 - 50,"YOU DIED", 2, 2, 0,  c_black, c_red, c_red, c_red, 1)

	var m_x = device_mouse_x_to_gui(0)
	var m_y = device_mouse_y_to_gui(0)

	for (var i = 0; i < op_max; i++) {

		var str_h = string_height("I")
		var str_w = string_width(options[i])
	
		var gap = 1.7
		var offset = 50
	
		var x1 = gui_width / 2 - str_w / 2
		var y1 = gui_height / 2 - str_h / 2 + str_h * (i * gap) + offset

		var x2 = gui_width / 2 + str_w / 2
		var y2 = gui_height / 2 + str_h / 2 + str_h * (i * gap) + offset //+ offset

		if (point_in_rectangle(m_x, m_y, x1, y1, x2, y2)) {
			scale[i] = lerp(scale[i], 1.4, 0.15)
			draw_set_color(c_red)

			if (mouse_check_button_pressed(mb_left)) {
				switch (options[i]) {
					case options[0]:
						reset_player_data()
						room_restart()
						break;
					case options[1]:
						game_end()
						break;
				}
			}
		} else {
			scale[i] = lerp(scale[i], 1, 0.15)
			draw_set_color(c_white)
		}

		draw_text_transformed(display_get_gui_width()/2, gui_height / 2 + str_h * (i * gap) + offset, options[i], scale[i], scale[i], 0)
	}

	draw_set_font(-1)
	draw_set_halign(-1)
	draw_set_valign(-1)
	draw_set_alpha(-1)
	draw_set_color(-1)
} else {
	instance_destroy()
}
