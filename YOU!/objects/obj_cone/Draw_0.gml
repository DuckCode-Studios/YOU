if ((variable_global_exists("pause") && global.pause == true)
	|| (variable_global_exists("choosing") && global.choosing == true)) exit;

if(!surface_exists(light_surf))
{
  light_surf=surface_create(room_width,room_height);
}

var _list = ds_list_create()
var _num = 0

surface_set_target(light_surf)
{
  draw_clear_alpha(c_black,1);
  draw_primitive_begin(pr_trianglefan);
  draw_vertex_colour(x,y,c_white,.5);
  var _start_angle=image_angle_-angle/2;
  var _angle_change=angle/fan_divisions;
  for(var _i=0; _i<=fan_divisions;_i++)
  {  
	var pointX = x+lengthdir_x(maxLength, _start_angle + _angle_change * _i)
	var pointY = y+lengthdir_y(maxLength, _start_angle + _angle_change * _i)
	draw_vertex_colour(pointX,
					   pointY,
                       colors[index],.1);
					   
	_wall = collision_line(x, y, pointX, pointY, obj_wall, false, true)
	if (_wall != noone) {
		continue
	} else {
		collision_line_list(x, y, pointX, pointY, obj_enemy, false, true, _list, false);
	}
  }
  
  draw_primitive_end();
  
  var _a_big_number = $7FFFFFFF;
  var _light_x = x;
  var _light_y = y;
  
  with(obj_wall)
  {
    var _mar=1;
    
    var _l = ( bbox_left   - _light_x ) * _a_big_number;
    var _t = ( bbox_top    - _light_y ) * _a_big_number;
    var _r = ( bbox_right  - _light_x ) * _a_big_number;
    var _b = ( bbox_bottom - _light_y ) * _a_big_number;

    draw_primitive_begin(pr_trianglelist);
        
    draw_vertex_colour(bbox_right+_mar,bbox_top,c_black,1);
    draw_vertex_colour(bbox_right+_mar,bbox_bottom+_mar,c_black,1);
    draw_vertex_colour(_r,_b,c_black,1);

    draw_vertex_colour(bbox_right+_mar,bbox_top,c_black,1);
    draw_vertex_colour(_r,_t,c_black,1);
    draw_vertex_colour(_r,_b,c_black,1);

    draw_vertex_colour(bbox_right+_mar,bbox_top,c_black,1);
    draw_vertex_colour(_r,_t,c_black,1);
    draw_vertex_colour(bbox_left,bbox_top,c_black,1);

    draw_vertex_colour(bbox_left,bbox_top,c_black,1);
    draw_vertex_colour(_r,_t,c_black,1);
    draw_vertex_colour(_l,_t,c_black,1);

    draw_vertex_colour(bbox_left,bbox_top,c_black,1);
    draw_vertex_colour(bbox_left,bbox_bottom+_mar,c_black,1);
    draw_vertex_colour(_l,_t,c_black,1);

    draw_vertex_colour(bbox_left,bbox_bottom+_mar,c_black,1);
    draw_vertex_colour(_l,_b,c_black,1);
    draw_vertex_colour(_l,_t,c_black,1);

    draw_vertex_colour(bbox_right+_mar,bbox_bottom+_mar,c_black,1);
    draw_vertex_colour(bbox_left,bbox_bottom+_mar,c_black,1);
    draw_vertex_colour(_l,_b,c_black,1);

    draw_vertex_colour(bbox_right+_mar,bbox_bottom+_mar,c_black,1);
    draw_vertex_colour(_r,_b,c_black,1);
    draw_vertex_colour(_l,_b,c_black,1);

    draw_primitive_end();
  }
}
surface_reset_target();

var enemiesDamaged = ds_list_create()
for (var i = 0; i < ds_list_size(_list); i++) {
	var instance = _list[| i]
	
	if ( (instance.color == "red" && index == 1) 
		|| (instance.color == "blue" && index == 2) 
		|| (instance.color == "white" && index == 0)) {
	
	
		if (ds_list_find_index(enemiesDamaged, instance) == -1) {
			ds_list_add(enemiesDamaged, instance)
			
			with (instance) {
				visible = true
				if (variable_global_exists("stats")) {
					alpha = 0.25
					life -= global.stats.light_damage
				}
			}
			
			if (global.stats.life_steal != 0) {
				change_life(global.stats.light_damage * (global.stats.life_steal/100))
				//change_life((global.stats.life_steal))
			}
		}
	
	} else {
	
		instance.visible = false
	}

}


ds_list_destroy(enemiesDamaged)
ds_list_destroy(_list)

gpu_set_blendmode_ext(2,2)
draw_surface_ext(light_surf,0,0,1,1,0,colors[index],.1);
gpu_set_blendmode(bm_normal)
