class User < ActiveRecord::Base
  has_many :interests
  has_many :categories, through: :interests

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :phone, uniqueness: true
  phony_normalize :phone, :default_country_code => 'US'
end
