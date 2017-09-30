/// @description Insert description here
// You can write your code in this editor

//bgm=audio_play_sound(s_map0_bgm,1,1);

/*
with(obj_textBox_manager)
	backInputReciever=InputReceiver.cursor;
addSceneTextBox("asuna","Nice to meet you.",0);
addSceneTextBox("kirito","Nice to meet you,too.",1);
addSceneTextBox("asuna","My name is Asuna.",0);
addSceneTextBox("kirito","My name is Kirito.",1);
*/

global.inputReceiver=InputReceiver.textBox;
with(obj_textBox_manager){
	backInputReciever=InputReceiver.cursor;
	backRoom=noone;
	
	scenceState=ScenceState.nextElement;
}

addSceneTextBox("asuna","We are in the front now.",0);
addSceneTextBox("kirito","Have a good time.",1);