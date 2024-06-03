class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :documents, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :assignements, dependent: :destroy
  has_many :user_groups, dependent: :destroy
  has_many :messages, dependent: :destroy
end
