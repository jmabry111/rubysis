// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require bootstrap
//= require_tree .

// jquery datepicker
$(function() {
	$("input#student_dob").datepicker({
		changeYear:true,
		yearRange:'-40:+0',
		changeMonth:true,
		showAnim:'slideDown',
		dateFormat: 'D, M dd yy',
		});
});

$(document).ready(function() {
	$('#fill_address').click(function() {
		street = $("#student_street_address").val();
		city = $("#student_city").val();
		state = $("#student_state").val();
		zip = $("#student_zip").val();
		$("#student_street_address_911").val(street);
		$("#student_city_911").val(city);
		$("#student_state_911").val(state);
		$("#student_zip_911").val(zip);
    });
});

