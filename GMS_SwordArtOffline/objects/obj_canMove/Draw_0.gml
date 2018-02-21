/// @description Insert description here
// You can write your code in this editor
var isDrawSelf=true;



if(instance_exists(obj_doMoreMemu)){
	var doMoreMenu=instance_find(obj_doMoreMemu,0);
	
	if(image_index==CAN_ATTACK){
		
		if(doMoreMenu.doMoreSelectIndex!=OPTION_FIGHT)
			isDrawSelf=false;
			
	}

}

if(isDrawSelf)
	draw_self();