/// @description Insert description here
// You can write your code in this editor
if(room==room_fight){
	global.inputReceiver=InputReceiver.CURSOR;
	
	fightType=noone;
	
	if(deadEnemyRole!=noone)
		instance_destroy(deadEnemyRole);
}