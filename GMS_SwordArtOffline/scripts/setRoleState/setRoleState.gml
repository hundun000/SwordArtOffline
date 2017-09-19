/// @argument0 role
/// @argument1 state

var role=argument0;
var to=argument1;

switch(to){
	case RoleState.selected:
		pourWater(role.x,role.y,role.roleType,role.MAX_MOVEMENT,role.roleAttackRangFrom,role.roleAttackRangto);//test range
		break;
	case RoleState.doMore:
		buildCanAttackTile(role.x,role.y,role.roleAttackRangFrom,role.roleAttackRangto);
		break;			
	case RoleState.gray:
		role.roleState=RoleState.gray;
		role.image_blend=c_gray;
		break;
	default:
}