Template.newPosts.helpers
  options: ->
    sort: {submitted: -1}
    handle: newPostsHandle

Template.bestPosts.helpers
  options: ->
    sort: {votes: -1, submitted: -1}
    handle: topPostsHandle

Template.postsList.helpers
  posts: ->
    Posts.find {}, {sort: this.sort, limit: this.handle.limit()}

  postsReady: ->
    !this.handle.loading()

  allPostsLoaded: ->
    !this.handle.loading() && Posts.find().count() < this.handle.loaded()

Template.postsList.events
  'click .load-more': (event) ->
    event.preventDefault()
    this.handle.loadNextPage()
