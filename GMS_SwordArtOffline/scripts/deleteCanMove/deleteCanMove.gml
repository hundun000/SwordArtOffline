while(instance_number(obj_canMove)>0){
	instance_destroy(instance_find(obj_canMove,instance_number(obj_canMove)-1));
}