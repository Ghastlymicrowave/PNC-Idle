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

draw_healthbar(x+sprite_width/2, y - 100, x+sprite_width/2+40,y+100,value/value_max*100,c_black,c_black,c_white,3,true,true)