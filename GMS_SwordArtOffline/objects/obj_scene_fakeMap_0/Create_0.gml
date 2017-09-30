/// @description Insert description here
// You can write your code in this editor

//bgm=audio_play_sound(s_map0_bgm,1,1);

global.inputReceiver=InputReceiver.textBox;
with(obj_textBox_manager){
	backInputReciever=InputReceiver.cursor;
	backRoom=room_map_0;
	
	scenceState=ScenceState.nextElement;
}
	
	
addSceneTextBox("asuna","Nice to meet you.",0);
addSceneTextBox("kirito","Nice to meet you,too.",1);
addSceneTextBox("asuna","My name is Asuna.",0);
addSceneTextBox("kirito","My name is Kirito.",1);

addSceneMovement("kirito",5,2,4);

addSceneTextBox("kirito","Let's form a team.",0);
addSceneTextBox("asuna","That sound good.",1);