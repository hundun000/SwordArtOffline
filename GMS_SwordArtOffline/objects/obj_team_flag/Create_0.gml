/// @description Insert description here
// You can write your code in this editor
event_inherited();

globalvar curWorldPos
global.curWorldPos=0;
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
option_model[4]="Load Game";
option_model[5]="Save Game";

	
worldMapState=WorldMapState.worldFree;




