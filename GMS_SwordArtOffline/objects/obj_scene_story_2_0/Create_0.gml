/// @description Insert description here
// You can write your code in this editor
event_inherited();


addSceneDelay(20);


addSceneTextBox("klein","可恶，我们被杂兵拖住了!",1);
addSceneMovement("cursor",5,0,16);
addSceneMovement("cursor",5,9,16);
addSceneTextBox("kirito","看来得由我们两人来解决boss了。",0);
addSceneTextBox("asuna","好的。",1);

addSceneChangeRoom(room_battle_2_1,InputReceiver.cursor);

