neededitemid=items_refrence.battery
deleteItem=true
image_speed = 0
image_index = 3

function load(inputMap){
	
	x = ds_map_find_value(inputMap,"y")
	y = ds_map_find_value(inputMap,"x")
	neededItemId = ds_map_find_value(inputMap,"neededItemId")
	deleteItem = ds_map_find_value(inputMap,"deleteItem")
	uses = ds_map_find_value(inputMap,"uses")
	maxUses = ds_map_find_value(inputMap,"maxUses")
	
}



function save(){
	var objMap = ds_map_create()
	ds_list_add(obj_Control.sceneObjList,objMap)
	ds_list_mark_as_map(obj_Control.sceneObjList,ds_list_size(obj_Control.sceneObjList)-1)
	ds_map_add(objMap,"object_index",object_index)//must have these
	ds_map_add(objMap,"x",x)
	ds_map_add(objMap,"y",y)

	ds_map_add(objMap,"neededItemId",neededItemId)
	ds_map_add(objMap,"deleteItem",deleteItem)
}

function use(itemID){
	//itemID is passed incase object can accept different ID's, if so, use a switch
	if instance_exists(obj_Control){
		obj_Control.upg_powerMax+=10	
	}
}