var var_path=argument0;

			while(path_get_number(var_path)>0){
			//cut all nodes
				instance_destroy(instance_position(path_get_point_x(var_path,0),path_get_point_y(var_path,0),obj_pathNode));
				path_delete_point(var_path,0); 
			}

			path_delete(var_path);