
itemID = items_refrence.metalPlate

function load(inputMap){
	
	x = ds_map_find_value(inputMap,"y")
	y = ds_map_find_value(inputMap,"x")
	itemID = ds_map_find_value(inputMap,"itemID")
}



function save(){
	var objMap = ds_map_create()
	ds_list_add(obj_Control.sceneObjList,objMap)
	ds_list_mark_as_map(obj_Control.sceneObjList,ds_list_size(obj_Control.sceneObjList)-1)
	ds_map_add(objMap,"object_index",object_index)//must have these
	ds_map_add(objMap,"x",x)
	ds_map_add(objMap,"y",y)
	ds_map_add(objMap,"itemID",itemID)
}