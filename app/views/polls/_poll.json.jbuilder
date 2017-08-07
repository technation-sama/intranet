json.extract! poll, :id, :user_id, :body, :created_at, :updated_at
json.url poll_url(poll, format: :json)
