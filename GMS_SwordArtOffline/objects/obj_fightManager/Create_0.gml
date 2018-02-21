/// @description Insert description here
// You can write your code in this editor
#macro FIGHT_L 0
#macro FIGHT_R 1

enum FightState{
	noInFightRoom,
	preFight,
	waitStartDelay,
	
	startAttackAnimation,
	waitAttackAnimationEnd,
	startResultAnimation,
	waitResultAnimation,
	
	startStrengthenAnimation,
	processStrengthen,
	
	processXp,
	fightEnd,
}

enum FightType{
	ATTACK,
	STRENGEN,
	ACTION	
}

fighter[FIGHT_L]=noone;
fighter[FIGHT_R]=noone;
fightBackRoom=noone;
fightState=FightState.noInFightRoom;
fightType=noone;

deadEnemyRole=noone;

//******** HP bar data ***********
rate_remainHp[FIGHT_L]=-1;
rate_remainHp[FIGHT_R]=-1;
num_remainHp[FIGHT_L]=-1;
num_remainHp[FIGHT_R]=-1;	


attackAnimation[FIGHT_L]=noone;
attackAnimation[FIGHT_R]=noone;