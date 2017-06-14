$(document).on('ready page:load', function () {
  handleSearch();
  rotateSearchTerms();
  autoSizeReviewInput();
  showLoginOnUse();
  showLoginOnReview();
  handleAddProduct();
  $('.product-form-name').hide()
  $('.product-form-image').hide()
  $('.product-form-category').hide()
  $('form#new_product').hide()

});

function rotateSearchTerms() {
  $('input#search').fadeIn(500)
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'coinbase').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'ethereum').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'bitcoin').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'blockchain.info').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'ledger').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'cold wallet').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'paper wallet').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'trezor').dequeue()})
  .delay(1500)
  .queue(function() { $(this).attr('placeholder', 'search all wallets')})
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

function handleAddProduct() {
  revealAddProductForm()
  $('input#link').on('click', clearAddProductForm)
  $('input#link').on('paste', function() {
    // ajax get to the url

    setTimeout(function () {
      var link = $('input#link').val()
      parseLink(link)
    }, 50);
    handleSelection()
    // retrieve image, product name from the DOM
  })
}

function clearAddProductForm() {
  $('input#link').val('')
}

function revealAddProductForm() {
  $('.share-button').on('click', function() {
    $('form#new_product').slideDown(500)
    $('.add-row').hide()
    $('.front-page').fadeTo(500, 0.3)
    event.preventDefault()
    handleCancel()
  })
}

function parseLink(link) {
  $.get("/availabilities", {
    url: link,
  }).done(function(data) {
    if (typeof data.image === 'string') {
      $('.product-form-image-display').html(`<img src='${data.image}'>`)
    }
    $('.product-form-brand').fadeIn(300)
    $('.product-form-name').fadeIn(300)
    $('input#link').fadeTo(100, 0)

    $('textarea#name').val(data.name)
    $('input#product_link').val(data.link)
    handleImage(data.image)
  })
}

function handleImage(image) {
  if (typeof image === 'string') {
    $('input#product_image').val(image)
  }
  else {
    image.forEach(function(singleImage, i) {
      renderIfBig(singleImage)
    })
  }
  $('.image-grid').on('click', '*', function() {
      $('.product-form-image-display').html(this)
      $('#product_image').val($(this).attr('src'))
      $('.image-grid').fadeTo(300, 0.5)
  })
}

function renderIfBig(image) {
  var img = new Image()
  img.src = image
  img.onload = function(img) {
    if (this.width > 199) {
      $('.image-grid').append(this)
    }
  }
}

function handleCancel() {
  $('.cancel').on('click', function() {
    $('.add-row').show()
    $('form#new_product').hide()
    $('.front-page').fadeTo(200, 1)
  })
}
