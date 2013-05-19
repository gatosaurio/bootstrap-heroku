class Product < ActiveRecord::Base
  attr_accessible :name, :price

  belongs_to :user

  validates :name, :price, presence: true
  validates :name, length: {in: 4..60}
  validates :price, :numericality => { :greater_than_or_equal_to => 0.00, :message => "must be a non-negative number"}
end
