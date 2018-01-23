/// @argument0 itemName
/// @argument1 role

var itemName=argument0;
var role=argument1;

if(isWeapon(itemName))
		return "武器在战斗中起效，无法直接使用。";
		
		
switch(itemName){
	case "伤药":
	case "好伤药":
		if(role.curHp<role.hp)
			return true;
		else
			return "生命值已满，无法使用该道具。";
		break;	
	default:
		return "检测能否使用 道具名未定义！";
}