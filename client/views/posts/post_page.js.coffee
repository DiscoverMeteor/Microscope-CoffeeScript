Template.postPage.helpers
  currentPost: ->
    Posts.findOne Session.get('currentPostId')
