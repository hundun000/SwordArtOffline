/// @description Insert description here



//draw role photo
draw_sprite(spr_role_photo,subImageIndex,rolePhotoX[rolePhotoSide],box_top_y);



//draw box
draw_sprite(spr_textBox,0,0,box_top_y);



//draw text
draw_set_font(textBoxFont_mainText);

draw_text_ext(0,box_top_y,curText,fontSize+2,VIEW_HEIGHT);