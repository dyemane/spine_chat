class App.Message extends Spine.Model
  @configure 'Message', 'sender', 'content'
  @extend Spine.Model.Ajax