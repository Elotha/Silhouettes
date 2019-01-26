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
        if global.talk != -1 then with(global.talk)
            {
            alarm[2] = 1;
            alarm[0] = -1;
            }
        else with(global.key)
            {
            alarm[2] = 1;
            alarm[0] = -1;
            }
        if instance_number(obj_KeyboardGetUp) != 0 then with(obj_KeyboardGetUp) alarm[2] = 1;
        instance_create(x+16,y,obj_DialogBox);
        with(obj_DialogBox) 
            {
            dialog_full = obj_DialogCreator.dialog[argument0,argument1];
            }
        return true;
        }
    else return false;
}
