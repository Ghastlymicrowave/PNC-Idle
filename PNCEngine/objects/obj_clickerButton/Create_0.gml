
value = 0
value_perClick = 1
value_max = 10

value_decayPerStep = 0
value_growthPerStep = 0

value_decayTimer_tick = 0//private

value_decayTimer_maxTick = 2//sec
value_decayTimer_amount = 0

value_growthTimer_tick = 0//private

value_growthTimer_maxTick = 2//sec
value_growthTimer_amount = 0

function load(inputMap){
	
	x = ds_map_find_value(inputMap,"x")
	y = ds_map_find_value(inputMap,"y")
	value = ds_map_find_value(inputMap,"value")
	value_perClick = ds_map_find_value(inputMap,"value_perClick")
	value_max = ds_map_find_value(inputMap,"value_max")
	value_decayPerStep = ds_map_find_value(inputMap,"value_decayPerStep")
	value_growthPerStep = ds_map_find_value(inputMap,"value_growthPerStep")
	value_decayTimer_amount = ds_map_find_value(inputMap,"value_decayTimer_amount")
	value_decayTimer_maxTick = ds_map_find_value(inputMap,"value_decayTimer_maxTick")
	value_growthTimer_amount = ds_map_find_value(inputMap,"value_growthTimer_amount")
	value_growthTimer_maxTick = ds_map_find_value(inputMap,"value_growthTimer_maxTick")
}



function save(){
	var objMap = ds_map_create()
	ds_list_add(obj_Control.sceneObjList,objMap)
	ds_list_mark_as_map(obj_Control.sceneObjList,ds_list_size(obj_Control.sceneObjList)-1)
	ds_map_add(objMap,"object_index",object_index)//must have these
	ds_map_add(objMap,"x",x)
	ds_map_add(objMap,"y",y)
	ds_map_add(objMap,"value",value)
	ds_map_add(objMap,"value_perClick",value_perClick)
	ds_map_add(objMap,"value_max",value_max)
	ds_map_add(objMap,"value_decayPerStep",value_decayPerStep)
	ds_map_add(objMap,"value_growthPerStep",value_growthPerStep)
	ds_map_add(objMap,"value_decayTimer_amount",value_decayTimer_amount)
	ds_map_add(objMap,"value_decayTimer_maxTick",value_decayTimer_maxTick)
	ds_map_add(objMap,"value_growthTimer_amount",value_growthTimer_amount)
	ds_map_add(objMap,"value_growthTimer_maxTick",value_growthTimer_maxTick)
}






//privates
mouseMode = mouseModes.null
image_xscale = 4
image_yscale = 4
bg_animate_amount = 0

rand1 = random_range(1.5,1.7)
randRot = random_range(0,30)
darkAlpha = .9

lightsOn = false