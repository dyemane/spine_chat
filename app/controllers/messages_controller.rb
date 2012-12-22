class MessagesController < ApplicationController
  require 'chat_broadcaster'
  include ChatBroadcaster
  before_filter :authenticate_user!
  
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    
    if @message.save
      ChatBroadcaster.broadcast(@message)
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
    
  end

end
