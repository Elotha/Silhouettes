///Wrap

{
    if x < -(sprite_xoffset+sprite_width+64)
        {
        x += room_width+128;
        }
    else if x > room_width+sprite_width-sprite_xoffset+64
        {
        x -= room_width+128;
        }
}
