global.thisGame.worldTeamFlag.x=global.thisGame.worldX[global.curWorldPos];
global.thisGame.worldTeamFlag.y=global.thisGame.worldY[global.curWorldPos];

//quit from doMore
global.thisGame.worldTeamFlag.worldDoMoreSelectedIndex=-1;
global.thisGame.worldTeamFlag.worldMapState=WorldMapState.worldFree;
global.thisGame.worldTeamFlag.toWorldPos=global.curWorldPos;

with(obj_world_map){
	image_index=global.storyLine;	
}