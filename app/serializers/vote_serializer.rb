class VoteSerializer < ActiveModel::Serializer
  attributes :id, :comment, :starts, 

  belongs_to :user
  belongs_to :dish 
end
