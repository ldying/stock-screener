class Stock < ActiveRecord::Base
  has_many :follows
  has_many :users, through: :follows

  validates :symbol, uniqueness: { case_sensitive: false }

end
