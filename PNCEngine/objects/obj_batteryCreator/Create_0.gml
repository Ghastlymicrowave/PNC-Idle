value = 0
value_perClick = 1
value_max = 10
enabled = true

function load(inputMap){
	
	x = ds_map_find_value(inputMap,"x")
	y = ds_map_find_value(inputMap,"y")
	enabled = ds_map_find_value(inputMap,"enabled")
	value = ds_map_find_value(inputMap,"value")
	value_max = ds_map_find_value(inputMap,"value_max")

}



function save(){
	var objMap = ds_map_create()
	ds_list_add(obj_Control.sceneObjList,objMap)
	ds_list_mark_as_map(obj_Control.sceneObjList,ds_list_size(obj_Control.sceneObjList)-1)
	ds_map_add(objMap,"object_index",object_index)//must have these
	ds_map_add(objMap,"x",x)
	ds_map_add(objMap,"y",y)
	ds_map_add(objMap,"enabled",enabled)
	ds_map_add(objMap,"value",value)
	ds_map_add(objMap,"value_max",value_max)
}



//privates
mouseMode = mouseModes.null
image_xscale = 4
image_yscale = 4

function click(){
	value+=value_perClick
	if value >= value_max{
	value=0
	item_add_to_inventory(items_refrence.battery)
	}
}

