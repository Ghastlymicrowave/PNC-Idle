function WorldToGuiY() {
	return (argument[0]-camera_get_view_y(view_camera[0]))/camera_get_view_height(view_camera[0]) * window_get_height()


}
