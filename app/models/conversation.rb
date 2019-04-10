class Conversation < ActiveRecord::Base
    
    belongs_to :sender, :foreign_key => :sender_id, class_name: 'User'
    belongs_to :receiver, :foreign_key => :receiver_id, class_name: 'User'
    
    has_many :messages, dependent: :destroy
    validates_uniqueness_of :sender_id :scope => receiver_id
    
    scope :between, -> (sender_id, receiver_id) do
        where(("Conversation.sende_id = ? And Conversation.receiver_id =?")
                OR ("Conversation.sende_id = ? And Conversation.receiver_id =?"),
                sender_id, receiver_id, receiver_id,sende_id)
    end
end