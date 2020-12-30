module Web::Controllers::Users
	class Create
		include Web::Action
		expose :user
		params do
			required(:user).schema do
				required(:name).filled(:str?)
				required(:mail).filled(:str?)
			end
		end

		def call(params)
			@user= UserRepository.new(params[:user])
			if @user.save?
				redirect_to '/books'
			else
				self.status = 422
			end
		end					
	end
end
