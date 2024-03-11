
function reset_player_data() {
	if (variable_global_exists("stats")) {
		global.stats = {
			level: 1,
			xpLevel: 0,
			totalExperience: 0,

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
			light_range: 30,
		
			maxLife: 1500,
			life: 1500,
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
	var cooldown_reduction = {
		skillId: 1,
		name: "Dash reduce cooldown",
		description: "Reduces dash cooldown by 10%",
		values: 1,
		attributes: ["dash_cooldown"],
		task: "reduce", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 10, //Value of add or reduce
		minValue: 10,
		maxValue: -1
	}
	
	var life_upgrade = {
		skillId: 2,
		name: "Upgrade max Life",
		description: "Upgrade Max life by 10%",
		values: 2,
		attributes: ["life", "maxLife"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 10, //Value of add or reduce
		minValue: -1,
		maxValue: -1
	}
	
	var damage_upgrade = {
		skillId: 3,
		name: "Upgrade Light Damage",
		description: "Upgrade Light Damage by 10%",
		values: 1,
		attributes: ["light_damage"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 10, //Value of add or reduce
		minValue: -1,
		maxValue: -1
	}
	
	var speed_upgrade = {
		skillId: 4,
		name: "Upgrade Walk Speed",
		description: "Upgrade Walk Speed by 10%",
		values: 1,
		attributes: ["velc"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 10, //Value of add or reduce
		minValue: -1,
		maxValue: 8
	}
	
	var light_range_upgrade = {
		skillId: 5,
		name: "Upgrade Light Range",
		description: "Upgrade Walk Speed by 5%",
		values: 1,
		attributes: ["light_range"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 5, //Value of add or reduce
		minValue: -1,
		maxValue: 50
	}
	
	
	if (!variable_global_exists("all_skills")) {
		global.all_skills = ds_map_create()
	}
	
	ds_map_add(global.all_skills, cooldown_reduction.skillId, cooldown_reduction)
	ds_map_add(global.all_skills, life_upgrade.skillId, life_upgrade)
	ds_map_add(global.all_skills, damage_upgrade.skillId, damage_upgrade)
	ds_map_add(global.all_skills, speed_upgrade.skillId, speed_upgrade)
	ds_map_add(global.all_skills, light_range_upgrade.skillId, light_range_upgrade)
	
	
	
	
	var expCurve = []
	
	for (var i = 0; i < 30; i++) {
		if (i == 0) {
			expCurve[i] = 100
		} else {
			expCurve[i] = expCurve[i-1]*1.3
		}
	}
	
	global.expCurves = expCurve
	
	show_debug_message(global.expCurves)
	
	
}

function give_skill(skillId) {
	
	if (variable_global_exists("stats") && variable_global_exists("all_skills")) {
		
		var skill = ds_map_find_value(global.all_skills, skillId)
		
		show_debug_message("Giving the skill:")
		show_debug_log(skill)
		var value = 0
		if (skill.task == "reduce") {
			//Reduce
			value = - skill.valueSkill;
		} else {
			//Add
			value = skill.valueSkill;
		}
		
		for (var i = 0; i < skill.values; i++) {
			var valueCandidate = global.stats[$ skill.attributes[i]]
			
			
			if (skill.typeSkill == "percentual") {
				valueCandidate += global.stats[$ skill.attributes[i]] * (value/100)
			} else {
				valueCandidate += value
			}			
			
			
			if ( (skill.maxValue != -1 && valueCandidate > skill.maxValue) ) {
				global.stats[$ skill.attributes[i]] = skill.maxValue
			}
			else if ( (skill.minValue != -1 && valueCandidate < skill.minValue) ) {
				global.stats[$ skill.attributes[i]] = skill.minValue
			} else {
				global.stats[$ skill.attributes[i]] = valueCandidate
			}
			
		}
		
		show_debug_message("New PlayerData:")
		show_debug_message(global.stats)
		
	}
	
}