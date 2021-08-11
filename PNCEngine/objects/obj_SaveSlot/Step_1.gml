if obj_Control.menu = 0 then instance_destroy()




var a = mouse_get_extendedScreenPos()
	var px = a[0]
	var py = a[1]
	var w = sprite_width
	var h = sprite_height/2


if point_in_rectangle(px,py,xgui-w,ygui-h*.1,xgui+w,ygui+h*.2){
heightanimate+=(100-heightanimate)/8

if mouse_check_button_pressed(mb_left)&&obj_Control.menu=1{//saving
	show_debug_message("Saving..."+"slot "+string(num))
	var dir = global.saveDirectory+"/file"+string(num)+"/"//save file folder
	var datastring= dir+string(room)+".sav" //save file
	//looks like:      gamefolder*/saves/fileX/XXXX.sav
	if num==obj_Control.saveSlots{obj_Control.saveSlots++}
	
	ini_open(dir+"global.ini")
	ini_write_real("main","room",room) //writes current room
	ini_write_real("main","cordx",obj_Control.cordx)
	ini_write_real("main","cordy",obj_Control.cordy)
	ini_close()
	/* gamefolder/saves/fileX/global.ini
	
	[main]
	room = xxxx
	globalVar = xxxx
	*/
	
	var screensave= "screen"+string(num)+".jpg"
	file_copy("tempscreensave.jpg",screensave)

	//need to create temp save that keeps a temp file of all this shit incase player saves
	//because currently it only keeps the current room's data, not all the other rooms in the
	//case that the player moves to a different room
	
	for (var i = 0; i < instance_number(obj_sceneObjPrnt);i++){
		var inst = instance_find(obj_sceneObjPrnt,i)
		show_debug_message(object_get_name(inst.object_index))
			saving = method(inst,inst.save)
			saving()
		
	}
	
	obj_Control.inventoryList = ds_list_create()
	for (var i = 0; i < instance_number(obj_inventoryItem);i++){
		var inst = instance_find(obj_inventoryItem,i)
		show_debug_message(object_get_name(inst.object_index))
			saving = method(inst,inst.save)
			saving()
		
	}
	var top_level = ds_map_create()
	
	ds_map_add_list(top_level,"inventoryList",obj_Control.inventoryList)
	ds_map_add_list(top_level,"scenesObjList",obj_Control.sceneObjList)

	
	var str = json_encode(top_level)
	
	ds_map_destroy(top_level)
	
	var buffer = buffer_create( string_byte_length(str)+1, buffer_fixed,1)
	buffer_write(buffer,buffer_string,str)
	buffer_save(buffer,datastring)
	buffer_delete(buffer)
	
	
	obj_Control.menu=0
	obj_Control.paused=0
	instance_destroy(prnt_pauseMenu)

	
}else if mouse_check_button_pressed(mb_left)&&obj_Control.menu=2{//loading
	show_debug_message("Loading...")
	var dir = global.saveDirectory+"/file"+string(num)+"/"//save file folder
	
	ini_open(dir+"global.ini")//get room and other globals 
	var rm = ini_read_real("main","room",0)
	ini_close()
	
	
	//sets stuff so that the control obj can align 
	global.saveFile = num
	loadRoom(rm,0)
	
//just change room, lets obj_control do the rest
}


}else{
	heightanimate+=(0-heightanimate)/4
}