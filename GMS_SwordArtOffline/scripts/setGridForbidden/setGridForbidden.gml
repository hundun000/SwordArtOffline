var role=argument0;

mp_grid_clear_all(grid);  //reset
switch(role.type){
	case RoleType.walker:
		mp_grid_add_instances(grid,obj_tile_hill,false);
		//mp_grid_add_instances(grid,obj_tile_hill,false);
		break;
	default:	
}
mp_grid_add_instances(grid,obj_role_base,false);
mp_grid_clear_cell(grid,getTileIndex(role.x),getTileIndex(role.y));  //can not move 