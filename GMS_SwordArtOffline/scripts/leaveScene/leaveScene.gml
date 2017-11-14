show_debug_message("leave room make inputReciever set to "+string(backInputReciever));
global.inputReceiver=backInputReciever;
backInputReciever=noone;
	
scenceState=ScenceState.noScene;
//isSerie=false;
	
if(backRoom!=noone){
	room_goto(backRoom);
	backRoom=noone;
}