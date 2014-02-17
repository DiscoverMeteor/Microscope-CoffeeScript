Meteor.publish 'posts', ->
  Posts.find()

Meteor.publish 'comments', (postId) ->
  Comments.find postId: postId

Meteor.publish 'notifications', ->
  Notifications.find userId: this.userId, read: false
