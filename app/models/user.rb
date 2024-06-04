class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many_attached :photos
  # documents que t'as créé
  has_many :documents, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :assignements, dependent: :destroy
  # documents qu'on t'as assigné
  has_many :assigned_documents, through: :assignements, source: :document
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups
  has_many :messages, dependent: :destroy
end
