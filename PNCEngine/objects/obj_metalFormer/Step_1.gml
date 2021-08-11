/// @description Insert description here
// You can write your code in this editor

if value == value_max {
	value = 0
	
	if pilingItem ==noone{
		pilingItem = instance_create_depth(x+sprite_get_width(spr_metalPlate)*1,y,0,obj_metalFormerPickup)
		pilingItem.image_xscale = 2
		pilingItem.image_yscale = 2
	}else{
		pilingItem.value ++
	}
	
}