$(document).on('ready page:load', function () {
  transitionIn($('.feed-item'));
  transitionIn($('.page'));
  handleSearch();
  rotateSearchTerms();
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
