class HelloController < ApplicationController
    def index
        render json: {helloRails: "Hello Rails!"}
    end
end
