///@argument0 text
///@argument1 speaker

var lastReceiver=global.inputReceiver;
global.inputReceiver=InputReceiver.textBox;
with(obj_textBox_manager){
	//wake up for handle scene
	scenceState=ScenceState.nextElement;
}
addSceneTextBox(argument1,argument0,0);
//addSceneDelay(1);
addSceneChangeRoom(noone,lastReceiver);