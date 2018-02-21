/// @description Insert description here
// You can write your code in this editor

globalvar frontEnemies;
global.frontEnemies=ds_list_create();


curProcessIndex=-1;

enemyManagerState=EnemyManagerState.waitPlayer;

//global.playerTeamDone=false;

enum EnemyManagerState{
	turnStart,
	waitTurnStartAnimation,
	initTarget,
	moving,
	moved,
	fighting,
	nextEnemy,
	enemySideEnd,
	waitPlayer,
	notInBattle,
	waitPlayerWinAnimation
}

delayCounter=-1;

enemy=noone;
attackTarget=noone;
moveTarget=noone;
