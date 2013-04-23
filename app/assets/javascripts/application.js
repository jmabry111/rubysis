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
	$("input#student_dob, input#school_year_starts_on, input#school_year_ends_on, input#semester_starts_on, input#semester_ends_on, input#grading_period_starts_on, input#grading_period_ends_on").datepicker({
		changeYear:true,
		yearRange:'-40:+5',
		changeMonth:true,
		showAnim:'slideDown',
		dateFormat: 'D, M dd yy',
		});
});


$(document).ready(function(e) {
  $('#parent-fields, #student-address-fields, #teacher-address-fields').nestedFields();
});

// Function to make sort and search ajax on student index page
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

// Hides search button on student index page
$(function() {
	$("#search_button").hide();
});

/*
// Function to make 	search ajax on section enrollment
$(function() {
	$(document).keyup("#section_school_search input", function() {
		$.get($("#section_school_search").attr("action"), $("#section_school_search").serialize(), null, "script");
		return false;
	});
});

// Hides search button on section enrollment
$(function() {
	$("#section_search_button").hide();
});
*/