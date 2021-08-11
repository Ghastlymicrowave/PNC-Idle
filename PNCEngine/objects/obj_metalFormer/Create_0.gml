

function load(inputMap){
	
	x = ds_map_find_value(inputMap,"y")
	y = ds_map_find_value(inputMap,"x")
	value = ds_map_find_value(inputMap,"value")
	value_max = ds_map_find_value(inputMap,"value_max")
	value_perTick = ds_map_find_value(inputMap,"value_perTick")
	
}



function save(){
	var objMap = ds_map_create()
	ds_list_add(obj_Control.sceneObjList,objMap)
	ds_list_mark_as_map(obj_Control.sceneObjList,ds_list_size(obj_Control.sceneObjList)-1)
	ds_map_add(objMap,"object_index",object_index)//must have these
	ds_map_add(objMap,"x",x)
	ds_map_add(objMap,"y",y)
	ds_map_add(objMap,"value",value)
	ds_map_add(objMap,"value_max",value_max)
	ds_map_add(objMap,"value_perTick",value_perTick)

}

pilingItem = noone
image_xscale = 3
image_yscale = 3
value = 0
value_max = 240
value_perTick = 1