window_set_cursor(cr_none)


state = player_states_free;

flash_light = instance_create_layer(x, y, "Instances", obj_flashlight)

cone = noone

can_snd_walk = true
max_time = 30
time_now = 0

if (!variable_global_exists("stats")) {
	global.stats = {
			level: 0,
			total_experience: 0,
		
			velh: 0,
			velv: 0,
			velc: 3.0,
			dash_direction: 0,
			dash_force: 15,
			dash_distance: 10,
			can_dash: true,
			dash_cooldown: 45,
			x_position: 0,
			dash_time: 0,
			light_range: 30,
		
			maxLife: 100,
			life: 100,
			light_damage: 1,
			life_steal: 1
	}

}

if (!variable_global_exists("all_skills")) {
	load_all_skills()

}