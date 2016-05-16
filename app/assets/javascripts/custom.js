$(document).ready(function(){
$('.delete_image').click(function() {
	$(this).parent().find('img').hide();
    $(this).parent().find('img').src = '';
    $(this).hide();
    $(this).parent().find('input[type=hidden]').val(true);
  });
});