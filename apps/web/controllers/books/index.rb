module Web::Controllers::Books
	class Index
		include Web::Action
		expose :books

		def call(params)
			@books = BookRepository.new.all
		end

		private

		# def authenticate!;end
  end
end
