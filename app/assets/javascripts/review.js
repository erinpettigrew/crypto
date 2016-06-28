$(document).on('ready page:load', function () {
  handleReviewForm()
});

// function handleReviewForm() {
//   $('.review-button').on('click', function(event) {
//     var review = $('textarea#review_comment').val("")
//     updateReviews()
//     event.preventDefault()
//   })
// }

// function handleReviewForm() {
//   $('.review-button').on('click', function(event) {
//     var review = $('textarea#review_comment').val("")
//     event.preventDefault()
//     alert('submitted')
//   })
// }

function handleReviewForm() {
  $('.new_review').on('ajax:success', updateReviews)
}

function updateReviews(event, data) {
  debugger
  $(this).parent().find('.new-review').before(data.comment)
  $(this).find('#review_comment').val('')
}
