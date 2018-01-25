/// @description Insert description here
// You can write your code in this editor


/*
 This room is MVC pattetn.
 This obj is the Model and Controller.Other obj_xxxxList is View,which show the data stored and changed in this Obj.
*/
enum TeamRoomState{
	selectingRole,
	selectingRoleOperation,
	selectingBagItem,
	selectingBoxItem,
	selectingItemOperation
	
}

teamRoomState=TeamRoomState.selectingRole;

selectedTeamRole=noone;
selectedRoleOperationIndex=-1;
selectedBagItemIndex=-1;
selectedItemOperationIndex=-1;
selectedBoxItemIndex=-1;

//textItemInfo="";
textOperationInfo="";

#macro ITEM_OPERATE_USE 0
#macro ITEM_OPERATE_PUT_TO_BOX 1
#macro ITEM_OPERATE_GET_FROM_BOX 2
#macro ITEM_OPERATE_DISCARD 3

itemOperationName[ITEM_OPERATE_USE]="使用道具";
itemOperationName[ITEM_OPERATE_PUT_TO_BOX]="放入运输队";
itemOperationName[ITEM_OPERATE_GET_FROM_BOX]="从运输队取出";
itemOperationName[ITEM_OPERATE_DISCARD]="丢弃";

#macro ROLE_OPERATE_TO_ITEM 0
#macro ROLE_OPERATE_LEAVE 1
#macro ROLE_OPERATE_TO_POS_2 2
#macro ROLE_OPERATE_TO_POS_3 3
#macro ROLE_OPERATE_TO_POS_4 4
#macro ROLE_OPERATE_TO_POS_5 5
#macro ROLE_OPERATE_TO_POS_6 6

roleOperationName[ROLE_OPERATE_TO_ITEM]="道具操作";
roleOperationName[ROLE_OPERATE_LEAVE]="从出击队伍撤出";
roleOperationName[ROLE_OPERATE_TO_POS_2]="编入出击队伍2号位";
roleOperationName[ROLE_OPERATE_TO_POS_3]="编入出击队伍3号位";
roleOperationName[ROLE_OPERATE_TO_POS_4]="编入出击队伍4号位";
roleOperationName[ROLE_OPERATE_TO_POS_5]="编入出击队伍5号位";
roleOperationName[ROLE_OPERATE_TO_POS_6]="编入出击队伍6号位";

#macro NUM_TEAM_POS 6
roleInTeamPos=ds_list_create();
for(var i=0;i<NUM_TEAM_POS;i++)
	ds_list_set(roleInTeamPos,i,noone);



