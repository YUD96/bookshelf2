class UserRepository < Hanami::Repository
	def find_by_email(mail)
    users.where(mail: mail).first
	end
	
end
