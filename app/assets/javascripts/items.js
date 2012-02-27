// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function() {
  $('#bookmarklet a').attr("href", "javascript:url=window.location.href;title=document.title;window.open('"
  + window.location.protocol + "//"
  + window.location.host +
  "/items/new?url='+encodeURIComponent(url)+'&title='+encodeURIComponent(title),'bookmark','width=600,height=500,status=yes,resizable=yes,scrollbars=yes');"
)
})