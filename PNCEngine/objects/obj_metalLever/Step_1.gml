
function released(){
	targetAngle = (round(angle /snapDegrees) * snapDegrees % 360)
	if targetAngle < 0 { targetAngle+=360}
	drawAngle = targetAngle//*angle_ratio
	angle = targetAngle
}

if angle == -45{
	if obj_Control.res_power>0.01{
		obj_Control.res_power-=0.01
		with(obj_metalFormer){
			value = min(value+value_perTick,value_max)	
		}
	}
	
}

#region interaction
if (place_meeting(x,y,obj_cursor)){
	
	if mouseMode != mouseModes.held{
	mouseMode = mouseModes.hover
	}
	
	if (mouse_check_button_pressed(mb_left)) {
		mouseMode = mouseModes.held
	}

	if (mouse_check_button_released(mb_left)){
		mouseMode = mouseModes.null
		released()
	}
	
} else {
	if mouseMode==mouseModes.held && !mouse_check_button(mb_left){
		mouseMode = mouseModes.null
		released()
	}
}

if mouseMode = mouseModes.held {
	
	
	var newangle = angle + (angle_difference(point_direction(x,y,mouse_x,mouse_y),angle) )/rotSpd
	angle = newangle
	angle = clamp(angle,-45,45)
	drawAngle=angle
}else {
	var newangle = angle + (angle_difference(targetAngle,angle))/(rotSpd)
}

#endregion

currentDrawAngle += angle_difference(drawAngle,currentDrawAngle)/rotSpd

image_angle = currentDrawAngle


// angle clamp

//angle = clamp(newangle,0,360)