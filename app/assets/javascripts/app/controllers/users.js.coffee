$ = jQuery.sub()
User = App.User

$.fn.item = ->
  elementID   = $(@).data('id')
  elementID or= $(@).parents('[data-id]').data('id')
  User.find(elementID)
  
class App.Users extends Spine.Controller
  constructor: (@current_user) ->
    super
    User.bind 'refresh change', @render
    User.fetch()
    
  render: =>
    users = User.all()
    @html @view('users/index')({
      users: users,
      current_user: @current_user})
    console.log("user render")
    
  refresh: =>
    console.log("fetching user")
    User.fetch()