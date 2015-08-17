json.array!(@pet_academies) do |pet_academy|
  json.extract! pet_academy, :id, :title, :description, :image_url, :phone, :website, :city
  json.url pet_academy_url(pet_academy, format: :json)
end
