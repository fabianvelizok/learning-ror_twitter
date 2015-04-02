$(document).on 'ready', ->
  $('.not-implemented').on 'click', (event) ->
    event.preventDefault()
    alert('Not implemented yet')
