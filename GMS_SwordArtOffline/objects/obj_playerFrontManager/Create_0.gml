/// @description Insert description here
// You can write your code in this editor
event_inherited();

enum CursorState{
	turnStart,
	waitTurnStartAnimation,
	free,
	selectedRole,
	roleDoMore,
	selectingBagItem,
	selectingEnemy,
	nextPlayer,

	moved,
	playerSideEnd,
	waitEnemy,
	notInBattle,
	waitPlayerWinAnimation,
	
	selectingSkillTarget,
}


cursorState=noone;

playerPath=noone;
targetIns=noone;
targetTypeObj=noone;
targetTileObj=noone;

fightForecastInfo=noone;

operatedRole=noone;






