json.extract! post, :id, :name, :content, :user_id, :group_id, :created_at, :updated_at
json.user post.user.as_json
# json.user post.groups.as_json
