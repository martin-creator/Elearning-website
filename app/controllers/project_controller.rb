class ProjectController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.friendly.find(params[:id])
    @tasks = @project.tasks.order(:tag)

    @joined = false

  	if !current_user.nil? && !current_user.projects.nil?
  		@joined = current_user.projects.include?(@project)
  	end

  	@users = @project.users.order('created_at DESC').first(10)


      @review = Review.new
      @reviews = @project.reviews
      
      @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
    
  end


  def list
    if !current_user.nil?
      @projects = current_user.projects      
    end
  end

  
end
