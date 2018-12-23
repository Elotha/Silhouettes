///Create Dialog Box
//
//argument0: dialog tipi
//argument1: kaçıncı dialog olduğu

{
    instance_create(x+16,y,obj_DialogBox);
    with(obj_DialogBox) 
        {
        dialog_full = obj_DialogCreator.dialog[argument0,argument1];
        }
}
