$(document).on('ready page:load', function() {
  $('.new_answer').on('ajax:success', updateAnswers)
});

function updateAnswers(event, data) {
  $('.new_answer').hide(100) // hide only that one tho
  $(data.answer).appendTo('ul.answers')
}
