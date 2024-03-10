
function reset_player_data() {
	if (variable_global_exists("stats")) {
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
		
			maxLife: 20,
			life: 20,
			light_damage: 1,
		
			habilities: ds_list_create()
		}
	}
	
	
	if (variable_global_exists("level")) {
		global.level = 0
	}
}


function load_all_skills() {

	show_debug_message("Loading all skills:")
	var skill1 = {
		skillId: 1,
		name: "Dash reduce cooldown",
		description: "Reduces dash cooldown by 10%",
		attribute: "dash_cooldown",
		task: "reduce", //reduce, add
		type: "flat", //flat, percentual
		value: 10, //Value of add or reduce
	}
	
	
	if (!variable_global_exists("all_skills")) {
		global.all_skills = ds_map_create()
	}
	
	ds_map_add(global.all_skills, skill1.skillId, skill1)
	
	show_debug_message(global.stats[$ skill1.attribute])
	
	show_debug_message(ds_map_find_value(global.all_skills, skill1.skillId))
}