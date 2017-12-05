/// @description Insert description here
// You can write your code in this editor
//about draw x,y

var view_x=camera_get_view_x(view_camera[0]);
var view_y=camera_get_view_y(view_camera[0]);

var box_top_y=VIEW_HEIGHT-sprite_get_height(spr_textBox)+view_y;
var rolePhotoX;
rolePhotoX[0]=0+view_x;
rolePhotoX[1]=VIEW_WIDTH-264+view_x;

if(scenceState==ScenceState.showText){

		
	
		//draw role photo
		draw_sprite(spr_role_photo,subImageIndex,rolePhotoX[rolePhotoSide],box_top_y);



		//draw box
		draw_sprite(spr_textBox,0,view_x,box_top_y);



		//draw text
		draw_set_font(textBoxFont_mainText);
		draw_set_color(c_white);

		draw_text_ext(view_x+2,box_top_y,curText,font_get_size(textBoxFont_mainText)+2,VIEW_HEIGHT);
	
	
	}
	else if(scenceState==ScenceState.nextElement&&isSerie){

		

		//draw blank box
		draw_sprite(spr_textBox,0,view_x,box_top_y);
	}
