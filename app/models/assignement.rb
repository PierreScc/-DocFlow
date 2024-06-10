class Assignement < ApplicationRecord
  belongs_to :user
  belongs_to :document

  validates :user_id, presence: true
  validates :comment, presence: true
end
