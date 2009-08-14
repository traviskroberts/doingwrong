// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  // set remote links to function via ajax
  $('a.remote').click(function() {
    if(this.rel) {
      $("#" + this.rel).show();
    }
    $.get(this.href, null, null, "script");
    return false;
  });
  
  // make the delete links function via ajax
  $('a.remote-delete').click(function() {
    $.post(this.href, { _method: 'delete' }, null, "script");
    return false;
  });
  
  // submit form slider
	$("#submit_link").click(function(){
    // reset the submit form
    $(":input", "#entry_submit_form").val("");
    // show the submit form
	  $("#submit_form_holder").slideToggle("slow");
    // change the tab_inner class
    if($("#tab_inner").hasClass('tab_inner')) {
      $("#tab_inner").removeClass('tab_inner');
      $("#tab_inner").addClass('tab_inner_active');
    } else if($("#tab_inner").hasClass('tab_inner_active')) {
      $("#tab_inner").removeClass('tab_inner_active');
      $("#tab_inner").addClass('tab_inner');
    }
		return false;
	});
	
  // set up the tool tips
	$('.help_tip').tooltip({
    delay: 0,
    showURL: false
  });

});