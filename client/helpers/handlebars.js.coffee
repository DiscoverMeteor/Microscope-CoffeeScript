Handlebars.registerHelper 'pluralize', (n, thing) ->
  if n == 1
    "1 #{thing}"
  else
    "#{n} #{thing}s"

