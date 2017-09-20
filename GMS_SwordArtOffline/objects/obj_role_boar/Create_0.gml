/// @description Insert description here
// You can write your code in this editor
event_inherited();


rolePath=path_add();
var hcells=room_width div UNIT;
var vcells=room_height div UNIT;
gridMap=mp_grid_create(0,0,hcells,vcells,UNIT,UNIT);
//for test 
mp_grid_add_instances(gridMap,obj_role_player,true);
mp_grid_add_instances(gridMap,obj_tile_hill,true);




name="boar";
curHp=-1;

roleType=RoleType.walker;
MAX_MOVEMENT=5; 
roleAttackRangFrom=1;
roleAttackRangTo=1;
curWeapon=noone;