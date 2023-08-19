class ApplicationController < ActionController::Base
    before_action :authenticate_user!, :except => [:home, :welcome, :about]
end
