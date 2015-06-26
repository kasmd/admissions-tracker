$(document).ready(
	function(){
		$('#submission_upload').change(
			function(){
				if ($(this).val()) {
					$('#app-submit').attr('disabled',false);
					// or, as has been pointed out elsewhere:
					// $('input:submit').removeAttr('disabled'); 
				}
			}
		);
	}
);