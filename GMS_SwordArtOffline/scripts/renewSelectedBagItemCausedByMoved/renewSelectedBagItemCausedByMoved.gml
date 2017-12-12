if(selectedTeamRole.curNumItem>0){				
	selectedBagItemIndex=0;
	var itemName=ds_grid_get(selectedTeamRole.items,selectedBagItemIndex,INDEX_ITEM_NAME);
	textItemInfo=getItemInfo(itemName);
}
else{
	selectedBagItemIndex=-1;
}
selectedItemOperationIndex=-1;
teamRoomState=TeamRoomState.selectingBagItem;