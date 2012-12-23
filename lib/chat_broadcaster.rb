module ChatBroadcaster
  require 'eventmachine'
  
  def self.client(channel = '/chat')
    unless @client
      @client = Faye::Client.new('http://localhost:9292/faye')
      @client.subscribe(channel) do |msg|
        Rails.logger.info "\n\n Server subscribing to channel /chat"
      end
    end
    @client
  end
  
  def self.broadcast message
    EM.run {
      client.publish('/chat', 'message' => message.to_json)
    }
  end
end