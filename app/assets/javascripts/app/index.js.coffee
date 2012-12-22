#= require json2
#= require jquery
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route

#= require_tree ./lib
#= require_self
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views

class App extends Spine.Controller
  constructor:(@el,@current_user) ->
    super
    @append(@chatrooms = new App.Chatrooms(@current_user))
    # @append(new App.Users(@current_user))
    # @append(new App.Messages(@current_user))
    
	Spine.Route.setup()    

window.App = App