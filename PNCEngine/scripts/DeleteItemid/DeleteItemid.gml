function DeleteItemid() {
	ds_list_delete(obj_Control.inventory,ds_list_find_index(obj_Control.inventory,argument[0]))
	obj_Control.tempvar = position
	with(obj_inventoryItem){
	if (position>obj_Control.tempvar){
	position--
	}
	}
	instance_destroy()


}
