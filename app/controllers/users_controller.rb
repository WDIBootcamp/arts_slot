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

  def create
    # project = Project.find(params[:project_id])
    # new_character = params.require(:character).permit(:name, :age, :height, :weight, :eye_color, :hair_color, :gender, :project_id = project)
    # project.characters.create(new_character)
    # binding.pry
    respond_to do |f|
        f.html {render :layout => false}
        f.json {render json: project }
    end
  end

  def update
  end

  def delete
  end


end
