Template.postsList.helpers
  posts: ->
    Posts.find {}, {sort: {submitted: -1}}
