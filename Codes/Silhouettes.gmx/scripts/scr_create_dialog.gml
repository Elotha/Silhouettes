///Create Dialog Box
//
//argument0: dialog tipi
//argument1: kaçıncı dialog olduğu

{
    if active && global.item_interaction[argument0]
        {
        global.dialog_time = true;
        global.dialog_type = argument0;
        with(global.key)with(global.key) 
            {
            alarm[2] = 1;
            alarm[0] = -1;
            }
        instance_create(x+16,y,obj_DialogBox);
        with(obj_DialogBox) 
            {
            dialog_full = obj_DialogCreator.dialog[argument0,argument1];
            }
        global.item_interaction[argument0] = false;
        return true;
        }
    else return false;
}
