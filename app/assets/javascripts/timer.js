window.addEventListener("load", function() {
	var timer = document.querySelector("#timer");
	var start = document.querySelector("#start-timer");
	var stop = document.querySelector("#stop-timer");
	var reset = document.querySelector("#reset-timer");

	var time = 600;

	// **** add this part in if you wanna be able to do cusom times ****
	// var getTime = function() {
	// 	var mins = parseInt(timer.textContent.split(":")[0])
	// 	var secs = parseInt(timer.textContent.split(":")[1])
	// 	time = (mins * 60) + secs;
	// };

	var timerInterval;

	var countdown = function() {
		time--;
		if (time < 0) {
			window.clearInterval(timerInterval);
		} else {
			var mins = Math.floor(time / 60);
			var secs = time - (mins * 60);
			if (mins < 10) {
				mins = "0" + mins;
			}
			if (secs < 10) {
				secs = "0" + secs;
			}
			timer.textContent = mins + ":" + secs;
		}
	};

	var startCountdown = function() {
		// getTime();
		start.disabled = true;
		timerInterval = window.setInterval(countdown, 1000);
	};

	var stopCountdown = function() {
		start.disabled = false;
		window.clearInterval(timerInterval);
	};
	if (timer && start && stop && reset) {
		start.addEventListener("click", startCountdown);
		stop.addEventListener("click", stopCountdown);
		reset.addEventListener("click", function() {
			stopCountdown();
			time = 600;
			timer.textContent = "10:00";
		});
	}
});