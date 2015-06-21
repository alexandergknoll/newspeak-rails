class User < ActiveRecord::Base
  has_many :interests
  has_many :categories, through: :interests
  accepts_nested_attributes_for :interests, :reject_if => lambda { |a| a[:num].blank? }, :allow_destroy => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :phone, uniqueness: true, presence: true
  phony_normalize :phone, :default_country_code => 'US'
end
