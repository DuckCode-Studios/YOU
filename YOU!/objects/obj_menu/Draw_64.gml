draw_set_font(ft_menu)

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

		if (mouse_check_button_pressed(mb_left)) {
			switch (options[i]) {
				case options[0]:
					global.menu = false
					audio_stop_sound(snd_game_menu)
					audio_play_sound(snd_game, 10, true)
					room_goto(1)
					break;
				case options[2]:
					audio_stop_sound(snd_game_menu)
					game_end()
					break;
				case options[1]:
					audio_stop_sound(snd_game_menu)
					room_goto(2)
					break;
			}
		}
	} else {
		scale[i] = lerp(scale[i], 1, 0.15)
		draw_set_color(c_white)
	}

	draw_text_transformed(gui_width / 2, gui_height / 2 + str_h * i, options[i], scale[i], scale[i], 0)
}

draw_set_halign(-1)
draw_set_valign(-1)
draw_set_font(-1)
