window.addEventListener("load", function() {
	var rejected = document.querySelector("#rejected");
	if (rejected) {
		window.setTimeout(function() {
			rejected.classList.add("rejected-show");
			console.log(rejected, rejected.classList)
		}, 500);
	}
});