/// @description Insert description here
// You can write your code in this editor
event_inherited();

isPropertiesInit=false;



ds_list_add(global.frontEnemies,self);
list_canAttack=ds_list_create();
list_worth=ds_list_create();
list_tileForAttack=ds_list_create();

rolePath=noone;
gridMap=noone;

enemyState=EnemyState.waitPath;
weaponProfession=ItemType.weapon_enemy;

enum EnemyState{
	waitPath,
	pathReady,
	moving,
	moved,
	fighting,
	afterFight

}

show_debug_message(string(id)+" created.");