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
    new_character = params.require(:character).permit(:name, :age, :height, :weight, :eye_color, :hair_color, :gender)
    character = Character.create(new_character)
    respond_to do |f|
        f.html {redirect_to projects_path}
        f.json {render json: project }
    end
  end

  def update
  end

  def delete
  end


end
