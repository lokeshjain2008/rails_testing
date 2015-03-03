class User < ActiveRecord::Base

	validates :email,:name , presence: true
	has_secure_password

	validates :email, uniqueness:{case_sensitive:false}

	#validations
	before_save{email.downcase!}
end
