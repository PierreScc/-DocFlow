class Group < ApplicationRecord
  has_many :documents, dependent: :destroy
  has_many :user_groups, dependent: :destroy
  has_many :users, through: :user_groups
  has_many :messages, dependent: :destroy
  validates :title, presence: true
end
