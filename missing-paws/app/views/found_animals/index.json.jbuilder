json.array!(@found_animals) do |found_animal|
  json.extract! found_animal, :id, :title, :description, :image_url, :name, :phone, :email, :city
  json.url found_animal_url(found_animal, format: :json)
end
