$(document).ready(function() {
  var height = 744,
      width = 869;
  $('a.bookmarklet').attr("href", "javascript:url=window.location.href;title=document.title;window.open('"
  + window.location.protocol + "//"
  + window.location.host +
  "/new?url='+encodeURIComponent(url)+'&title='+encodeURIComponent(title)+'&bookmarklet=true','bookmark','width=" + width + 
  ",height=" + height + ",status=yes,resizable=yes,scrollbars=yes');");
  
  $('.color-single').click(function() {
    var id = this.id.replace(/user-color-/, '')
    $('#user_color_id').val(id)
    $('.color-single').removeClass("selected")
    $(this).addClass("selected")
  })
  
  try {
    var selectedColorID = $('#user_color_id').val().toString();
    $("#user-color-" + selectedColorID).addClass("selected")
  } catch(err) {} // don't do this because you're not on the user's edit page
  
  // register_item_events();
  
  $('#item_description').keydown(function (e) {
     if (e.keyCode == 13 && e.shiftKey) {
       $("#new_item").submit()
     }
   });
   
   $('#show-md-sheet').click(function(e) {
     e.preventDefault();
     $('#markdown-cheat-sheet').slideToggle('200')
   })
})