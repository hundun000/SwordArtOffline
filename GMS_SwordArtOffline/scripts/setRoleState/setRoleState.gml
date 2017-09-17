var role=argument0;
var to=argument1;

switch(to){
	case RoleState.selected:
		pourWater(selectedRole.x,selectedRole.y,selectedRole.roleType,selectedRole.MAX_MOVEMENT,selectedRole.roleAttackRangFrom,selectedRole.roleAttackRangto);//test range
		break;
	case RoleState.doMore:
		pourWater(selectedRole.x,selectedRole.y,selectedRole.roleType,0,selectedRole.roleAttackRangFrom,selectedRole.roleAttackRangto);//test range
		break;			
	case RoleState.gray:
		selectedRole.roleState=RoleState.gray;
		selectedRole.image_blend=c_gray;
		break;
	default:
}