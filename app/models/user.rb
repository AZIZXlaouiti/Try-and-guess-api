class User < ApplicationRecord
    has_many :chat_messages 
    has_many :members
    has_many :rooms, through: :members
    validates_uniqueness_of :username
    has_secure_password
    def appear()
        self.update(online: true)
    end
    def disappear()
        self.update(online: false)
    end
    def gain()
        self.update(score: self.score+200)
    end
end
