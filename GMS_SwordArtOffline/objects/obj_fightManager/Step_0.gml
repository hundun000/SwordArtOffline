/// @description Insert description here
// You can write your code in this editor

#macro THRESHOLD_DEX 4
#macro STEP_reduceHpAnimation 40
#macro FIGHT_END_DELAY 60

#macro XP_SPEED 1



if(global.inputReceiver!=InputReceiver.fightRoom) return;

switch(fightState){

	case FightState.preFight:
		//show_("into preFight");
		//mean found side
		
		if(curAttackSide==FIGHT_L)
			var ans_list=getFightInfo(fighter[FIGHT_L],fighter[FIGHT_R],false);			
		else
			var ans_list=getFightInfo(fighter[FIGHT_R],fighter[FIGHT_L],false);
			
		//!!!!!!!!!!!!!!!!!!! curAttackSide<=>founder<=>ans[0] !!!!!!!!!!!!!!!
		
		
		//init turnTimes
		turnTimes[curAttackSide]=ans_list[0];
		turnTimes[!curAttackSide]=ans_list[1];
		
		
		var side=curAttackSide;
		//let two side use the same codes by the two-times loop
		for(var i=0;i<2;i++){

			//hitRate range in (33,100)% ,线性增加
			hitRate[side]=ans_list[2+i]; 

			preDamage[side]=ans_list[4+i];
	
			//criticalRate range in (0,50)% ,线性增加
			criticalRate[side]=ans_list[6+i];
	
			//toggle side
			side=!side;
		}
		
		
		
		
		
		
		//init animation
		attackAnimation[FIGHT_L].sprite_index=getAttackSpriteByRole(fighter[FIGHT_L]);
		attackAnimation[FIGHT_R].sprite_index=getAttackSpriteByRole(fighter[FIGHT_R]);
		attackAnimation[FIGHT_L].image_xscale*=-1;
		attackAnimation[FIGHT_L].image_speed=0;
		attackAnimation[FIGHT_R].image_speed=0;
		
		startDelay=STEP_reduceHpAnimation;
		reduceHpAnimationCountDown=-1; //distinguish countdown==0 and init==-1
		fightState=FightState.waitStartDelay;
		
		randomise();
		
		break;
		
	case FightState.waitStartDelay:
	
		if(startDelay>0){		
			startDelay--;
		}
		else{
			fightState=FightState.startAttackAnimation;
		}
		
		break;
		
	case FightState.startAttackAnimation:
	
	    //last turn's attack's damage's animation
		if(reduceHpAnimationCountDown>0){
			
			reduceHpAnimationCountDown--;
			
			//wait next step to countinue the animation
			return;
		}
		else if(reduceHpAnimationCountDown==0){//distinguish countdown==0 and init==-1
			
			//the Hp reduction actully happen here
			fighter[!curAttackSide].curHp-=actulDamage;
			
			
			if(fighter[!curAttackSide].curHp==0){
			//rival die,fight state to result	
				
				//simply check who die
				if(curAttackSide==FIGHT_R){
					flag_enemy_die=true;	
				}
				else{
					flag_player_die=true;
				}
				
				//set reduce animation as normal hp bar
				reduceHpAnimationCountDown=-1;
				
				fightState=FightState.startResultAnimation;
				return;
			}
			else{
			//countinue to next turn
			
				//switch attack side
				curAttackSide=!curAttackSide;
			}
			
		}
	
		if(turnTimes[curAttackSide]>0||turnTimes[!curAttackSide]>0){
		//any side not end
		
			//set to that side	
			if(turnTimes[curAttackSide]==0){
				curAttackSide=!curAttackSide;
			}
			
			turnTimes[curAttackSide]--;
			
			//*******************process data***************
			//oprate the role Hp data will happen after Hp reduce animation finished
			
			//ramdom critical
			isCriticalHappen=(random(100)<criticalRate[curAttackSide]);
			
			if(isCriticalHappen){
				actulDamage=clamp(preDamage[curAttackSide]*3,0,fighter[!curAttackSide].curHp);	
				isHit=true;
			}
			else{
				//ramdom hit
				isHit=(random(100)<hitRate[curAttackSide]);
				if(isHit)
					actulDamage=clamp(preDamage[curAttackSide],0,fighter[!curAttackSide].curHp);		
				else
					actulDamage=0;
			}

			
			//*******************process animation****************
			//process one turn,play animations,thus retrieve its speed

			//current side animation can be normal or critical,while speed must set to 1
			if(isCriticalHappen){
				attackAnimation[curAttackSide].sprite_index=getCriticalSpriteByRole(fighter[curAttackSide]);
			}
			else{
				attackAnimation[curAttackSide].sprite_index=getAttackSpriteByRole(fighter[curAttackSide]);
			}
			attackAnimation[curAttackSide].image_speed=1;
			
			//default set to miss sprite,just image speed set depend on isHit
			attackAnimation[!curAttackSide].sprite_index=getMissSpriteByRole(fighter[!curAttackSide]);
			attackAnimation[!curAttackSide].image_speed=(!isHit);

			var curDepth=attackAnimation[curAttackSide].depth;
			attackAnimation[curAttackSide].depth=curDepth-1;
			attackAnimation[!curAttackSide].depth=curDepth;
			

			
			//*******************process state change****************
			//wait attack animation,and reuce HP animation
			reduceHpAnimationCountDown=STEP_reduceHpAnimation;
			fightState=FightState.waitAttackAnimationEnd;
		}
		else{
		//both side done
			//As checked before,no die happen 
			
			//set reduce animation as normal hp bar
			reduceHpAnimationCountDown=-1;


			fightState=FightState.processXp;
		}
		
		
		break;
	case FightState.waitAttackAnimationEnd:
		//when animation finished,the content object will change the state
		break;
	case FightState.startResultAnimation:
		if(flag_enemy_die||flag_player_die){
			//*******************process die animation****************
			//must be other side die
			attackAnimation[!curAttackSide].sprite_index=getDieSpriteByRole(fighter[!curAttackSide]);
			attackAnimation[!curAttackSide].image_speed=1;
			//mean only need one animation finish
			isHit=1;
			fightState=FightState.waitResultAnimation;
		}
		break;
	case FightState.waitResultAnimation:
		//when animation finished,the content object will change the state
		break;
	case FightState.processXp:
		if(flag_player_die){
			//create scene_roleDying which handle later death in battle map
			var sceneDying=instance_create_depth(0,0,1,obj_scene_roleDying);
			//died must be other side
			sceneDying.diedRole=fighter[!curAttackSide];
			
			fightEnd_delay=-1;
			fightState=FightState.fightEnd;
			return;
		}
		
		if(waitAddXp==-1){
		//if waitAddXp not init		
			if(flag_enemy_die){
				//died must be other side
				waitAddXp=clamp(fighter[!curAttackSide].xp
							*(5-(fighter[!curAttackSide].lv-fighter[curAttackSide].lv))
							,10,100);	
							
			}
			else{
				waitAddXp=3;
			}	
		}


		if(waitAddXp>0){
			//********proces Xp data**********
			//must right side add xp
			if(waitAddXp>=XP_SPEED){	
				fighter[FIGHT_R].xp+=XP_SPEED;
				waitAddXp-=XP_SPEED;
			}
			else{
				fighter[FIGHT_R].xp+=waitAddXp;
				waitAddXp=0;
			}
				
				
			if(fighter[FIGHT_R].xp>=100){
				fighter[FIGHT_R].xp-=100;

				flag_lv_up=true;
				var lv_up_delay=120;
				lv_up_countDown=lv_up_delay;
										
				lv_isAdd[INDEX_HP]=random(100)>80;
				lv_isAdd[INDEX_ATK]=random(100)>50;
				lv_isAdd[INDEX_DEF]=random(100)>50;
				lv_isAdd[INDEX_DEX]=random(100)>30;										 
			}
		}
		else{
		//Xp add finish ,no long draw Xp ,maybe draw lv up 
		
			if(flag_lv_up){
				lv_up_countDown--;
				if(lv_up_countDown==0){
					flag_lv_up=false;
					
					fighter[FIGHT_R].lv++;
					fighter[FIGHT_R].hp+=lv_isAdd[INDEX_HP];
					fighter[FIGHT_R].atk+=lv_isAdd[INDEX_ATK];
					fighter[FIGHT_R].def+=lv_isAdd[INDEX_DEF];
					fighter[FIGHT_R].dex+=lv_isAdd[INDEX_DEX];
					
					fighter[FIGHT_R].curHp+=lv_isAdd[INDEX_HP];
				}
			}
			else{
				fightEnd_delay=-1;
				fightState=FightState.fightEnd;
			}
				
		}
	
		break;	
	
	case FightState.fightEnd:
		
		if(fightEnd_delay==-1){
			fightEnd_delay=FIGHT_END_DELAY;
		}
		else if(fightEnd_delay>0){
			fightEnd_delay--;
		}
		else{
		
			if(flag_enemy_die){
				//destroy the died enemy
				ds_list_delete(global.frontEnemies,ds_list_find_index(global.frontEnemies,fighter[!curAttackSide])); 
				with(obj_enemyManager){
					//after delete a enemy,next enemy should be the same index
					ii--;
				}
				//destroy in room end
				deadRole=fighter[!curAttackSide];
				
			}	

			//not handle plyer role die here
			for(var i=0;i<ds_list_size(global.playerFrontTeam);i++){
					var frontRole=ds_list_find_value(global.playerFrontTeam, i);
					frontRole.visible=true;
			}	

				
			
			room_goto(fightBackRoom);
		}
		break;
		
	default:
		show_debug_message("enter swtich default");
}




//************************ set HP bar data ****************
if(reduceHpAnimationCountDown>=0 && reduceHpAnimationCountDown<STEP_reduceHpAnimation){	
num_remainHp[curAttackSide]=fighter[curAttackSide].curHp; 
num_remainHp[!curAttackSide]=(fighter[!curAttackSide].curHp-actulDamage) ;		
}
else{   
num_remainHp[FIGHT_L]=fighter[FIGHT_L].curHp;
num_remainHp[FIGHT_R]=fighter[FIGHT_R].curHp;
}
rate_remainHp[FIGHT_L]=num_remainHp[FIGHT_L]/fighter[FIGHT_L].hp; 
rate_remainHp[FIGHT_R]=num_remainHp[FIGHT_R]/fighter[FIGHT_R].hp; 






