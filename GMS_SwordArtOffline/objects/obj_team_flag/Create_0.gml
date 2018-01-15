/// @description Insert description here
// You can write your code in this editor
event_inherited();


toWorldPos=0;

toWorldX=0;
toWorldY=0;

worldDoMoreSelectedIndex=-1;

enum WorldMapState{
	worldFree,
	worldMoving,
	worldDoMoreSelect,
	worldWantIntoBattle,
}


option_model[0]="Into Battle";
option_model[1]="Into Shop";
option_model[2]="Team Info";
option_model[3]="Blank";
option_model[4]="Load Game";
option_model[5]="Save Game";
num_optionModel=6;
	
worldMapState=WorldMapState.worldFree;

global.thisGame.worldTeamFlag=instance_find(obj_team_flag,0);  


