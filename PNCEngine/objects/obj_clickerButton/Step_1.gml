
if instance_exists(obj_lever1){
	if obj_lever1.targetAngle==90 {
		lightsOn = true
	}else {
		lightsOn = false	
	}
}


function click(){
	value += value_perClick;
}

function growthTick(){
	value += value_growthTimer_amount
}

function decayTick(){
	value -= value_decayTimer_amount
}

//mouse click
if (place_meeting(x,y,obj_cursor)){
	
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

//timers

value_growthTimer_tick --
if value_growthTimer_tick <= 0 {
	growthTick()
	value_growthTimer_tick = value_growthTimer_maxTick*60
}

value_decayTimer_tick --
if value_decayTimer_tick <= 0 {
	decayTick()
	value_decayTimer_tick = value_decayTimer_maxTick*60
}
if value = 0{
	value_growthTimer_tick = value_growthTimer_maxTick*60
	value_decayTimer_tick = value_decayTimer_maxTick*60
}

value += value_growthPerStep
value -=( value_decayPerStep + 0.005 * lightsOn	)

value = clamp(value,0,value_max)

