class Word < ApplicationRecord
    validates_uniqueness_of :username
end
