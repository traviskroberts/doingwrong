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
	  $("#submit_form_holder").slideToggle("slow");
		return false;
	});
	
  // set up the tool tips
	$('.help_tip').tooltip({
    delay: 0,
    showURL: false
  });

});