
/// @argument0 name
/// @argument1 lv
#macro NUM_ROLE_PROPERTY 1

//ans[NUM_ROLE_PROPERTY];
switch(argument0){
	case "boar":
	switch(argument1){
		case 1:
		ans[INDEX_HP]=10;
		ans[INDEX_ATK]=6;
		ans[INDEX_DEF]=3;
		ans[INDEX_DEX]=2;
		ans[INDEX_XP]=10;
		break;
		case 2:
		ans[INDEX_HP]=15;
		ans[INDEX_ATK]=8;
		ans[INDEX_DEF]=4;
		ans[INDEX_DEX]=4;
		ans[INDEX_XP]=15;
		break;
		case 3:
		ans[INDEX_HP]=20;
		ans[INDEX_ATK]=9;
		ans[INDEX_DEF]=5;
		ans[INDEX_DEX]=6;
		ans[INDEX_XP]=15;
		break;
		case 4:
		ans[INDEX_HP]=15;
		ans[INDEX_ATK]=10;
		ans[INDEX_DEF]=6;
		ans[INDEX_DEX]=8;
		ans[INDEX_XP]=15;
		break;

	}

}

return ans;

