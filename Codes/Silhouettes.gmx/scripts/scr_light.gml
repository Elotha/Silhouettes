///Light
//
//argument0: size
//argument1: color
//argument2: x coordinate
//argument3: y coordinate
//-view_xview-view_yview


{
    draw_set_blend_mode(bm_subtract);
    surface_set_target(light);
    draw_circle_colour(argument2,argument3,argument0,argument1,c_black,false);
    surface_reset_target();
    draw_set_blend_mode(bm_normal);
}
