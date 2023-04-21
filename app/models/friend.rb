class Friend < ApplicationRecord
  has_many :dogs
  has_many :houses

  validates :houses, presence: true
  before_validation :create_house
  def create_house
    houses << House.new(kind: 'house', city:'Lille')
  end
end
