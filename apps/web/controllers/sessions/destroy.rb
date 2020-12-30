module Web
  module Controllers
    module Sessions
      class Destroy
        include Web::Action

				def call(params)
					session.delete(:user_id)
        end
      end
    end
  end
end
