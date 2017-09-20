/// @description Insert description here
// You can write your code in this editor
if(!isPropertiesInit){
	var properties=getRoleProperties(name,lv);
	
	hp=properties[INDEX_HP];
	atk=properties[INDEX_ATK];
	def=properties[INDEX_DEF];
	dex=properties[INDEX_DEX];
	xp=properties[INDEX_XP];
	
	curHp=hp;
	
	
	
	
	isPropertiesInit=true;
}