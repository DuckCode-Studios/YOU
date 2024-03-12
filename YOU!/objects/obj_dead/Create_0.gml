window_set_cursor(cr_arrow)

options = ["NEW GAME", "CLOSE GAME"]
op_max = array_length(options)
scale[array_length(options) - 1] = 0

for (var i = 0; i < op_max; i++) {
	scale[i] = 1
}