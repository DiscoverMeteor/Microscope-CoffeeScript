Template.postsList.helpers
  posts: ->
    Posts.find {}, {sort: {submitted: -1}, limit: postsHandle.limit()}

  postsReady: ->
    !postsHandle.loading()

  allPostsLoaded: ->
    !postsHandle.loading() && Posts.find().count() < postsHandle.loaded()

Template.postsList.events
  'click .load-more': (event) ->
    event.preventDefault()
    postsHandle.loadNextPage()
