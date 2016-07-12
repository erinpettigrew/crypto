$(document).on('ready page:load', function() {
  handleUsername();
});

function handleUsername() {
  $('input#user_user_name').on('click', function(event) {
    $('input#user_user_name').attr('value', '')
  })
}
