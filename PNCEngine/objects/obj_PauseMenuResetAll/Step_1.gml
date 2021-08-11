if obj_Control.menu=0{
	var a = mouse_get_extendedScreenPos()
	var px = a[0]
	var py = a[1]
	var w = sprite_width
	var h = sprite_height

if point_in_rectangle(px,py,xgui-w,ygui-h,xgui+w,ygui+h){
image_blend = c_red
}else{
image_blend = c_white	
}

	if mouse_check_button_released(mb_left)&&point_in_rectangle(px,py,xgui-w,ygui-h,xgui+w,ygui+h){
		
		
		for (var slot = 0; slot < 30;slot++){
			var dir = global.saveDirectory+"/file"+string(slot)+"/"//save file folder
			file_delete(dir+"global.ini")
			var i = room_first
			while( i != room_last){
				file_delete(dir+string(i)+".sav")
				if i == room_last{break;}
				i = room_next(i)
				if i == room_last{
					file_delete(dir+string(i)+".sav")
					break;
				}
			}
		}
		
		for (var i = 1; i< obj_Control.maxSlots+1;i++){
			var screensave= "screen"+string(i)+".jpg"
		file_delete(screensave)	
		}
		
		obj_Control.x = GridReturnX(obj_Control.cordx) 
		obj_Control.y = GridReturnY(obj_Control.cordy) 
		obj_cameraFollow.x=obj_Control.x
		obj_cameraFollow.y=obj_Control.y
		obj_Control.menu=0
		obj_Control.paused=0
		instance_destroy(prnt_pauseMenu)
		
		ds_list_clear(obj_Control.inventoryID)
		ds_list_clear(obj_Control.inventory)
		
		loadRoom(rm_clicker_main,false)

	}
}

