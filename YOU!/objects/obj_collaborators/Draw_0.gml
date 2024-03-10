draw_sprite_ext(spr_logo, 0, room_width / 2, 150, 0.25, 0.25, 0, c_white, 1)

draw_set_font(ft_menu)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

var _text = "The first game developed by DunkCode Studios"
var _text2 = "formed by Henrique Jose de Souza and Jadir Pires de Borba Junior."
var _text3 = "Thank you for playing our game!"

draw_text_transformed_color(room_width /2, (room_height / 2) - 50, _text, 1, 1, 0, c_white, c_white,c_white,c_white,  1)
draw_text_transformed_color(room_width /2, (room_height / 2), _text2, 1, 1, 0, c_white, c_white,c_white,c_white,  1)
draw_text_transformed_color(room_width /2, (room_height / 2) + 50, _text3, 1, 1, 0, c_white, c_white,c_white,c_white,  1)

var gui_height = display_get_gui_height()
var gui_width = display_get_gui_width()

var m_x = device_mouse_x_to_gui(0)
var m_y = device_mouse_y_to_gui(0)

var menu = "MENU"

var str_h = string_height("I")
var str_w = string_width(menu)

var x1 = room_width / 2 - str_w
var y1 = (room_height / 2 ) + 150 - str_h / 2

var x2 = room_width / 2 + str_w / 2
var y2 = (room_height / 2) + 150+ str_h
if (point_in_rectangle(m_x, m_y, x1, y1, x2, y2)) {
	draw_set_color(c_purple)

	if (mouse_check_button_pressed(mb_left)) {
			audio_stop_sound(snd_game_menu)
			room_goto(0)
	}
} else {
	draw_set_color(c_white)
}

draw_text_transformed(room_width /2, (room_height / 2) + 150, menu, 1, 1, 0)

draw_set_halign(-1)
draw_set_valign(-1)
draw_set_font(-1)

