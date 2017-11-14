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
	waitPlayerWinAnimation
}


cursorState=noone;

playerPath=noone;
target=noone;

fightForecastInfo=noone;

//globalvar playerTeamDone;
//global.playerTeamDone=false;






