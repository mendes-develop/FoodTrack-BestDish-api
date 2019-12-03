class DishSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price
end
