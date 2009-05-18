// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
   $('a.remote').click(function() {
     $.get(this.href, null, null, "script");
     return false;
   });
   
   $('a.remote-delete').click(function() {
     $.post(this.href, { _method: 'delete' }, null, "script");
     return false;
   });
});