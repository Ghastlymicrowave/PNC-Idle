depth=num

//if !surface_exists(global.lightsSurface) {
//	global.lightsSurface = surface_create(surface_get_width(application_surface),surface_get_height(application_surface))	
//}
//surface_set_target(global.lightsSurface)
//gpu_set_colorwriteenable(1,1,1,0)
//draw_sprite_tiled(spr_fog,0,0,0)
//gpu_set_colorwriteenable(0,0,0,1)
draw_sprite_stretched(spr_black,0,xgui-sprite_width,ygui,sprite_width+heightanimate/100*sprite_width/4,sprite_height*0.10)
//gpu_set_colorwriteenable(1,1,1,1)
//surface_reset_target()
//draw_surface(global.lightsSurface,0,0)
draw_sprite_part_ext(sprite_index,0,0,0,sprite_width/image_xscale,sprite_height*max(heightanimate,10)/100/image_yscale,xgui-sprite_width,ygui,image_xscale,image_yscale,c_white,1)


draw_set_halign(fa_right)
draw_text(xgui+heightanimate/100*sprite_width/4-10,ygui+10,"Save slot: " + string(num))