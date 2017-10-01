/// @description Insert description here
// You can write your code in this editor


#macro TEAM_FLAG_SPEED 8

if(global.inputReceiver!=InputReceiver.worldTeamFlag) return;

var isU=input_dy==-1;
var isD=input_dy==1;
var isL=input_dx=-1;
var isR=input_dx==1;

//fast return
//if(isU+isD+isL+isR==0&&toWorldPos==curWorldPos) return;

switch(worldMapState){
	
	case WorldMapState.worldFree:
		
		if(isA){
			worldDoMoreSelectedIndex=0;
			worldMapState=WorldMapState.worldDoMoreSelect;
		}
		else{
			//determine which pos to go
			switch(curWorldPos){
				case 0:
					if(global.storyLine>=1)
					if(isU||isL){
						toWorldPos=1;
					}
					break;
				case 1:
					if(isD||isR)
						toWorldPos=0;
	
					break;

					default:
			}
			
			if(curWorldPos!=toWorldPos){
				//get the x,y of the pos to go
				switch(toWorldPos){
					case 0:
						toWorldX=660;
						toWorldY=579;	
						break;	
					case 1:
						toWorldX=539;
						toWorldY=496;
					break;

					default:
				}
		
				//add motion to go
				move_towards_point(toWorldX,toWorldY,TEAM_FLAG_SPEED);
				worldMapState=WorldMapState.worldMoving;
			}
		}
		break;
	
	case WorldMapState.worldMoving:
	
		if(distance_to_point(toWorldX,toWorldY)<TEAM_FLAG_SPEED){
			x=toWorldX;
			y=toWorldY;
			speed=0;
			curWorldPos=toWorldPos;
			worldMapState=WorldMapState.worldFree;	
		}
		break;
		
	case WorldMapState.worldDoMoreSelect:
		if(isA){
			switch(worldDoMoreSelectedIndex){
				case 0:
					worldMapState=WorldMapState.worldWantIntoBattle;
					break;
				case 1:
				
					break;
				default:
			}
		}
		else if(isB){
			worldDoMoreSelectedIndex=-1;
			worldMapState=WorldMapState.worldFree;
		}
		else if(input_dy!=0){
			worldDoMoreSelectedIndex+=input_dy;
			if(worldDoMoreSelectedIndex<0){
				worldDoMoreSelectedIndex=num_option-1;
			}
			else if(worldDoMoreSelectedIndex==num_option){
				worldDoMoreSelectedIndex=0;
			}
		}
		break;
		
	case WorldMapState.worldWantIntoBattle:
		switch(curWorldPos){
			case 0:
				room_goto(room_fake_1_0);
				break;
			case 1:
				show_message("want into pos 1 battle");
				break;

				default:
		}	
		break;
}











