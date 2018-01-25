/// @description Insert description here
// You can write your code in this editor



global.instanceManager=id;
list_instances=ds_list_create();


ins_kirito=instance_create_depth(0,0,0,obj_role_kirito);
ds_list_add(list_instances,ins_kirito);
ins_asuna=instance_create_depth(0,0,0,obj_role_asuna);
ds_list_add(list_instances,ins_asuna);
ins_silica=instance_create_depth(0,0,0,obj_role_silica);
ds_list_add(list_instances,ins_silica);
	
ins_woodenSword=instance_create_depth(0,0,0,obj_wooden_sword);
ds_list_add(list_instances,ins_woodenSword);
ins_sharpClaw=instance_create_depth(0,0,0,obj_sharpClaw);
ds_list_add(list_instances,ins_sharpClaw);
ins_coverDrug=instance_create_depth(0,0,0,obj_coverDrug);
ds_list_add(list_instances,ins_coverDrug);
ins_goodCoverDrug=instance_create_depth(0,0,0,obj_goodCoverDrug);
ds_list_add(list_instances,ins_goodCoverDrug);

with(global.thisGame){
	textBoxManager=instance_create_depth(0,0,0,obj_textBox_manager); 
	playerFrontManager=instance_create_depth(0,0,0,obj_playerFrontManager);
	enemyFrontManager=instance_create_depth(0,0,0,obj_enemyFrontManager);
	teamRoomManager=instance_create_depth(0,0,0,obj_teamRoomManager);
	homeManager=instance_create_depth(0,0,0,obj_homeManager);
	worldMapManager=instance_create_depth(0,0,0,obj_worldMapManager);
	fightManager=instance_create_depth(0,0,0,obj_fightManager);
}