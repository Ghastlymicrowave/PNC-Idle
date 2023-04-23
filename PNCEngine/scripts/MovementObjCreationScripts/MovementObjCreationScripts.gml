
///@func Fade()
///@desc Creation: sets snap move or snap obj_move to fade in and fade out
function Fade() {

	fade=1


}



///@func LinkToObject( object Refrence, is unique?, Optional: if not unique- PointID)
///@description Creation: link this object to another to be activated
///@param real objectRefrence
///@param real unique?
///@param real if_not_unique;_pointID



///@func NeededID
///@desc Creation: sets a itemuse to require a certain itemID
///@arg id neededitemid
///@arg bool deleteitem
function NeededID() {


	neededitemid=argument[0]
	deleteItem=argument[1]


}

#region snaps
///@func SnapDown(snap x, snap y)
///@desc Creation: snap to a location 
///@arg {real} x cord to snap camera to
///@arg {real} y cord to snap camera to
function SnapDown() {

	slide=0
	dir=3
	gotox=argument[0]
	gotoy=argument[1]


}

///@func SnapLeft(snap x, snap y)
///@desc Creation: snap to a location 
///@arg {real} x cord to snap camera to
///@arg {real} y cord to snap camera to
function SnapLeft() {

	slide=0
	dir=1
	gotox=argument[0]
	gotoy=argument[1]


}




///@func SnapRight(snap x, snap y)
///@desc Creation: snap to a location 
///@arg {real} x cord to snap camera to
///@arg {real} y cord to snap camera to
function SnapRight() {

	slide=0
	dir=0
	gotox=argument[0]
	gotoy=argument[1]


}





///@func SnapUp(snap x, snap y)
///@desc Creation: snap to a location 
///@arg {real} x cord to snap camera to
///@arg {real} y cord to snap camera to
function SnapUp() {

	slide=0
	dir=2
	gotox=argument[0]
	gotoy=argument[1]


}



#endregion

#region slides

///@func SlideDown()
///@desc Creation: slide down one tile
function SlideDown() {

	slide=1
	dir=3


}


///@func SlideLeft()
///@desc Creation: slide left one tile
function SlideLeft() {
	slide=1
	dir=1


}


///@func SlideRight()
///@desc Creation: slide right one tile
function SlideRight() {
	slide=1
	dir=0


}

///@func SlideUp()
///@desc Creation: slide up one tile
function SlideUp() {
	slide=1
	dir=2


}

#endregion

#region snapMoves

///@func SnapDownMove(snap x, snap y, move x, move y)
///@desc Creation: snap to a location then move to another location
///@arg {real} x cord to snap camera to
///@arg {real} y cord to snap camera to
///@arg {real} x cord to move to
///@arg {real} y cord to move to
function SnapDownMove() {
	slide=2
	dir=3
	gotoxCord=argument[0]
	gotoyCord=argument[1]
	gotox=argument[2]
	gotoy=argument[3]



}

///@func SnapLeftMove(snap x, snap y, move x, move y)
///@desc Creation: snap to a location then move to another location
///@arg {real} x cord to snap camera to
///@arg {real} y cord to snap camera to
///@arg {real} x cord to move to
///@arg {real} y cord to move to
function SnapLeftMove() {
	slide=2
	dir=1
	gotoxCord=argument[0]
	gotoyCord=argument[1]
	gotox=argument[2]
	gotoy=argument[3]


}

///@func SnapRightMove(snap x, snap y, move x, move y)
///@desc Creation: snap to a location then move to another location
///@arg {real} x cord to snap camera to
///@arg {real} y cord to snap camera to
///@arg {real} x cord to move to
///@arg {real} y cord to move to
function SnapRightMove() {
	slide=2
	dir=0
	gotoxCord=argument[0]
	gotoyCord=argument[1]
	//cords to snap to
	gotox=argument[2]
	gotoy=argument[3]
	//cords to move to


}

///@func SnapUpMove(snap x, snap y, move x, move y)
///@desc Creation: snap to a location then move to another location
///@arg {real} x cord to snap camera to
///@arg {real} y cord to snap camera to
///@arg {real} x cord to move to
///@arg {real} y cord to move to
function SnapUpMove() {
	slide=2
	dir=2
	gotoxCord=argument[0]
	gotoyCord=argument[1]
	gotox=argument[2]
	gotoy=argument[3]

}

#endregion


