/// @description Insert description here
// You can write your code in this editor
//printRolePropertiesForDebug(global.fighter_L);

global.inputReceiver=InputReceiver.fightRoom;

global.fightState=FightState.preFight;

//in order to use index to point fighter L and R
fighter[FIGHT_L]=global.fighter_L;
fighter[FIGHT_R]=global.fighter_R;



flag_enemy_die=false;
flag_player_die=false;
flag_lv_up=false;

//sign waitAddXp not init
waitAddXp=-1;
lv_up_countDown=-1;

var side=FIGHT_L;
//let two side use the same codes by the two-times loop
for(var i=0;i<2;i++){

	//hitRate range in (33,100)% ,线性增加
	hitRate[side]=floor(clamp(33+(fighter[side].dex-fighter[!side].dex*0.3)*6,33,100)); 

	preDamage[side]=fighter[side].atk-fighter[!side].def;
	
	//criticalRate range in (0,50)% ,线性增加
	criticalRate[side]=floor(clamp((fighter[side].dex-fighter[!side].dex*0.5)*1.5,0,50)); 
	
	//toggle side
	side=!side;
}

hitRate[FIGHT_R]=70;//!!!!!!!!!!!!for test!!!!!!!!!!!!!!!!






