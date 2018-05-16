$(document).on 'turbolinks:load', ->
  BUCKETLIST.cable.task()
