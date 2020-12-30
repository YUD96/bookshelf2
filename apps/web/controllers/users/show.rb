module Web
  module Controllers
    module Users
      class Show
				include Web::Action
				expose :user				

				def call(params)
					@user = UserRepository.new.find(1)					
        end
      end
    end
  end
end
