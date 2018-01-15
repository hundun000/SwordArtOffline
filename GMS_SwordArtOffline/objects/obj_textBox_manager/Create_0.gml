/// @description Insert description here



//-------------How to use this -------------------
/*
A call should likes this{

with(obj_textBox_manager)
	backInputReciever=InputReceiver.cursor;
addSceneTextBox("asuna","Nice to meet you.",0);
addSceneTextBox("kirito","Nice to meet you,too.",1);
addSceneTextBox("asuna","My name is Asuna.",0);
addSceneTextBox("kirito","My name is Kirito.",1);


}
firstly set the back state,which state after the text box you want to be.
then you can add any text box;


*/


event_inherited();

scenceElements=ds_queue_create();

texts=ds_queue_create();
names=ds_queue_create();
sides=ds_queue_create();

moverNames=ds_queue_create();
destinations_tile_x=ds_queue_create();
destinations_tile_y=ds_queue_create();
movementSpeed=ds_queue_create();


delayTimes=ds_queue_create();

//rooms=ds_queue_create();


backInputReciever=noone;
backRoom=noone;

isSerie=false;

enum ScenceElement{
	textBox,
	movement,
	delay,
	changeRoom

}



enum ScenceState{
	showText,
	roleMove,
	waitMoved,
	delayCountDown,
	nextElement,
	noScene

}

scenceState=ScenceState.noScene;

//-------------need init--------
subImageIndex=-1;
rolePhotoSide=0;
text="";

//mover=noone;
//destination_x=-1;
//destination_y=-1;
//spd=-1;
curDelay=-1;






//about dynamic draw
textSpeed=1;
curText="";
curLen=0;
numWordPerLine=5;