var camber = document.getElementById("camber");
var camberValue = document.getElementById("cambervalue");

var offset = document.getElementById("offset");
var offsetValue = document.getElementById("offsetvalue");

var wheel = document.getElementById("wheelWidth");
var wheelValue = document.getElementById("wheelWidthvalue");

var wheelSize = document.getElementById("wheelSize");
var wheelSizeValue = document.getElementById("wheelSizevalue");

var rideHeight = document.getElementById("rideHeight");
var rideHeightValue = document.getElementById("rideHeightvalue");
var nuifocus = 0
var interval_;


var currentwheelid = 0

var camberamount = 0
var offsetamount = 0
var wheelWidthamount = 0
var rideHeightamount = 0
var wheelSizeamount = 0

var stancerMode = 1

function dragElement(elmnt) {
  var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
  if (document.getElementById(elmnt.id + "move")) {
    document.getElementById(elmnt.id + "move").onmousedown = dragMouseDown;
  } else {
    elmnt.onmousedown = dragMouseDown;
  }

  function dragMouseDown(e) {
    e = e || window.event;
    e.preventDefault();
    pos3 = e.clientX;
    pos4 = e.clientY;
    document.onmouseup = closeDragElement;
    document.onmousemove = elementDrag;
  }

  function elementDrag(e) {
    e = e || window.event;
    e.preventDefault();
    pos1 = pos3 - e.clientX;
    pos2 = pos4 - e.clientY;
    pos3 = e.clientX;
    pos4 = e.clientY;
    elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
    elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
  }

  function closeDragElement() {
    document.onmouseup = null;
    document.onmousemove = null;
  }
}



$(function() {
    window.addEventListener('message', function(event) {
     var data = event.data;


     document.onkeyup = function(data) {
      console.log(data.which)
      if (data.which == 27 ) {
        $.post('http://wizating_stancer/close', JSON.stringify({}));
      } else if (data.which == 13 ) {
        save()
        $.post('http://wizating_stancer/close', JSON.stringify({}));

      }else if (data.which == 16 ) {
        if (nuifocus == 1) {
          nuifocus = 0
          updateui(nuifocus)
        }
      }
    };

     if (data.type == "enablebutton") {  

      document.body.style.display = data.enable ? "block" : "none";
      $(".mainbutton").css("display", "block")
      $(".mainbg").css("display", "none")
      $(".mainbuttonText").html(data.openkey)
    }


     if (data.type == "stancerSettings") {
      if (data.customWheels == -1) {
        $(".wheelWidthDiv").css("display", "none")
        $(".wheelSizeDiv").css("display", "none")
        $(".mainbg").css("height", "235px")
      } else {
        $(".wheelWidthDiv").css("display", "block")
        $(".wheelSizeDiv").css("display", "block")
        $(".mainbg").css("height", "340px")
      }
      $("#camber").val(data.camber);
      $("#offset").val(data.offset);
      $("#wheelWidth").val(data.wheelwidth);
      $("#wheelSize").val(data.wheelsize);
      $("#rideHeight").val(data.rideheight);
     }

     if (data.type == "updatewheel") { 
      currentwheelid = data.wheel
     }
     if (data.type == "updateui") { 
      nuifocus = data.focus
     }
     pictureChange()

     if (data.type == "enableui") {  
      document.body.style.display = data.enable ? "block" : "none";
      $(".mainbg").css("display", "block")
      $(".mainbutton").css("display", "none")

      camberValue.innerHTML = camber.value;
      offsetValue.innerHTML = offset.value;
      wheelValue.innerHTML = wheel.value;
      wheelSizeValue.innerHTML = wheelSize.value;
      rideHeightValue.innerHTML = rideHeight.value;
      currentwheelid = data.wheel
       
      dragElement(document.getElementById("mainbg"));
      


      camber.oninput = function() {
        camberValue.innerHTML = this.value;
        camberamount = camberValue.innerHTML;       
      }
       
      offset.oninput = function() {
        offsetValue.innerHTML = this.value;
        offsetamount = offsetValue.innerHTML;
      }
      
      wheel.oninput = function() {
        wheelValue.innerHTML = this.value;
        wheelWidthamount = wheelValue.innerHTML;
      }
      
      wheelSize.oninput = function() {
        wheelSizeValue.innerHTML = this.value;
        wheelSizeamount = wheelSizeValue.innerHTML;
      }
      
      rideHeight.oninput = function() {
        rideHeightValue.innerHTML = this.value;
        rideHeightamount = rideHeightValue.innerHTML;     
      }

    }
 

  });
});

function save() {
  $.post('http://wizating_stancer/save', JSON.stringify({camber : camberamount , offset : offsetamount , wheelwidth : wheelWidthamount , wheelsize : wheelSizeamount , rideheight : rideHeightamount}));
}
function updateui(nuifocus) {
  $.post('http://wizating_stancer/updateui', JSON.stringify({nuifocus}));
}

function changemode() {
 stancerMode = stancerMode + 1
 if (stancerMode >= 4) {
  stancerMode = 1
 }
 pictureChange()
}




function updateCamber(camber) {
  camberamount = camber
  $.post('http://wizating_stancer/wizating:stancer:wheelcamber', JSON.stringify({currentwheelid, camberamount, stancerMode}));
}


function updateOffset(offset) {
  offsetamount = offset
  $.post('http://wizating_stancer/wizating:stancer:wheeloffset', JSON.stringify({currentwheelid, offsetamount , stancerMode}));
}

function updateWheelWidth(wheelW) {
  wheelWidthamount = wheelW;
  $.post('http://wizating_stancer/wizating:stancer:wheelwidth', JSON.stringify({currentwheelid, wheelWidthamount}));
}

function updateWheelSize(wheelS) {
  wheelSizeamount = wheelS;
  $.post('http://wizating_stancer/wizating:stancer:wheelsize', JSON.stringify({currentwheelid, wheelSizeamount}));
}


function updateRideHeight(rideH) {
  rideHeightamount = rideH;
  $.post('http://wizating_stancer/wizating:stancer:rideheight', JSON.stringify({currentwheelid, rideHeightamount}));
  
}



function pictureChange() {
  if (stancerMode == 1) {
    if (currentwheelid == 0) {
      document.getElementById("modeimg").src="images/fl.png";
    } else  if (currentwheelid == 1) {
      document.getElementById("modeimg").src="images/fr.png";
    } else  if (currentwheelid == 2) {
      document.getElementById("modeimg").src="images/rl.png";
    } else  if (currentwheelid == 3) {
      document.getElementById("modeimg").src="images/rr.png";
    } 
  }else if (stancerMode == 2) { /** use 2 wheels at once */
    if  ( currentwheelid == 0 || currentwheelid == 1)  {
      document.getElementById("modeimg").src="images/flfr.png";
    }else if  ( currentwheelid == 2 || currentwheelid == 3)  {
      document.getElementById("modeimg").src="images/rlrr.png";
    }
  } else if (stancerMode == 3) {/** use 4 wheels at once */
   document.getElementById("modeimg").src="images/all.png"
  }
}



