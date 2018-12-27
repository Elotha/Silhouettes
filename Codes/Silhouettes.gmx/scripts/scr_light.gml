///Light
//
//argument0: size
//argument1: color
//argument2: x coordinate
//argument3: y coordinate
//-view_xview-view_yview


{
    exit;
    draw_set_blend_mode(bm_subtract);
    surface_set_target(light);
    draw_circle_colour(argument2-view_xview+global.light_xfix,argument3-view_yview+global.light_yfix,argument0,argument1,c_black,false);
    surface_reset_target();
    draw_set_blend_mode(bm_normal);
    
    if (global.light_xfix != 0 || global.light_yfix != 0) && obj_Light.alarm[0] = -1 then obj_Light.alarm[0] = 1;
}
