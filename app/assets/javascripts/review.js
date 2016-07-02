$(document).on('ready page:load', function() {
  $('.new_review').on('ajax:success', updateReviews)
});

function updateReviews(event, data) {
  $('.new_review').hide(300)
  $(data.review).hide().prependTo('.reviews').fadeIn(200)
  incrementReviewsHeader()
}

function incrementReviewsHeader() {
  var count = $('#ratings').text().replace(" Rating", "").replace("s", "")
  count++
  if (count > 1) ratings = " Ratings"
  else ratings = " Rating"
  $('#ratings').text(count + ratings)
}
