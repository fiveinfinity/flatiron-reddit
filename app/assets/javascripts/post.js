// Post constructor with prototype functions.
function Post(id, content, createdAt, updatedAt, title, authorId, categories, comments, vote) {
  this.id = id;
  this.content = content;
  this.createdAt = createdAt;
  this.updatedAt = updatedAt;
  this.title = title;
  this.authorId = authorId;
  this.categories = categories;
  this.comments = comments;
  this.vote = vote;

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
