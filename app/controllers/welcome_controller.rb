class WelcomeController < ApplicationController
  def index
    @bands = Band.all
    @events = Event.all
  end
end
