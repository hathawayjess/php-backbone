MessageModel = Backbone.Model.extend(
	urlRoot : '../api/example_1.php'
	defaults: ->
		message: 'Text Message'
	)
MessageView = Backbone.View.extend(
  template: _.template($('#tpl-hello-backbone').html())
  render: (eventName) ->
    $(@el).html @template(@model.toJSON())
    this
)
MessageRouter = Backbone.Router.extend(
  routes: '': 'displayMessage'
  displayMessage: ->
    messageModel = new MessageModel()
    messageView = new MessageView(model: messageModel)
    messageModel.fetch({
    	success: ->
    		$('#msg').html(messageView.render().el)
    })
    return
)
messageRouter = new MessageRouter()
Backbone.history.start()
