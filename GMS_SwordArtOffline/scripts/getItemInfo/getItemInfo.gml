///@argument0 item_name

var itemName=argument0;

switch(itemName){
	case "伤药":	
		return "cove 10 hp for role";
		break;
	case "好伤药":	
		return "cove 20 hp for role";
		break;	
	default:
		return "no defined itemName";
}