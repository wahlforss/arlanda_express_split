// Function to add waiters directly in browswer without refresh.
$(function(){
	for (i = 0; i < 10; i++) {
		var elem = '.waiters' + i
		var counter = $(elem).data('rubyvar')
		$(elem).text(counter)
		var button = '.split_button' + i
		$(button).click(function(){
			var id = $(this).attr('class').slice(-2,-1)
			var elem1 = '.waiters' + id
			counter = parseInt($(elem1).text()) + 1
			$(elem1).text(counter)
			swal(
				'Great!',
				'Meet up by the cashier 10 minutes before departure to split the fare!',
				'success'
				)
		});
	}
});

// Height of space to center prices in wrapper1

$(function(){ 

	var w = $('#wrapper1').width()
	$('.space').height(w*0.2);
	if(w > 800) {
		$('.space').height(20);

	}

});


function goToByScroll(id) {
	$('html,body').animate({
		scrollTop: $('#' + id).offset().top},
		'slow');
}
$(function() {
	$('.arrow').click(function() {
	goToByScroll('wrapper2')
});
});
