class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  has_many :answer_users
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    def self.search1(search)
	    if search

		  where ['name LIKE :s OR lastname  LIKE :s', :s => "%#{search}%"]
	   	  #where('name or lastname like ?', "%#{search}%" )
	      #where('name LIKE ?', "%#{search}%")
	    else
	      all
	    end
	end

	def self.search2(search)
	    if search
	    	where ['name LIKE :s OR lastname  LIKE :s', :s => "%#{search}%"]
	   	  #where('name or lastname like ?', "%#{search}%" )
	      #where('name LIKE ?', "%#{search}%")
	    else
	      all
	    end
	end
         
end
