///Create Random Objects
//
//argument0 = hangi obje?

{
    i = 1;
    var mask, rnd, rnd_x, rnd_y, rnd_dir, inst;
    switch(argument0)
            {
            case LAMP:
                spr = spr_LampMask;
                obj = obj_Lamp;
                break;
                
            case TRASHCAN:
                spr = spr_TrashCanMask;
                obj = obj_TrashCan;
                break;
                
            case CHEST:
                spr = spr_ChestMask;
                obj = obj_Chest;
                break;
                
            case MIRROR:
                spr = spr_MirrorMask;
                obj = obj_Mirror;
                break;
                
            case HEDGE:
                spr = spr_HedgeMask;
                obj = obj_Hedge;
                
            case FOUNTAIN:
                spr = spr_FountainMask;
                obj = obj_Fountain;
                break;
                
            case BENCH_LAMP:
                spr = spr_LampBenchMask;
                obj = obj_Lamp;
                break;
                
            case BENCH_LAMP_TRASH:
                spr = spr_LampBenchTrashMask;
                obj = obj_Lamp;
                break;
                
            case SILHOUETTE:
                spr = spr_OneSilhouetteMask;
                obj = obj_Silhouette;
                break;
                
            case SILHOUETTES_TWO:
                spr = spr_TwoSilhouettesMask;
                obj = obj_Silhouette;
                break;
                break;
                
            case SILHOUETTES_THREE:
                spr = spr_ThreeSilhouettesMask;
                obj = obj_Silhouette;
                break;
                
            case LAMP_SILHOUETTE_ONE:
                spr = spr_LampOneSilhouetteMask;
                obj = obj_Lamp;
                break;
                
            case LAMP_SILHOUETTES_TWO:
                spr = spr_LampTwoSilhouettesMask;
                obj = obj_Lamp;
                break;
                
            case LAMP_SILHOUETTES_THREE:
                spr = spr_LampThreeSilhouettesMask;
                obj = obj_Lamp;
                break;
                
                
            }    
    switch(argument0)
        {
        case BENCH_LAMP:
            x1 = (irandom(room_width/32)*32);
            y1 = room_height/2-32*4;
            mask = instance_create(x1,y1,obj_Mask);
            mask.sprite_index = spr;
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
            if i <= 30
                {
                inst = instance_create(x1,y1,obj);
                instance_create(inst.x+32,inst.y+32,obj_Bench);
                }
            exit;
            break;
            
        case BENCH_LAMP_TRASH:
            x1 = (irandom(room_width/32)*32);
            y1 = room_height/2-32*4;
            mask = instance_create(x1,y1,obj_Mask);
            mask.sprite_index = spr;
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
            if i <= 30
                {
                inst = instance_create(x1,y1,obj);
                instance_create(inst.x+32,inst.y+32,obj_Bench);
                instance_create(inst.x+160,inst.y,obj_TrashCan);
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
    mask.sprite_index = spr;
    with(mask) 
        {
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
        inst = instance_create(x1,y1,obj);
        if argument0 = SILHOUETTES_TWO
            {
            instance_create(inst.x+32,inst.y,obj_Silhouette);
            }
        if argument0 = SILHOUETTES_THREE
            {
            instance_create(inst.x+24,inst.y+32,obj_Silhouette);
            instance_create(inst.x+48,inst.y,obj_Silhouette);
            }
        if argument0 = LAMP_SILHOUETTE_ONE
            {
            instance_create(inst.x+(irandom_range(-6,26)),inst.y+32,obj_Silhouette);
            }
        if argument0 = LAMP_SILHOUETTES_TWO
            {
            instance_create(inst.x,inst.y+32,obj_Silhouette);
            instance_create(inst.x+32,inst.y+32,obj_Silhouette);
            }
        if argument0 = LAMP_SILHOUETTES_THREE
            {
            instance_create(inst.x-16,inst.y,obj_Silhouette);
            instance_create(inst.x+16,inst.y+32,obj_Silhouette);
            instance_create(inst.x+56,inst.y,obj_Silhouette);
            
            }
        }
    var spr, obj, inst;
}
