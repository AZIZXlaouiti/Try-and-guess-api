class User < ApplicationRecord
    has_many :chat_messages
    has_many :rooms, through: :chat_messages
    validates_uniqueness_of :username
    has_secure_password
    def appear()
        self.update(online: true)
    end
    def disappear()
        self.update(online: false)
    end
end
