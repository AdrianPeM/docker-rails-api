class MusicController < ApplicationController
    def index
        render json: {hello: "This is hello action"}
    end
end
