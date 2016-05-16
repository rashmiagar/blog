json.array!(@posts) do |post|
  json.extract! post, :id, :body, :image_file, :user_id
  json.url post_url(post, format: :json)
end
