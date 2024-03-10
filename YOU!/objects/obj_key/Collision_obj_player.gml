global.level += 1
if (variable_global_exists("stats")) {
	global.stats.life = global.stats.maxLife
	global.stats.can_dash = true
	give_skill(1)
}
room_restart()