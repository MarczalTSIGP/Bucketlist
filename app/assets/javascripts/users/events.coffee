$(document).on 'turbolinks:load', ->
  BUCKETLIST.share_list_user_autocomplete()
  BUCKETLIST.toggleTask()

###################################################################################################
############################ SEARCH USER TO SHARE LIST  ###########################################
###################################################################################################

BUCKETLIST.share_list_user_autocomplete = ->
  return unless $('#lists_share').length > 0

  obj = $('#autocomplete_user_by_name')
  url = obj.data('url')
  obj.autocomplete
    minLength: 2
    appendTo: '#main'
    select: (event, selected) ->
       input_user_id = $('#autocomplete_user_by_id')
       input_user_id.val(selected.item.data)
    source: (request, response)->
      console.log(response)
      $.ajax
        url:  url
        dataType: 'JSON'
        data:
          query: request.term
        success: (data) ->
          response(data)

###################################################################################################
############################ MARK TASKS AS DONE OR UNDONE  ########################################
###################################################################################################

BUCKETLIST.toggleTask = ->
  return unless $('#lists_show').length > 0

  # checked checkboxs if necessary
  checkboxs = $('#lists_show ul li.list-group-item input[type="checkbox"]')
  $.each checkboxs, (i,v) ->
    $(@).prop('checked', $(@).data('status'))

  # Send request when it changes
  $('#lists_show ul').on 'change', 'li.list-group-item input[type="checkbox"]', ->
    url = $(@).attr('update-task-status-url')
    $.ajax
      url: url
      method: 'POST'
      data: { _method: 'patch' }
      #success: ->
      #  console.log('success')
