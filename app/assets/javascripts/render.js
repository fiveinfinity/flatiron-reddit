function Post(id, content, createdAt, updatedAt, title, authorId, categories, comments) {
  this.id = id;
  this.content = content;
  this.createdAt = createdAt;
  this.updatedAt = updatedAt;
  this.title = title;
  this.authorId = authorId;
  this.categories = categories;
  this.comments = comments;
  this.parseTime = function(rubyTime, id) {
    var time = {"time": rubyTime};

    $.post('/posts/time', time).success(function(response) {
      $("#timeid-" + id).text(response["time"]);
    });
  }

  this.findAuthor = function(author_id, id) {
    var author = {"author": author_id};

    $.post('/posts/find_author', author).success(function(response) {
      $("#authorid-" + id).text(response["author"]);
    })
  }
}

Array.prototype.getUnique = function(){
   var u = {}, a = [];
   for(var i = 0; i < this.length; ++i){
      if(u.hasOwnProperty(this[i])) {
         continue;
      }
      a.push(this[i]);
      u[this[i]] = 1;
   }
   return a;
}

function renderCategories() {
  $.get('/posts.json', function(response) {
    var categoryLinks = '';
    var posts = response["posts"];

    posts.forEach(function(post) {
      var categories = post["categories"];
      uniq_categories = categories.getUnique();
      uniq_categories.forEach(function(category) {
          categoryLinks += ('<li role="presentation"><a href="/category/' + category["id"] + '">' + category["title"] + '</a></li>');
      });
    });
    $("#index_categories").html(categoryLinks);
  });
}

function allPosts() {
  $.get('/posts.json', function(response) {
    $(".posts").html(renderPosts(response));
  });
}

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

function renderPosts(response) {
  var postBlocks = [];
  var posts = response["posts"];
  posts.forEach(function(post) {
    var post = new Post(post["id"], post["content"], post["created_at"], post["updated_at"], post.title, post["author_id"], post["categories"], post["comments"]);

    post.parseTime(post.createdAt, post.id);
    post.findAuthor(post.authorId, post.id);

    postBlocks += ('<div class="well">')
    postBlocks += ('<strong><a data-postid="' + post.id + '"  href="/posts/' + post.id +'">' + post.title + '</a></strong><br>');

    postBlocks += (post.content + '<br>');

    var categories = post.categories;
    categories.forEach(function(category) {
      if(category["title"] != '') {
        postBlocks += ('<a href="/category/' + category["id"] + '">' + category["title"] + '</a>' + ' ');
        postBlocks += (' | ');
      }
    });
    postBlocks += (post.comments.length + ' Comments' + ' | ');
    postBlocks += ('<b id="authorid-' + post.id + '"></b>'+ ' | ');
    postBlocks += ('<b id="timeid-' + post.id + '"></b>');
    postBlocks += ('</div>')
  });
  return postBlocks;
}

$(document).ready(function() {
  renderCategories();
  allPosts();
  search();
});
