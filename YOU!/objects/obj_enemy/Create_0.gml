//state()

state = "awake"

path = path_add();


color = "red"
visible = false
switch (color) {
	case "red":
		vel = 2;
		sprite_index = spr_red_enemy_one;
		break;
	case "blue":
		vel = 1;
		sprite_index = spr_blue_enemy_one_walk;
		break;
	case "white":
		vel = 4;
		sprite_index = spr_white_enemy;
		break;
}