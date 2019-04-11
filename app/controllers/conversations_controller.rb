class ConversationsController < ActionController::Base
    
    before_action :authenticate_user!
    
    def index
        @users = User.all
        @conversations = Conversation.all
    end
    
    def create
        if Conversation.between(params[:sender_id], params[:receiver_id]).present?
            @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
        else
            @conversation = Conversation.create!(conversation_param)
        end
        redirect conversation_messages_path(@conversation)
    end
    
    private
    def conversation_param
        params.permit(:sender_id, :receiver_id)
    end
end