
fade=0
active = true

function load(inputMap){
	
	
	
	x = ds_map_find_value(inputMap,"x")
	y = ds_map_find_value(inputMap,"y")
	image_xscale = ds_map_find_value(inputMap,"xscale")
	image_yscale = ds_map_find_value(inputMap,"yscale")
	slide = ds_map_find_value(inputMap,"slide")
	dir = ds_map_find_value(inputMap,"dir")
	
	if slide==undefined{
		//show_debug_message("x"+string(x))
		//show_debug_message("y"+string(y))
		//show_debug_message("image_xscale "+string(image_xscale))
		//show_debug_message("image_yscale "+string(image_yscale))
		//show_debug_message("slide "+string(slide))
		//show_debug_message("dir "+string(dir))
	}
	
	
	switch (slide){
	case 0:
		gotox = ds_map_find_value(inputMap,"gotox")
		gotoy = ds_map_find_value(inputMap,"gotoy")
	break;
	case 1:
	break;
	case 2:
		gotoxCord = ds_map_find_value(inputMap,"gotoxCord")
		gotoyCord = ds_map_find_value(inputMap,"gotoyCord")
		gotox = ds_map_find_value(inputMap,"gotox")
		gotoy = ds_map_find_value(inputMap,"gotoy")
	break;
	}
}



function save(){
	
	show_debug_message("slide:"+string(slide))
	
	
	var objMap = ds_map_create()
	ds_list_add(obj_Control.sceneObjList,objMap)
	ds_list_mark_as_map(obj_Control.sceneObjList,ds_list_size(obj_Control.sceneObjList)-1)
	ds_map_add(objMap,"object_index",object_index)//must have these
	ds_map_add(objMap,"x",x)
	ds_map_add(objMap,"y",y)
	ds_map_add(objMap,"xscale",image_xscale)
	ds_map_add(objMap,"yscale",image_yscale)
	ds_map_add(objMap,"dir",dir)
	ds_map_add(objMap,"slide",slide)
	
	switch (slide){
	case 0:
		ds_map_add(objMap,"gotox",gotox)
		ds_map_add(objMap,"gotoy",gotoy)
	break;
	case 1:
	break;
	case 2:
		ds_map_add(objMap,"gotoxCord",gotoxCord)
		ds_map_add(objMap,"gotoyCord",gotoyCord)
		ds_map_add(objMap,"gotox",gotox)
		ds_map_add(objMap,"gotoy",gotoy)
	break;
	}
	
}