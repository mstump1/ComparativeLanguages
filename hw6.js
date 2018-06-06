// Homework 6 JavaScript programming problem 
// 
// Author: MArgaret Stump
// Version: 1
//
var fromValue;
var toValue;
var fromScale;
var toScale;

// Converts from one scale to another.
function convert() {
  var from = NaN;
  //changed kelvin to temp 
  var temp = NaN;
  var to = NaN;

  if (fromValue.value != '') {
    //takes value from input text box
    from = Number(fromValue.value);
  }
  if (!isNaN(from)) {
    //takes value from first drop down menu
    switch (fromScale.value) 
    {
      case '0':
        //takes value from second drop down menu
        //temp is changed depending on second drop down menu
        switch (toScale.value)
        {
          //convert celsius to celsius
          case '0':
            temp = from < -273.15 ? NaN : from;
            break;
          //convert celsius to fahrenheit
          case '1':
            temp = from < -273.15 ? NaN : (from * 1.8) + 32;
            break;
          //convert celsius to kelvin
          case '2':
            temp = from < -273.15 ? NaN : from + 273.15;
            break;
        }
        break;
      //fahrenheit to whatever
      case '1':
        switch (toScale.value)
        {
          //convert Fahrenheit to celsius
          case '0':
            temp = from < -459.67 ? NaN : (from - 32) / 1.8;
            break;
          //convert fahrenheit to fahrenheit
          case '1':
            temp = from < -459.67 ? NaN : from;
            break;
          //convert fahrenheit to kelvin
          case '2':
            temp = from < -459.67 ? NaN : (from + 459.67) / 1.8;
            break;
        }
        break;
        //kelvin to
      case '2':
        
        switch (toScale.value)
        {
          //convert kelvin to celsius
          case '0':
            temp = from < 0 ? NaN : from + 273.15;
            break;
          //convert kelvin to fahrenheit
          case '1':
            temp = from < 0 ? NaN : (from * 1.8) - 459.67;
            break;
          //convert kelvin to kelvin
          case '2':
            temp = from < 0 ? NaN : from;
            break;
        }
        break;
      defaul:
        temp = NaN;
    }
  } 
  //added this to ensure there will be 2 decimal places
  var n = isNaN(temp) ? 'Error!' : temp.toFixed(2);
  toValue.value = n;
}

// Clears the value of the result field.
function clear() {
  toValue.value = '';
}

// Initializes the variables whene the page is loaded
function init() {
  fromValue = document.getElementById('fromValue');
  toValue = document.getElementById('toValue');
  fromScale = document.getElementById('fromScale');
  //i added the toscale line
  toScale = document.getElementById('toScale');
  document.getElementById('convert').onclick = convert;
  fromValue.onchange = clear;
  fromScale.onchange = clear;
  toScale.onchange = clear;
}

// Sets the function to invoke when the page is loaded.
window.onload = init;
