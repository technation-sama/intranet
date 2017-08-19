json.extract! suggestion, :id, :subject, :message, :created_at, :updated_at
json.url suggestion_url(suggestion, format: :json)
