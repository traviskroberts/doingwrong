// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
   $('a.remote').click(function() {
     if(this.rel) {
        $("#" + this.rel).show();
       }
     $.get(this.href, null, null, "script");
     return false;
   });
   
   $('a.remote-delete').click(function() {
     $.post(this.href, { _method: 'delete' }, null, "script");
     return false;
   });

	$("#submit_link").click(function(){
	  $("#submit_form_holder").slideToggle("slow");
		return false;
	});

});

function show_comment_busy() {
  $("#comment_busy").show();
}