/// @description Insert description here
// You can write your code in this editor
draw_self();

draw_set_color(c_black);
draw_set_font(itemMenuFont);

var text_space=UNIT;	//every two lines offset
var y_offset=50;  //the first line offset
for(var i=0;i<manager.operatedRole.curNumItem;i++){
	var name=ds_grid_get(manager.operatedRole.items,i,INDEX_ITEM_NAME);
	var itemIns=getItemInstanceByName(name);
	var y_i=y+y_offset+(i-NUM_ROLE_ITEM*0.5-0.5)*text_space;
	
	draw_sprite(itemIns.sprite_index,0,x-sprite_width*0.45,y_i);
	draw_text(x-sprite_width*0.2,y_i,name);
	draw_text(x+sprite_width*0.36,y_i,ds_grid_get(manager.operatedRole.items,INDEX_ITEM_QUALITY,i));				
	if(i==manager.operatedRole.curWeaponIndex)
		draw_sprite(spr_holdWeapon,0,x+sprite_width*0.5-spr_holdWeapon.sprite_width,y_i);
		
}

//draw the sign of the selected item  
var rectangle_y1=y+y_offset*0.5+(manager.itemSelectIndex-NUM_ROLE_ITEM*0.5-0.5)*text_space;
draw_set_color(c_orange);
draw_rectangle(x-sprite_width*0.46,rectangle_y1
			   ,x+sprite_width*0.46,rectangle_y1+UNIT
			   ,true);