neededitemid=0
deleteItem=0
uses=0
maxUses=1

function load(inputMap){
	
	x = ds_map_find_value(inputMap,"y")
	y = ds_map_find_value(inputMap,"x")
	neededItemId = ds_map_find_value(inputMap,"neededItemId")//a item id refrence, or omitted
	deleteItem = ds_map_find_value(inputMap,"deleteItem")//true or false
	uses = ds_map_find_value(inputMap,"uses")//typically 0, or omitted
	maxUses = ds_map_find_value(inputMap,"maxUses")//either a num, or omitted
	
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
	ds_map_add(objMap,"uses",uses)
	ds_map_add(objMap,"maxUses",maxUses)
}

function use(itemID){
	//itemID is passed incase object can accept different ID's (if neededItemId is omitted), if so, use a switch
	//uses++ is handled here
}