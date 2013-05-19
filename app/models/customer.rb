class Customer < ActiveRecord::Base
  attr_accessible :department, :name, :number, :phone, :street

  belongs_to :user


  def self.search(params)
  	where("phone LIKE ?", "%#{params[:keyword]}%")
  end

  validates :name, :phone, :street, :number, presence: true
  validates :phone, uniqueness: true
  validates :phone, numericality: true
  validates :phone, length: {in: 6..12}
end
