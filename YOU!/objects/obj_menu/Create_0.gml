audio_play_sound(snd_game_menu, 10, 1)

options = ["NEW GAME", "COLLABORATORS", "EXIT"]
op_max = array_length(options)
scale[array_length(options) - 1] = 0

for (var i = 0; i < op_max; i++) {
	scale[i] = 1
}

index = 0

global.menu = true