class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :height_inches, :weight_pounds, :private_profile
end
