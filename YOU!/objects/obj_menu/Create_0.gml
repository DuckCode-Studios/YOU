options = ["NEW GAME", "COLLABORATORS", "HELP", "EXIT"]
op_max = array_length(options)
scale[array_length(options) - 1] = 0

for (var i = 0; i < op_max; i++) {
	scale[i] = 1
}

index = 0

sound_played = [0,0,0,0]

one_time_2 = true
xold = 0
yold = 0

global.menu = true