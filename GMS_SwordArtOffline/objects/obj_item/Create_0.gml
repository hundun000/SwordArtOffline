/// @description Insert description here
// You can write your code in this editor

enum ItemType{
	normal,
	weapon_null,
	weapon_sword,
	weapon_knife,
	weapon_enemy,
	skill_strengthen,
	skill_action,
	defaultType
	
	
}
name="default name";
introduction="default introduction";

itemType=ItemType.defaultType;

ds_list_add(global.instanceManager.list_instances,id);
