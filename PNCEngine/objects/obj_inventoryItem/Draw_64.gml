if obj_Control.paused=0{
	var alph = 1
if selected = 1{
//draw_sprite_ext(sprite_index,image_index,regularx,regulary,defaultxScale,defaultxScale,0,c_white,alp)	
alph = 0.5
} else{
	var scrWidth = surface_get_width(application_surface)
	var alph = -((targx-scrWidth/2)*(targx-scrWidth/2)) / (scrWidth/2*scrWidth/2)+1	
}
	var scl = (surface_get_width(application_surface)/obj_Control.ivObsPerRow)/sprite_width*image_xscale
	// next / current = mod
	
	draw_sprite_ext(sprite_index,image_index,targx+3,targy+3,scl,scl,image_angle,c_black,alph)
	draw_sprite_ext(sprite_index,image_index,targx,targy,scl,scl,image_angle,make_color_hsv(0,0,255*percent),alph)
	if amount > 1{
		draw_text_transformed_color(targx+40+lengthdir_y(10,image_angle),targy+20+lengthdir_x(10,image_angle),string(amount),2,2,0,c_white,c_white,c_gray,c_gray,alph)
	}
}

