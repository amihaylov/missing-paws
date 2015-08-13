json.array!(@pet_shops) do |pet_shop|
  json.extract! pet_shop, :id, :title, :description, :image_url, :phone, :website, :city
  json.url pet_shop_url(pet_shop, format: :json)
end
