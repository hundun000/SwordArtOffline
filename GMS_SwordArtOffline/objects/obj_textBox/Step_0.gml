/// @description Insert description here
// You can write your code in this editor


if(string_length(text)-curLen>0){
		
	curLen+=clamp(string_length(text)-curLen,0,textSpeed);
	curText=string_copy(text,0,curLen);

}
