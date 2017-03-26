json.extract! comment, :id, :content, :user_id, :post_id, :created_at, :updated_at
json.user comment.user.as_json
