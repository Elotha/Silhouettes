///Create Random Objects
//
//argument0 = hangi obje?
//argument1 = sprite_index
//argument2 = object_index

{
    
    var i = 1;
    var mask_x, mask_y;
    switch(argument0)
        {
        case BENCH_LAMP:
            var rnd = (irandom(room_width/32)*32);
            mask_x = sprite_get_width(spr_BenchMask)+sprite_get_width(spr_LampMask);
            mask_y = sprite_get_height(spr_LampMask);
            x1 = rnd;
            y1 = room_height/2-32*3;
            x2 = rnd+mask_x;
            y2 = room_height/2-32*3-mask_y;
            while collision_rectangle(rnd,y1,x2,y2,obj_Mask,false,true)
                {
                rnd = (irandom(room_width/32)*32);
                x2 = rnd+mask_x;
                i++;
                if i > 10 then break;
                }
            if i <= 10
                {
                var bench = instance_create(rnd,y1,obj_Bench);
                instance_create(bench.x-32,bench.y-32,obj_Lamp);
                }
            exit;
            break;
            
        case BENCH_LAMP_TRASH:
            var rnd = (irandom(room_width/32)*32);
            mask_x = sprite_get_width(spr_BenchMask)+sprite_get_width(spr_LampMask)+sprite_get_width(spr_TrashCanMask);
            mask_y = sprite_get_height(spr_LampMask);
            x1 = rnd;
            y1 = room_height/2-32*3;
            x2 = rnd+mask_x;
            y2 = room_height/2-32*3-mask_y;
            while collision_rectangle(rnd,y1,x2,y2,obj_Mask,false,true)
                {
                rnd = (irandom(room_width/32)*32);
                x2 = rnd+mask_x;
                i++;
                if i > 10 then break;
                }
            if i <= 10
                {
                var bench = instance_create(rnd,y1,obj_Bench);
                instance_create(bench.x-32,bench.y-32,obj_Lamp);
                instance_create(bench.x+128,bench.y-32,obj_TrashCan);
                }
            exit;
            break;
            
        case HEDGE:
            var nmb = irandom_range(1,4);
            var rnd_x = (irandom(room_width/32)*32);
            var rnd_y = choose(room_height/2-64,room_height/2+80);
            mask_x = sprite_get_width(spr_HedgeMask);
            mask_y = sprite_get_height(spr_HedgeMask);
            while collision_rectangle(rnd_x,rnd_y,rnd_x+((nmb-1)*64)+mask_x,rnd_y-mask_y,obj_Mask,false,true)
                {
                rnd_x = (irandom(room_width/32)*32);
                rnd_y = choose(room_height/2-64,room_height/2+80);
                i++;
                if i > 10 then break;
                }
            if i <= 10
                {
                for(var k = 0; k < nmb; k++)
                    {
                    instance_create(rnd_x+(k*64),rnd_y,obj_Hedge);
                    }
                }
            exit;
            break;
            
        default:
            rnd_x = (irandom(room_width/32)*32);
            rnd_y = irandom(10)*32;
            rnd_dir = choose(-1,1);
            mask_x = sprite_get_width(argument1);
            mask_y = sprite_get_height(argument1);
            x1 = rnd_x;
            y1 = room_height/2+(rnd_dir*(rnd_y+96));
            x2 = rnd_x+mask_x;
            y2 = room_height/2+rnd_dir*(rnd_y+96)-mask_y;            
            break;
        }
        
    while collision_rectangle(rnd_x,x2,y1,y2,obj_Mask,false,true)
        {
        rnd = (irandom(room_width/32)*32);
        rnd_x = (irandom(room_width/32)*32);
        rnd_y = irandom(10)*32;
        rnd_dir = choose(-1,1);
        y1 = room_height/2+(rnd_dir*(rnd_y+96));
        x2 = rnd_x+mask_x;
        y2 = room_height/2+rnd_dir*(rnd_y+96)-mask_y;     
        i++;
        if i > 10 then break;
        }
    if i <= 10
        {
        instance_create(rnd_x,y1,argument2);
        }
}
