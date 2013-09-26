$(document).ready(function(){

	$('#issues td').click(function() {
		window.location = $(this).parent().attr("href");
	});


});
