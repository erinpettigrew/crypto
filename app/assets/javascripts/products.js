$(document).on('ready page:load', function () {
  handleSearch();
  rotateSearchTerms();
  autoSizeReviewInput();
  showLoginOnUse();
  showLoginOnReview();
});

function rotateSearchTerms() {
  $('input#search').fadeIn(500)
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'orgasm blush').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'hyaluronic acid').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'huda lashes').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'cerave cream').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'green tea').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'hydrogel sheet mask').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'caudalie face mist').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'vitamin c').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'strobing powder').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'search 832 products!')})
}

function handleSearch() {
  $('input#search').on('click', function() {
    $(this).attr('placeholder', '')
  })
}

function autoSizeReviewInput() {
  $('#review_comment').on('keyup', function() {
    var commentLength = $('#review_comment').val().length
    if ( commentLength > 100 ) {
        $('#review_comment').attr('rows', '6')
    }
    if ( commentLength > 160 ) {
      $('#review_comment').attr('rows', '8')
    }
    if ( commentLength > 235 ) {
      $('#review_comment').attr('rows', '10')
    }
    if ( commentLength > 300 ) {
      $('#review_comment').attr('rows', '12')
    }
    if ( commentLength > 360 ) {
      $('#review_comment').attr('rows', '16')
    }
  })
}

function showLoginOnUse() {
  $('.use-button-logged-out').on('click', function(event) {
    $('.login-layer').fadeIn(300)
    $('.page').fadeTo(600, 0.25)
    $('.big-search').fadeTo(600, 0.25)
    $('.fa-times').on('click', function() {
      $('.login-layer').fadeOut(200)
      $('.page').fadeTo(300, 1)
      $('.big-search').fadeTo(300, 1)
    })
    $('.login-button').on('click', function() {
      $('.login-layer').fadeOut(300)
      $('.page').fadeTo(300, 1)
      $('.big-search').fadeTo(300, 1)
    })
    event.preventDefault()
  })
}

function showLoginOnReview() {
  $('.review-button-logged-out').on('click', function(event) {
    $('.login-layer').fadeIn(300)
    $('.page').fadeTo(600, 0.25)
    $('.big-search').fadeTo(600, 0.25)
    $('.fa-times').on('click', function() {
      $('.login-layer').fadeOut(200)
      $('.page').fadeTo(300, 1)
      $('.big-search').fadeTo(300, 1)
    })
    $('.login-button').on('click', function() {
      $('.login-layer').fadeOut(300)
      $('.page').fadeTo(300, 1)
      $('.big-search').fadeTo(300, 1)
    })
    event.preventDefault()
  })
}
