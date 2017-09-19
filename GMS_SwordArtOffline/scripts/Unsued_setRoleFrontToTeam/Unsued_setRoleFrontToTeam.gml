/// @function renewRoleToTeam
/// @description renew Role to world team
/// @argument0 grid 
/// @argument1 name
// @argument1 hp
// @argument1 atk
// @argument1 def
// @argument1 dex
// @argument1 lv
// @argument1 type
// @argument1 movement
// @argument1 prof
// @argument1 rangeFrom
// @argument1 rangeTo

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
var name=argument1;
/*
var hp=argument2;
var atk=argument3;
var def=argument4;
var dex=argument5;
var lv=argument6;
var type=argument7;
var movement=argument8;
var prof=argument9;
var rangeFrom=argument10;
var rangeTo=argument11;
*/


//role not exist,do new

//resize grid
if(ds_grid_get(grid,0,0)!=0)
	ds_grid_resize(grid,ds_grid_width(grid),ds_grid_height(grid)+1);


var newSlot=ds_grid_height(grid)-1;

switch(name){
	case "asuna":{
		ds_grid_set(grid,INDEX_NAME,newSlot,role.name);
		ds_grid_set(grid,INDEX_HP,newSlot,role.hp);
		ds_grid_set(grid,INDEX_ATK,newSlot,role.atk);
		ds_grid_set(grid,INDEX_DEF,newSlot,role.def);
		ds_grid_set(grid,INDEX_DEX,newSlot,role.dex);
		ds_grid_set(grid,INDEX_XP,newSlot,role.xp);
		ds_grid_set(grid,INDEX_LV,newSlot,role.lv);
		ds_grid_set(grid,INDEX_TYPR,newSlot,role.roleType);
		ds_grid_set(grid,INDEX_MOVEMENT,newSlot,role.MAX_MOVEMENT);
		ds_grid_set(grid,INDEX_PROF,newSlot,role.weaponProfession);
		ds_grid_set(grid,INDEX_RANGE_FROM,newSlot,role.roleAttackRangFrom);
		ds_grid_set(grid,INDEX_RANGE_TO,newSlot,role.roleAttackRangTo);
	}
}

/*
ds_grid_set(grid,INDEX_NAME,newSlot,role.name);
ds_grid_set(grid,INDEX_HP,newSlot,role.hp);
ds_grid_set(grid,INDEX_ATK,newSlot,role.atk);
ds_grid_set(grid,INDEX_DEF,newSlot,role.def);
ds_grid_set(grid,INDEX_DEX,newSlot,role.dex);
ds_grid_set(grid,INDEX_XP,newSlot,role.xp);
ds_grid_set(grid,INDEX_LV,newSlot,role.lv);
ds_grid_set(grid,INDEX_TYPR,newSlot,role.roleType);
ds_grid_set(grid,INDEX_MOVEMENT,newSlot,role.MAX_MOVEMENT);
ds_grid_set(grid,INDEX_PROF,newSlot,role.weaponProfession);
ds_grid_set(grid,INDEX_RANGE_FROM,newSlot,role.roleAttackRangFrom);
ds_grid_set(grid,INDEX_RANGE_TO,newSlot,role.roleAttackRangTo);
*/


