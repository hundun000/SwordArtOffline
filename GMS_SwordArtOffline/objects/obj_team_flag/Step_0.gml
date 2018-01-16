/// @description Insert description here
// You can write your code in this editor


#macro TEAM_FLAG_SPEED 8



var isU=input_dy==-1;
var isD=input_dy==1;
var isL=input_dx=-1;
var isR=input_dx==1;

//fast return
//if(isU+isD+isL+isR==0&&toWorldPos==curWorldPos) return;


/*
switch(worldMapState){
	
	case WorldMapState.worldFree:
		
		if(isA){
			worldDoMoreSelectedIndex=0;
			
			//renew option	
			num_option=0;
			option=array_create(num_optionModel);
			if(global.curWorldPos==global.storyLine)
				option[num_option++]=option_model[0];
			else
				option[num_option++]=option_model[1];
			option[num_option++]=option_model[2];	
			option[num_option++]=option_model[4];	
			option[num_option++]=option_model[5];
			
			worldMapState=WorldMapState.worldDoMoreSelect;
		}
		else{
			//determine which pos to go
			switch(global.curWorldPos){
				case 0:
					if(global.storyLine>=1)
					if(isU||isL){
						toWorldPos=1;
					}
					break;
				case 1:
					if(isD||isR)
						toWorldPos=0;
					else if(isL)
						toWorldPos=2;
					break;					
				case 2:
					if(isR)
						toWorldPos=1;
					break;
				default:	
			}
			
			if(global.curWorldPos!=toWorldPos){
				//get the x,y of the pos to go
				toWorldX=global.thisGame.worldX[toWorldPos];
				toWorldY=global.thisGame.worldY[toWorldPos];
		
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
			global.curWorldPos=toWorldPos;
			worldMapState=WorldMapState.worldFree;	
		}
		break;
		
	case WorldMapState.worldDoMoreSelect:
		if(isA){
			if(option[worldDoMoreSelectedIndex]==option_model[0])
				worldMapState=WorldMapState.worldWantIntoBattle;
			else if(option[worldDoMoreSelectedIndex]==option_model[1])	
				show_message("Option shop");
			else if(option[worldDoMoreSelectedIndex]==option_model[2]){
				room_goto(room_team);
			}
			else if(option[worldDoMoreSelectedIndex]==option_model[4]){
				loadGame();
				//renewWorldView();
				show_message("Option load");
			}	
			else if(option[worldDoMoreSelectedIndex]==option_model[5]){
				saveGame();
				show_message("Option save");
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
		switch(global.curWorldPos){
			case 0:
				//handle battle front init
				//*** kiroto add to world when resetWorldData	
				addRoleToFront(global.kirito,room_battle_1_1,0);
				
				room_goto(room_fake_1_0);
				break;
			case 1:
				//flag handle battle front init
				addRoleToWorld(global.asuna);
				addRoleToFront(global.kirito,room_battle_2_1,0);
				addRoleToFront(global.asuna,room_battle_2_1,1);
			
				room_goto(room_fake_2_0);
				break;
			case 2:
				addRoleToWorld(global.silica);
				addRoleToFront(global.kirito,room_battle_3_1,0);
				addRoleToFront(global.silica,room_battle_3_1,1);				
				
				room_goto(room_fake_3_0);
				break;

			default:
		}	

		break;
}
*/










