/// @description Insert description here
// You can write your code in this editor

//bgm=audio_play_sound(s_map0_bgm,1,1);


global.inputReceiver=InputReceiver.textBox;
with(obj_textBox_manager){
	scenceState=ScenceState.nextElement;
}


addSceneDelay(40);
addSceneTextBox("kirito","Well,I will defeat these boars.",0);

addSceneChangeRoom(noone,InputReceiver.cursor,CursorState.turnStart);