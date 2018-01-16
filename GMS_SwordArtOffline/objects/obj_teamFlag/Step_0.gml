/// @description Insert description here
// You can write your code in this editor

switch(teamFlagState){
	case TeamFlagState.flagFree:
		if(manager.curWorldPos!=manager.toWorldPos){
			//get the x,y of the pos to go
			toWorldX=manager.worldX[manager.toWorldPos];
			toWorldY=manager.worldY[manager.toWorldPos];
		
			//add motion to go
			move_towards_point(toWorldX,toWorldY,TEAM_FLAG_SPEED);
			
			teamFlagState=TeamFlagState.flagMoving;
		}
		break;
	case TeamFlagState.flagMoving:
		if(distance_to_point(toWorldX,toWorldY)<TEAM_FLAG_SPEED){
			x=toWorldX;
			y=toWorldY;
			speed=0;
			
			manager.worldMapState=WorldMapState.worldMapFinishMoving;
			
			teamFlagState=TeamFlagState.flagFree;
		}
		break;
	default:
	
}





