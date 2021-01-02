module Web::Views::Books
	class Index
		include Web::View
			def logout
				form_for :session , '/logout', method: :delete do 
					submit 'LOGOUT'
				end
			end
	end
end
