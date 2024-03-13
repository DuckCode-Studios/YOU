if (variable_global_exists("pause") && global.pause == true) {
	
	draw_set_font(ft_menu)

	draw_set_alpha(0.8)
	draw_set_color(c_black)
	draw_rectangle(0,0, room_width, room_height, false)


	var gui_height = display_get_gui_height()
	var gui_width = display_get_gui_width()
	var margin = 50

	var m_x = device_mouse_x_to_gui(0)
	var m_y = device_mouse_y_to_gui(0)

	draw_set_halign(fa_center)
	draw_set_valign(fa_center)

	for (var i = 0; i < op_max; i++) {

		var str_h = string_height("I")
		var str_w = string_width(options[i])

		var x1 = gui_width / 2 - str_w / 2
		var y1 = gui_height / 2 - str_h / 2 + str_h * i

		var x2 = gui_width / 2 + str_w / 2
		var y2 = gui_height / 2 + str_h / 2 + str_h * i

		if (point_in_rectangle(m_x, m_y, x1, y1, x2, y2)) {
			scale[i] = lerp(scale[i], 1.4, 0.15)
			draw_set_color(c_purple)

			if (one_time) {
				audio_play_sound(snd_mouse_pass, 10, false, 0.2)
				one_time = false
			}

			if (mouse_check_button_pressed(mb_left)) {
				audio_stop_sound(snd_mouse_pass)
				audio_play_sound(snd_click, 10, false, 0.2)
				
				switch (options[i]) {
					case options[0]:
						global.pause = false
						break;
					case options[1]:
						global.pause = false
						// ZERA TUDO JADIR
						window_set_cursor(cr_arrow)
						game_restart()
						audio_stop_sound(snd_game)
						instance_destroy(obj_player)
						instance_destroy(obj_pause)
						room_goto(0)
						global.level = 0
						break;
				}
			}
		} else {
			one_time = true
			scale[i] = lerp(scale[i], 1, 0.15)
			draw_set_color(c_white)
		}

		draw_text_transformed(gui_width / 2, gui_height / 2 + str_h * i, options[i], scale[i], scale[i], 0)
	}

	draw_set_halign(-1)
	draw_set_valign(-1)
	draw_set_font(-1)
	draw_set_color(-1)
}