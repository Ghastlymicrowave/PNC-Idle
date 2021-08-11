

/*
if waitForFade=0{
hspeed= clamp((obj_Control.x-x)/spd,-maxSpd,maxSpd)
vspeed= clamp((obj_Control.y-y)/spd,-maxSpd,maxSpd)
}else{
	hspeed=0
	vspeed=0
if obj_fade.image_alpha=1 {
hspeed= (obj_Control.x-x)
vspeed= (obj_Control.y-y)
	//obj_fade.x=obj_Control.x
	//obj_fade.y=obj_Control.y
obj_fade.fade=0
waitForFade=0
}
}
*/
//slight viginette is 900:500


if (obj_Control.x != targetPositionx || obj_Control.y != targetPositiony)&&waitForFade==0&&dontUpdate==0{//updated position
	
	startingPosx = targetPositionx
	startingPosy = targetPositiony
	
	targetPositionx = obj_Control.x
	targetPositiony = obj_Control.y
	
	currentMoveTime = movementTimeMax 
	
	if snapTox != -1 || snapToy != -1{
		startingPosx = snapTox
		startingPosy = snapToy
		targetPositionx = snapTox
		targetPositiony = snapToy
		currentMoveTime=0
		x = snapTox
		y = snapToy
		snapTox = -1
		snapToy = -1
		
	}
	
} else if dontUpdate > 0{
dontUpdate--

}


scale=camera_get_view_width(view_camera[0])*9/5/sprite_width



if currentMoveTime > 0{
	
	var maxCount = movementTimeMax
	var currentCount = movementTimeMax - currentMoveTime
// smooth in smooth out (sin((1/maxCount*currentCount-0.5)*pi)*0.5+0.5)
// smooth in fast out (sin((currentCount/maxCount)*0.5*pi)*0.5)
	var percent = (sin((currentCount/maxCount)*0.5*pi))
	var xDist = targetPositionx - startingPosx
	var yDist = targetPositiony - startingPosy

	x = startingPosx + xDist * percent
	y = startingPosy + yDist * percent
	
	
	currentMoveTime--
	if currentMoveTime < 0{
		currentMoveTime = 0	
	}
}





if waitForFade !=0 && obj_fade.image_alpha=1 {
		x = obj_Control.x
		y = obj_Control.y

		obj_fade.fade=0
		waitForFade=0
}

/*
if waitForFade == 0{//not waiting for fade
	
	x = obj_Control.x
	y = obj_Control.y
	
}else{
	
	
}
	
}
*/

//heavy viginette => sprite_width=camera_get_view_width(view_camera[0])*8/5