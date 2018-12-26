///Collision Check

{
    if instance_number(obj_Character) = 0 then exit;
    if argument0 //Çağıran blok ise
        {
        if amount = 0 || amount = -1 then exit;
        var check = ((place_meeting(x,y+40,obj_Character) || place_meeting(x,y+16,obj_Character)) && obj_Character.sprite_index = spr_CharacterUp);
        }
    else //Çağıran silüet ise
        {
        switch(obj_Character.sprite_index)
            {
            case spr_CharacterRight:
                dir = 180;
                break;
                
            case spr_CharacterUp:
                dir = 270;
                break;
                
            case spr_CharacterLeft:
                dir = 0;
                break;
                
            case spr_CharacterDown:
                dir = 90;
                break;
            }
        var check = (place_meeting(x+lengthdir_x(24,dir),y+lengthdir_y(24,dir),obj_Character) || place_meeting(x+lengthdir_x(16,dir),y+lengthdir_y(16,dir),obj_Character))
        }
        
        
    if check
        {
        if global.interaction = -1
            {
            if !active
                {
                if global.key != -1
                    {
                    if global.block_id = id then with(global.key) if object_index != obj_KeyboardGetUp
                        {
                        other.active = true;
                        alarm[2] = -1;
                        alarm[0] = 1;
                        exit;
                        }
                    }
                if instance_number(obj_KeyboardKey) = 0
                    {
                    if id.object_index = obj_Bench then global.key = instance_create(x+xx,y+yy,obj_KeyboardSit);
                    else global.key = instance_create(x+xx,y+yy,obj_KeyboardKey);
                    global.block_id = id;
                    active = true;
                    }
                }
            }
        }
    else if active
        {
        with(global.key) 
            {
            alarm[2] = 1;
            alarm[0] = -1;
            }
        active = false;
        }
        
    
}
