/// @argument0 skillRole

var skillRole=argument0;
var ans;

var skillIns=getItemInstanceByName(skillRole.skillName);
if(skillIns.itemType==ItemType.skill_strengthen){
	ans[0]=skillIns.strengthen_hp;
	ans[1]=skillIns.strengthen_atk;
	ans[2]=skillIns.strengthen_def;
	ans[3]=skillIns.strengthen_dex;
}
else{
	ans[0]=0;
	ans[1]=0;
	ans[2]=0;
	ans[3]=0;
}


return ans;