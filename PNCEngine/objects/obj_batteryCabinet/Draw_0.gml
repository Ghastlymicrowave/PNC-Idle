if open == false {
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
	draw_self()
}