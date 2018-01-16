/// @description Insert description here
// You can write your code in this editor


if(room==room_world){
	//blind inputreciever with romm
	global.inputReceiver=InputReceiver.worldMapManager;
	//reset state
	//worldMapState=WorldMapState.worldFree; 
	visible=true;
	with(obj_role_player)
		visible=false;
}
	

