class RegisteredApplicationsController < ApplicationController
  def index
    @reg_apps = RegisteredApplication.all
  end

  def new
    @reg_app = RegisteredApplication.new
  end
  
  def create
    @reg_app = RegisteredApplication.new(reg_app_params)

    # RegisteredApplication belongs_to User
    @reg_app.user = current_user
    
    if @reg_app.save
      flash[:notice] = "Registered application was saved."
      redirect_to @reg_app
    else
      flash[:error] = "Registered application was not saved."
      render :new
    end
  end

  def edit
    
  end
  
  def update
    
  end

  def show
    
  end
  
  def destroy
    
  end
  
  private
  
    def reg_app_params
      params.require(:reg_app).permit(:name, :url)
    end
end