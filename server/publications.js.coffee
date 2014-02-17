Meteor.publish 'newPosts', (limit) ->
  Posts.find({}, {sort: {submitted: -1}, limit: limit})

Meteor.publish 'singlePost', (id) ->
  id && Posts.find id

Meteor.publish 'comments', (postId) ->
  Comments.find postId: postId

Meteor.publish 'notifications', ->
  Notifications.find userId: this.userId, read: false
