/// @description Insert description here
// You can write your code in this editor
if(global.inputReceiver!=InputReceiver.TEAM_MENBER)	return;

if(isA||isB||input_dx!=0||input_dy!=0)
	textOperationInfo="";

switch(teamRoomState){
	
	case TeamRoomState.selectingRole:
		if(isA){
			teamRoomState=TeamRoomState.selectingBagItem;
			if(selectedTeamRole.curNumItem>0)
				selectedBagItemIndex=0;
			else
				selectedBagItemIndex=-1;
		}
		else if(isB){
			room_goto(room_home);	
			return;
		}
		else if(input_dy!=0){
			var curRoleIndex=ds_list_find_index(global.playerWorldTeam,selectedTeamRole);
			var nextRoleIndex=clamp(curRoleIndex+input_dy,0,ds_list_size(global.playerWorldTeam)-1);
			selectedTeamRole=ds_list_find_value(global.playerWorldTeam,nextRoleIndex);
		}
		break;
	
	case TeamRoomState.selectingBagItem:
		if(isA){
			teamRoomState=TeamRoomState.selectingItemOperation;
			selectedItemOperationIndex=0;
		}
		else if(isB){
			teamRoomState=TeamRoomState.selectingRole
			selectedBagItemIndex=-1;
			selectedBoxItemIndex=-1;
			//textItemInfo="";
		}
		else if(input_dy!=0){
			if(selectedBagItemIndex!=-1){
				selectedBagItemIndex=clamp(selectedBagItemIndex+input_dy,0,selectedTeamRole.curNumItem-1);
				//var itemName=ds_grid_get(selectedTeamRole.items,selectedBagItemIndex,INDEX_ITEM_NAME);
				//textItemInfo=getItemInfo(itemName);
			}
		}		
		break;
	case TeamRoomState.selectingBoxItem:
		if(isA){
			//must be operation"get from box"
			if(selectedBoxItemIndex!=-1){
				textOperationInfo=moveItemFromPublicBoxToRole(selectedTeamRole,selectedBoxItemIndex);
				renewSelectedBagItemCausedByMoved();
				selectedBoxItemIndex=-1;
			}
			else
				textOperationInfo="无道具可操作";
		}
		else if(isB){
			teamRoomState=TeamRoomState.selectingItemOperation;
			selectedBoxItemIndex=-1;
		}
		else if(input_dy!=0){
			if(selectedBoxItemIndex!=-1)
				selectedBoxItemIndex=clamp(selectedBoxItemIndex+input_dy,0,global.curNumPublicBoxItem-1);
		}
		break;
	case TeamRoomState.selectingItemOperation:
		if(isA){
			switch(selectedItemOperationIndex){
				case ITEM_OPERATE_USE:
					var item_name=ds_grid_get(selectedTeamRole.items,selectedBagItemIndex,INDEX_ITEM_NAME);
					var usable=canUseItem(item_name,selectedTeamRole);
					if(usable==true){
						var useReturn=useItemGeneral(selectedTeamRole,selectedBagItemIndex);
						textOperationInfo=usable[1];
					}
					else{
						textOperationInfo=usable;
					}
					break;
				case ITEM_OPERATE_DISCARD:
					if(selectedBagItemIndex!=-1){
						textOperationInfo=removeItemFromRole(selectedTeamRole,selectedBagItemIndex);		
						renewSelectedBagItemCausedByMoved();
					}
					else
						textOperationInfo="无道具可操作";
					break;
				case ITEM_OPERATE_PUT_TO_BOX:
					if(selectedBagItemIndex!=-1){
						textOperationInfo=moveItemToPublicBoxFromRole(selectedTeamRole,selectedBagItemIndex);
						renewSelectedBagItemCausedByMoved();
					}
					else
						textOperationInfo="无道具可操作";
					break;
				case ITEM_OPERATE_GET_FROM_BOX:
					teamRoomState=TeamRoomState.selectingBoxItem;
					if(global.curNumPublicBoxItem>0)
						selectedBoxItemIndex=0;
					else
						selectedBoxItemIndex=-1;
					break;
				default:
			}
		}
		else if(isB){
			teamRoomState=TeamRoomState.selectingBagItem;
			selectedItemOperationIndex=-1;
		}
		else if(input_dy!=0){
			selectedItemOperationIndex=clamp(selectedItemOperationIndex+input_dy,0,array_length_1d(itemOperationName)-1);
		}	
	default:
	
	
	
}