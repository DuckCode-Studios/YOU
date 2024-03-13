global.pause = false

options = ["RESUME GAME", "EXIT"]
op_max = array_length(options)
scale[array_length(options) - 1] = 0

for (var i = 0; i < op_max; i++) {
	scale[i] = 1
}

index = 0

one_time = true

global.menu = true