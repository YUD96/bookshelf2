require 'hanami/interactor'
require 'hanami/action/session'

module UserInteractor
	class Create
		include Hanami::Interactor
		expose :user, :params


		def initialize(params)
			@params = params
			
		end

		def call
			# @user = UserRepository.new.find(mail: @params[:session][:mail])
			@user = UserRepository.new.find_by_email(@params[:session][:mail])
			# @password = BCrypt::Password.create(@params[:session][:password])
			if @user && UserRepository.new.authenticate(@user.password, @params[:session][:password])
				# set_result(@user)
			else
				return  false
			end
		end

	private

	# def set_result(user)
	# 	result = UserInteractor::Create.new(
	# 		user_id = user.id
	# 	).call
	# end

	end
end