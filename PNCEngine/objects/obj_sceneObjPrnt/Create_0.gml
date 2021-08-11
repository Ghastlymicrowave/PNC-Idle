testvar0 = 0
testvar1 = 1
testvar2 = 2

function load(inputMap){
	
	x = ds_map_find_value(inputMap,"y")
	y = ds_map_find_value(inputMap,"x")
	testvar0 = ds_map_find_value(inputMap,"testvar0")
	testvar1 = ds_map_find_value(inputMap,"testvar1")
	testvar2 = ds_map_find_value(inputMap,"testvar2")
	
}



function save(){
	var objMap = ds_map_create()
	ds_list_add(obj_Control.sceneObjList,objMap)
	ds_list_mark_as_map(obj_Control.sceneObjList,ds_list_size(obj_Control.sceneObjList)-1)
	ds_map_add(objMap,"object_index",object_index)//must have these
	ds_map_add(objMap,"x",x)
	ds_map_add(objMap,"y",y)
	//these, not so much
	ds_map_add(objMap,"testvar0",0)
	ds_map_add(objMap,"testvar1",1)
	ds_map_add(objMap,"testvar2",2)
}