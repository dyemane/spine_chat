$ = jQuery.sub()
Message = App.Message

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  Message.find(elementID)

class App.Messages extends Spine.Controller
  events:
    'submit form': 'send'
    
  constructor: (@current_user) ->
    super
    Message.bind 'refresh change', @render
    
    Message.fetch()
    
  message_received: (data) ->
    console.log("Incoming message received")
    Message.fetch()
    
  render: =>
    messages = Message.all()
    
    @html @view('messages/index')({
      messages: messages,
      current_user: @current_user})

    @scroll_down()
    
  send: (e)->
    e.preventDefault()
    @message = Message.fromForm(e.target).save()
    
  scroll_down: ->
    console.log("scroll down")
    $("#messages").scrollTop($("#messages")[0].scrollHeight);  

  refresh: =>
    Message.fetch()

