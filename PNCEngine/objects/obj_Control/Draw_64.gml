/*
var a = application_get_position();

var xoff = a[0];
var yoff = a[1];

if obj_cursor.keyboardInUse==0{
	mouseX=(window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface)
	mouseY=(window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface)

*/

var wdth = surface_get_width(application_surface)
var hght = surface_get_height(application_surface)
var scl = wdth/sprite_width

newOpenHeight = -obj_Control.ivOpen*(hght*inventoryHeightPercentage) -hght*.05
openHeight+= (newOpenHeight-openHeight)/4

var alpha = 1-currentMouseScroll/25

if paused=0{
draw_sprite_ext(spr_inventoryBar,0,wdth/2,openHeight+hght,scl,scl,0,c_white,alpha)
}


