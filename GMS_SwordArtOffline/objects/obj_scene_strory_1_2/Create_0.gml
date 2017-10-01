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


addSceneDelay(20);
addSceneMovement("kirito",1,3,4);
addSceneTextBox("kirito","It seems that you have learnt how to fight.",0);
addSceneTextBox("klein","Thanks for your help,guy.",1);
addSceneTextBox("kirito","Oh,I have to log out now for dinner.",0);
addSceneTextBox("klein","Me too.",1);
addSceneTextBox("kirito","So...Wait,why I cann't find the log out option?",0);
addSceneTextBox("klein","Neither am I.",1);
addSceneTextBox("kirito","Look,a system message say we should go to the Main Squar.",0);
addSceneTextBox("klein","Let's go.There must be someone give us a explaination.",1);


addSceneChangeRoom(room_world,InputReceiver.worldTeamFlag);
global.storyLine=1;
