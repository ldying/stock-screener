class Stock < ActiveRecord::Base
	has_many :follows
	has_many :users, through: :follow

end
