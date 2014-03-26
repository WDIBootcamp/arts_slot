class CharactersController < ApplicationController

  def index
    characters = Project.find(params[:project_id]).characters
    characters.map! do |character|
      actor_suggestions = suggestions(character)
      character = character.to_hash()
      character["suggestions"] = actor_suggestions
    end
    binding.pry
    respond_to do |f|
      f.html  {render :layout => false }
      f.json  {render :json => characters }
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
    new_character = params.require(:character).permit(:name, :age, :height, :weight, :eye_color, :hair_color, :gender, :project_id)
    character = project.characters.create(new_character)
    respond_to do |f|
        f.html {render nothing: true}
        f.json {render json: character, status: 201 }
    end
  end

  def suggestions(character)

     character_params = character.attributes
     character_params["id"] = nil
     character_params["name"] = nil
     character_params["project_id"] = nil
     character_params["user_id"] = nil
     character_params["created_at"] = nil
     character_params["updated_at"] = nil
     search = character_params.delete_if{|k,v| v.nil?}
     return suggestions = User.where(search)

  end

  def update
  end

  def delete
  end


end
