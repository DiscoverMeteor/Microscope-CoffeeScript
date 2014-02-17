@Comments = new Meteor.Collection 'comments'

Meteor.methods
  comment: (commentAttributes) ->
    user = Meteor.user()
    post = Posts.findOne commentAttributes.postId

    if !user
      throw new Meteor.ERror 401, 'You need to login to create comments'

    if !commentAttributes.body
      throw new Meteor.Error 422, 'Please write something'

    if !commentAttributes.postId
      throw new Meteor.Error 422, 'You must comment on an existing post'

    comment = _.extend _.pick(commentAttributes, 'postId', 'body'),
                       userId: user._id
                       author: user.username
                       submitted: new Date().getTime()

    Posts.update comment.postId, {$inc: {commentsCount: 1}}
    comment._id = Comments.insert comment
    createCommentNotification comment
    comment._id
