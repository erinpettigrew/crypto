$(document).on('ready page:load', function() {
  $('.want-button').on('ajax:success', updateWants)
});

function updateWants(event, data) {
  toggleWants(data)
}

function toggleWants(data) {
  status = $('.want-button').html()
  if (status === "I'm want this!") {
    $('.want-button').html("I want this!")
    $('.small-avatar#'+data.id).hide()
    decrementWantsHeader()
  }
  if (status === "I want this!") {
    $('.want-button').html("I'm wanting this!")
    $(data.want).hide().prependTo('.user-matrix').fadeIn(300)
    incrementWantsHeader()
  }
}

function incrementWantsHeader() {
  var count = $('#wanters').text().replace(" Wanter", "").replace("s", "")
  count++
  if (count > 1) wanters = " Wanters"
  else wanters = " Wanter"
  $('#wanters').text(count + wanters)
}

function decrementWantsHeader() {
  var count = $('#wanters').text().replace(" Wanter", "").replace("s", "")
  count--
  if (count > 1 || count == 0) wanters = " Wanters"
  else wanters = " Wanter"
  $('#wanters').text(count + wanters)
}
