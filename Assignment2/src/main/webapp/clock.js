// JavaScript Document

window.onload=clockFunction;
function clockFunction(){
	if (typeof sceneryFunction === 'function') {sceneryFunction();}
	if (typeof speedFunction === 'function') {speedFunction();}
}

function fullDay(day){
	if(day==0)day="Sunday";
	else if(day==1)day="Monday";
	else if(day==2)day="Tuesday";
	else if(day==3)day="Wednesday";
	else if(day==4)day="Thursday";
	else if(day==5)day="Friday";
	else if(day==6)day="Saturday";
	return day;
}

function shortDay(day){
	if(day==0)day="Sun";
	else if(day==1)day="Mon";
	else if(day==2)day="Tue";
	else if(day==3)day="Wed";
	else if(day==4)day="Thu";
	else if(day==5)day="Fri";
	else if(day==6)day="Sat";
	return day;
}
	
function fullMonth(month){
	if(month==0)month="January";
	else if(month==1)month="February";
	else if(month==2)month="March";
	else if(month==3)month="April";
	else if(month==4)month="May";
	else if(month==5)month="June";
	else if(month==6)month="July";
	else if(month==7)month="August";
	else if(month==8)month="September";
	else if(month==9)month="October";
	else if(month==10)month="November";
	else if(month==11)month="December";
	return month;
}

function shortMonth(month){
	if(month==0)month="Jan";
	else if(month==1)month="Feb";
	else if(month==2)month="Mar";
	else if(month==3)month="Apr";
	else if(month==4)month="May";
	else if(month==5)month="Jun";
	else if(month==6)month="Jul";
	else if(month==7)month="Aug";
	else if(month==8)month="Sep";
	else if(month==9)month="Oct";
	else if(month==10)month="Nov";
	else if(month==11)month="Dec";
	return month;
}

function _2d(number){
	if(number<10)number="0"+number;
	return number;
}

function _3d(number){
	if(number<10)number="00"+number;
	else if(number<100)number="0"+number;
	return number;
}

