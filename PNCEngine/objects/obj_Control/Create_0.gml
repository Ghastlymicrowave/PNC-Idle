
//main menu is fucked and needs to be fixed

//the buttons need to be acessed from the gui not x y cords
//the load button lost all it's code for some fucking reason 

#region engine

instance_create_depth(0,0,0,obj_cameraFollow)
instance_create_depth(0,0,0,obj_fade)
instance_create_depth(0,0,0,obj_screenshakeTarget)
instance_create_depth(0,0,0,obj_cursor)

window_set_cursor(cr_none)
ini_open("save.data")

saveSlots=1
maxSlots = 8

for (var i = 1; i<30; i++){
	
	var datastring= "data"+string(i)+".sav"
	
	if file_exists(datastring)
	{
		saveSlots = i+1
	}else{break;}
	
}

ini_close()

if saveSlots > maxSlots {
saveSlots = maxSlots	
}

mouseScroll = 0
currentMouseScroll = 0;


ivObsPerRow = 8

ivScrollMod=0

effectOnScrollZoom = 0

scrollDisallowedTime=0
mouseAimDisallowedTime=0

frame1=0

//set all grid parameters

gridx=1000
gridy=1000
gridxoff=500 //position the center of view
gridyoff=500



//SnapToCord(1,0)


inventoryHeightPercentage = .20

oneItemPercent=0.10//0.13
openHeight=0
newOpenHeight=0
inventory = ds_list_create()
ivOpen=0
inventoryScreenPercentage=0.75
inventoryScreenHeightPercentage=.95
ivSpaceDist=0
newivSpaceDist=ivSpaceDist

//instance_place_list()
inputCooldown=0
//frames? \/
inputCooldownMax=20//1000000*.5//1 second * percent of one second

room_speed=60
keyboard_set_map(ord("W"),vk_up)
keyboard_set_map(ord("S"),vk_down)
keyboard_set_map(ord("A"),vk_left)
keyboard_set_map(ord("D"),vk_right)
image_alpha=0

sShakeTime=0
sShakeStartingTime=0
sShakeIntense=0
sShakeType=0
sShakeForm=0
sShakeRandom=0

sZoom=1
sZoomSpeed=1

sZoomPercent=0
sZoomBounce=0
sZoomBounced=1

viewv=camera_get_view_height(view_camera[0])
viewh=camera_get_view_width(view_camera[0])

nonUniqueObjects= ds_list_create()

menu=0
paused=0
waitForFade=0

item = noone
holdingItem = false

ivOpen=0
inputCooldown=0

itemUsesMap = ds_map_create()
UsedObjectsMap=ds_map_create()
inventoryID=ds_list_create()
counterList=ds_list_create()
counterMap=ds_map_create()

// replace those /\

//with this \/

sceneObjList = ds_list_create()


function load(inputList){
	
	for (var i = 0; i < ds_list_size(inputList); i++){
		var objMap = ds_list_find_value(inputList,i)
		var obj = instance_create_depth(0,0,0,ds_map_find_value(objMap,"object_index"))
		var objLoad = method(obj,obj.load)
		objLoad()
	}
	
	
}


lightAlpha = 0
rand1 = 0
randRot = 0

#endregion 

#region game specific

//stored recource values, !!!!! ADD THESE TO SAVING/LOADING
res_power = 0
res_metal = 0

upg_powerMax = 10
upg_metalMax = 10
#endregion