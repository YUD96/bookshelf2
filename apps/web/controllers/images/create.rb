module Web::Controllers::Images
  class Create
    include Web::Action

    def call(params)
      result = ImageCreate.new(params).call
      if result.successful?
        response_body = JSON.pretty_generate(
          status: 1,
          message: "OK",
        )
        self.status = 201
        self.body = response_body
        flash[:notice] = "記事を作成しました"
      else
        @error = result.error
      end 
    end

    def authenticate!; end

    def verify_csrf_token?
      false
    end
  end
end
