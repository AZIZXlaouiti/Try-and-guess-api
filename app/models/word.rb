class Word < ApplicationRecord
    validates_uniqueness_of :word
end
