class Message < ActiveRecord::Base
    
    belongs_to :User
    belongs_to :Conversation
    
    validates_presence_of :body, :user_id, :conversation_id
end