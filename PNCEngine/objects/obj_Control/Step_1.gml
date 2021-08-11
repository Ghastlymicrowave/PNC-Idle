

if keyboard_check_pressed(ord("N")){
ivObsPerRow --	
}


if keyboard_check_pressed(ord("M")){
ivObsPerRow ++
}

//zoom in cam with mouse scroll

if mouse_wheel_up(){
mouseScroll =min(mouseScroll+10,75)	
//show_debug_message(currentMouseScroll)
}
if mouse_wheel_down(){
mouseScroll =max(mouseScroll-10,0)
}

if  currentMouseScroll != mouseScroll{
	currentMouseScroll += (mouseScroll - currentMouseScroll)/8
	if abs(currentMouseScroll-mouseScroll)<0.1{
	currentMouseScroll=mouseScroll	
	}
	
}
if scrollDisallowedTime<1{
	if scrollDisallowedTime > -50{
		scrollDisallowedTime--
		sZoomPercent = currentMouseScroll
		sZoomSpeed = 10-8*abs(scrollDisallowedTime)/50
	
	}else{
		sZoomPercent = currentMouseScroll
		sZoomSpeed =2
	}
}


if keyboard_check_pressed(vk_escape)&&inputCooldown==0{
	if menu!=0{
	menu = 0	
	}else{
	if (paused){//closing
		instance_destroy(prnt_pauseMenu)
	}else if (!paused){//opening
		screen_save("tempscreensave.jpg")
		instance_create_depth(x,y,0,obj_PauseMenuLoad)
		instance_create_depth(x,y,0,obj_PauseMenuSave)
		instance_create_depth(x,y,0,obj_PauseMenuReset)
		instance_create_depth(x,y,0,obj_PauseMenuQuit)
		instance_create_depth(x,y,0,obj_PauseMenuResetAll)
		menu=0
	}
	paused=!paused
}
}

