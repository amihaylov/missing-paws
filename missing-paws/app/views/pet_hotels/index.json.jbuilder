json.array!(@pet_hotels) do |pet_hotel|
  json.extract! pet_hotel, :id, :title, :description, :image_url, :phone, :website, :city
  json.url pet_hotel_url(pet_hotel, format: :json)
end
