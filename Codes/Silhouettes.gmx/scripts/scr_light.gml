///Light
//
//argument0: size
//argument1: color
//argument2: x coordinate
//argument3: y coordinate


{
    draw_set_blend_mode(bm_subtract);
    surface_set_target(light);
    draw_circle_colour(x-view_xview+argument2,y-view_yview+argument3,argument0,argument1,c_black,false);
    surface_reset_target();
    draw_set_blend_mode(bm_normal);
}
