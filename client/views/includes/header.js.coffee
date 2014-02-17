Template.header.helpers
  activeRouteClass: ->
    args = Array.prototype.slice.call arguments, 0
    args.pop()

    active = _.any args, (name) ->
      location.pathname == Meteor.Router[name + "Path"]()

    active && 'active'
