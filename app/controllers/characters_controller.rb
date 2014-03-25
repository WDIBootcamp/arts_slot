class CharactersController < ApplicationController

  def index
    respond_to do |f|
      f.html  {render :layout => false }
      f.json  {render :json => Character.all}
    end
  end

  def show
    respond_to do |f|
      f.html  {render :layout => false }
      f.json  {render :json => Character.find(params[:id])}
    end
  end

  def create
    project = Project.find(params[:project_id])
    new_character = params.require(:character).permit(:name, :age, :height, :weight, :eye_color, :hair_color, :gender, :project_id = project)
    project.characters.create(new_character)
    respond_to do |f|
        f.html {render nothing: true}
        f.json {render json: project, status: 201 }
    end
  end

  def update
  end

  def delete
  end


end
