<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Date Selector</title>
    
    <script language="JavaScript">
// {{{ y2k()

function y2k(number)
{
    return (number < 1000) ? number + 1900 : number; 
}

// }}}
// {{{ _rgb2hex()

function _rgb2hex(red,green,blue) 
{
    var html_red = red.toString(16).toUpperCase();
    var html_green = green.toString(16).toUpperCase();
    var html_blue = blue.toString(16).toUpperCase();
    if (html_red.length == 1) {
        html_red = "0" + html_red
    }

    if (html_green.length == 1) {
        html_green = "0" + html_green
    }

    if (html_blue.length == 1) {
        html_blue = "0" + html_blue
    }

    return '#' + html_red + html_green + html_blue;
}
 
// }}}
// {{{ _hex2rgb()

function _hex2rgb(htmlcode) 
{
    var htmlcode = htmlcode.replace(/#/,'');
    var rgb = new Array();
    rgb["red"] = parseInt(htmlcode.substr(0,2),16);
    rgb["green"] = parseInt(htmlcode.substr(2,2),16);
    rgb["blue"] = parseInt(htmlcode.substr(4,2),16);
    return rgb;
}
 
// }}}
// {{{ getDarkColor()

function getDarkColor(htmlcode) 
{
    var decimalcolor = _hex2rgb(htmlcode);
    decimalcolor["red"] = Math.max(0,decimalcolor["red"]-40);
    decimalcolor["green"] = Math.max(0,decimalcolor["green"]-40);
    decimalcolor["blue"] = Math.max(0,decimalcolor["blue"]-40);
    return _rgb2hex(decimalcolor["red"],decimalcolor["green"],decimalcolor["blue"]);
}

// }}}

if (typeof(window.opener.calendarStartMonday) == 'undefined') {
    var calendarStartMonday = false;
}
else {
    var calendarStartMonday = window.opener.calendarStartMonday ? true : false;
}

// get the date format
if (typeof(window.opener.calendarFormat) == 'undefined') {
    var calendarFormat = 'y/m/d';
}
// we are doing on a leap of faith here that the user has 'm','d' and 'y' only in the format
else {
    var calendarFormat = window.opener.calendarFormat;
}

// get the calendarColors variable and setup the colors
if (typeof(window.opener.calendarColors) == 'undefined') {
    alert('Please configure the colors by setting the calendarColors array!');
    window.close();
}

// grab the color settings
var calendarColors = window.opener.calendarColors;
// set defaults for the selected date to be a darker color
if (typeof(calendarColors['dateSelectedBgColor']) == 'undefined') {
    calendarColors['dateSelectedBgColor'] = getDarkColor(calendarColors['dateBgColor']);
}

if (typeof(calendarColors['dateSelectedColor']) == 'undefined') {
    calendarColors['dateSelectedColor'] = calendarColors['dateColor'];
}

if (typeof(window.opener.calendarMonths) == 'undefined' || window.opener.calendarMonths.length != 12) {
    var calendarMonths = new Array('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
}
else {
    var calendarMonths = window.opener.calendarMonths;
}

if (typeof(window.opener.calendarWeekdays) == 'undefined' || window.opener.calendarWeekdays.length != 8) {
    // we have two sundays to accomodate for calendars starting on monday
    var calendarWeekdays = new Array('Sun', 'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat', 'Sun');
}
else {
    var calendarWeekdays = window.opener.calendarWeekdays;
}

var calendarDays  = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

//images
var right_still = "arrows_r_still.gif";
var right_anim = "arrows_r_anim.gif";
var left_still = "arrows_l_still.gif";
var left_anim = "arrows_l_anim.gif";

// get the reference to the target element and setup the date
var targetDateField = window.opener.calendarTarget;
var dateString = targetDateField.value;

if (dateString != '' && 
   (typeof(window.opener.calendarUseToday) == 'undefined' || !window.opener.calendarUseToday)) {
    // convert the user format of the date into something we use to make a javascript Date object
    // we need to pad with placeholders to get the rigth offset
    tmp_format = calendarFormat.replace(/m/i, 'mm').replace(/d/i, 'dd').replace(/y/i, 'yyyy');
    tmp_yOffset = tmp_format.indexOf('y');
    tmp_mOffset = tmp_format.indexOf('m');
    tmp_dOffset = tmp_format.indexOf('d');
    var today = new Date(dateString.substring(tmp_yOffset, tmp_yOffset + 4), dateString.substring(tmp_mOffset, tmp_mOffset +
 2) - 1, dateString.substring(tmp_dOffset, tmp_dOffset + 2));

    if ((today == "Invalid Date") || (isNaN(today))) {
        var today = new Date();
    }
}
// use today's date
else {
    var today = new Date();
}

var day = today.getDate();
var year  = y2k(today.getYear());
var month = today.getMonth();

var currentDay = day;
var currentYear = year;
var currentMonth = month;
    </script>
  </head>
  <frameset frameborder="0" framespacing="0" ROWS="100%,*">
    <frame scrolling="no" frameborder="0" marginheight="0" marginwidth="0" name="cal" noresize src="<%=request.getContextPath()%>/jsp/calendar_body.jsp">
  </frameset>



</body>
</html>