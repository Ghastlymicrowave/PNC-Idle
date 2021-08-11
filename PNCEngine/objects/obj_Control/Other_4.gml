

destroyOthersOfThis()


	
	//already have global.room
	
	SnapToCord(global.spawnX ,global.spawnY)

	obj_cameraFollow.snapTox = GridReturnX(cordx)
	obj_cameraFollow.snapToy = GridReturnY(cordy)
	
	var dir = global.saveDirectory+"/file"+string(global.saveFile)+"/"//save file folder
	var datastring= dir+string(room)+".sav" //save file

	
	
	
	
	if file_exists(datastring){
		
		var buffer = buffer_load(datastring)
		var str = buffer_read(buffer,buffer_string)
		buffer_delete(buffer)
		var top_level = json_decode(str)
		
		
		var loadInventory 
		
		loadInventory = ds_map_find_value(top_level,"inventoryList")
		
		//wipe previous
		ds_list_clear(obj_Control.inventory)
		
		obj_Control.sceneObjList = ds_map_find_value(top_level,"scenesObjList")
		
		ini_open(dir+"global.ini")
		var a = GetPosForLevel(room)
		obj_Control.cordx = ini_read_real("main","cordx",a[0])
		obj_Control.cordy = ini_read_real("main","cordy",a[1])
		ini_close()
		
		instance_destroy(obj_sceneObjPrnt)
		
		for(var i = 0; i < ds_list_size(obj_Control.sceneObjList);i++){
			var objMap = ds_list_find_value(obj_Control.sceneObjList,i)
			show_debug_message(objMap)
			if(ds_map_exists(objMap,"object_index")){
				var obj = instance_create_depth(0,0,0,ds_map_find_value(objMap,"object_index"))
				show_debug_message("loading obj: "+object_get_name(obj.object_index))
				show_debug_message(objMap)
				var loadObj = method(obj,obj.load)
				loadObj(objMap)	
			}else{
				show_debug_message("error loading");	
			}
			
		}
		
		instance_destroy(obj_inventoryItem)
		for(var i = 0; i<ds_list_size(loadInventory);i++){
			var itemMap = ds_list_find_value(loadInventory,i)
			var item = instance_create_depth(0,0,0,ds_map_find_value(itemMap,"object_index"))
			var loadItem = method(item,item.load)
			loadItem(itemMap)
		}
	
		
	}
	
	with(obj_Control){
		SnapToCord(cordx,cordy)	
		obj_cameraFollow.snapTox = GridReturnX(cordx)
		obj_cameraFollow.snapToy = GridReturnY(cordy)
	}
	
	
	
	//obj_Control.SnapToCord(obj_Control.cordx,obj_Control.cordy)
	
	obj_Control.menu=0
	obj_Control.paused=0

	


