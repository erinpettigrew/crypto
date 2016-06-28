$(document).on('ready page:load', function () {
  transitionIn($('.feed-item'));
  transitionIn($('.page'));
  handleSearch();
  rotateSearchTerms();
  handleUseButton();
});

function rotateSearchTerms() {
  $('input#search.big-search').fadeIn(500)
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
  .queue(function() { $(this).attr('placeholder', 'search 737 products')})
}

function handleSearch() {
  $('input#search.big-search').on('click', function() {
    $(this).attr('placeholder', '')
  })
}

function handleUseButton() {
  $('.use-button').on('click', function(event) {
    var status = $('.use-button').html()
    toggleUses(status)
    event.preventDefault()
  })
}

function toggleUses(status) {
  if (status === "I'm using this!") {
    $('.use-button').html("I use this!")
    $('.users').append("<div class='small-avatar'><%= link_to image_tag(user.pic), user %></div>")
  }
  if (status === "I use this!") {
    $('.use-button').html("I'm using this!")
    // figure out how to remove the user's avatar
    // $('.users').append("<div class='small-avatar'><%= link_to image_tag(user.pic), user %></div>")
  }
}
