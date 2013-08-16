jQuery.fn.submitOnCheck = function() {
  this.find('input[type=submit]').remove();
  this.find('input[type=radio]').click(function() {
    $(this).parent('form').submit();
  });
  return this;
}

$(document).on('page:load', function() {
    $(function() {
  		$('#attendee_form').submitOnCheck();
	});
});

