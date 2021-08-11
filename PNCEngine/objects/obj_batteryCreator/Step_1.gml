
if instance_exists(obj_lever1){
	if obj_lever1.targetAngle==90 {
		lightsOn = true
	}else {
		lightsOn = false	
	}
}

//mouse click
if (place_meeting(x,y,obj_cursor))&&enabled==true&&lightsOn==true{
	
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

