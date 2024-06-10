class Assignement < ApplicationRecord
  belongs_to :user
  belongs_to :document
  attr_accessor :user_ids

  validates :user_id, presence: true
end
