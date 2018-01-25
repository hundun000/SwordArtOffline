/// @description Insert description here
// You can write your code in this editor
if(enemyManagerState==EnemyManagerState.fighting){
	room_enter_counter++;
	if(room_enter_counter==2){
		enemyManagerState=EnemyManagerState.nextEnemy;
	}
	
}