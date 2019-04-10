class ConversationController < ActionController::Base
    
    before_action do
        @conversation = Conversation.find(params[:conversation_id])
    end
    
    def index
       @messages = @conversation.messages
       @message = @conversation.messages.new
    end
    
    def create
        @message = @conversation.messages.new(message_param)
        if @message.save
            redirect conversation_messages_path(@conversation)
        end
    end
    
    private
    def message_param
        params.require(:message).permit(:body, :user_id)
    end
end