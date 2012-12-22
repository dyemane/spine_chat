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
    
    faye = new Faye.Client("http://localhost:9292/faye")
    faye.subscribe "/chat", (data) =>
      @message_received(data)
    Message.fetch()
    
  message_received: (data) ->
    console.log("message received")
    Message.fetch()
    #@message = Message.create({
    #  sender: @current_user
    #  content: data
    #})
    
    #Message.trigger('refresh')
    
  render: =>
    console.log("render")

    messages = Message.all()
    @html @view('messages/index')({
      messages: messages,
      current_user: @current_user})
  
  send: (e)->
    e.preventDefault()
    @message = Message.fromForm(e.target).save()
    
  