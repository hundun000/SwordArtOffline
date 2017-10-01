/// @description Insert description here
// You can write your code in this editor
if(inMap_stroryLine!=global.storyLine){

	global.inputReceiver=InputReceiver.textBox;
	with(obj_textBox_manager){
		scenceState=ScenceState.nextElement;
		
		backInputReciever=InputReceiver.worldTeamFlag;
		backRoom=noone;
	}
	
	switch(global.storyLine){
		case 1:
			image_index=1;
			break;
		default:
	}

	inMap_stroryLine=global.storyLine;

}