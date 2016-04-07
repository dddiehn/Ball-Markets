# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  if $('#team-show').length > 0
    console.log('start')
    data = []

    for row in $('.rating-table').find('.data-row')
      date_string = $($(row).find('td')[0]).text().split('-')[0]
      date   = new Date(date_string)
      rating = $($(row).find('td')[1]).text()

      data.push([date, rating])

    new Dygraph(document.getElementById('team-stock-graph'),
      data,
    )
