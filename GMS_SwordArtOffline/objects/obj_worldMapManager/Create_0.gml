/// @description Insert description here
// You can write your code in this editor
enum WorldMapState{
	worldMapFree,
	worldMapWaitMoving,
	worldMapWantIntoBattle,
	worldMapFinishMoving
}

curWorldPos=-1;
storyLine=-1;

worldDoMoreSelectedIndex=-1;
toWorldPos=-1;

worldMapState=WorldMapState.worldMapFree;

//const value
worldX[0]=660;
worldY[0]=579;
worldX[1]=539;
worldY[1]=496;	
worldX[2]=338;
worldY[2]=478;