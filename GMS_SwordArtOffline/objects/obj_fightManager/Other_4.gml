/// @description Insert description here
// You can write your code in this editor
//printRolePropertiesForDebug(global.fighter_L);
if(room==room_fight){
	global.inputReceiver=InputReceiver.FIGHT_ROOM;

	fightState=FightState.preFight;

	flag_enemy_die=false;
	flag_player_die=false;
	flag_lv_up=false;

	attackAnimation[FIGHT_L]=instance_find(obj_fightRole,0);
	attackAnimation[FIGHT_R]=instance_find(obj_fightRole,1);

	//sign waitAddXp not init
	waitAddXp=-1;
	lv_up_countDown=-1;



	hitRate[FIGHT_R]=70;//!!!!!!!!!!!!for test!!!!!!!!!!!!!!!!
}






