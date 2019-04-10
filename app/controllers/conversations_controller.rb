class ConversationsController < ActionController::Base
    
    before_action :authenticate_user!
    
    def index
        @users = User.all
        @conversations = Conversation.all
    end
    
    def create
        if Conversation.between(params[:sende_id], params[:recever_id]).present?
            @conversation = Conversation.between(params[:sende_id], params[:recever_id]).first
        else
            @conversation = Conversation.create!(conversation_param)
        end
        redirect conversation_messages_path(@conversation)
    end
    
    private
    def conversation_param
        params.permit(:sender_id, :recever_id)
    end
end