show_debug_message(string(x)+" : "+string(y))

if obj_Control.paused!=1 { 
//var objects per a full screen width



	var a = application_get_position();
	var xoff = a[0];
	var yoff = a[1];
	var mouseX=(window_mouse_get_x()-xoff)/(window_get_width()-xoff*2) * surface_get_width(application_surface)
	var mouseY=(window_mouse_get_y()-yoff)/(window_get_height()-yoff*2) * surface_get_height(application_surface)

var newtargx = (surface_get_width(application_surface)/obj_Control.ivObsPerRow)*position +obj_Control.ivSpaceDist



//needs fixed
var mouseoverHeight=-max((150-point_distance(newtargx,0,mouseX,0)),0)/5 //* (point_distance(0,targy+window_get_width()+obj_cameraFollow.vspeed,0,mouse_y)<100)

//needs fixed
var ivOpenHeight = -obj_Control.ivOpen*surface_get_height(application_surface)*obj_Control.inventoryHeightPercentage 
var defaultHeight = obj_Control.inventoryHeightPercentage*surface_get_height(application_surface)/2
var newtargy = surface_get_height(application_surface)+mouseoverHeight+ivOpenHeight+defaultHeight
var low = defaultHeight + surface_get_height(application_surface)
var high =  +defaultHeight-surface_get_height(application_surface)*obj_Control.inventoryHeightPercentage+surface_get_height(application_surface)-150/5

//destroy if it doesn't move
if point_distance(targx,targy,newtargx,newtargy)<1{instance_destroy()
	show_debug_message("desroyed visual iv item")
	}

targx+=(newtargx-targx)/spd
targy+=(newtargy-targy)/spd

percent = (low-targy)/(low-high)
//regularx=targx+camera_get_view_x(view_camera[0])+obj_cameraFollow.hspeed+obj_Control.ivSpaceDist
//regulary=targy+camera_get_view_y(view_camera[0])+obj_cameraFollow.vspeed

regularx=targx
regulary=targy

regularWorldx =(regularx/surface_get_width(application_surface))*camera_get_view_width(view_camera[0])+camera_get_view_x(view_camera[0])
regularWorldy =(regulary/surface_get_height(application_surface))*camera_get_view_height(view_camera[0])+camera_get_view_y(view_camera[0])

x = regularWorldx
y = regularWorldy

if hover=1{
	hover=0
//newimage_xscale=clamp(1.5-(point_distance(x,y,mouse_x,y))/70,1,1.3) 
//newimage_angle=clamp(point_distance(x,y,mouse_x,mouse_y)-100,0,25)

}else{
	newimage_xscale=defaultxScale
	newimage_angle=25
}


	if (selected){
	newimage_angle=0
	newimage_xscale=defaultxScale*1.25
	}
	
	
	
	image_xscale+=(newimage_xscale-image_xscale)/10
	image_angle+=(newimage_angle-image_angle)/10
image_yscale=image_xscale


if oneframe>0{
	oneframe--
	}
	
}