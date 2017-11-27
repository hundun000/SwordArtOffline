/// @argument0 role
/// @argument1 state

var role=argument0;
var to=argument1;

switch(to){
	case RoleState.idle:
		role.roleState=RoleState.idle;
		role.image_blend=c_white;
		role.depth=DEPTH_ROLE_IDLE;
		break;
	case RoleState.selected:
		newPourWater(role.x,role.y,role.roleType,role.MAX_MOVEMENT,role.roleAttackRangFrom,role.roleAttackRangTo,ControlType.player,true);
		role.depth=DEPTH_ROLE_MOVING;
		break;
	case RoleState.doMore:
		newBuildCanAttackTile(role.x,role.y,role.roleAttackRangFrom,role.roleAttackRangTo,true);
		break;			
	case RoleState.gray:
		role.roleState=RoleState.gray;
		role.image_blend=c_gray;
		role.depth=DEPTH_ROLE_IDLE;
		break;
	default:
}