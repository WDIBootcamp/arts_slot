class UsersController < ApplicationController

  def index
    respond_to do |f|
      f.html  {render :layout => false }
      f.json  {render :json => User.all}
    end
  end

  def show
    respond_to do |f|
      f.html  {render :layout => false }
      f.json  {render :json => User.find(params[:id])}
    end
  end

end
