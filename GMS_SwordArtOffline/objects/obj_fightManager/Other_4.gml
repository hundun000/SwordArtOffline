/// @description Insert description here
// You can write your code in this editor
//printRolePropertiesForDebug(global.fighter_L);

global.inputReceiver=InputReceiver.fightRoom;

fightState=FightState.preFight;

//in order to use index to point fighter L and R
fighter[FIGHT_L]=global.fighter_L;
fighter[FIGHT_R]=global.fighter_R;



flag_enemy_die=false;
flag_player_die=false;
flag_lv_up=false;

//sign waitAddXp not init
waitAddXp=-1;
lv_up_countDown=-1;



hitRate[FIGHT_R]=70;//!!!!!!!!!!!!for test!!!!!!!!!!!!!!!!






