class Document < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :comments, dependent: :destroy
  has_many :assignements, dependent: :destroy
  has_one_attached :photo
end
