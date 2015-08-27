json.array!(@vet_centers) do |vet_center|
  json.extract! vet_center, :id, :title, :description, :image_url, :phone, :website, :city
  json.url vet_center_url(vet_center, format: :json)
end
