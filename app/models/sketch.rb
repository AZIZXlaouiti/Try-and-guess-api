class Sketch < ApplicationRecord
    has_many :paths , :dependent => :destroy
end
