if ((variable_global_exists("pause") && global.pause == true) 
	|| (variable_global_exists("choosing") && global.choosing == true)) {
	sprite_index = spr_player_hidden
	image_index = 4
	exit;
}

time_now += 1

if (max_time <= time_now) {
	can_snd_walk = true
} else {
	can_snd_walk = false
}

if (state == player_states_dash) {
	audio_play_sound(snd_dash, 15, false, 0.2)
} else if (state == player_states_free ) {
	if (sprite_index == spr_player_walk && can_snd_walk) {
		can_snd_walk = false
		time_now = 0
		audio_play_sound(snd_walk, 15, false, 0.2)
	} else if (sprite_index == spr_player_idle) {
		audio_stop_sound(snd_walk)
	}
} 

depth = -7

if (variable_global_exists("stats") && global.stats.life <= 0) {
	instance_destroy()
	exit;
}

state()

if (!instance_exists(obj_cone)) {
	cone = instance_create_layer(x, y, "Instances", obj_cone)
}