// var shift = false,
//     enter = false,
//     form  = document.getElementById('new_item');
// 
// function reg_key(e) {
//   var keyCode = e.keyCode; // get the code of the key
//   
//   shift = (keyCode == 16) ? true : false;
//   enter = (keyCode == 13) ? true : false;
//   
//   submit_form();
// };
// 
// function submit_form () {
//   if (shift && enter) {
//     form.submit();
//     console.log(shift + " : " + enter)
//   }
// };
// 
// function register_item_events () {
//   description_field = document.getElementById('item_description')
//   
//   description_field.onkeydown = reg_key;
//   description_field.onkeyup   = reg_key;
// };