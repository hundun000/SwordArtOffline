/// @description Insert description here
// You can write your code in this editor
#macro FIGHT_L 0
#macro FIGHT_R 1

#macro DEPTH_FRONT -201
#macro DEPTH_BACK -200



globalvar fighter_L;
globalvar fighter_R;
globalvar curAttackSide;//value is FIGHT_L(0) or FIGHT_R(1)
globalvar fightState;
globalvar isHit;

attackAnimation[0]=instance_find(obj_fightRole,0);
attackAnimation[1]=instance_find(obj_fightRole,1);

random_set_seed(4);