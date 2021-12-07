class UserSerializer < ActiveModel::Serializer
  attributes  :id , :username , :online ,:score
end
