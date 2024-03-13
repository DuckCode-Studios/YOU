
draw_set_font(ft_menu)
draw_set_halign(fa_center)
draw_set_valign(fa_center)

var hist = "Cleiton is a purple monster, seen as an aberration, in a world where there are only blue, red, and white monsters. "
var hist2 = " And he wants to escape from this world. Help him try to flee and go to the underworld of aberrations."

draw_text_transformed_color(room_width /2, (room_height / 2) - 250, hist, 0.5, 0.5, 0, c_white, c_white,c_white,c_white,  1)
draw_text_transformed_color(room_width /2, (room_height / 2) -200, hist2, 0.5, 0.5, 0, c_white, c_white,c_white,c_white,  1)

var _text = "WASD moves the character"
var _text2 = "QE change the lantern color"
var _text3 = "SHIFT uses the dash"
var _text4= "To kill the monsters, aim at them with the correct lantern color;"
var _text5= "you'll only see them if you have the right color."

draw_text_transformed_color(room_width /2, (room_height / 2) - 100, _text, 1, 1, 0, c_white, c_white,c_white,c_white,  1)
draw_text_transformed_color(room_width /2, (room_height / 2) - 50, _text2, 1, 1, 0, c_white, c_white,c_white,c_white,  1)
draw_text_transformed_color(room_width /2, (room_height / 2), _text3, 1, 1, 0, c_white, c_white,c_white,c_white,  1)
draw_text_transformed_color(room_width /2, (room_height / 2) + 100, _text4, 0.5, 0.5, 0, c_white, c_white,c_white,c_white,  1)
draw_text_transformed_color(room_width /2, (room_height / 2) + 150, _text5, 0.5, 0.5, 0, c_white, c_white,c_white,c_white,  1)

var gui_height = display_get_gui_height()
var gui_width = display_get_gui_width()

var m_x = device_mouse_x_to_gui(0)
var m_y = device_mouse_y_to_gui(0)

var menu = "MENU"

var str_h = string_height("I")
var str_w = string_width(menu)

var x1 = room_width / 2 - str_w
var y1 = (room_height / 2 ) + 300 - str_h / 2

var x2 = room_width / 2 + str_w / 2
var y2 = (room_height / 2) + 300+ str_h
if (point_in_rectangle(m_x, m_y, x1, y1, x2, y2)) {
	if (one_time) {
		audio_play_sound(snd_mouse_pass, 10, false, 0.2)
		one_time = false
	}
	draw_set_color(c_purple)

	if (mouse_check_button_pressed(mb_left)) {
		audio_stop_sound(snd_mouse_pass)
		audio_play_sound(snd_click, 10, false, 0.2)

		audio_stop_sound(snd_game_menu)
		room_goto(0)
	}
} else {
	draw_set_color(c_white)
	one_time = true
}

draw_text_transformed(room_width /2, (room_height / 2) + 300, menu, 1, 1, 0)

draw_set_halign(-1)
draw_set_valign(-1)
draw_set_font(-1)

