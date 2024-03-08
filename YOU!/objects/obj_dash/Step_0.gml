image_alpha -= 0.1

if (global.stats.velh >= 0) {
	image_xscale = 1
} else {
	image_xscale = -1
}

if (image_alpha <= 0) {
	instance_destroy()
}