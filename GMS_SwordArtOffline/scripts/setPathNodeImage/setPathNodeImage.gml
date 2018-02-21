//should only belong to <buoldPath>!!!!
var var_path=argument0;
var j=argument1;

var len=path_get_number(var_path);
			//set image for current path		
			with(instance_position(path_get_point_x(var_path,j),path_get_point_y(var_path,j),obj_pathNode)){
				if(j==len-1){
					image_index=END;
				}
				else if(j==0){
					image_index=BGN;
				}
				else{	
					var myX=path_get_point_x(var_path,j);
					var myY=path_get_point_y(var_path,j);					
					var lastX=path_get_point_x(var_path,j-1);
					var lastY=path_get_point_y(var_path,j-1);
					var nextX=path_get_point_x(var_path,j+1);
					var nextY=path_get_point_y(var_path,j+1);					
					
					var isL=(lastX<myX||nextX<myX);
					var isR=(lastX>myX||nextX>myX);
					var isU=(lastY<myY||nextY<myY);
					var isD=(lastY>myY||nextY>myY);

					var code=0;
					if(isL) code+=1;
					if(isR) code+=2;
					if(isU) code+=4;
					if(isD) code+=8;
					
					
					switch(code){
					case 3:
						image_index=L_R;
						break;
					case 5: 
						image_index=L_U;
						break;
					case 9: 
						image_index=L_D;
						break;
					case 6: 
						image_index=U_R;
						break;
					case 12: 
						image_index=U_D;
						break;
					case 10: 
						image_index=R_D;
						break;

					}
				}
			}