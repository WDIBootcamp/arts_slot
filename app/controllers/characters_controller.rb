class CharactersController < ApplicationController
  # before_filter :authenticate_user!

  def index
    characters = Project.find(params[:project_id]).characters
    new_characters = []
    characters.map do |character|
      actor_suggestions = character.suggestions()
      character = character.to_hash()
      character["suggestions"] = actor_suggestions
      new_characters << character
    end
    respond_to do |f|
      f.html  {render :layout => false }
      f.json  {render :json => new_characters }
    end
  end

  def show
    character = Character.find(params[:id])
    actor_suggestions = character.suggestions()
    character = character.to_hash()
    character["suggestions"] = actor_suggestions
    character
    respond_to do |f|
      f.html  {render :layout => false }
      f.json  {render :json => character}
    end
  end

  def create
    project = Project.find(params[:project_id])
    new_character = params.require(:character).permit(:name, :age, :height, :weight, :eye_color, :description, :hair_color, :gender, :project_id)
    character = project.characters.create(new_character)
    respond_to do |f|
        f.html {render nothing: true}
        f.json {render json: character, status: 201 }
    end
  end

  def update
  end

  def delete
  end


end
