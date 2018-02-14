/// @description Insert description here
// You can write your code in this editor


/*
 This room is MVC pattetn.
 This obj is the Model and Controller.Other obj_xxxxList is View,which show the data stored and changed in this Obj.
*/

enum TeamLayoutState{
	selectingSlot,
	selectingTeamRole
}

teamLayoutState=TeamLayoutState.selectingSlot;

selectedSlotIndex=-1;
selectedTeamRole=noone;

ROOM_FONT=global.font_CN_teamRoom;

positonSimultaneousFrame=-1;
frameCounter=-1;

#macro NUM_TEAM_SLOT 6
teamLayoutSlots=ds_list_create();
for(var i=0;i<NUM_TEAM_SLOT;i++)
	ds_list_set(teamLayoutSlots,i,noone);

posShift_x[0]=2;
posShift_y[0]=0;

posShift_x[1]=1;
posShift_y[1]=1;
posShift_x[2]=3;
posShift_y[2]=1;

posShift_x[3]=0;
posShift_y[3]=2;
posShift_x[4]=2;
posShift_y[4]=2;
posShift_x[5]=4;
posShift_y[5]=2;

