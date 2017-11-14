/// @description Insert description here
// You can write your code in this editor
global.inputReceiver=InputReceiver.textBox;
with(obj_textBox_manager){
	//wake up for handle scene
	scenceState=ScenceState.nextElement;
}


addSceneDelay(20);


addSceneTextBox("klein","We can't move toward any more!",1);
addSceneMovement("cursor",5,0,16);
addSceneMovement("cursor",5,9,16);
addSceneTextBox("kirito","We must solve them by ourselves.",0);
addSceneTextBox("asuna","Yes.",1);

addSceneChangeRoom(room_battle_2_1,InputReceiver.cursor);
