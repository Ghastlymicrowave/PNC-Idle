var mouseXpercent = (window_mouse_get_x() - window_get_width()/2 )/ window_get_width()*2
var mouseYpercent = (window_mouse_get_y() - window_get_height()/2 )/ window_get_height()*2
currentMousePerX+= (mouseXpercent-currentMousePerX)/4
currentMousePerY+= (mouseYpercent-currentMousePerY)/4

var camX = currentMousePerX * obj_Control.gridx* (1-obj_Control.sZoom)/2
var camY = currentMousePerY * obj_Control.gridy* (1-obj_Control.sZoom)/2
//show_debug_message(string(camX)+":"+string(camY))
var w = camera_get_view_width(view_camera[0])/2
var h = camera_get_view_height(view_camera[0])/2

if obj_Control.mouseAimDisallowedTime >0{
	camera_set_view_pos(view_camera[0],x-w,y-h)
}else{
	camera_set_view_pos(view_camera[0],x-w+camX,y-h+camY)
}


var scl = surface_get_width(application_surface)/sprite_width*9/5

draw_sprite_ext(spr_viginette,0,surface_get_width(application_surface)/2,surface_get_height(application_surface)/2,scl,scl,0,c_white,1)
if (obj_Control.paused){

bg_animate_amount+=0.25
if bg_animate_amount >= 800 {bg_animate_amount=0}

var bgSpr = spr_junjiItoBg

xWobble = dsin((bg_animate_amount%80)/80 * 360)/8+1
yWobble = dsin((bg_animate_amount%100)/100 * 360)/4+1

var offx = surface_get_width(application_surface)/2
var offy = surface_get_height(application_surface)/2
offx +=dcos((bg_animate_amount%400)/400 * 360)*surface_get_width(application_surface)/2
offy +=dsin((bg_animate_amount%200)/200 * 360)*surface_get_height(application_surface)/2

draw_sprite_tiled_ext(bgSpr,0,offx,offy,xWobble,yWobble,c_white,.85)


draw_sprite_ext(spr_viginette,0,surface_get_width(application_surface)/2,surface_get_height(application_surface)/2,scl,scl,0,c_white,1)


var winW = window_get_width()
var winH = window_get_height()

var modi = winH / surface_get_height(application_surface)
var surfaceW = winW/modi



draw_sprite_tiled_ext(spr_black,0,0,0,1,1,c_white,0.5)


//right
var x1 = surface_get_width(application_surface)/2 + scl*sprite_get_width(spr_viginette)/2 
var y1 = surface_get_height(application_surface)/2 - scl*sprite_get_height(spr_viginette)/2
var w1 = surfaceW
var h1 = scl*sprite_get_height(spr_viginette)
draw_sprite_stretched(spr_black,0,x1,y1,w1,h1)

//left
var x2 = -surfaceW
var y2 = surface_get_height(application_surface)/2 - scl*sprite_get_height(spr_viginette)/2
var w2 = -(-surfaceW - (surface_get_width(application_surface)/2 - scl*sprite_get_width(spr_viginette)/2 ))
var h2 = scl*sprite_get_height(spr_viginette)
draw_sprite_stretched(spr_black,0,x2,y2,w2,h2)

}