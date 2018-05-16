(->
  @App or (@App = {})
  App.cable = ActionCable.createConsumer()
  return
).call this
