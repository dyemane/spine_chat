class App.TicTacToe extends Spine.Controller
  elements:
     '#board': 'board'
     '.box' : 'boxes'
     #'#box1': 'box1'
     
  events:
     'click .box': 'box_clicked'

  constructor: ->
    super
    @render()
    
  render: => @html @view('tic_tac_toe/index')({})  
  
  box_clicked: (el) ->
    box = $("##{el.target.id}")
    if box.hasClass("x")
      box.removeClass("x")
    else
      box.addClass("x")