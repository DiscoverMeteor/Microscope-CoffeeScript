Template.postItem.helpers
  ownPost: ->
    this.userId == Meteor.userId()

  domain: ->
    a = document.createElement('a')
    a.href = this.url
    return a.hostname