if paused!=1 {
	

//with dir:
//0 = right
//1 is Left
//2 is up
//3 is down

//if slide = 0 then use gotox and gotoy and move cam follow
//if slide = 1 then dir

if waitForFade=1{
if obj_fade.image_alpha=0 then waitForFade=0	
}

if waitForFade=0{
if inputCooldown>0&&obj_cameraFollow.speed<2{
inputCooldown--

}

if point_in_rectangle(mouse_x,mouse_y,camera_get_view_x(view_camera[0])+5,camera_get_view_y(view_camera[0])+5,camera_get_view_width(view_camera[0])-5+camera_get_view_x(view_camera[0]),camera_get_view_height(view_camera[0])-5+camera_get_view_y(view_camera[0])){

	mask_index=spr_point
	instance = instance_place(mouse_x,mouse_y,obj_move)
	if inputCooldown==0&&ivOpen==0&&menu=0{
	if instance!=noone{
	switch(instance.dir){
		case 0://right 
		cursor_sprite = spr_cursor_right
		break;
		case 1://left
		cursor_sprite = spr_cursor_left
		break;
		case 2://up
		cursor_sprite = spr_cursor_up
		break;
		case 3://down
		cursor_sprite = spr_cursor_down
		break;
		
	}
	
	if instance.active==false{
	cursor_sprite=spr_lock	
	}
	
	}else{
	cursor_sprite = spr_cursor		
	}
	}else if menu == 1{
	cursor_sprite = spr_cursor	
	}
	
	
	
	
		
	if(mouse_check_button_pressed(mb_left)&&ivOpen=0&&inputCooldown=0&&instance!=noone&&holdingItem==false){
			//show_debug_message("instanceActive"+string(instance.active))

			if (instance.active==true){
				show_debug_message(instance.slide)
				switch (instance.slide){
	case 0:
	#region snap movement

	cordx=instance.gotox
	cordy=instance.gotoy
	//inputCooldown=inputCooldownMax
	MoveToCord(cordx,cordy)
	if instance.fade=1{
		obj_fade.fade=1
		obj_cameraFollow.waitForFade=1
		waitForFade=1
	}else{
		SnapToCord(cordx,cordy)	
	}
	obj_cameraFollow.snapTox = GridReturnX(cordx)
	obj_cameraFollow.snapToy = GridReturnY(cordy)

		
		#endregion
	break;
	
	case 1:
	#region slide movement
	cursor_sprite = spr_hourglass
switch (instance.dir){
			case 0:
			cordx++
			break;
			case 1:
			cordx--
			break;
			case 2:
			cordy--
			break;
			case 3:
			cordy++
			break;
			}

inputCooldown=inputCooldownMax
MoveToCord(cordx,cordy)	
break;




#endregion		
	break;
	
	case 2:
	#region snap then move movement
		cursor_sprite = spr_hourglass
		inputCooldown=inputCooldownMax
		MoveToCord(cordx,cordy)
		
		obj_cameraFollow.startingPosx = GridReturnX(instance.gotoxCord)
		obj_cameraFollow.startingPosy = GridReturnY(instance.gotoyCord)
		
		x = GridReturnX(instance.gotox)
		y = GridReturnY(instance.gotoy)
		
		obj_cameraFollow.targetPositionx = x
		obj_cameraFollow.targetPositiony = y
		
		obj_cameraFollow.dontUpdate = 1
		obj_cameraFollow.currentMoveTime = obj_cameraFollow.movementTimeMax 
		if instance.fade=1{	
			obj_fade.fade=1
			obj_cameraFollow.waitForFade=1
			waitForFade=1
		}
		
		cordx = instance.gotox
		cordy = instance.gotoy
		
		break;
		
	
		
		#endregion
	break;
				}
				
			}
		}


if ivOpen {
	cursor_sprite = spr_cursor		
}

item = instance_nearest(mouse_x,mouse_y,obj_inventoryItem)
if(item!=noone){
var hoverCheck = point_distance(mouse_x,0,item.x,0)<item.width*1.05
if ivOpen=1&&hoverCheck{
	if item.selected==0{
	cursor_sprite = spr_cursor_point}
	//&&point_in_rectangle(mouse_x,mouse_y,item.x-item.width*item.image_xscale/2,item.y-item.height*item.image_yscale/2,item.x+item.width*item.image_xscale/2,item.y+item.height*item.image_yscale/2)
	item.hover=1
	item.newimage_xscale=item.defaultxScale+item.defaultxScale*.25*hoverCheck
item.newimage_angle=25*(!hoverCheck)
	
	
	if mouse_check_button_pressed(mb_left){
	
	if item.selected=0{
		cursor_sprite = noone
	obj_inventoryItem.selected=0
	item.selected=1	
	item.oneframe=1
	holdingItem = true
		}
	}
}else if ivOpen=1{
cursor_sprite = spr_cursor	
}
}
	mask_index=spr_controlHitbox

} else {
	
	cursor_sprite = spr_cursor_inactive	
	sShakeTime=1
	sShakeStartingTime=1
	sShakeIntense=1
	sShakeType=2
	sShakeForm=2
	sShakeRandom=1
}



#region keyboard movement
var movementOptions = ds_list_create()

if instance_place_list(x,y,obj_move,movementOptions,0)>0{

	if(keyboard_check(vk_right)||keyboard_check(vk_left)||keyboard_check(vk_up)||keyboard_check(vk_down))&&inputCooldown=0{
		
		for(var i = ds_list_size(movementOptions)-1;i>-1;i--){
	
	instance = ds_list_find_value(movementOptions,i)
//show_debug_message(string(instance.dir)+" "+string(instance.slide))
			if (instance.active==true){
				
				switch (instance.slide){
	case 0:
	#region snap movement
		
		var check1 = 0
		
if instance.dir=0&&keyboard_check_pressed(vk_right){
check1 = 1
}

if instance.dir=1&&keyboard_check_pressed(vk_left){
check1 = 1
}

if instance.dir=2&&keyboard_check_pressed(vk_up){
check1 = 1
}

if instance.dir=3&&keyboard_check_pressed(vk_down){
check1 = 1
}


if check1 = 1{

	cordx=instance.gotox
	cordy=instance.gotoy
	//inputCooldown=inputCooldownMax
	MoveToCord(cordx,cordy)
	if instance.fade=1{
		cursor_sprite = spr_hourglass
		obj_fade.fade=1
		obj_cameraFollow.waitForFade=1
		waitForFade=1
	}else{
		SnapToCord(cordx,cordy)	
	}
	obj_cameraFollow.snapTox = GridReturnX(cordx)
	obj_cameraFollow.snapToy = GridReturnY(cordy)
}
		
		#endregion
	break;
	
	case 1:
	#region slide movement
	
		var check2 = 0
if instance.dir=0&&keyboard_check(vk_right){
cordx++
check2 = 1
}

if instance.dir=1&&keyboard_check(vk_left){
cordx--
check2 = 1
}

if instance.dir=2&&keyboard_check(vk_up){
cordy--
check2 = 1
}

if instance.dir=3&&keyboard_check(vk_down){
cordy++
check2 = 1
}

if check2 = 1{
	cursor_sprite = spr_hourglass
inputCooldown=inputCooldownMax
MoveToCord(cordx,cordy)	
break;
}



#endregion		
	break;
	
	case 2:
	#region snap then move movement
		
		var check3 = 0
		
if instance.dir=0&&keyboard_check(vk_right){
check3 = 1
}

if instance.dir=1&&keyboard_check(vk_left){
check3 = 1
}

if instance.dir=2&&keyboard_check(vk_up){
check3 = 1
}

if instance.dir=3&&keyboard_check(vk_down){
check3 = 1
}

	
		if check3 = 1 {
		cursor_sprite = spr_hourglass
		inputCooldown=inputCooldownMax
		MoveToCord(cordx,cordy)
		
		obj_cameraFollow.startingPosx = GridReturnX(instance.gotoxCord)
		obj_cameraFollow.startingPosy = GridReturnY(instance.gotoyCord)
		
		x = GridReturnX(instance.gotox)
		y = GridReturnY(instance.gotoy)
		
		obj_cameraFollow.targetPositionx = x
		obj_cameraFollow.targetPositiony = y
		
		obj_cameraFollow.dontUpdate = 1
		obj_cameraFollow.currentMoveTime = obj_cameraFollow.movementTimeMax 
		if instance.fade=1{	
			obj_fade.fade=1
			obj_cameraFollow.waitForFade=1
			waitForFade=1
		}
		
		cordx = instance.gotox
		cordy = instance.gotoy
		
		break;
		}
	
		
		#endregion
	break;
				}
				
			}
		}
	}
}

#endregion


///spawn debug items

if keyboard_check_pressed(ord("U")){
	item_add_to_inventory(items_refrence.spoon)
}
if keyboard_check_pressed(ord("I")){
	item_add_to_inventory(items_refrence.valve)	
}
if keyboard_check_pressed(ord("O")){
	item_add_to_inventory(items_refrence.big)	
}

if keyboard_check_pressed(ord("F")){
	window_set_fullscreen(!window_get_fullscreen())	
}

}




if waitForFade=0{
	var a = application_get_position();

	var xoff = a[0];
	var yoff = a[1];
	var mouseX=(window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface)
	var mouseY=(window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface)
	
	
if (ivOpen==0&&mouseY >= surface_get_height(application_surface)*(1-0.05))&&!mouse_check_button(mb_left){
	ivOpen=1
	
}else if (ivOpen=1){
	if !(mouseY >= surface_get_height(application_surface)*(1-inventoryHeightPercentage-0.05)){
		ivOpen=0
	}
}

}

if currentMouseScroll!=0{
ivOpen=0	
}

//if keyboard_check_pressed(ord("N")){
//	ini_open("save.data")
//	ini_write_string("data","inventory",ds_list_write(inventory))
//	ini_close()
	
//game_save("save.game")	
//}
//if keyboard_check_pressed(ord("M")){

//	ini_open("save.data")
//	ds_list_read(inventory,ini_read_string("data","inventory",ds_list_create())) 
//	ini_close()
//game_load("save.game")
//}

mask_index=spr_controlHitbox
//!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!
//!!!!! if in view \/, commented rn because it was four counters
//!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!
//!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!
//!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!
//!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!
//!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!
//!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!/!!!!!!!!!!!!!
//if (place_meeting(x,y,prnt_requiresCounters)){
	
//	templist= ds_list_create()
//	instance_place_list(x,y,prnt_requiresCounters,templist,0)
	
//	for (var i = 0; i < ds_list_size(templist);i++){
//	instance = ds_list_find_value(templist,i)
//	instance.inView=1
	
//	}
	
//}

//if ivOpen == 1{//move inventory left right while open
	var mousex = window_mouse_get_x()
	var mousey = window_mouse_get_y()
	
	
//(window_get_width()/obj_Control.ivObsPerRow)*position +obj_Control.ivSpaceDist


//l t r b
//if point_in_rectangle(mousex,mousey,x,y-sprite_height/2,x+sprite_width*5,y+sprite_height/2)&&ds_list_size(obj_Control.inventory)>0{

/*

var a = application_get_position();
	var xoff = a[0];
	var yoff = a[1];
	var mouseX=(window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface)
	var mouseY=(window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface)
surface_get_width(application_surface)

*/
	var a = application_get_position();
	var xoff = a[0];
	var yoff = a[1];
	var mouseX=(window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface)
	var mouseY=(window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface)

var maxWidthHalf = ((surface_get_width(application_surface)/ivObsPerRow)*(ds_list_size(inventory)-1))/2

if ivOpen==1 {

//edge of last item
//var rightEdge = ((window_get_width()/ivObsPerRow)*(ds_list_size(inventory)-1))+ivSpaceDist
if mouseX > surface_get_width(application_surface)*.85{
	ivScrollMod -= 10
}else if mouseX < surface_get_width(application_surface)*.15{
	ivScrollMod += 10
}


}
//show_debug_message(maxWidthHalf)

ivScrollMod = clamp(ivScrollMod,-maxWidthHalf,maxWidthHalf)

newivSpaceDist = surface_get_width(application_surface)/2 - maxWidthHalf
newivSpaceDist += ivScrollMod

ivSpaceDist+=(newivSpaceDist-ivSpaceDist)/1
//}
//y=camera_get_view_y(view_camera[0])+obj_cameraFollow.vspeed +obj_Control.inventoryScreenHeightPercentage*(camera_get_view_height(view_camera[0]))
//x=min(camera_get_view_width(view_camera[0])-sprite_width+camera_get_view_x(view_camera[0])+obj_cameraFollow.hspeed,camera_get_view_x(view_camera[0])+obj_cameraFollow.hspeed+obj_Control.ivSpaceDist +obj_Control.inventoryScreenPercentage*(camera_get_view_width(view_camera[0])/(ds_list_size(obj_Control.inventory))*(ds_list_size(obj_Control.inventory)-1+.5))+(camera_get_view_width(view_camera[0])-camera_get_view_width(view_camera[0])*obj_Control.inventoryScreenPercentage)/2)
//}
}




