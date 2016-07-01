function allPosts() {
  $.get('/posts.json', function(response) {
    $(".posts").html(renderPosts(response));
  });
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

function renderPosts(response) {
  var postBlocks = [];
  var posts = response["posts"];
  posts.forEach(function(post) {
    var post = new Post(post["id"], post["content"], post["created_at"], post["updated_at"], post["title"], post["author_id"], post["categories"], post["comments"], post["vote"]);
    post.parseTime(post.createdAt, post.id);
    post.findAuthor(post.authorId, post.id);

    postBlocks += ('<div class="well" data-id="' + post.id + '"><table><tr><td class="content_td">');
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
    postBlocks += ('</td>');

    postBlocks += ('<td class="vote_td"><img src="assets/pabstcan.jpg" class="upvote" id="' + post.id + '" onClick="getVoteId(\'upvote\', this.id)">');
    postBlocks += ('<b class="post_vote" data-id="' + post.id + '">' + post.vote + '</b>');
    postBlocks += ('<img src="assets/downpabstcan.jpg" class="downvote" id="' + post.id + '" onClick="getVoteId(\'downvote\', this.id)">')
    postBlocks += ('</td></tr></table></div>');
  });
  return postBlocks;
}
