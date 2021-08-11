neededitemid=items_refrence.metalPlate
deleteItem=1

image_xscale = 3
image_yscale = 3


function load(inputMap){
	
	x = ds_map_find_value(inputMap,"y")
	y = ds_map_find_value(inputMap,"x")

}



function save(){
	var objMap = ds_map_create()
	ds_list_add(obj_Control.sceneObjList,objMap)
	ds_list_mark_as_map(obj_Control.sceneObjList,ds_list_size(obj_Control.sceneObjList)-1)
	ds_map_add(objMap,"object_index",object_index)//must have these
	ds_map_add(objMap,"x",x)
	ds_map_add(objMap,"y",y)

}

function use(itemID){
	//itemID is passed incase object can accept different ID's, if so, use a switch
	//uses++ is handled here
	obj_Control.res_metal = min(obj_Control.res_metal+1,obj_Control.upg_metalMax)
}