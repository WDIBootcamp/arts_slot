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

  def update
  User.find(params[:id]).update_attributes(params.require(:user).permit(:name, :age, :gender, :ethnicity))

  render nothing: true, status: 200
  end

end
