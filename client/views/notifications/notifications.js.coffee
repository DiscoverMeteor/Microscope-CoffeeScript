Template.notifications.helpers
  notifications: ->
    Notifications.find userId: Meteor.userId(), read: false

  notificationCount: =>
    Notifications.find(userId: Meteor.userId(), read: false).count()

Template.notification.events
  'click a': ->
    Notifications.update this._id, {$set: {read: true}}
