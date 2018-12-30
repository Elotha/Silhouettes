///Create Random Objects
//
//argument0 = hangi obje?
//argument1 = sprite_index
//argument2 = object_index

{
    i = 1;
    var mask, rnd, rnd_x, rnd_y, rnd_dir, obj;
    switch(argument0)
        {
        case BENCH_LAMP:
            x1 = (irandom(room_width/32)*32);
            y1 = room_height/2-32*3;
            mask = instance_create(x1,y1,obj_Mask);
            mask.sprite_index = argument1;
            with(mask) 
                {
                while place_meeting(x,y,obj_Mask)
                    {
                    x = (irandom(room_width/32)*32);
                    other.i++;
                    if other.i > 10 then instance_destroy();
                    }
                other.x1 = x;
                }
            if i <= 10
                {
                obj = instance_create(x1,y1,argument2);
                instance_create(obj.x+32,obj.y+32,obj_Bench);
                }
            exit;
            break;
            
        case BENCH_LAMP_TRASH:
            x1 = (irandom(room_width/32)*32);
            y1 = room_height/2-32*3;
            mask = instance_create(x1,y1,obj_Mask);
            with(mask) 
                {
                sprite_index = argument1;
                while place_meeting(x,y,obj_Mask)
                    {
                    x = (irandom(room_width/32)*32);
                    other.i++;
                    if other.i > 10 then instance_destroy();
                    }
                other.x1 = x;
                }
            if i <= 10
                {
                obj = instance_create(x1,y1,argument2);
                instance_create(obj.x+32,obj.y+32,obj_Bench);
                instance_create(obj.x+160,obj.y,obj_TrashCan);
                }
            exit;
            break;
            
        case HEDGE:
            nmb = irandom_range(1,4);
            rnd_x = (irandom(room_width/32)*32);
            rnd_y = choose(room_height/2-64,room_height/2+80);
            var k;
            mask = -1;
            mask_col = false;
            while mask = -1
                {
                for(k = 0; k < nmb; k++)
                    {
                    if mask_col = false
                        {
                        mask[k] = instance_create(rnd_x+(k*64),rnd_y,obj_Mask);
                        mask[k].sprite_index = spr_HedgeMask;
                        with(mask[k]) 
                            {
                            if place_meeting(x,y,obj_Mask)
                                {
                                other.mask_col = true;
                                }
                            }
                        }
                    else break;
                    }
                if mask_col
                    {
                    for(k = 0; k < array_length_1d(mask); k++)
                        {
                        with(mask[k]) instance_destroy();
                        }
                    mask = -1;
                    nmb = irandom_range(1,4);
                    rnd_x = (irandom(room_width/32)*32);
                    rnd_y = choose(room_height/2-64,room_height/2+80);
                    mask_col = false;
                    }
                i++;
                if i > 10 then break;
                }
            if i <= 10
                {
                for(k = 0; k < nmb; k++)
                    {
                    instance_create(rnd_x+(k*64),rnd_y,obj_Hedge);
                    }
                instance_create(mask[k-1].x+64,mask[k-1].y,obj_Hedge2);
                var hedge = instance_create(mask[k-1].x+64,mask[k-1].y,obj_Mask);
                hedge.sprite_index = spr_Hedge2Mask;
                }
            exit;
            break;
            
        case LAMP_SILHOUETTE_ONE:
            rnd_x = (irandom(room_width/32)*32);
            rnd_y = irandom(12)*32;
            rnd_dir = choose(-1,1);
            mask_x = sprite_get_width(spr_LampMask);
            mask_y = sprite_get_height(spr_LampMask);
            x1 = rnd_x;
            y1 = room_height/2+(rnd_dir*(rnd_y+96));
            if rnd_dir = 1 then y1 += 32;
            x2 = rnd_x+mask_x;
            y2 = room_height/2+rnd_dir*(rnd_y+96)-mask_y;       
            if rnd_dir = 1 then y2 += 32; 
            while collision_rectangle(x1,y1,x2,y2,obj_Mask,false,true)
                {
                rnd_x = (irandom(room_width/32)*32);
                rnd_y = irandom(12)*32;
                rnd_dir = choose(-1,1);
                x1 = rnd_x;
                x2 = rnd_x+mask_x;
                i++;
                if i > 10 then break;
                }
            if i <= 10
                {
                lamp = instance_create(x1,y1,obj_Lamp);
                instance_create(lamp.x+(irandom_range(-6,26)),lamp.y+32,obj_Silhouette);
                }
            exit;
            break;
            
        case LAMP_SILHOUETTES_THREE:
            rnd_x = (irandom(room_width/32)*32);
            rnd_y = irandom(12)*32;
            rnd_dir = choose(-1,1);
            mask_x = 104;
            mask_y = sprite_get_height(spr_LampMask)+64;
            x1 = rnd_x;
            y1 = room_height/2+(rnd_dir*(rnd_y+96));
            if rnd_dir = 1 then y1 += 32;
            x2 = rnd_x+mask_x;
            y2 = room_height/2+rnd_dir*(rnd_y+96)-mask_y;       
            if rnd_dir = 1 then y2 += 32; 
            while collision_rectangle(x1,y1,x2,y2,obj_Mask,false,true)
                {
                rnd_x = (irandom(room_width/32)*32);
                rnd_y = irandom(12)*32;
                rnd_dir = choose(-1,1);
                x1 = rnd_x;
                x2 = rnd_x+mask_x;
                i++;
                if i > 10 then break;
                }
            if i <= 10
                {
                lamp = instance_create(x1,y1,obj_Lamp);
                                
                instance_create(lamp.x-16,lamp.y,obj_Silhouette);
                instance_create(lamp.x+16,lamp.y+32,obj_Silhouette);
                instance_create(lamp.x+56,lamp.y,obj_Silhouette);
                }
            exit;
            break;
            
        default:
            rnd_x = (irandom(room_width/32)*32);
            rnd_y = irandom(12)*32;
            rnd_dir = choose(-1,1);
            x1 = rnd_x;
            y1 = room_height/2+(rnd_dir*(rnd_y+96));
            if rnd_dir = 1 then y1 += 32;
            i++;
            break;
        }
        
    mask = instance_create(x1,y1,obj_Mask);
    with(mask) 
        {
        sprite_index = argument1;
        while place_meeting(x,y,obj_Mask)
            {
            x = (irandom(room_width/32)*32);
            rnd_y = irandom(12)*32;
            rnd_dir = choose(-1,1);
            y1 = room_height/2+(rnd_dir*(rnd_y+96));
            if rnd_dir = 1 then y1 += 32;
            y = y1;
            other.i++;
            if other.i > 10 then instance_destroy();
            other.x1 = x;
            other.y1 = y;
            }
        }
    if i <= 10
        {
        obj = instance_create(x1,y1,argument2);
        if argument0 = SILHOUETTES_THREE
            {
            instance_create(obj.x+24,obj.y+32,obj_Silhouette);
            instance_create(obj.x+48,obj.y,obj_Silhouette);
            }
        }
}
