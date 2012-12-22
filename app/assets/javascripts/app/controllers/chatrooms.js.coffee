
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
    @messages    = new App.Messages(@current_user)
    @users    = new App.Users(@current_user)
    @render()
    
  render: =>
    @html @view('messages/chatroom')({ current_user: @current_user})
    @append(@users)
    @append(@messages)
    console.log("chatroom render")
  
  refresh: (e)->
    @messages.refresh()
    @users.refresh()