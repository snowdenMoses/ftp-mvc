class User < ApplicationRecord
  has_one :personal_detail, dependent: :destroy
  has_many :user_roles
  has_many :roles, through: :user_roles, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :favourites, dependent: :destroy
  # accepts_nested_attributes_for :personal_detail, :reject_if => lambda { |a| a[:first_name].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :personal_detail, :allow_destroy => true

  validates_presence_of :email, :password
  validates_associated :personal_detail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: %i[active deactivated]
end
