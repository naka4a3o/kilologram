class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @calendars = user.calendars
  end
end
