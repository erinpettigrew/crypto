$(document).on('ready page:load', function () {
  handleSearch();
  rotateSearchTerms();
  autoSizeReviewInput();
  showLoginOnUse();
  showLoginOnReview();
  handleAddProduct();
  $('.product-form-brand').hide()
  $('.product-form-name').hide()
  $('.product-form-image').hide()
  $('.product-form-category').hide()
  $('form#new_product').hide()

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

function handleAddProduct() {
  revealAddProductForm()
  $('input#link').on('click', clearAddProductForm)
  $('input#link').on('paste', function() {
    // ajax get to the url

    setTimeout(function () {
      var link = $('input#link').val()
      parseLink(link)
    }, 50);

    // retrieve image, product name, product brand from the DOM
  })
}

function clearAddProductForm() {
  $('input#link').val('')
}

function revealAddProductForm() {
  $('.share-button').on('click', function() {
    $('form#new_product').show(500)
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
    $('.product-form-image-display').html(`<img src='${data.image}'>`)
    $('.product-form-brand').fadeIn(300)
    $('.product-form-name').fadeIn(300)
    $('input#link').fadeTo(100, 0)

    handleImage(data.image)

    $('input#product_product_brand').val(data.product_brand)
    $('textarea#product_product_name').val(data.product_name)
    // $('select#product_category_id').val(1) // Other Products category

  })
}

function handleImage(image) {
  if (image.length === 1) {
    $('input#product_image').val(image)
  }
  else {
    image.forEach(function(singleImage, i) {
      debugger
      $('.image-grid').append("<img src='" + singleImage + "'>")
      handleSelection()
    })
  }
}

function handleSelection() {
  $('.image-grid img').on('click', function() {
    // show image in form
    // fade out other images?
  })
}

function getImageHeight(url){
    var img = new Image();
    var height
    img.onload = function(){
        height = this.height
    };
    img.src = url;
    return height
}

function getImageWidth(url){
    var img = new Image();
    img.onload = function(){
        alert( this.width+' '+ this.height );
    };
    img.src = url;
}

function handleCancel() {
  $('.cancel').on('click', function() {
    $('.add-row').show()
    $('form#new_product').hide()
    $('.front-page').fadeTo(200, 1)
  })
}
