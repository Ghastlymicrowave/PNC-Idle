draw_self()
draw_sprite_ext(spr_leverBase,0,x,y,2,2,0,c_white,1)

draw_set_halign(fa_left)
draw_healthbar(x+200,y-100,x+250,y+100,angle_ratio*100,c_black,c_red,c_green,3,true,true)
draw_text(x+260,y+100-(angle_ratio*200),"efficency: "+string(angle_ratio*100))