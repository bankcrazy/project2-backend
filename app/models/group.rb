class Group < ApplicationRecord
  belongs_to :category
  has_many :posts
  has_many :users_groups
  has_many :users,:through => :users_groups
  validates :name, presence: true
end
