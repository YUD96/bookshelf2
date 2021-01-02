module Web::Views::Sessions
	class New
		include Web::View

		def form 
			form_for :session , '/login' do 
				email_field :mail
				text_field :password

				submit 'POST'
			end
		end
  end
end
