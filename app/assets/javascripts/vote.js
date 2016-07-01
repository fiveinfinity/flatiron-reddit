// functions for post voting
function getVoteId(clicked_class, clicked_id) {
  if(clicked_class === 'upvote') {
    upVote(clicked_id);
  } else {
    downVote(clicked_id);
  }
}

function upVote(postId) {
  console.log(currentUser);
  $.get('/upvote/' + postId).success(function(response) {
    $('b[data-id="' + postId + '"]').text(response["post"]["vote"]);
  });
}

function downVote(postId) {
  $.get('/downvote/' + postId).success(function(response) {
    $('b[data-id="' + postId + '"]').text(response["post"]["vote"]);
  });
}
