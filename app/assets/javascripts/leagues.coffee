# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  if $('#league-show').length > 0
    id = $('#league-id').text()
    $.ajax(url: "/leagues/#{id}.json", type:"GET").done (data) ->
      console.log(data)

      new Dygraph(document.getElementById('league-graph'),
        data,
      )
