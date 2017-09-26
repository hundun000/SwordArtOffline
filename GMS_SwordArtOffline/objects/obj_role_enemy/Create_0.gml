/// @description Insert description here
// You can write your code in this editor
isPropertiesInit=false;

name=-1;
lv=-1;



ds_list_add(global.frontEnemies,self);
list_canAttack=ds_list_create();
list_worth=ds_list_create();
list_tileForAttack=ds_list_create();



rolePath=noone;
gridMap=noone;



enemyState=EnemyState.waitPath;

//for room event,room_enter_counter==2 mean the timeing that goto fight room,then back here
room_enter_counter=0;

enum EnemyState{
	waitPath,
	pathReady,
	moving,
	moved,
	fighting,
	afterFight

}