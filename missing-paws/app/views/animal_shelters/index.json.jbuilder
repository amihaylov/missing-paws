json.array!(@animal_shelters) do |animal_shelter|
  json.extract! animal_shelter, :id, :title, :description, :image_url, :phone, :website, :city
  json.url animal_shelter_url(animal_shelter, format: :json)
end
