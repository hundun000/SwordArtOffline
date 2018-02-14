/// @description Insert description here
// You can write your code in this editor

if(global.inputReceiver!=InputReceiver.WORLD_MAP) return;

var isU=input_dy==-1;
var isD=input_dy==1;
var isL=input_dx=-1;
var isR=input_dx==1;

switch(worldMapState){
	
	case WorldMapState.worldMapFree:
		if(isA){
			worldMapState=WorldMapState.worldMapWantIntoBattle;
		}
		else if(isB){
			room_goto(room_home);
			return;
		}
		else if(input_dy!=0||input_dx!=0){
			switch(curWorldPos){
				case 0:	
					if(isU||isL){
						if(storyLine>=1)	toWorldPos=1;
					}
					break;
				case 1:
					if(isD||isR)
						toWorldPos=0;
					else if(isL){
						if(storyLine>=2)	toWorldPos=2;
					}
					break;					
				case 2:
					if(isR)
						toWorldPos=1;
					break;
				default:	
			}
			
			if(curWorldPos!=toWorldPos)
				worldMapState=WorldMapState.worldMapWaitMoving;
		}
		break;
	
	case WorldMapState.worldMapWaitMoving:
		//wait obj_flag change this.state
		break;
	
	case WorldMapState.worldMapFinishMoving:
		curWorldPos=toWorldPos;
		worldMapState=WorldMapState.worldMapFree;
		break;
	
	case WorldMapState.worldMapWantIntoBattle:
		if(isWorldPosHasBattle(curWorldPos,storyLine)){
			switch(curWorldPos){
				case 0:
					addTeamToFront(room_battle_1_1);
					room_goto(room_fake_1_0);
					break;
				case 1:
					addTeamToFront(room_battle_2_1);
					room_goto(room_fake_2_0);
					break;
				case 2:			
					addTeamToFront(room_battle_3_1);
					room_goto(room_fake_3_0);
					break;

				default:
			}
		}
	
		break;
		
		
		
	default:
}


