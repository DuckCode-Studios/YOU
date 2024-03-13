if (variable_global_exists("choosing") && global.choosing == true) {
	
	window_set_cursor(cr_handpoint)
	
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

	if (array_length(cards) < 3 &&  variable_global_exists("all_skills")) {
		cards = randomize_cards()
	}


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
			
			if (array_length(cards) > 0) {
				var selectedSkill = noone
				if (mouse_check_button_pressed(mb_left)) {
					window_set_cursor(cr_none)
					
					switch (options[i]) {
						case options[0]:
							//selectedSkill = ds_map_find_value(cards, options[0])
							selectedSkill = cards[0]
							give_skill(selectedSkill.skillId)
							global.choosing = false
							break;
						case options[1]:
							//selectedSkill = ds_map_find_value(cards, options[1])
							selectedSkill = cards[1]
							give_skill(selectedSkill.skillId)
							global.choosing = false
							break;
						case options[2]:
							//selectedSkill = ds_map_find_value(cards, options[2])
							selectedSkill = cards[2]
							give_skill(selectedSkill.skillId)
							global.choosing = false
							break;
					}
				}
			}
			
			
		} else {
			scale[i] = lerp(scale[i], 1, 0.15)
			draw_set_color(c_white)
		}
		
		 
		//var skill = ds_map_find_value(cards, i)
		var skill = cards[i]
		//show_debug_message(skill)
		var template = ds_map_find_value(global.tiers, skill.tier)
			
		draw_sprite_ext(template.spriteImage, 0, origin + i*gap, gui_height / 2, scale[i], scale[i], 0, c_white, 1)
		draw_sprite_ext(skill.spriteImage, 0, origin + i*gap, gui_height / 2 - 86*scale[i], scale[i], scale[i], 0, c_white, 1)
			
		draw_set_color(c_black)
		draw_text_ext_transformed(origin + i*gap, gui_height/2 + 80*scale[i], skill.description, string_height(skill.description), 300, 0.6 * scale[i], 0.6 * scale[i], 0)

		
		
		/*draw_sprite_ext(spr_card_template_silver, 0, origin + i*gap, gui_height / 2, scale[i], scale[i], 0, c_white, 1)
		
		if (ds_map_size(cards) < 3 && variable_global_exists("all_skills")) {
			
			randomize()
			var idCard = irandom(ds_map_size(global.all_skills) - 1) + 1
			
			while (ds_list_find_index(sortedNumbers ,idCard) != -1) {
				idCard = irandom(ds_map_size(global.all_skills) - 1) + 1
			}
			
			var skill = ds_map_find_value(global.all_skills, idCard)
			
			ds_map_add(cards, i, skill)
			ds_list_add(sortedNumbers, idCard)
			
			
			draw_sprite_ext(skill.spriteImage, 0, origin + i*gap, gui_height / 2 - 86*scale[i], scale[i], scale[i], 0, c_white, 1)
			
			draw_text_ext_transformed(origin + i*gap, gui_height/2 + 80*scale[i], skill.description, string_height(skill.description), 300, 0.6 * scale[i], 0.6 * scale[i], 0)
			
		} else {
			
			var skill = ds_map_find_value(cards, i)
			
			draw_sprite_ext(skill.spriteImage, 0, origin + i*gap, gui_height / 2 - 86*scale[i], scale[i], scale[i], 0, c_white, 1)
			
			draw_set_color(c_black)
			draw_text_ext_transformed(origin + i*gap, gui_height/2 + 80*scale[i], skill.description, string_height(skill.description), 300, 0.6 * scale[i], 0.6 * scale[i], 0)
			
		}*/
		
	}
	
	draw_set_alpha(-1)
	draw_set_color(-1)
	draw_set_halign(-1)
	draw_set_valign(-1)
	draw_set_font(-1)
	
} else {
	//ds_map_clear(cards)
	cards = []
	ds_list_clear(sortedNumbers)
} 