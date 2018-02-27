/// @description Insert description here
// You can write your code in this editor



global.instanceManager=id;
list_instances=ds_list_create();

//********** role ***************
ins_kirito=instanceObject(obj_role_kirito,list_instances);
ins_asuna=instanceObject(obj_role_asuna,list_instances);
ins_silica=instanceObject(obj_role_silica,list_instances);
ins_yuna=instanceObject(obj_role_yuna,list_instances);
	
//****** weapon *******************
ins_weapon_null=instanceObject(obj_weapon_null,list_instances);
	
ins_woodenSword=instanceObject(obj_wooden_sword,list_instances);
ins_lightIronySword=instanceObject(obj_lightIrony_sword,list_instances);
ins_heavyIronySword=instanceObject(obj_heavyIrony_sword,list_instances);

ins_sharpClaw=instanceObject(obj_sharpClaw,list_instances);

ins_coverDrug=instanceObject(obj_coverDrug,list_instances);
ins_goodCoverDrug=instanceObject(obj_goodCoverDrug,list_instances);

ins_petHeal_skill=instanceObject(obj_petHeal_skill,list_instances);
ins_songAction_skill=instanceObject(obj_songAction_skill,list_instances);

with(global.thisGame){
	textBoxManager=instance_create_depth(0,0,0,obj_textBox_manager); 
	playerFrontManager=instance_create_depth(0,0,0,obj_playerFrontManager);
	enemyFrontManager=instance_create_depth(0,0,0,obj_enemyFrontManager);
	teamRoomManager=instance_create_depth(0,0,0,obj_teamRoomManager);
	homeManager=instance_create_depth(0,0,0,obj_homeManager);
	worldMapManager=instance_create_depth(0,0,0,obj_worldMapManager);
	fightManager=instance_create_depth(0,0,0,obj_fightManager);
	teamLayoutManager=instance_create_depth(0,0,0,obj_teamLayoutManager);
}