
state = player_states_free;

flash_light = instance_create_layer(x, y, "Instances", obj_flashlight)

cone = noone

if (!variable_global_exists("stats")) {
	global.stats = {
			level: 1,
			xpLevel: 0,
		
			velh: 0,
			velv: 0,
			velc: 3.0,
			dash_direction: 0,
			dash_force: 15,
			dash_distance: 10,
			can_dash: true,
			dash_cooldown: 20,
			x_position: 0,
			dash_time: 0,
		
			maxLife: 1500,
			life: 1500,
			light_damage: 1,
		
			habilities: ds_list_create()
	}

}

if (!variable_global_exists("all_skills")) {
	load_all_skills()

}