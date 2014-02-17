Template.newPosts.helpers
  options: ->
    sort: {submitted: -1}
    handle: newPostsHandle

Template.bestPosts.helpers
  options: ->
    sort: {votes: -1, submitted: -1}
    handle: topPostsHandle

Template.postsList.helpers
  postsWithRank: ->
    i = 0
    options =
      sort: this.sort
      limit: this.handle.limit()
    Posts.find({}, options).map (post) ->
      post._rank = i
      i += 1
      post

  postsReady: ->
    !this.handle.loading()

  allPostsLoaded: ->
    !this.handle.loading() && Posts.find().count() < this.handle.loaded()

Template.postsList.events
  'click .load-more': (event) ->
    event.preventDefault()
    this.handle.loadNextPage()
