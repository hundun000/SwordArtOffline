/// @description Insert description here
// You can write your code in this editor
event_inherited();


addSceneDelay(20);


addSceneTextBox("silica","太危险了，我得离开。",0);
addSceneMovement("silica",3,4,8);
addSceneMovement("silica",8,4,8);
addSceneMovement("silica",8,2,8);
addSceneTextBox("silica","惊了，是死路，RUA！",0);
addSceneMovement("cursor",14,9,16);
//addSceneMovement("cursor",14,9,16);
addSceneTextBox("kirito","好像有人遇到麻烦了。",0);

addSceneChangeRoom(room_battle_3_1,InputReceiver.CURSOR);

