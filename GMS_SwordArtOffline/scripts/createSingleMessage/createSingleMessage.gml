///@argument0 text
///@argument1 speaker

var lastReceiver=global.inputReceiver;
global.inputReceiver=InputReceiver.TEXT_BOX;

//wake up for handle scene
global.thisGame.textBoxManager.scenceState=ScenceState.nextElement;

addSceneTextBox(argument1,argument0,0);
//addSceneDelay(1);
addSceneChangeRoom(noone,lastReceiver);