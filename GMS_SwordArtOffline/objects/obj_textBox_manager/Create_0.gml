/// @description Insert description here



//-------------How to use this -------------------
/*
A call should likes this{

with(obj_textBox_manager)
	backInputReciever=InputReceiver.cursor;
addTextBox("asuna","Nice to meet you.",0);
addTextBox("kirito","Nice to meet you,too.",1);
addTextBox("asuna","My name is Asuna.",0);
addTextBox("kirito","My name is Kirito.",1);


}
firstly set the back state,which state after the text box you want to be.
then you can add any text box;


*/


event_inherited();

texts=ds_queue_create();
names=ds_queue_create();
sides=ds_queue_create();


backInputReciever=noone;



//-------------need init--------
subImageIndex=-1;
rolePhotoSide=0;
text="";



//about draw x,y
box_top_y=VIEW_HEIGHT-sprite_get_height(spr_textBox);
rolePhotoX[0]=0;
rolePhotoX[1]=VIEW_WIDTH-264;
//2*sprite_get_width(spr_textBoxRolePhoto);
fontSize=font_get_size(textBoxFont_mainText);

//about dynamic draw
textSpeed=1;
curText="";
curLen=0;