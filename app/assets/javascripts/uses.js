$(document).on('ready page:load', function() {
  $('.use-button').on('ajax:success', updateUses)
});

function updateUses(event, data) {
  toggleUses(data)
  console.log(data)
  // data is sometimes the DOM object and sometimes JSON
}

function toggleUses(data) {
  status = $('.use-button').html()
  if (status === "I'm using this!") {
    $('.use-button').html("I use this!")
    $('.small-avatar#'+data.id).hide()
    decrementUsesHeader()
  }
  if (status === "I use this!") {
    $('.use-button').html("I'm using this!")
    $(data.use).hide().prependTo('.user-matrix').fadeIn(300)
    incrementUsesHeader()
  }
}

function incrementUsesHeader() {
  var count = $('#users').text().replace(" User", "").replace("s", "")
  count++
  if (count > 1) users = " Users"
  else users = " User"
  $('#users').text(count + users)
}

function decrementUsesHeader() {
  var count = $('#users').text().replace(" User", "").replace("s", "")
  count--
  if (count > 1 || count == 0) users = " Users"
  else users = " User"
  $('#users').text(count + users)
}
