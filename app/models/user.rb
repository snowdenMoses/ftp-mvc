class User < ApplicationRecord
  has_one :personal_detail, dependent: :destroy
  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy
  has_many :products, dependent: :destroy

  validates_presence_of :email, :encrypted_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: %i[active deactivated]
end
