	
		
		
if obj_Control.menu=0{
	
	
	var a = mouse_get_extendedScreenPos()
	var px = a[0]
	var py = a[1]
	var w = sprite_width
	var h = sprite_height

if point_in_rectangle(px,py,xgui-w,ygui-h,xgui+w,ygui+h){
image_blend = c_green
} else {
image_blend = c_white	
}


	if mouse_check_button_released(mb_left)&&point_in_rectangle(px,py,xgui-w,ygui-h,xgui+w,ygui+h){

		obj_Control.menu=1

		distBetween = clamp(surface_get_height(application_surface)*.5/totalSlots,0,surface_get_height(application_surface)*.1)


		var createdSlots = 0
		for (var _i = 0; _i< maximumTotalSlots; _i++){
			var dir = global.saveDirectory+"/file"+string(_i)+"/"//save file folder
			if ini_saveExists(dir+"global.ini"){
				show_debug_message("found save at slot"+string(_i))
				createdSlots++
				create_saveSlot(_i)
			}
		}
		if createdSlots<maximumTotalSlots{
			for (var _i = 0; _i< maximumTotalSlots; _i++){
				var dir = global.saveDirectory+"/file"+string(_i)+"/"//save file folder
				if !ini_saveExists(dir+"global.ini"){
					createdSlots++
					create_saveSlot(_i)
					break;
				}
			}

		}
	}
}