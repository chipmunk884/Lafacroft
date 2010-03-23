// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
	var input_field = $("#image_edit_field");
	input_field.focusout(function() {
		$("#image_preview_field").attr("src", "/images/nspire/"+input_field.val());
	});
});
