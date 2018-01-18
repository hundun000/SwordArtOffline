/// @description Insert description here
// You can write your code in this editor
#macro FIGHT_L 0
#macro FIGHT_R 1

#macro DEPTH_FRONT -201
#macro DEPTH_BACK -200

//******** HP bar data ***********
rate_remainHp[0]=-1;
rate_remainHp[1]=-1;
num_remainHp[0]=-1;
num_remainHp[1]=-1;	


attackAnimation[0]=instance_find(obj_fightRole,0);
attackAnimation[1]=instance_find(obj_fightRole,1);

random_set_seed(4);