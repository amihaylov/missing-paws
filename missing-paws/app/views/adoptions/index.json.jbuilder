json.array!(@adoptions) do |adoption|
  json.extract! adoption, :id, :title, :description, :image_url, :name, :phone, :email, :city
  json.url adoption_url(adoption, format: :json)
end
