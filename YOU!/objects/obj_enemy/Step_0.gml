switch (color) {
	case "red":
		sprite_index = spr_red_enemy_one
		break;
	case "blue":
		sprite_index = spr_blue_enemy_one_seated
		break;
	case "white":
		sprite_index = spr_white_enemy
		break;
}

switch (state) {
	case "awake":
		var range = 100
		
		var line = collision_line(x, y, obj_player.x, obj_player.y, obj_wall, false, false)
		
		if ((distance_to_object(obj_player) <= range) && !line) {
			state = "chasing"
		}
		
		break;
	case "chasing":
		var x1 = x
		var y1  = y

		var x2 = (obj_player.x div 32) * 32 + 16
		var y2 = (obj_player.y div 32) * 32 + 16

		if (mp_grid_path(obj_map.grid2, path, x1, y1, x2, y2, true)) {
			path_start(path, vel, path_action_stop, false)
		}
		break;
}


//state = enemy_states_idle