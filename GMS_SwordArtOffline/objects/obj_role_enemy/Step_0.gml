/// @description Insert description here
// You can write your code in this editor
if(!isPropertiesInit){
	var properties=getRoleProperties(name,lv);
	
	hp=properties[INDEX_HP];
	atk=properties[INDEX_ATK];
	def=properties[INDEX_DEF];
	dex=properties[INDEX_DEX];
	xp=properties[INDEX_XP];
	
	curHp=hp;
	
	isPropertiesInit=true;
}




switch(enemyState){
	case EnemyState.pathReady:
		if(path_get_length(rolePath)>0){
			//show_message("len>0 path");
			path_start(rolePath,8,path_action_stop,false);

			depth=DEPTH_ROLE_MOVING;
			noMoveDelay=-1;
		}
		else{
			//show_message("len==0 path");
			noMoveDelay=60;
			//"len==0 path" cant delete
			//path_delete(rolePath);
		}
		enemyState=EnemyState.moving;
		break;
	case EnemyState.moving:	
		global.cursor_pointer.x=x;
		global.cursor_pointer.y=y;
		if(noMoveDelay>0){
		// do count down
			noMoveDelay--;
		}else if(noMoveDelay==0){
		//no move count down finish
			enemyState=EnemyState.moved;
		}
		//else noMoveDelay==-1 means wait for paht end event change state
		
		break;			
	case EnemyState.moved:	

		global.thisGame.enemyFrontManager.enemyManagerState=EnemyManagerState.moved;
		break;

	case EnemyState.waitPath:
		break;



}