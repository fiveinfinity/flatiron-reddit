function search() {
  $("#search_form").submit(function(event) {
    event.preventDefault();

    var q = $(this).serialize();
    var search = $.get('/search.json', q);
    search.success(function(response) {
      $(".posts").html(renderPosts(response));
    });
  });
}

function sortListeners() {
  $("#sort_newest").click(function(event) {
    event.preventDefault();
    sort('sort_newest');
  });

  $("#sort_oldest").click(function(event) {
    event.preventDefault();
    sort('sort_oldest');
  });

  $("#sort_most").click(function(event) {
    event.preventDefault();
    sort('sort_most');
  });

  $("#sort_least").click(function(event) {
    event.preventDefault();
    sort('sort_least');
  });

}

function sort(type) {
    $.get('/' + type + '').success(function(response) {
      $(".posts").html(renderPosts(response));
    });
}
