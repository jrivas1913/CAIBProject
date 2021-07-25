/*window.setInterval(function() {

var currentTime = new Date();
    // Converts currentTime (client local time) to UTC
    function toUTC(date) {
        return Date.UTC(
            date.getFullYear(),
            date.getMonth(),
            date.getDate(),
            date.getHours(),
            date.getMinutes(),
            date.getSeconds(),
            date.getMilliseconds()
        );
    }
    toUTC(currentTime);
	var startOpenTime = new Date("2021-05-01T00:00:01Z");
	var endOpenTime = new Date("2021-05-02T24:00:00Z");
    var startExecutionTime = new Date("2021-05-03T00:00:01Z");
    var endExecutionTime = new Date("2021-05-03T24:00:00Z");
    var startCloseTime = new Date("2021-05-04T00:00:01Z");
	currentTime= new Date("2021-05-04T00:00:01Z");
	if (currentTime.getTime() >= startOpenTime.getTime() && currentTime.getTime() <= endOpenTime.getTime()) {
		$('.close').hide();
		$('.execution').hide();
    } else if (currentTime.getTime() >= endOpenTime.getTime) {
        $('.open').hide();
		$('.close').hide();
		$('.execution').hide();
	}
    if (currentTime.getTime() >= startExecutionTime.getTime() && currentTime.getTime() <= endExecutionTime.getTime()) {
		$('.close').hide();
		$('.open').hide();
    } else if (currentTime.getTime() >= endExecutionTime.getTime) {
        $('.execution').hide();
		$('.close').hide();
		$('.open').hide();
		
    }
    if (currentTime.getTime() >= startCloseTime.getTime()) {
        $('.execution').hide();
		$('.open').hide();
		$('.resultats').show();
		
}
}, 0);*/

function myFunctionFirstPopup() {
  var popup = document.getElementById("myPopup1");
  popup.classList.toggle("show");
}

function myFunctionSecondPopup() {
  var popup = document.getElementById("myPopup2");
  popup.classList.toggle("show");
}

function myFunctionThirdPopup() {
  var popup = document.getElementById("myPopup3");
  popup.classList.toggle("show");
}
