function player_states_free(){
	
	if (global.stats.life <= 0) {
		state = player_states_dead
		exit;
	}
	
	
	if (variable_global_exists("expCurves") && global.expCurves[global.stats.level] <= global.stats.total_experience) {
		//Player passou de nível!!!!
		if (global.stats.level <= global.max_level) {
			global.stats.total_experience -= global.expCurves[global.stats.level]
			global.stats.level += 1
			global.choosing = true
			exit;
		}

	}
	
	#region walk

	var up = keyboard_check(ord("W"));
	var down = keyboard_check(ord("S"));
	var right = keyboard_check(ord("D"));
	var left = keyboard_check(ord("A"));

	var pressed = right - left != 0 || down - up != 0;

	var move_dir = point_direction(0, 0, (right - left), (down - up));

	global.stats.velh = lengthdir_x(global.stats.velc * pressed, move_dir);
	global.stats.velv = lengthdir_y(global.stats.velc * pressed, move_dir);

	if (global.stats.velh != 0 || global.stats.velv != 0) {
		sprite_index = spr_player_walk;
	} else {
		sprite_index = spr_player_idle;
	}

	if (keyboard_check(vk_shift) && (global.stats.can_dash)) {
		global.stats.velh = 0;
		global.stats.velv = 0;
		
		alarm[0] = global.stats.dash_cooldown
		
		global.stats.can_dash = false
		
		global.stats.dash_direction = point_direction(x, y, mouse_x, mouse_y)
	
		sprite_index = spr_player_dash
		
		state = player_states_dash;
	}

		if (place_meeting(x+global.stats.velh, y, obj_wall)) {
		while (!place_meeting(x+sign(global.stats.velh), y, obj_wall)) {
			x+=sign(global.stats.velh);
		}
		global.stats.velh = 0;
	}

	x+=global.stats.velh;

	if (place_meeting(x, y+global.stats.velv, obj_wall)) {
		while (!place_meeting(x, y+sign(global.stats.velv), obj_wall)) {
			y+=sign(global.stats.velv);
		}
		global.stats.velv = 0;
	}

	y+=global.stats.velv;

	#endregion
}

function player_states_dead() {
	
	if (variable_global_exists("stats")) {
		instance_destroy()
	}
}
	
	


function player_states_dash() {
	
	if (global.stats.life <= 0) {
		state = player_states_dead
		exit;
	}
	
	global.stats.velh = lengthdir_x(global.stats.dash_force, global.stats.dash_direction);
	global.stats.velv = lengthdir_y(global.stats.dash_force, global.stats.dash_direction);
	
	global.stats.dash_time++
	
	if (global.stats.velh >= 0) {
		image_xscale = 1
	} else {
		image_xscale = -1
	}
	
	if (place_meeting(x+global.stats.velh, y, obj_wall)) {
		while (!place_meeting(x+sign(global.stats.velh), y, obj_wall)) {
			x+=sign(global.stats.velh);
		}
		global.stats.dash_time = global.stats.dash_distance
		global.stats.velh = 0;
	}

	x+=global.stats.velh;

	if (place_meeting(x, y+global.stats.velv, obj_wall)) {
		while (!place_meeting(x, y+sign(global.stats.velv), obj_wall)) {
			y+=sign(global.stats.velv);
		}
		global.stats.dash_time = global.stats.dash_distance
		global.stats.velv = 0;
	}

	y+=global.stats.velv;
	
	if  (global.stats.dash_time >= global.stats.dash_distance) {
		global.stats.dash_time = 0
		global.stats.velh = 0
		global.stats.velv = 0
		state = player_states_free
	}
	instance_create_layer(x, y, "Instances", obj_dash);
}