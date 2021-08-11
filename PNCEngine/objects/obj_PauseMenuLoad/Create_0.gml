xgui= surface_get_width(application_surface)/2

ygui= surface_get_height(application_surface)/1.5*(2/4)

totalSlots = 0
maximumTotalSlots = 10
for (var _i = 0; _i< maximumTotalSlots; _i++){
	var dir = global.saveDirectory+"/file"+string(_i)+"/"//save file folder
	if ini_saveExists(dir+"global.ini"){
		totalSlots++
	}
}