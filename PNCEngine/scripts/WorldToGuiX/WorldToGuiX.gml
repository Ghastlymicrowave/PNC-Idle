function WorldToGuiX() {
	return (argument[0]-camera_get_view_x(view_camera[0]))/camera_get_view_width(view_camera[0]) * window_get_width()


}
