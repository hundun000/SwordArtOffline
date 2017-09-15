#macro PATH_SPEED 100
#macro PATH_LAYER "Instance_myPath"

#macro BGN 0
#macro L_R 1
#macro L_U 2
#macro L_D 3
#macro U_D 4
#macro U_R 5
#macro R_D 6
#macro END 7

var var_path=argument0;
var newX=argument1;
var newY=argument2;

var i;
var j;
var len=path_get_number(var_path);

for(i=0;i<len;i++){
	if(path_get_point_x(var_path,i)==newX&&path_get_point_y(var_path,i)==newY){
		//path rebuild
		while(path_get_number(var_path)>i+1){
			//cut "short circuit" nodes
			instance_destroy(instance_position(path_get_point_x(var_path,i+1),path_get_point_y(var_path,i+1),obj_pathNode));
			path_delete_point(var_path,i+1); 
		}

		

		for(j=0;j<=i;j++){
			setPathNodeImage(var_path,j);
		}
		
		return;
		
		
	}

}


path_add_point(var_path,newX,newY,PATH_SPEED);
instance_create_layer(newX,newY,PATH_LAYER,obj_pathNode);
		
		
len=path_get_number(var_path);//new len
for(j=max(len-2,0);j<=len-1;j++){			
	setPathNodeImage(var_path,j);
}
