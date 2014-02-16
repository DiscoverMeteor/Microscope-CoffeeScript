if Posts.find().count() == 0
  now = new Date().getTime()

  tomsId = Meteor.users.insert
    profile:
      name: 'Tom Coleman'
  tom = Meteor.users.findOne tomsId

  sachasId = Meteor.users.insert
    profile:
      name: 'Sacha Greif'
  sacha = Meteor.users.findOne sachasId

  nicholasId = Meteor.users.insert
    profile:
      name: 'Nicholas Hughes'
  nicholas = Meteor.users.findOne nicholasId

  telescopeId = Posts.insert
    title: 'Introducing Telescope'
    userId: sacha._id
    author: sacha.profile.name
    url: 'http://sachagreif.com/introducing-telescope'
    submitted: now - 7 * 3600 * 1000

  Comments.insert
    postId: telescopeId
    userId: tom._id
    author: tom.profile.name
    submitted: now - 5 * 3600 * 1000
    body: 'Interesting project Sacha, can I get involved?'

  Comments.insert
    postId: telescopeId
    userId: sacha._id
    author: sacha.profile.name
    submitted: now - 3 * 3600 * 1000
    body: 'You sure can, Tom!'

  Posts.insert
    title: 'Meteor'
    userId: tom._id
    author: tom.profile.name
    url: 'http://meteor.com'
    submitted: now - 10 * 3600 * 1000

  Posts.insert
    title: 'The Meteor Book'
    userId: tom._id
    author: tom.profile.name
    url: 'http://themeteorbook.com'
    submitted: now - 12 * 3600 * 1000

  Posts.insert
    title: 'Making Games is Hard. So What?'
    userId: nicholas._id
    author: nicholas.profile.name
    url: 'http://makinggamesishard.piinecone.com'
    submitted: now - 3600 * 1000
