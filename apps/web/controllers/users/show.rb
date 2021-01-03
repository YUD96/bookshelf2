module Web
  module Controllers
    module Users
      class Show
				include Web::Action
				expose :user				

				def call(params)
					@user = UserRepository.new.find(params[:id])					
        end
      end
    end
  end
end
