MessageModel = Backbone.Model.extend(defaults:
  code: 0
  message: 'Test Message')
MessageRouter = Backbone.Router.extend(
  routes: '': 'displayMessages'
  displayMessages: ->
    msg1 = new MessageModel(
      code: '001'
      message: 'Registration Success')
    msg2 = new MessageModel(
      code: '002'
      message: 'Registration Fail')
    msg3 = new MessageModel(
      code: '003'
      message: 'Login Success')
    msg4 = new MessageModel(
      code: '003'
      message: 'Login Fail')
    messageCollection = new MessageCollection([
      msg1
      msg2
      msg3
      msg4
    ])
    messageListView = new MessageListView(model: messageCollection)
    messageCollection.fetch success: ->
      $('#messageList').html messageListView.render().el
      return
    return
)
MessageCollection = Backbone.Collection.extend(
  model: MessageModel
  url: '../api/example_2.php')
MessageListView = Backbone.View.extend(
  tagName: 'ul'
  render: (eventName) ->
    _.each @model.models, ((msg) ->
      $(@el).append new MessageListItemView(model: msg).render().el
      return
    ), this
    this
)
MessageListItemView = Backbone.View.extend(
  tagName: 'li'
  template: _.template($('#tpl-message-item').html())
  render: (eventName) ->
    $(@el).html @template(@model.toJSON())
    this
)
messageRouter = new MessageRouter()
Backbone.history.start()