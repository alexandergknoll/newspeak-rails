class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :phone, uniqueness: true

  phony_normalize :phone, :default_country_code => 'US'
end
