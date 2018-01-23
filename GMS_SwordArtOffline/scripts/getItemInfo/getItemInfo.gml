///@argument0 item_name

var itemName=argument0;

switch(itemName){
	
	
	case "伤药":	
		return "回复10点HP。";
		break;
	case "好伤药":	
		return "回复20点HP。";
		break;
	case "木剑":
		return "最基本的剑类武器。";
		break;	
		
		
	case "利爪":
		return "野兽的攻击武器。";
		break;			
		
		
		
		
		
	default:
		return "信息 道具名未定义！";
}