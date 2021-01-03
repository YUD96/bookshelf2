module Web::Controllers::Users
	class Index
		include Web::Action

		expose :users

		def initialize
			@users = UserRepository.new
		end

		def call(params)
			@users = @users.all
		end
  end
end
