if (variable_global_exists("choosing") && global.choosing == true) {
	
	draw_set_font(ft_menu)

	draw_set_alpha(0.8)
	draw_set_color(c_black)
	draw_rectangle(0,0, room_width, room_height, false)


	var gui_height = display_get_gui_height()
	var gui_width = display_get_gui_width()
	
	var gap = 350
	var origin = 290
	
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_center)
	
	var m_x = device_mouse_x_to_gui(0)
	var m_y = device_mouse_y_to_gui(0)


	for (var i = 0; i < 3; i++) {
		
		draw_set_color(c_white)
		
		var cardHeight = 400
		var cardWidth = 300

		var x1 = (origin + i*gap) - cardWidth/2
		var y1 = gui_height/2 - cardHeight/2 

		var x2 = (origin + i*gap) + cardWidth/2
		var y2 = gui_height/2 + cardHeight/2

		if (point_in_rectangle(m_x, m_y, x1, y1, x2, y2)) {
			scale[i] = lerp(scale[i], 1.25, 0.15)
			
			if (mouse_check_button_pressed(mb_left)) {
				switch (options[i]) {
					case options[0]:
						break;
					case options[1]:
						
						break;
					case options[2]:
						
						break;
				}
			}
		} else {
			scale[i] = lerp(scale[i], 1, 0.15)
			draw_set_color(c_white)
		}
		
		draw_sprite_ext(spr_card_template, 0, origin + i*gap, gui_height / 2, scale[i], scale[i], 0, c_white, 1)
		
		
	}
	
	draw_set_alpha(-1)
	draw_set_color(-1)
	draw_set_halign(-1)
	draw_set_valign(-1)
	draw_set_font(-1)
	
} else {
	
	for (var i = 0; i < ds_list_size(cards);i++) {
		instance_destroy(cards[| i])
	}
	ds_list_clear(cards)
}