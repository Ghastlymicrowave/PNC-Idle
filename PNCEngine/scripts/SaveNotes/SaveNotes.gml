enum mouseModes {
	null,
	hover,
	held,
	clicked
}


global.saveDirectory = working_directory+"/saves/"


//beginning of game defaults, set these up for first level encountered or change them before then
	global.currentRoom = 0
	global.saveFile = 0
	global.spawnX = 0
	global.spawnY = 0 
	
	
function ini_saveExists(name){
	ini_open(name)
	if ini_read_real("main","room",-4) == -4 {show_debug_message("nada");return false} else {
		show_debug_message("yes!")
		return true
		}
	ini_close()
}
	
function destroyOthersOfThis(){
	var i = 0
	while (instance_number(object_index) > 1){
	
	instance_destroy(instance_find(object_index,i))
	i++//destroy other objs
	}
}	
	
	//room id, if this is a reset or will changing rooms include an autosave
function loadRoom(nextRoom,willAutosave){
	room_goto(nextRoom)
	var a = GetPosForLevel(nextRoom)
	global.spawnX = a[0]
	global.spawnY = a[1]
	global.currentRoom = nextRoom

}
	
function create_saveSlot(num){
			

	var slot = instance_create_depth(x,y,0,obj_SaveSlot)//need to be fixed
	slot.num = num
	slot.origin = id
			
	with(slot){
				
		//final = mod * origin
		//final / origin = mod
				
				

		var screensave= "screen"+string(num)+".jpg"
		if file_exists(screensave){
		sprite_index = sprite_add(screensave,1,0,0,0,0)
		}
				
		image_xscale = surface_get_width(application_surface)*.4 / sprite_width
		image_yscale = surface_get_height(application_surface)*.4 / sprite_height
				
				
		xgui = surface_get_width(application_surface)/2
		ygui = origin.distBetween*(num)+surface_get_height(application_surface)*.25/2
				
	}
}