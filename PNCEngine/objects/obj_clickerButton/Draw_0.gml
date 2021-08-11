draw_self()

switch(mouseMode){
	case mouseModes.null:
	image_index = 0
	break;
	case mouseModes.hover:
	image_index = 1
	break;
	case mouseModes.held:
	image_index = 2
	break;
	case mouseModes.clicked:
	image_index = 3
	break;
	
	
}
draw_set_halign(fa_center)
draw_text(x,y+32,value)



	
	//bg_animate_amount+=0.25
	//if bg_animate_amount >= 800 {bg_animate_amount=0}

	var bgSpr = spr_black

	//xWobble = dsin((bg_animate_amount%80)/80 * 360)/8+1
	//yWobble = dsin((bg_animate_amount%100)/100 * 360)/4+1

	//var offx = surface_get_width(application_surface)/2
	//var offy = surface_get_height(application_surface)/2
	//offx +=dcos((bg_animate_amount%400)/400 * 360)*surface_get_width(application_surface)/2
	//offy +=dsin((bg_animate_amount%200)/200 * 360)*surface_get_height(application_surface)/2

	
	

draw_healthbar(x+sprite_width/2, y - 100, x+sprite_width/2+40,y+100,value/value_max*100,c_black,c_black,c_white,3,true,true)