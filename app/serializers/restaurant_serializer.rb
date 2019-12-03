class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :state, :postal_code, :street_address, :latitude, :longitude, :price_rating, :media_image, :logo
  has_many :dishes
end
