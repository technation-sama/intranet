json.extract! gallery_attachment, :id, :gallery_id, :photo, :created_at, :updated_at
json.url gallery_attachment_url(gallery_attachment, format: :json)
