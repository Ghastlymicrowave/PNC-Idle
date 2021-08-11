function GridReturnX() {
	//@func GridReturnX( x cordinate)
	//@desc return a world-space x value from a cordinate x
	//@arg Cordinate


	var val =obj_Control.gridxoff+obj_Control.gridx*argument[0]
	if (argument[0]<0){
		var val =obj_Control.gridxoff+obj_Control.gridx*0
		cordx=0
	}
	return val


}
