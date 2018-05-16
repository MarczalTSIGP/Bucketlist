BUCKETLIST.cable.task = ->
  obj = $('#list-show')
  return unless obj.length >0

  id = obj.data('list-id')

  App.task = App.cable.subscriptions.create { channel: "TasksChannel", list_id: id },
    connected: ->
      # Called when the subscription is ready for use on the server
      console.log("connected")

    disconnected: ->
      # Called when the subscription has been terminated by the server
      console.log("disconnected")

    received: (data) ->
      console.log("received")
      # Called when there's incoming data on the websocket for this channel
      @renderTask(data)

    renderTask: (task) ->
      console.log task
      ul = $("#{task.container}")
      li = $("#task-#{task.id}")
      checkbox = li.find('input')

      checkbox.attr('update-task-status-url', task.url)
      checkbox.prop('checked', task.completed)

      ul.prepend(li)
