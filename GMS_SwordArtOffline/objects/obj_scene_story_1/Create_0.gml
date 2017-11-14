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
	scenceState=ScenceState.nextElement;
}


addSceneDelay(40);
/*
addSceneMovement("klein",2,4,2);
addSceneMovement("klein",1,4,2);
addSceneTextBox("klein","How can I defeat the boar?",0);
addSceneMovement("kirito",1,3,4);
*/
//disable for test
addSceneTextBox("kirito","Follow me.",1);

addSceneChangeRoom(room_battle_1_1,InputReceiver.cursor);

