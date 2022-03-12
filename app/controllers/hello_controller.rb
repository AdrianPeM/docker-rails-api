class HelloController < ApplicationController
    def index
        render json: {helloRails: "Hello Rails!", endpoints: "post '/articles', resources: v1: users, v1: facts"}
    end
end
