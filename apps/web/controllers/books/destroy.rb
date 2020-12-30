module Web::Controllers::Books
	class Destroy
		include Web::Action

		def call(_)
			session[:user_id] = nil
			redirect_to '/login'
		end
	end
end
