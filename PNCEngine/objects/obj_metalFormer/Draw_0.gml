
draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,0,c_white,1)

if instance_exists(pilingItem){
	
	with(pilingItem){
		for (var i = value-1; i > -1; i--){
	
			var amt = (i+1)*4
			draw_sprite_ext(sprite_index,0,x+amt,y,2,2,0,c_white,1)
		}
	}
}

var xpos = sprite_get_width(spr_metalPlate) - sprite_get_width(spr_metalPlate) * (value / value_max)
var width = sprite_get_width(spr_metalPlate) * (value / value_max)
draw_sprite_part_ext(spr_metalPlate,0,xpos,0,width,sprite_get_height(spr_metalPlate),x,y-sprite_get_height(spr_metalPlate),2,2,c_white,1)
layer_force_draw_depth(false, 0);