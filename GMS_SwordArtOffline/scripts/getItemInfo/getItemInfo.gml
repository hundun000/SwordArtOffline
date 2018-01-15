///@argument0 item_name

var itemName=argument0;

switch(itemName){
	case "伤药":	
		return "回复10点HP。";
		break;
	case "好伤药":	
		return "回复20点HP。";
		break;	
	default:
		return "信息 道具名未定义！";
}