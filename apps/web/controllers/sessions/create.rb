module Web::Controllers::Sessions
	class Create
		include Web::Action
		include Hanami::Action::Session

		expose :user
		params do
			required(:session).schema do
				required(:mail).filled(:str?)
				required(:password).filled(:str?)
			end
		end

		def call(params)
			if params.valid?
				user = UserRepository.new.find_by_email(params[:session][:mail])
				if !user.nil? && authenticate?(user)
					session[:user_id] = user.id
					redirect_to '/books'
				else
					redirect_to '/login'
				end
			end
		end

		private

		def authenticate?(user)
			BCrypt::Password.new(user.password).is_password?(requested_password)
		end

		def reqested_email	
			params[:session][:mail]
		end

		def requested_password
			params[:session][:password]
		end

		def authenticate!; end
  end
end
