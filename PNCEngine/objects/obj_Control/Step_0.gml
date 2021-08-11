
if paused!=1{ 
	
	


//form, formula
//0 is constant until it ends
//1 is linear
//2 is exponentally decreasing

//sShakeType, the type of screenshake,
//0 vertical
//1 horizontal
//2 both

//sShakeRandom, weather it cycles between sides or is simply randomly picking points


if keyboard_check_pressed(vk_control){
sZoomPercent=50
sZoomSpeed=4
scrollDisallowedTime=50
effectOnScrollZoom=1
}

if keyboard_check_pressed(vk_space){
sShakeTime=20
sShakeStartingTime=20
sShakeIntense=3
sShakeType=2
sShakeForm=1
sShakeRandom=1

sZoomPercent=20
sZoomSpeed=5
sZoomBounce=0
sZoomBounced=0
scrollDisallowedTime=100
mouseAimDisallowedTime=100
effectOnScrollZoom=0
}

if keyboard_check_pressed(vk_alt){
sShakeTime=1
sShakeStartingTime=1
sShakeIntense=1
sShakeType=2
sShakeForm=2
sShakeRandom=1
}

#region Screenshake
if sShakeTime>0{
	
	
	//camera_set_view_target(view_camera[0],obj_screenshakeTarget)
	

	
	if (sShakeTime % 2) then var side = 1 else var side = -1
	
	switch(sShakeForm){
		//no curve
	case 0:	var shakeStrength = 1
	break;
		//linear curve
	case 1: var shakeStrength = sShakeIntense * sShakeTime/sShakeStartingTime 
	break;
		//smooth in out curve
	case 2: 
	var maxim = sShakeStartingTime
	var curentval = abs(sShakeStartingTime - sShakeTime)
	var shakeStrength = (sin((2/maxim*curentval-0.5)*pi)*0.5+0.5)
	break;
		//default no curve
	default: var shakeStrength =1
	}
	
	
	
	if (sShakeRandom){
	var horizShake = irandom_range(0,sShakeIntense*shakeStrength)*choose(1,-1) 
	var vertShake = irandom_range(0,sShakeIntense*shakeStrength)*choose(1,-1)
	}else{
	var horizShake = (sShakeIntense*shakeStrength)*side
	var vertShake = (sShakeIntense*shakeStrength)*side
	}
	//camera_set_view_pos(view_camera[0],obj_cameraFollow.x+horizShake*(sShakeType==1||sShakeType=2),obj_cameraFollow.y+vertShake*(sShakeType==0||sShakeType=2))
	var shakeH = horizShake*(sShakeType==1||sShakeType=2)
	var shakeV = vertShake*(sShakeType==0||sShakeType=2)
	//type 0 is v only
	//type 1 is h only
	//type 2 is v and h
	var w = camera_get_view_width(view_camera[0])/2
	var h = camera_get_view_height(view_camera[0])/2
	var camX = obj_cameraFollow.currentMousePerX * obj_Control.gridx*obj_Control.currentMouseScroll/100 / 2
	var camY = obj_cameraFollow.currentMousePerY * obj_Control.gridy*obj_Control.currentMouseScroll/100 / 2
	if effectOnScrollZoom{
		camera_set_view_pos(view_camera[0],obj_cameraFollow.x-w+shakeH+camX,obj_cameraFollow.y-h+shakeV+camY)
	}else{
		obj_cameraFollow.currentMousePerX=.5
		obj_cameraFollow.currentMousePerY=.5
		camera_set_view_pos(view_camera[0],obj_cameraFollow.x-w+shakeH,obj_cameraFollow.y-h+shakeV)
	}
	
	
	
	
sShakeTime-=1*(sShakeForm!=2)+sShakeTime*.05*(sShakeForm==2)
if sShakeTime<=0{
camera_set_view_target(view_camera[0],noone)		
}
//show_debug_message(string(sShakeForm!=2)+" : "+string(horizShake))
}

#endregion

#region Zoom

//stuff about bouncing it, unessisary for now
//if (sZoomPercent!=0&&sZoomPercent*sZoomBounced>0){//do the bounce
//var newScreenScale = 1 - 0.01*(sZoomPercent*sZoomBounced)}else  var newScreenScale = 1


//if abs((newScreenScale-sZoom))<0.05&&sZoomBounce>0{
//	show_debug_message(string((sZoomPercent*sZoomBounced)))
//	sZoomBounce--
//	if sZoomBounced=1{sZoomBounced=-1}else{sZoomBounced=1}
//}


if sZoomBounce =1 {
	if sZoomBounced =0 {
		var newScreenScale = 1 - 0.01*sZoomPercent
		if abs((newScreenScale-sZoom))<0.05{
		sZoomBounced=1	
		}
	}else{//has bounced
		var newScreenScale = 1 
		if abs((newScreenScale-sZoom))<0.05{
		sZoomBounced=0
		sZoomBounce=0
		}
	}

}else{


	if (sZoomPercent!=0){
		var newScreenScale = 1 - 0.01*sZoomPercent
	}else{
		var newScreenScale = 1
	}

}

sZoom+=(newScreenScale-sZoom)/sZoomSpeed

//show_debug_message(string(sZoom))
camera_set_view_size(view_camera[0],viewh*(sZoom),viewv*(sZoom))
#endregion

if mouseAimDisallowedTime>0{
	mouseAimDisallowedTime--
	if mouseAimDisallowedTime<=0{ 
		mouseAimDisallowedTime=0
	}
	
}

if scrollDisallowedTime>0{
	scrollDisallowedTime--
	if scrollDisallowedTime<=0{ 
		scrollDisallowedTime=0
	}
	
}

//	screenScaleInput= 1 - screenshake/time/zoom
//	screenScale += (screenScaleInput-screenScale)/1.5
	
	
/*

#region oldscreenshake
if screenshake>0{
	
	screenshake= screenshake- initalscreenshake/duration
	
	percent = screenshake/time
	//angle = startingangle*percent
	
	if screenshake=0{ screenshake=0;angle=0}
	
	camera_set_view_angle(view_camera[0],angle)
	//960 x 540
	//screenScale = screenshake/15
	screenScaleInput= 1 - screenshake/time/zoom
	screenScale += (screenScaleInput-screenScale)/1.5
	
	//if screenScale<1 then screenScale=1
	camera_set_view_size(view_camera[0],viewh*(screenScale),viewv*(screenScale))
	camera_set_view_pos(view_camera[0],x-camera_get_view_width(view_camera[0])/2,y-camera_get_view_height(view_camera[0])/2)
	
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0])+ (1-2*(random(1))) * random(screenshake+1),camera_get_view_y(view_camera[0])+(1-2*(random(1))) * random(screenshake+1))
	if noshakey=1{
		camera_set_view_pos(view_camera[0],x-camera_get_view_width(view_camera[0])/2,y-camera_get_view_height(view_camera[0])/2)
	
	
	}
	//x+= (1-2*(random(1))) * random(screenshake+1)
	//y+= (1-2*(random(1))) * random(screenshake+1)
	
	
} else camera_set_view_pos(view_camera[0],x-camera_get_view_width(view_camera[0])/2,y-camera_get_view_height(view_camera[0])/2)
#endregion
*/
}