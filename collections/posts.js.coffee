@Posts = new Meteor.Collection 'posts'

Posts.allow
  update: ownsDocument
  remove: ownsDocument

Posts.deny
  update: (userId, post, fieldNames) ->
    _.without(fieldNames, 'url', 'title').length > 0

Meteor.methods
  post: (postAttributes) ->
    user = Meteor.user()
    postWithSameLink = Posts.findOne url: postAttributes.url

    if !user
      throw new Meteor.Error 401, 'You need to login to post new stories'

    if !postAttributes.title
      throw new Meteor.Error 422, 'Please fill in a headline'

    if postAttributes.url && postWithSameLink
      throw new Meteor.Error 302, 'This link has already been posted', postWithSameLink._id

    post = _.extend _.pick(postAttributes, 'url', 'message'),
                    title: "#{postAttributes.title} #{if this.isSimulation then ' (client)' else ' (server)'}"
                    userId: user._id
                    author: user.email
                    submitted: new Date().getTime()
                    commentsCount: 0
                    upvoters: []
                    votes: 0

    Posts.insert post

  upvote: (postId) ->
    user = Meteor.user()
    if !user
      throw new Meteor.Error 401, 'You need to login to cast votes'
    post = Posts.findOne postId
    if !post
      throw new Meteor.Error 422, 'Post not found'
    if _.include post.upvoters, user._id
      throw new Meteor.Error 422, "You've already voted for this post"

    Posts.update {
      _id: postId,
      upvoters: {$ne: user._id}
    }, {
      $addToSet: {upvoters: user._id}
      $inc: {votes: 1}
    }
