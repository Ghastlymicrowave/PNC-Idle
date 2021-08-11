if obj_Control.paused=0{
	
	
if selected = 1{
cursor_sprite = noone		

var scl = (surface_get_width(application_surface)/obj_Control.ivObsPerRow)/sprite_width*image_xscale
	//((y - camera_get_view_y(view_camera[0]))/camera_get_view_height(view_camera[0]))*window_get_height()
var a = application_get_position();
	var xoff = a[0];
	var yoff = a[1];
	var mouseX=(window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface)
	var mouseY=(window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface)
	
	var newX = mouseX//((x - camera_get_view_x(view_camera[0]))/camera_get_view_width(view_camera[0]))*window_get_width() 
	var newY = mouseY
	
	//item drawn at where you are holding it w mouse
draw_sprite_ext(sprite_index,image_index,newX+3,newY+3,scl,scl,image_angle,c_black,image_alpha)
draw_sprite_ext(sprite_index,image_index,newX,newY,scl,scl,image_angle,c_white,image_alpha)

if amount > 1{
		draw_text_transformed_color(newX+40+lengthdir_y(10,image_angle),newY+20+lengthdir_x(10,image_angle),string(amount),2,2,0,c_white,c_white,c_gray,c_gray,1)
	}

}
	


}

