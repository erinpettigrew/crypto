$(document).on('ready page:load', function() {
  $('.new_review').on('ajax:success', updateReviews)
});

function updateReviews(event, data) {
  $('.new_review').hide()
  $(data.review).hide().prependTo('.reviews').fadeIn(300)
}
