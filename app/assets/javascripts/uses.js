$(document).on('ready page:load', function() {
  $('.use-button').on('ajax:success', updateUses)
});

function updateUses(event, data) {
  toggleUses(data)
  // data is sometimes the DOM object and sometimes JSON
}

function toggleUses(data) {
  status = $('.use-button').html()
  if (status === "I'm using this!") {
    $('.use-button').html("I use this!")
    $('.small-avatar#'+data.id).hide()
  }
  if (status === "I use this!") {
    $('.use-button').html("I'm using this!")
    $(data.use).hide().prependTo('.user-matrix').fadeIn(300)
  }
}
