$(document).ready(function(){
	var $rows = $('tbody .results-row');
	$('#search').keyup(function() {
			var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();
			console.log(val);
			
			$rows.show().filter(function() {
					var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
					return !~text.indexOf(val);
			}).hide();
	});
});