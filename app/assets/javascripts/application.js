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
//= require jquery.nested-fields
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

$(document).ready(function(e) {
  $('#parent-fields, #student-address-fields, #teacher-address-fields').nestedFields();
});

// Function to make sort and search ajax on applicant index page
$(function() {
	$(document).on("click","#students_ajax_table th a", function() {
	  $.getScript(this.href);
	  return false;
	});
	$(document).keyup("#students_search input", function() {
		$.get($("#students_search").attr("action"), $("#students_search").serialize(), null, "script");
		return false;
	});
});

// Hides search button on applicant index page
$(function() {
	$("#search_button").hide();
})
