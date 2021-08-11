//level starts and ends

function GetPosForLevel(roomId){
var output;

	switch (roomId){
		case rm_clicker:
		output[0] = 1
		output[1] = 0
		break;
		case rm_clicker_main:
		output[0] = 1
		output[1] = 2
		break;
	}

return output;
}