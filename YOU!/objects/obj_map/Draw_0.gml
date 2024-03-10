for (var xx = 0; xx < cell_h; xx++) {
	for (var yy = 0; yy < cell_v; yy++) {
		if (grid[# xx, yy] == 1 && grid[# xx, yy -1 ] == 0) {
			draw_set_alpha(0.7)
			draw_sprite(spr_shadow_wall, 0, xx * cell_size, yy * cell_size)
		}
	}
}