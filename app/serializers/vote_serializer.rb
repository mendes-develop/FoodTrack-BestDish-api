class VoteSerializer < ActiveModel::Serializer
  attributes :id, :comment, :stars 

  belongs_to :user
  belongs_to :dish 
end
