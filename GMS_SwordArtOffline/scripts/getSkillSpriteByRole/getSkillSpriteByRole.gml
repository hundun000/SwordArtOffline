var role=argument0;

switch(role.name){
	case "silica":
		return spr_silica_strengthen;
	case "yuna":	
		return spr_yuna_skill; 
	default:

		return noone;

}