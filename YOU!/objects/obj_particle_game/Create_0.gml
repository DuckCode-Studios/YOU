system2 = part_system_create()
emitter2 = part_emitter_create(system2)
particle2 = part_type_create()

part_type_speed(particle2, 0.5, 1, 0, 0)

part_type_direction(particle2, 0, 359, 0, true)

part_type_shape(particle2, pt_shape_flare)

part_type_size(particle2, 0.1, 0.5, -0.004, 0)

part_type_life(particle2, room_speed, room_speed * 2)

part_type_color3(particle2, c_purple, c_white, c_fuchsia)

part_type_blend(particle2, true)

part_type_alpha3(particle2, 1, 0.7, 0.5)