percent=1
position=0
selected=0
targx = 0
targy = 0
oneframe=0

//width=sprite_width
//height=sprite_height

newimage_xscale=1
newimage_angle=25
//mask_index=sprite_index
hover=0

spd = 10

function load(inputMap){
	
	ID = ds_map_find_value(inputMap,"ID")
	defaultxScale = ds_map_find_value(inputMap,"defaultxScale")
	amount = ds_map_find_value(inputMap,"amount")
	
	name = ds_map_find_value(inputMap,"name")
	sprite_index = ds_map_find_value(inputMap,"sprite_index")
	
	position = ds_list_find_index(obj_Control.inventory,id)
	image_xscale=defaultxScale
	image_yscale=defaultxScale
	width=sprite_width
	height=sprite_height
}

function save(){
	var objMap = ds_map_create()
	ds_list_add(obj_Control.inventoryList,objMap)
	ds_list_mark_as_map(obj_Control.inventoryList,ds_list_size(obj_Control.inventoryList)-1)
	ds_map_add(objMap,"object_index",object_index)//must have these
	ds_map_add(objMap,"ID",ID)
	ds_map_add(objMap,"amount",amount)
	ds_map_add(objMap,"defaultxScale",defaultxScale)
	ds_map_add(objMap,"name",name)
	ds_map_add(objMap,"sprite_index",sprite_index)
}