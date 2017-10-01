/// @description Insert description here
// You can write your code in this editor

if(backInputReciever!=noone){
//mean into scene

	switch(scenceState){
	
		case ScenceState.showText:
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
				scenceState=ScenceState.nextElement;
			}
			break;
		
		case ScenceState.nextElement:
			
			if(!ds_queue_empty(scenceElements)){
				var next=ds_queue_dequeue(scenceElements);
				
				switch(next){
				
					case ScenceElement.textBox:			

						global.inputReceiver=InputReceiver.textBox;
	
						isSerie=(curText!="");
	
						text=ds_queue_dequeue(texts)+"\n>>next";
						subImageIndex=getPhotoIndexByName(ds_queue_dequeue(names));
						rolePhotoSide=ds_queue_dequeue(sides);
					
						scenceState=ScenceState.showText;
					
						break;
					
					case ScenceElement.movement:
		
						var mover=getFakeRoleByName(ds_queue_dequeue(moverNames));
						var destination_x=(ds_queue_dequeue(destinations_tile_x)+0.5)*UNIT;
						var destination_y=(ds_queue_dequeue(destinations_tile_y)+0.5)*UNIT;
						var spd=ds_queue_dequeue(movementSpeed);

						with(mover){
							target_x=destination_x;
							target_y=destination_y;
							move_towards_point(target_x,target_y,spd);
						}
					
						scenceState=ScenceState.waitMoved;
					
						break;
					
					case ScenceElement.delay:
						var delayTime=ds_queue_dequeue(delayTimes);
						curDelay=delayTime;
						scenceState=ScenceState.delayCountDown;
						break;
				
					case ScenceElement.changeRoom:

						scenceState=ScenceState.noScene;
				
						/*
						switch(backInputReciever){
							case InputReceiver.cursor:
								
								break;
								
							default:						
						
						}
						*/
				
				
						leaveScene();
						

						break;
				
					default:
				
				}
			}
			else{
				leaveScene();
			}
				
				
			
			curText="";
			
			break;
			
		case ScenceState.delayCountDown:
			
			if(curDelay>0){
				curDelay--;
			}	
			else{
				scenceState=ScenceState.nextElement;
			}
			
			break;
			
		default:	

	}


	
}
		
	


