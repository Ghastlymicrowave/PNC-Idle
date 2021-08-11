
if mouse_check_button_pressed(mb_left)&&place_meeting(x,y,obj_cursor){
	item_add_to_inventory(itemID)	
	value--
	if value = 0{
		instance_destroy()
		obj_metalFormer.pilingItem = noone
	}
}
