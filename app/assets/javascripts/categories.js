$(document).on('ready page:load', function () {
  transitionIn($('.category-row'))
  getProducts()
  handleSorting()
});

function getProducts() {
  $products = $('.product-row')
}

function handleSorting() {
  sortByBrand()
  sortByName()
  sortByRating()
}

function sortByBrand() {
  $('.sorts #brand').on('click', function(event) {
    var $sortedProducts = $products
    $products.hide(200)
    $sortedProducts.sort(function(a,b) {
      a-b
      var brandA = a.getElementsByClassName('product-brand')[0]
      var brandB = b.getElementsByClassName('product-brand')[0]
    })
    $sortedProducts.show()
    event.preventDefault()
  })
}

function sortByName() {
  $('.sorts #name').on('click', function(event) {
    $products.hide()
    event.preventDefault()
  })
}


function sortByRating() {
  $('.sorts #rating').on('click', function(event) {
    $products.hide()
    event.preventDefault()
  })
}
