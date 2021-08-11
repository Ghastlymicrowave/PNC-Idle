//lighting

var alph = lightAlpha


if !surface_exists(global.lightsSurface){
	global.lightsSurface = surface_create(surface_get_width(application_surface),surface_get_height(application_surface))	
}

surface_set_target(global.lightsSurface)
	draw_clear_alpha(c_black,alph)
	var a= mouse_get_extendedScreenPos()
	gpu_set_blendmode(bm_subtract)
	
	if random(10) > 8{
		 rand1 = random_range(1.5,1.7)
	}
	if random(10)>8{
		 randRot = random_range(0,30)
	}
		
	draw_sprite_ext(spr_pointLight,0,a[0],a[1],rand1,rand1,randRot,c_white,1)
	
	var i;
	for (i = 0; i < instance_number(prnt_light); i += 1)
	{
		var light = instance_find(prnt_light,i);
		var lightx = light.x - camera_get_view_x(view_camera[0])
		var lighty = light.y - camera_get_view_y(view_camera[0])
		draw_sprite_ext(light.sprite_index,light.image_index,lightx,lighty,light.image_xscale,light.image_yscale,light.image_angle,c_white,light.image_alpha)
	}
	
	//with(prnt_light){
	//	surface_set_target(global.lightsSurface)
	//	gpu_set_blendmode(bm_subtract)
		
	//	gpu_set_blendmode(bm_normal)
	//	surface_reset_target()
	//}
	
	gpu_set_blendmode(bm_normal)
surface_reset_target()

draw_surface(global.lightsSurface,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]))
gpu_set_colorwriteenable(1,1,1,1)

//draw_rectangle(camera_get_view_x(view_camera[0])+5,camera_get_view_y(view_camera[0])+5,camera_get_view_width(view_camera[0])-5+camera_get_view_x(view_camera[0]),camera_get_view_height(view_camera[0])-5+camera_get_view_y(view_camera[0]),false)