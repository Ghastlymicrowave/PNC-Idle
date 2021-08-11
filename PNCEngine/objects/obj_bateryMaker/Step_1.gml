

if value >= value_max{
	value=0
	item_add_to_inventory(items_refrence.battery)
} else {

	if value != 0{
		value+=value_perTick	
	}

}

//mouse click
if (place_meeting(x,y,obj_cursor))&&enabled==true{
	
	if mouseMode != mouseModes.held{
	mouseMode = mouseModes.hover
	}
	
	if (mouse_check_button_pressed(mb_left)) {
		mouseMode = mouseModes.held
	}

	if (mouse_check_button_released(mb_left)&&mouseMode = mouseModes.held){
		click()
		mouseMode = mouseModes.clicked
	}
	
} else {
	mouseMode = mouseModes.null
}

