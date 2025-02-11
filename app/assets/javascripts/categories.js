$(document).on('ready page:load', function () {
  getProducts()
  handleSorting()
});

function getProducts() {
  $products = $('.product-row')
}

function handleSorting() {
  sortByBrand()
  sortByName()
  sortByUsers()
  sortByRating()
}

function sortByBrand() {
  $('.sorts #brand').on('click', function(event) {
    var $sortedProducts = $products
    $sortedProducts.sort(function(a,b) {
      var brandA = a.getElementsByClassName('product-brand')[0]
      brandA = $(brandA).text()

      var brandB = b.getElementsByClassName('product-brand')[0]
      brandB = $(brandB).text()

      var result = 0
      if (brandA < brandB) result = -1  // sort ascending
      if (brandA > brandB) result = 1
      if (brandA === brandB) result = 0
      return result
    })
    $('.sortable').append($sortedProducts)
    event.preventDefault()
  })
}

function sortByName() {
  $('.sorts #name').on('click', function(event) {
    var $sortedProducts = $products
    $sortedProducts.sort(function(a,b) {
      var nameA = a.getElementsByClassName('product-name')[0]
      nameA = $(nameA).text()

      var nameB = b.getElementsByClassName('product-name')[0]
      nameB = $(nameB).text()

      var result = 0
      if (nameA < nameB) result = -1  // sort ascending
      if (nameA > nameB) result = 1
      if (nameA === nameB) result = 0
      return result
    })
    $('.sortable').append($sortedProducts)
    event.preventDefault()
  })
}


function sortByUsers() {
  $('.sorts #users').on('click', function(event) {
    var $sortedProducts = $products
    $sortedProducts.sort(function(a,b) {
      var usersA = a.getElementsByClassName('count')[0]
      usersA = $(usersA).text()
      usersA = usersA.replace(" ", "").replace("user", "").replace("s", "")

      var usersB = b.getElementsByClassName('count')[0]
      usersB = $(usersB).text()
      usersB = usersB.replace(" ", "").replace("user", "").replace("s", "")

      var result = 0
      if (usersA < usersB) result = 1  // sort descending
      if (usersA > usersB) result = -1
      if (usersA === usersB) result = 0
      return result

    })
    $('.sortable').append($sortedProducts)
    event.preventDefault()
  })
}

function sortByRating() {
  $('.sorts #rating').on('click', function(event) {
    var $sortedProducts = $products
    $sortedProducts.sort(function(a,b) {
      var ratingA = a.getElementsByClassName('rating')[0]
      ratingA = $(ratingA).text()

      var ratingB = b.getElementsByClassName('rating')[0]
      ratingB = $(ratingB).text()

      var result = 0
      if (ratingA < ratingB) result = 1   // sort descending
      if (ratingA > ratingB) result = -1
      if (ratingA === ratingB) result = 0
      return result
    })
    $('.sortable').append($sortedProducts)
    event.preventDefault()
  })
}
