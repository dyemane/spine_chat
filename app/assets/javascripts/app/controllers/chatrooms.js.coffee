
class App.Chatrooms extends Spine.Controller
  # elements:
  #   '.items': items
  # 
  # events:
  #   'click .item': 'itemClick'
  events:
    'click .refresh': 'refresh'

  constructor: (@current_user) ->
    super
    faye = new Faye.Client("http://localhost:9292/faye")
    faye.subscribe "/chat", (data) =>
      @refresh()
    
    @messages    = new App.Messages(@current_user)
    @users    = new App.Users(@current_user)
    
    @render()
    
  render: =>
    @html @view('messages/chatroom')({ current_user: @current_user})
    @append(@users)
    @append(@messages)
  
  refresh: (e)->
    App.Message.fetch()
    #@messages.refresh()
    #@users.refresh()
    
    