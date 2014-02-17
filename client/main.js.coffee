Meteor.subscribe 'posts'
Meteor.autorun ->
  Meteor.subscribe 'comments', Session.get 'currentPostId'
Meteor.subscribe 'notifications'
