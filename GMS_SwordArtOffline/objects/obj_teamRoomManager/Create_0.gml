/// @description Insert description here
// You can write your code in this editor


/*
 This room is MVC pattetn.
 This obj is the Model and Controller.Other obj_xxxxList is View,which show the data stored and changed in this Obj.
*/
enum TeamRoomState{
	selectingRole,
	selectingBagItem,
	selectingBoxItem,
	selectingItemOperation
	
}

teamRoomState=TeamRoomState.selectingRole;

selectedTeamRole=noone;
selectedBagItemIndex=-1;
selectedItemOperationIndex=-1;
selectedBoxItemIndex=-1;

//textItemInfo="";
textOperationInfo="";

#macro OPERATE_USE 0
#macro OPERATE_PUT_TO_BOX 1
#macro OPERATE_GET_FROM_BOX 2
#macro OPERATE_DISCARD 3

operationName[OPERATE_USE]="使用道具";
operationName[OPERATE_PUT_TO_BOX]="放入运输队";
operationName[OPERATE_GET_FROM_BOX]="从运输队取出";
operationName[OPERATE_DISCARD]="丢弃";