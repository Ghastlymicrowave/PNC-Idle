
enabled = true

function load(inputMap){
	
	x = ds_map_find_value(inputMap,"x")
	y = ds_map_find_value(inputMap,"y")
	enabled = ds_map_find_value(inputMap,"enabled")

}



function save(){
	var objMap = ds_map_create()
	ds_list_add(obj_Control.sceneObjList,objMap)
	ds_list_mark_as_map(obj_Control.sceneObjList,ds_list_size(obj_Control.sceneObjList)-1)
	ds_map_add(objMap,"object_index",object_index)//must have these
	ds_map_add(objMap,"x",x)
	ds_map_add(objMap,"y",y)
	ds_map_add(objMap,"enabled",enabled)
}



//privates
mouseMode = mouseModes.null
image_xscale = 4
image_yscale = 4

function click(){
	//do thing
}

