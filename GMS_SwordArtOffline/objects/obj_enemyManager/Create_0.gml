/// @description Insert description here
// You can write your code in this editor

globalvar frontEnemies;
global.frontEnemies=ds_list_create();


ii=0;
enemyManagerState=EnemyManagerState.initTarget;

global.playerTeamDone=false;

enum EnemyManagerState{
	waitPlayer,
	initTarget,
	moving,
	moved,
	fighting,
	nextEnemy,
}

delayCounter=0;

enemy=noone;
attackTarget=noone;
moveTarget=noone;
