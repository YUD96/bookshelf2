module Web::Controllers::Users
	class Create
		include Web::Action
		expose :user

		def initialize(user: UserRepository.new)
			@user = user
		end

		params do
			required(:user).schema do
				required(:name).filled(:str?)
				required(:mail).filled(:str?)
				required(:password).filled(:str?)
			end
		end

		def call(params)
			user_params = user_params(params)
			if params.valid? && user_params
				@user = sign_up_user(user_params)
				redirect_to '/users'
			else
				self.status = 422
			end
		end

		private

		def sign_up_user(user_params)
			password_digest = BCrypt::Password.create(user_params[:password])

			user.create(
				name: user_params[:name],
				mail: user_params[:mail],
				password: password_digest
			)
		end

		def user_params(params)
			params[:user]
		end
	end
end
