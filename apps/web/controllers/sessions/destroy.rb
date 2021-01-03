module Web::Controllers::Sessions
	class Destroy
		include Web::Action
		include Hanami::Action::Session
		
		def call(params)
			session[:user_id] = nil
			flash[:success] = 'success!! logout'
			redirect_to '/login'
		end		
  end
end
