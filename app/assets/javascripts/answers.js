$(document).on('ready page:load', function() {
  $('.new_answer').on('ajax:success', updateAnswers)
});

function updateAnswers(event, data) {
  // event.preventDefault()
  $('.new_answer').hide(100) // hide only that one tho
  $(data.answer).hide().appendTo('.answers').slideUp(300)
}
