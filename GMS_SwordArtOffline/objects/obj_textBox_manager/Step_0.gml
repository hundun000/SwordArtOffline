/// @description Insert description here
// You can write your code in this editor

if(backInputReciever!=noone){

	//**************process input*************	
	if(isA){
		if(string_length(text)-curLen>0){
		//deepest the text
			curLen+=string_length(text)-curLen;
			curText=text;
		}
		else{
			//set this text done
			text="";
			curLen=0;
		}	
	}

	//**************process text box*************	
		if(text!=""){
		//is showing
			if(string_length(text)-curLen>0){
			//deepen the text
				curLen+=clamp(string_length(text)-curLen,0,textSpeed);
				curText=string_copy(text,0,curLen);
			}
		}
		else{
		//the text not load
			if(!ds_queue_empty(texts)){	
			//have text to continus showing,load it
				global.inputReceiver=InputReceiver.textBox;
			
				text=ds_queue_dequeue(texts)+"\n>>next";
				subImageIndex=getPhotoIndexByName(ds_queue_dequeue(names));
				rolePhotoSide=ds_queue_dequeue(sides);
			}
			else{
			//the group of texts all shown
				global.inputReceiver=backInputReciever;
				backInputReciever=noone;
			}
		}
}
		
	


