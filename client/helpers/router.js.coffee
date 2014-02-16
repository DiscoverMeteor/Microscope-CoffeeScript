Meteor.Router.add
  '/': 'postsList'
  '/posts/:_id':
    to: 'postPage'
    and: (id) -> Session.set 'currentPostId', id
  '/posts/:_id/edit':
    to: 'postEdit'
    and: (id) -> Session.set 'currentPostId', id
  '/submit': 'postSubmit'

Meteor.Router.filters
  'requireLogin': (page) ->
    if Meteor.user()
      page
    else if Meteor.loggingIn()
      'loading'
    else
      'accessDenied'
  'clearErrors': (page) ->
    Meteor.Errors.clear()
    page

Meteor.Router.filter 'requireLogin', only: 'postSubmit'
Meteor.Router.filter 'clearErrors'
