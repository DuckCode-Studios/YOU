system = part_system_create()

emitter = part_emitter_create(system)

particle = part_type_create()

part_type_speed(particle, 0.5, 1, 0, false)

part_type_direction(particle, 0, 359, 0, 10)

part_type_shape(particle, pt_shape_flare)

part_type_size(particle, 0.1, 0.5, -0.003, false)

part_type_color3(particle, c_white, c_gray, c_black)

part_type_blend(particle, true)

part_type_alpha3(particle, 1, .7, 0.2)

part_type_life(particle, room_speed, room_speed * 3)