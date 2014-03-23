class ProjectsController < ApplicationController
  def index
    respond_to do |f|
      f.html  {render :layout => false }
      f.json  {render :json => Project.all}
    end
  end
end
