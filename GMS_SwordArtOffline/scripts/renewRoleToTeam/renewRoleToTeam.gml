/// @function renewRoleToTeam
/// @description renew Role to world team
/// @argument0 grid 
/// @argument1 role


#macro INDEX_NAME 0
//maybr change in map
#macro INDEX_HP 1
#macro INDEX_ATK 2
#macro INDEX_DEF 3
#macro INDEX_DEX 4
#macro INDEX_XP 5
#macro INDEX_LV 6
//final
#macro INDEX_TYPR 7
#macro INDEX_MOVEMENT 8
#macro INDEX_PROF 9
#macro INDEX_RANGE_FROM 10
#macro INDEX_RANGE_TO 11

//in the futher,will pass in role's item and weapon to renew


var grid=argument0;
var role=argument1;

//role is exist,do renew
for(var i=0;i<ds_grid_height(grid);i++){
	if(ds_grid_get(grid,INDEX_NAME,i)==role.roleName){
		ds_grid_set(grid,INDEX_HP,i,role.hp);
		ds_grid_set(grid,INDEX_ATK,i,role.atk);
		ds_grid_set(grid,INDEX_DEF,i,role.def);
		ds_grid_set(grid,INDEX_XP,i,role.xp);
		ds_grid_set(grid,INDEX_LV,i,role.lv);
		return;
	}
}

/*

//role not exist,do new

//resize grid
if(ds_grid_get(grid,0,0)!=0)
	ds_grid_resize(grid,ds_grid_width(grid),ds_grid_height(grid)+1);


var newSlot=ds_grid_height(grid)-1;
ds_grid_set(grid,INDEX_NAME,newSlot,role.roleName);
ds_grid_set(grid,INDEX_HP,newSlot,role.hp);
ds_grid_set(grid,INDEX_ATK,newSlot,role.atk);
ds_grid_set(grid,INDEX_DEF,newSlot,role.def);
ds_grid_set(grid,INDEX_XP,newSlot,role.xp);
ds_grid_set(grid,INDEX_LV,newSlot,role.lv);
ds_grid_set(grid,INDEX_TYPR,newSlot,role.roleType);
ds_grid_set(grid,INDEX_MOVEMENT,newSlot,role.MAX_MOVEMENT);
ds_grid_set(grid,INDEX_PROF,newSlot,role.weaponProfession);
ds_grid_set(grid,INDEX_RANGE_FROM,newSlot,role.roleAttackRangFrom);
ds_grid_set(grid,INDEX_RANGE_TO,newSlot,role.roleAttackRangTo);




*/






