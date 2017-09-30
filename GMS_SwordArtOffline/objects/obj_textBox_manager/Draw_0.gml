/// @description Insert description here
// You can write your code in this editor
if(scenceState==ScenceState.showText){

		show_debug_message("draw into 1");
	
		//draw role photo
		draw_sprite(spr_role_photo,subImageIndex,rolePhotoX[rolePhotoSide],box_top_y);



		//draw box
		draw_sprite(spr_textBox,0,0,box_top_y);



		//draw text
		draw_set_font(textBoxFont_mainText);
		draw_set_color(c_white);

		draw_text_ext(2,box_top_y,curText,fontSize+2,VIEW_HEIGHT);
	
	
	}
	else if(scenceState==ScenceState.nextElement&&isSerie){

		show_debug_message("draw into 2");

		//draw box
		draw_sprite(spr_textBox,0,0,box_top_y);
	}
