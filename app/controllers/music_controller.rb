class MusicController < ApplicationController
    def hello
        render json: {hello: "This is hello action"}
    end
end
