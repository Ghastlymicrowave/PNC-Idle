if mouseMode == mouseModes.hover{
	if value == 0{
		draw_textbox("Create Battery\nMetal: 5\nPower: 5\nIncreases maximum power by 10")
	}else{
		draw_textbox("Speed up Production\nPower: 5\nSpeeds up battery production by a small amount")
	}	
}

function draw_textbox(text){
	
	var padding = 3
	var x1 = mouse_x+50
	var x2 = x1 + string_width(text)
	var y1 = mouse_y-50
	var y2 = y1 + string_height(text)
	draw_set_color(c_gray)
	draw_rectangle(x1-3,y1-3,x2+3,y2+3,false)
	draw_set_color(c_black)
	draw_rectangle(x1-3,y1-3,x2+3,y2+3,true)
	draw_set_color(c_white)
	draw_text(x1,y1,text)	
}