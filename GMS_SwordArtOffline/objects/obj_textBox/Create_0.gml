/// @description Insert description here


  //-------------need init--------
subImageIndex=-1;
rolePhotoSide=0;
text="";



//about draw x,y
box_top_y=VIEW_HEIGHT-sprite_get_height(spr_textBox);
rolePhotoX[0]=0;
rolePhotoX[1]=VIEW_WIDTH-sprite_get_height(spr_textBoxRolePhoto);
fontSize=font_get_size(textBoxFont_mainText);

//about dynamic draw
textSpeed=4;
curText="";
curLen=0;

