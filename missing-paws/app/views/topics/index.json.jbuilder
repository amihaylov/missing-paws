json.array!(@topics) do |topic|
  json.extract! topic, :id, : category, :title, :picture, :text
  json.url topic_url(topic, format: :json)
end
