depth = -10

alpha = lerp(alpha, 0, 0.25)

switch (color) {
	case "red":
		//vel = 2
		if (state = "awake") {
			sprite_index = spr_red_enemy_one
		} else if (state = "chasing") {
			sprite_index = spr_red_enemy_one_walk
		}
		break;
	case "blue":
		//vel = 1.5
		if (state = "awake") {
			sprite_index = spr_blue_enemy_one_seated
		} else if (state = "chasing") {
			sprite_index = spr_blue_enemy_one_walk
		}
		break;
	case "white":
		//vel = 3.2
		sprite_index = spr_white_enemy
		break;
}

if (life <= 0) {
	state = "died"
	
	audio_play_sound(snd_enemy_die, 10, false, 0.1)
	
	if (variable_global_exists("stats")) {
		global.stats.total_experience += experience
	}
	
}

if ((global.stats.life <= 0)) {
	exit;
}

switch (state) {
	case "awake":
		var range = 250
		
		var line = collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, false)
		
		if ((distance_to_object(obj_player) <= range) && !line) {
			state = "chasing"
		}
		
		break;
	case "chasing":
		if ((variable_global_exists("pause") && global.pause == true) 
			|| (variable_global_exists("choosing") && global.choosing == true)) {
			path_position = 0
			exit;
		}
		var x1 = x
		var y1  = y

		var x2 = (obj_player.x div 32) * 32 + 16
		var y2 = (obj_player.y div 32) * 32 + 16

		if (mp_grid_path(obj_map.grid2, path, x1, y1, x2, y2, true)) {
			path_start(path, vel, path_action_stop, false)
			if (point_distance(obj_player.x, obj_player.y, self.x, self.y) <= 15
			&& variable_global_exists("stats") && can_damage == true) {
				alarm[0] = 10
				can_damage = false
				global.stats.life -= damage
			}
		}
		break;
	case "died":
		var new_list = ds_list_create();
	    var list_size = ds_list_size(global.all_enemies);
	    for (var i = 0; i < list_size; i++) {
	        var enemy = global.all_enemies[| i];
	        if (enemy.enemyId != self.enemyId) {
	            ds_list_add(new_list, enemy);
	        }
	    }
    
	    ds_list_destroy(global.all_enemies);
	    global.all_enemies = new_list;
		instance_destroy()
		break;
}