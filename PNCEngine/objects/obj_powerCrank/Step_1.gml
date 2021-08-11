
function released(){
	angle_offset = angle
	targetAngle = (round(angle_released /snapDegrees) * snapDegrees % 360)
	if targetAngle < 0 { targetAngle+=360}
	drawAngle = targetAngle//*angle_ratio
	
}

function onIncrement(amt){
	obj_Control.res_power = min(obj_Control.res_power+powerPerIncrement,obj_Control.upg_powerMax)
}

function onRawIncrement(amt){

	rustyTimer= min(rustyTimer+1,maxRustyTimer)

	angle_ratio = shitRatio + (goodRatio - shitRatio)* (rustyTimer/maxRustyTimer)
	show_debug_message(angle_ratio)
}
#region interaction
if (place_meeting(x,y,obj_cursor)){
	
	if mouseMode != mouseModes.held{
	mouseMode = mouseModes.hover
	}
	
	if (mouse_check_button_pressed(mb_left)) {
		mouseMode = mouseModes.held
		angle_offset = point_direction(x,y,mouse_x,mouse_y) 
		angle=0
		totalAngle = 0
		increment = 0
		rawIncrement = 0
		//angle_released / angle_ratio
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
	
	
	var newangle = (angle_difference(point_direction(x,y,mouse_x,mouse_y)-angle_offset,angle) )/rotSpd
	angle += newangle
	angle_released = angle * angle_ratio + targetAngle 
	drawAngle=angle_released
	
	totalAngle+= abs(newangle)
	var newIncrement = (floor(totalAngle*angle_ratio /incrementDegrees))
	if increment< newIncrement{
		onIncrement(abs(newIncrement-increment))
		increment = newIncrement
	}
	
	var newIncrement = (floor(totalAngle/incrementDegrees))
	if rawIncrement< newIncrement{
		onRawIncrement(abs(newIncrement-rawIncrement))
		rawIncrement = newIncrement
	}
}else {
	var newangle = angle + (angle_difference(targetAngle,angle))/(rotSpd)
	
	if rustyTimer>0{
		show_debug_message(rustyTimer)
		rustyTimer--	
		angle_ratio = shitRatio + (goodRatio - shitRatio)* (rustyTimer/maxRustyTimer)
	}
}

#endregion

currentDrawAngle += angle_difference(drawAngle,currentDrawAngle)/rotSpd

image_angle = currentDrawAngle


// angle clamp

//angle = clamp(newangle,0,360)