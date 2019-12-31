# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

Restaurant.destroy_all
Favorite.destroy_all
User.destroy_all
Vote.destroy_all
Dish.destroy_all

Restaurant.reset_pk_sequence
Favorite.reset_pk_sequence
Dish.reset_pk_sequence
Vote.reset_pk_sequence
User.reset_pk_sequence

puts "initiating"


def scraper
    # url = 'http://localhost:3000/restaurants'

    # response = RestClient.get(url)

   

    json_from_file = File.read("#{Rails.root}/db/db.json")
    json = JSON.parse(json_from_file)

    if !json.nil?
        json["restaurants"].each do |restaurant|

            media_image = restaurant["media_image"]["base_url"] + restaurant["media_image"]["public_id"] + "." + restaurant["media_image"]["format"]
            logo = restaurant["additional_media_images"]["LOGO_HOME_PAGE"]["base_url"] + restaurant["additional_media_images"]["LOGO_HOME_PAGE"]["public_id"] + "." + restaurant["additional_media_images"]["LOGO_HOME_PAGE"]["format"]
            restaurant_instance = Restaurant.create(name: restaurant["name"], image: restaurant["logo"], city: restaurant["address"]["address_locality"], state: restaurant["address"]["address_region"], postal_code: restaurant["address"]["postal_code"], street_address: restaurant["address"]["street_address"], latitude: restaurant["address"]["latitude"], longitude:restaurant["address"]["longitude"], price_rating: restaurant["price_rating"], media_image: media_image, logo: logo)

            restaurant["menu_items"].each do |dish|
               dish = Dish.create(name: dish["name"], description: dish["description"], price: dish["minimum_price_variation"], restaurant_id: restaurant_instance.id)
                puts(dish)
            end

        end
       else
         puts "error fetching restaurants"
       end

end

scraper

puts "seeded it"