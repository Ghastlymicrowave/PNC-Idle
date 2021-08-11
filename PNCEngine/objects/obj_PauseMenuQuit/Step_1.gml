if obj_Control.menu=0{
	var a = mouse_get_extendedScreenPos()
	var px = a[0]
	var py = a[1]
	var w = sprite_width
	var h = sprite_height

if point_in_rectangle(px,py,xgui-w,ygui-h,xgui+w,ygui+h){
image_blend = c_red
} else {
image_blend = c_white	
}

	if mouse_check_button_released(mb_left)&&point_in_rectangle(px,py,xgui-w,ygui-h,xgui+w,ygui+h){
		game_end()
	}
}
