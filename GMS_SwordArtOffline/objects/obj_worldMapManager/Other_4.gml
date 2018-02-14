/// @description Insert description here
// You can write your code in this editor
if(room==room_world){
	//blind inputreciever with romm
	global.inputReceiver=InputReceiver.WORLD_MAP;
	//reset state
	worldMapState=WorldMapState.worldMapFree;
	
	toWorldPos=curWorldPos;
}