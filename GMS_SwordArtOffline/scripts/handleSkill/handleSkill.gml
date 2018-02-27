///@argument0 targetRole
///@argument1 skillName
var targetRole=argument0;
var skillName=argument1;

var skillIns=getItemInstanceByName(skillName);

if(skillIns.itemType==ItemType.skill_strengthen){
	//set rule cannot "heal" role to died
	targetRole.curHp=clamp(targetRole.curHp+skillIns.strengthen_hp,1,targetRole.hp);

	strengthen_atk=0;
	strengthen_def=0;
	strengthen_dex=0;
}
else if(skillIns.itemType==ItemType.skill_action){
	setRoleState(targetRole,RoleState.idle);	
}