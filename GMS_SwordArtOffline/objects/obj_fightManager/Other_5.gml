/// @description Insert description here
// You can write your code in this editor
if(room==room_fight){
	global.inputReceiver=InputReceiver.cursor;
	
	if(deadRole!=noone)
		instance_destroy(deadRole);
}