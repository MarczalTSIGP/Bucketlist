$(document).on 'turbolinks:load', ->
  BUCKETLIST.tasks_completed()
  BUCKETLIST.share_list()

window.BUCKETLIST = {}

BUCKETLIST.share_list = ->
  url = $('#autocomplete_user_by_name').data('url')
  $('#autocomplete_user_by_name').autocomplete
    minLength: 2
    appendTo: '#main'
    select: (event, selected) ->
       $("#autocomplete_user_by_id").val(selected.item.data);
    #source: [{ value: 'apple', data: 10}, {value: 'avocado', data: 1}, {value: 'apricot', data: 12}] 
    source: (request, response)->
      $.ajax
        url:  url
        dataType: 'json'
        data:
          query: request.term
        success: (data) ->
          console.log(data)
          response(data)

BUCKETLIST.tasks_completed = ->

  checkboxs = $('#lists_show ul li.list-group-item input[type="checkbox"]')
  $.each checkboxs, (i,v) ->
    $(@).prop('checked', $(@).data('status'))

  $('#lists_show ul').on 'change', 'li.list-group-item input[type="checkbox"]', ->
    url = $(@).attr('update-task-status-url')
    checkbox = $(@)
    li = checkbox.closest('li')
    $.ajax
      url: url
      method: 'POST'
      data: { _method: 'patch' }
      success: ->
        console.log(url)
        if checkbox.is(':checked')
          ul_id = '#tasks_completed'
          url = url.replace('/completed', '/uncompleted')
        else
          url = url.replace('/uncompleted', '/completed')
          ul_id = '#tasks_uncompleted'

        checkbox.attr('update-task-status-url', url)
        ul = $(ul_id)
        ul.prepend(li)
