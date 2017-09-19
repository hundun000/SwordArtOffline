
/// @argument0 name
/// @argument1 lv
#macro NUM_ROLE_PROPERTY 1

//ans[NUM_ROLE_PROPERTY];
switch(argument0){
	case "boar":
	switch(argument1){
		case 1:
		ans[INDEX_HP]=10;
		break;
		case 2:
		ans[INDEX_HP]=15;
		break;

	}

}

return ans;

