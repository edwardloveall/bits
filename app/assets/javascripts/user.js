$(document).ready(function() {
  $('#bookmarklet a').attr("href", "javascript:url=window.location.href;title=document.title;window.open('"
  + window.location.protocol + "//"
  + window.location.host +
  "/new?url='+encodeURIComponent(url)+'&title='+encodeURIComponent(title),'bookmark','width=600,height=500,status=yes,resizable=yes,scrollbars=yes');"
)
})
