class WelcomeController < ApplicationController

    def index
        render json: {body: "text"}
    end
end
