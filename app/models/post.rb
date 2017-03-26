# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :text
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :comments
  validates :user, presence: true
  validates :name, presence: true
  validates :content, presence: true

end
