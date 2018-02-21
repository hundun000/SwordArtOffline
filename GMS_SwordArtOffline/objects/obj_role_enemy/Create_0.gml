/// @description Insert description here
// You can write your code in this editor
isPropertiesInit=false;

name=-1;
lv=-1;

items=ds_grid_create(NUM_ITEM_PROPERTY,NUM_ROLE_ITEM);
curNumItem=0;
curWeaponIndex=-1;

ds_list_add(global.frontEnemies,self);
list_canAttack=ds_list_create();
list_worth=ds_list_create();
list_tileForAttack=ds_list_create();

rolePath=noone;
gridMap=noone;

enemyState=EnemyState.waitPath;

enum EnemyState{
	waitPath,
	pathReady,
	moving,
	moved,
	fighting,
	afterFight

}

show_debug_message(string(id)+" created.");