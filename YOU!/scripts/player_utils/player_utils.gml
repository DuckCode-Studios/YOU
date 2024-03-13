
function reset_player_data() {
	if (variable_global_exists("stats")) {
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
	
	
	if (variable_global_exists("level")) {
		global.level = 0
	}
}


function change_life(value) {
	
	var candidate = global.stats.life + value
	
	if (candidate < 0) {
		global.stats.life = 0
	} else if (candidate > global.stats.maxLife) {
		global.stats.life = global.stats.maxLife
	} else {
		global.stats.life += value
	}
	
	
}

function load_all_skills() {

	show_debug_message("Loading All Card Types")

	var diamond = {
		cardId: 1,
		name: "Diamond",
		spriteImage: spr_card_template_diamond,
		chance: 1,
	}
	
	var gold = {
		cardId: 2,
		name: "Gold",
		spriteImage: spr_card_template_gold,
		chance: 19,
	}
	
	var silver = {
		cardId: 3,
		name: "Silver",
		spriteImage: spr_card_template_silver,
		chance: 100
	}
	
	global.tiers = ds_map_create()
	
	global.silverCards = ds_list_create()
	global.goldCards = ds_list_create()
	global.diamondCards = ds_list_create()
	
	ds_map_add(global.tiers, diamond.cardId, diamond)
	ds_map_add(global.tiers, silver.cardId, silver)
	ds_map_add(global.tiers, gold.cardId, gold)

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
		maxValue: -1,
		spriteImage: spr_dash_reduction,
		tier: silver.cardId
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
		maxValue: -1,
		spriteImage: spr_life_boost,
		tier: silver.cardId
	}
	
	var life_upgrade2 = {
		skillId: 3,
		name: "Upgrade max Life",
		description: "Upgrade Max life by 35%",
		values: 2,
		attributes: ["life", "maxLife"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 35, //Value of add or reduce
		minValue: -1,
		maxValue: -1,
		spriteImage: spr_life_boost,
		tier: diamond.cardId
	}
	
	var damage_upgrade = {
		skillId: 4,
		name: "Upgrade Light Damage",
		description: "Upgrade Light Damage by 10%",
		values: 1,
		attributes: ["light_damage"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 10, //Value of add or reduce
		minValue: -1,
		maxValue: -1,
		spriteImage: spr_damage_boost,
		tier: silver.cardId
	}
	
	var damage_upgrade2 = {
		skillId: 5,
		name: "Upgrade Light Damage",
		description: "Upgrade Light Damage by 12%",
		values: 1,
		attributes: ["light_damage"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 12, //Value of add or reduce
		minValue: -1,
		maxValue: -1,
		spriteImage: spr_damage_boost,
		tier: gold.cardId
	}
	
	var damage_upgrade3 = {
		skillId: 6,
		name: "Upgrade Light Damage",
		description: "Upgrade Light Damage by 20%",
		values: 1,
		attributes: ["light_damage"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 20, //Value of add or reduce
		minValue: -1,
		maxValue: -1,
		spriteImage: spr_damage_boost,
		tier: diamond.cardId
	}
	
	var speed_upgrade = {
		skillId: 7,
		name: "Upgrade Walk Speed",
		description: "Upgrade Walk Speed by 10%",
		values: 1,
		attributes: ["velc"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 10, //Value of add or reduce
		minValue: -1,
		maxValue: 8,
		spriteImage: spr_move_speed,
		tier: silver.cardId
	}
	
	var speed_upgrade2 = {
		skillId: 8,
		name: "Upgrade Walk Speed",
		description: "Upgrade Walk Speed by 12%",
		values: 1,
		attributes: ["velc"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 12, //Value of add or reduce
		minValue: -1,
		maxValue: 8,
		spriteImage: spr_move_speed,
		tier: gold.cardId
	}
	
	var speed_upgrade3 = {
		skillId: 9,
		name: "Upgrade Walk Speed",
		description: "Upgrade Walk Speed by 20%",
		values: 1,
		attributes: ["velc"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 20, //Value of add or reduce
		minValue: -1,
		maxValue: 8,
		spriteImage: spr_move_speed,
		tier: gold.cardId
	}
	
	var light_range_upgrade = {
		skillId: 10,
		name: "Upgrade Light Range",
		description: "Upgrade Light Range by 5%",
		values: 1,
		attributes: ["light_range"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 5, //Value of add or reduce
		minValue: -1,
		maxValue: 50,
		spriteImage: spr_flashlight_range,
		tier: silver.cardId
	}
	
	var life_steal_upgrade = {
		skillId: 11,
		name: "Upgrade Life Steal",
		description: "Upgrade Life Steal by 5%",
		values: 1,
		attributes: ["life_steal"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 5, //Value of add or reduce
		minValue: -1,
		maxValue: 30,
		spriteImage: spr_life_steal,
		tier: gold.cardId
	}
	
	var life_steal_upgrade2 = {
		skillId: 12,
		name: "Upgrade Life Steal",
		description: "Upgrade Life Steal by 10%",
		values: 1,
		attributes: ["life_steal"],
		task: "add", //reduce, add
		typeSkill: "percentual", //flat, percentual
		valueSkill: 10, //Value of add or reduce
		minValue: -1,
		maxValue: 30,
		spriteImage: spr_life_steal,
		tier: diamond.cardId
	}
	
	
	if (!variable_global_exists("all_skills")) {
		global.all_skills = ds_map_create()
	}
	
	ds_map_add(global.all_skills, cooldown_reduction.skillId, cooldown_reduction)
	
	
	ds_map_add(global.all_skills, life_upgrade.skillId, life_upgrade)
	ds_map_add(global.all_skills, life_upgrade2.skillId, life_upgrade2)
	
	ds_map_add(global.all_skills, damage_upgrade.skillId, damage_upgrade)
	ds_map_add(global.all_skills, damage_upgrade2.skillId, damage_upgrade2)
	ds_map_add(global.all_skills, damage_upgrade3.skillId, damage_upgrade3)
	
	ds_map_add(global.all_skills, speed_upgrade.skillId, speed_upgrade)
	ds_map_add(global.all_skills, speed_upgrade2.skillId, speed_upgrade2)
	ds_map_add(global.all_skills, speed_upgrade3.skillId, speed_upgrade3)
	
	ds_map_add(global.all_skills, light_range_upgrade.skillId, light_range_upgrade)
	
	ds_map_add(global.all_skills, life_steal_upgrade.skillId, life_steal_upgrade)
	ds_map_add(global.all_skills, life_steal_upgrade2.skillId, life_steal_upgrade2)
	
	
	for (var i = 1; i <= ds_map_size(global.all_skills); i++) {
		var skill = ds_map_find_value(global.all_skills, i)
		if (skill.tier == 1) {
			ds_list_add(global.diamondCards, skill.skillId)
		} else if (skill.tier == 2) {
			ds_list_add(global.goldCards, skill.skillId)
		} else {
			ds_list_add(global.silverCards, skill.skillId)
		}
	}
	
	var expCurve = []
	global.max_level = 30
	for (var i = 0; i < global.max_level; i++) {
		if (i == 0) {
			expCurve[i] = 100
		} else {
			expCurve[i] = expCurve[i-1]*1.3
		}
	}
	
	global.expCurves = expCurve
	
	
}

function give_skill(skillId) {
	
	if (variable_global_exists("stats") && variable_global_exists("all_skills")) {
		
		var skill = ds_map_find_value(global.all_skills, skillId)
		
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
		
	}
	
}