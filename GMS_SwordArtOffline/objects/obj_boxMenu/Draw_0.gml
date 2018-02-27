/// @description Insert description here
// You can write your code in this editor
draw_self();



var text_space=UNIT;	//every two lines offset
var y_offset=y-sprite_height*0.5+30;  //the first line offset




draw_set_color(c_black);
for(var i=0;i<manager.operatedRole.curNumItem;i++){
	var name=ds_grid_get(manager.operatedRole.items,i,INDEX_ITEM_NAME);
	var itemIns=getItemInstanceByName(name);
	var y_i=y_offset+i*text_space;
	
	draw_sprite(itemIns.sprite_index,0,x-sprite_width*0.45,y_i);
	draw_text(x-sprite_width*0,y_i+10,name);
	draw_text(x+sprite_width*0.36,y_i+10,ds_grid_get(manager.operatedRole.items,i,INDEX_ITEM_QUALITY));				
	if(i==manager.operatedRole.curWeaponIndex)
		draw_sprite(spr_holdWeapon,0,x-sprite_width*0.45+UNIT,y_i);
		
}

//draw the sign of the selected item  
var rectangle_y1=y_offset+manager.itemSelectIndex*text_space;
draw_set_color(c_orange);
draw_rectangle(x-sprite_width*0.46,rectangle_y1
			   ,x+sprite_width*0.46,rectangle_y1+UNIT
			   ,true);