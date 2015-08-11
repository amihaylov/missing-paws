json.array!(@lost_animals) do |lost_animal|
  json.extract! lost_animal, :id, :title, :description, :image_url, :name, :phone, :email, :city
  json.url lost_animal_url(lost_animal, format: :json)
end
