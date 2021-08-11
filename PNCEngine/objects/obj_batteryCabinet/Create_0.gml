
open = false

enabled = true;

inst = noone;


function load(inputMap){
	
	x = ds_map_find_value(inputMap,"x")
	y = ds_map_find_value(inputMap,"y")
	open = ds_map_find_value(inputMap,"open")

}



function save(){
	var objMap = ds_map_create()
	ds_list_add(obj_Control.sceneObjList,objMap)
	ds_list_mark_as_map(obj_Control.sceneObjList,ds_list_size(obj_Control.sceneObjList)-1)
	ds_map_add(objMap,"object_index",object_index)//must have these
	ds_map_add(objMap,"x",x)
	ds_map_add(objMap,"y",y)
	ds_map_add(objMap,"open",open)
}



//privates
mouseMode = mouseModes.null
image_xscale = 2
image_yscale = 2

function click(){
	if (open){//was open
		instance_destroy(inst)
	}else{//was closed
		inst = instance_create_depth(x,y,0,obj_batteryCabinet_use)
		inst.image_xscale = image_xscale
		inst.image_yscale = image_yscale
	}
	open = !open
}

