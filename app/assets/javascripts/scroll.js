$(document).ready(function() {
	$('#scroll-button').click(function(event) {
		event.preventDefault();
		var scrollTarget = $( $(this).attr("href") );
		if (scrollTarget.length) {
	    $('html, body').animate({
	      scrollTop: scrollTarget.offset().top
      }, 1000);
	  }

	})
});