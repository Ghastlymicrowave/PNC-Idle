function GridReturnY() {


	//@Y Cordinate


	var val =obj_Control.gridyoff+obj_Control.gridy*argument[0]
	if (argument[0]<0){
		var val =obj_Control.gridyoff+obj_Control.gridy*0
		cordy=0
	}

	return val


}
