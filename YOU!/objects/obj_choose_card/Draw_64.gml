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
		
		draw_sprite_ext(spr_card_template_silver, 0, origin + i*gap, gui_height / 2, scale[i], scale[i], 0, c_white, 1)
		
		if (ds_map_size(cards) < 3 && variable_global_exists("all_skills")) {
			
			randomize()
			var idCard = irandom(4) + 1
			
			var skill = ds_map_find_value(global.all_skills, idCard)
			
			show_debug_message(skill)
			ds_map_add(cards, i, skill)
			
			
			draw_sprite_ext(skill.spriteImage, 0, origin + i*gap, gui_height / 2 - 86, 0.25 * scale[i], 0.25* scale[i], 0, c_white, 1)
			
			draw_text_transformed_color(origin + i*gap, gui_height/2 + 10, skill.description, 1, 1, 0, c_white, c_white,c_white,c_white,  1)
			
		} else {
			
			var skill = ds_map_find_value(cards, i)
			
			draw_sprite_ext(skill.spriteImage, 0, origin + i*gap, gui_height / 2 - 86, 0.25* scale[i], 0.25* scale[i], 0, c_white, 1)
			
			draw_set_color(c_black)
			draw_text_ext_transformed(origin + i*gap, gui_height/2 + 80, skill.description, string_height(skill.description), 300, 0.6 * scale[i], 0.6 * scale[i], 0)
			
		}
		
	}
	
	draw_set_alpha(-1)
	draw_set_color(-1)
	draw_set_halign(-1)
	draw_set_valign(-1)
	draw_set_font(-1)
	
} else {
	ds_map_clear(cards)
} 