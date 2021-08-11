function load(inputMap){
	
	x = ds_map_find_value(inputMap,"y")
	y = ds_map_find_value(inputMap,"x")
	enabled = ds_map_find_value(inputMap,"enabled")
	targetAngle = ds_map_find_value(inputMap,"targetAngle")
}



function save(){
	var objMap = ds_map_create()
	ds_list_add(obj_Control.sceneObjList,objMap)
	ds_list_mark_as_map(obj_Control.sceneObjList,ds_list_size(obj_Control.sceneObjList)-1)
	ds_map_add(objMap,"object_index",object_index)//must have these
	ds_map_add(objMap,"x",x)
	ds_map_add(objMap,"y",y)
	ds_map_add(objMap,"enabled",enabled)
	ds_map_add(objMap,"targetAngle",targetAngle)

}

image_xscale=1;
image_yscale=1
image_angle=90


snapDegrees = 180




targetAngle = 0
rotSpd = 2
mouseMode= 0

angle_released = 0
angle_offset = 0
angle = targetAngle

drawAngle=targetAngle
currentDrawAngle=targetAngle
drawRotSpd = 2
increment = 0