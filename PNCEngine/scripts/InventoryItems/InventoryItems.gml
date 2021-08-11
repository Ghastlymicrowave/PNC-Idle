function init_items(){
global.items_library = [20,2]
global.items = 0
item_add_to_library("spoon",spr_spoon)
item_add_to_library("valve",spr_valve)
item_add_to_library("big",spr_big)
item_add_to_library("small",spr_small)
item_add_to_library("battery",spr_battery)
item_add_to_library("metalPlate",spr_metalPlate)
}

function item_add_to_library(name,sprite){
	global.items_library[global.items,0] = name
	global.items_library[global.items,1] = sprite
	global.items++;
}

function item_get_name(ID){
	return global.items_library[ID,0]
}

function item_get_sprite(ID){
	return global.items_library[ID,1] 
}

enum items_refrence {
	spoon,
	valve,
	big,
	small, 
	battery,
	metalPlate
}

function item_add_to_inventory(ID){//adds 1 to the amount of an item if one shares an ID in the inventory
	//otherwise, it will make a new item with default ID based stats
	
	//ask if item already exists in list
	var existsFlag = 0
	var tempItem = 0
	for(var i = 0; i< ds_list_size(obj_Control.inventory);i++){
		tempItem = ds_list_find_value(obj_Control.inventory,i)
		if tempItem.ID == ID {
			existsFlag = true;
			break;
		}
	}
	
	if existsFlag {//exists
		//Need to add an animation here!
		tempItem.amount++;
		show_debug_message("item already exits")
		var item = instance_create_depth(mouse_x,mouse_y,0,obj_visualInventoryItem)
		
		var a = application_get_position();
		var xoff = a[0];
		var yoff = a[1];
		var mouseX=(window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface)
		var mouseY=(window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface)
		item.targx = mouseX
		item.targy = mouseY
		
		
		item.position = tempItem.position
		item.defaultxScale = tempItem.defaultxScale
		
		item.sprite_index = item_get_sprite(ID)
		item.image_xscale=item.defaultxScale
		item.image_yscale=item.defaultxScale
		item.width=item.sprite_width
		item.height=item.sprite_height
	}else {//does not exist
		ds_list_find_index(obj_Control.inventory,ID)
	
		show_debug_message("adding item: "+global.items_library[ID,0]+" ID: "+string(ID))	
		
		var item = instance_create_depth(mouse_x,mouse_y,0,obj_inventoryItem)
		ds_list_add(obj_Control.inventory,item.id)
		item.position = ds_list_find_index(obj_Control.inventory,item.id)
		var oneWidth = obj_Control.oneItemPercent*(camera_get_view_width(view_camera[0]))/obj_Control.sZoom
	
		var a = application_get_position();
		var xoff = a[0];
		var yoff = a[1];
		var mouseX=(window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface)
		var mouseY=(window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface)
		item.targx = mouseX
		item.targy = mouseY
	
		item.sprite_index = item_get_sprite(ID)
		item.name =item_get_name(ID)
		item.amount = 1
		item.ID = ID
	
		item.defaultxScale=oneWidth/item.sprite_width/1.25
		item.image_xscale=item.defaultxScale
		item.image_yscale=item.defaultxScale
		item.width=item.sprite_width
		item.height=item.sprite_height
	}
}

function item_add_to_inventory_ext(ID,amount,sprite/*optional*/){
	//adds whatever to the amount of an item if one shares an ID in the inventory (and a sprite if one is specified)
	//otherwise, it will make a new item with custom stats, 
	//!!!!!!!!!!!!!!!!!!!!!
	//be carefull when using this with inventory_add()
	//!!!!!!!!!!!!!!!!!!!!!
	
	//ask if item already exists in list
	var existsFlag = 0
	if variable_instance_exists(id,sprite){// if sprite is unused
		sprite=-4	
	}
	for(var i = 0; i< ds_list_size(obj_Control.inventory);i++){
		var tempItem = ds_list_find_value(obj_Control.inventory,i)
		if tempItem.ID == ID && (sprite == -4||tempItem.sprite_index == sprite){
			existsFlag = true;
			break;
		}
	}
	
	if existsFlag {//exists
		//Need to add an animation here!
		tempItem.amount+= amount;
		show_debug_message("item already exists")
	}else {//does not exist
		show_debug_message("adding item: "+global.items_library[ID,0]+" ID: "+string(ID)+" amt:"+string(amount)+" sprite:"+string(sprite_get_name(sprite)))	
		a=mouse_get_extendedScreenPos()
		var item = instance_create_depth(mouse_x,mouse_y,0,obj_inventoryItem_ext)
		ds_list_add(obj_Control.inventory,item.id)
		item.position = ds_list_find_index(obj_Control.inventory,item.id)
		var oneWidth = obj_Control.oneItemPercent*(camera_get_view_width(view_camera[0]))/obj_Control.sZoom
		
		var a = application_get_position();
		var xoff = a[0];
		var yoff = a[1];
		var mouseX=(window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface)
		var mouseY=(window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface)
		item.targx = mouseX
		item.targy = mouseY
	
		item.sprite_index = sprite
		item.name = string(name)
		item.amount = amount
		item.ID = ID
		
		item.defaultxScale=oneWidth/item.sprite_width/1.25
		item.image_xscale=item.defaultxScale
		item.image_yscale=item.defaultxScale
		item.width=item.sprite_width
		item.height=item.sprite_height
	}
}

	
	
	
	/*var item = instance_create_depth(a[0],a[1],0,obj_inventoryItem)

	item.ID = argument[0]

	ds_list_add(obj_Control.inventory,item.id)
	ds_list_add(obj_Control.inventoryID,item.ID)
	item.position = ds_list_find_index(obj_Control.inventory,item.id)


	
	show_debug_message(string(oneWidth))

	switch(argument[0]){
	case items_library.spoon:item.sprite_index = spr_spoon//spoon
	break;
	case items_library.valve:item.sprite_index = spr_valve
	break;
	case items_library.big:item.sprite_index = spr_big
	break;
	case items_library.small:item.sprite_index = spr_small
	break;
	case items_library.battery:item.sprite_index = spr_battery
	break;
	default:item.sprite_index = spr_defaultItem
	break;
	}

	item.defaultxScale=oneWidth/item.sprite_width/1.25
	show_debug_message(string(item.defaultxScale))
	item.image_xscale=item.defaultxScale
	item.image_yscale=item.defaultxScale
	//image_yscale=image_xscale

	item.width=item.sprite_width
	item.height=item.sprite_height


*/


