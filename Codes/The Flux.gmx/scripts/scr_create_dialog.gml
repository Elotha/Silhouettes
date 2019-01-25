///Create Dialog Box
//
//argument0: dialog tipi
//argument1: kaçıncı dialog olduğu

{
    if global.dialog_time then exit;
    if global.option_time then exit;
    if active
        {
        global.interaction = id;
        global.dialog_time = true;
        global.dialog_type = argument0;
        with(global.key)
            {
            alarm[2] = 1;
            alarm[0] = -1;
            }
        instance_create(x+16,y,obj_DialogBox);
        with(obj_DialogBox) 
            {
            dialog_full = obj_DialogCreator.dialog[argument0,argument1];
            }
        return true;
        }
    else return false;
}
