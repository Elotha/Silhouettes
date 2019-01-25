#define scr_destroy_instance
///Destroy

{
    with(argument0) instance_destroy();
}




#define scr_destroy_except
///Destroy

{
    with(argument0) 
        {
        if argument0 != argument1 then instance_destroy();
        }
}