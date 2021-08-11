// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mouse_get_extendedScreenPos(){
var a = application_get_position();

	var xoff = a[0];
	var yoff = a[1];
	var output
	output[1] = (window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface)
	output[0] = (window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface)
	return output
}