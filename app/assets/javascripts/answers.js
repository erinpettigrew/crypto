$(document).on('ready page:load', function() {
  $('.new_answer').on('ajax:success', updateAnswers)
});

function updateAnswers(event, data) {
  $('.new_answer').hide(300)
  $(data.answer).hide().prependTo('.answers').fadeIn(200)
  // incrementReviewsHeader()
}

// function incrementReviewsHeader() {
//   var count = $('#ratings').text().replace(" Rating", "").replace("s", "")
//   count++
//   if (count > 1) ratings = " Ratings"
//   else ratings = " Rating"
//   $('#ratings').text(count + ratings)
// }
