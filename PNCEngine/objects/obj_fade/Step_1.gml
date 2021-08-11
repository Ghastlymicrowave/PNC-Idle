if obj_Control.paused!=1 {

if fade=0&&image_alpha>0{
	image_alpha-=rate
	if image_alpha<0{image_alpha=0}
}else if fade=1&&image_alpha<1{
	image_alpha+=rate
	if image_alpha>1{image_alpha=1}
}

if abs(window_get_width()-sprite_width)>1{
image_xscale=window_get_width()/sprite_width
}
if abs(window_get_height()-sprite_height)>1{
image_yscale=window_get_height()/sprite_height

}



}