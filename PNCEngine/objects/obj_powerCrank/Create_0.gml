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

image_xscale=3;
image_yscale=3
image_angle=90

incrementDegrees = 360/4
snapDegrees = 90
powerPerIncrement = 0.25



targetAngle = 90
rotSpd = 4
mouseMode= 0

angle_released = 0
angle_offset = 0
angle = targetAngle
angle_ratio = 0.25 //4 : 1

drawAngle=targetAngle
currentDrawAngle=targetAngle
drawRotSpd = 4
increment = 0
rawIncrement = 0


goodRatio = 1
shitRatio = 0.25
rustyTimer = 0
maxRustyTimer = 60*2 //time until it becomes rusty again and has a shit gear ratio

