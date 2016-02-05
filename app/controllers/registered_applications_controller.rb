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
    @reg_app = RegisteredApplication.find(params[:id])
  end
  
  def update
    @reg_app = RegisteredApplication.find(params[:id])

    # RegisteredApplication belongs_to User
    @reg_app.user = current_user
    
    if @reg_app.update(reg_app_params)  
      flash[:notice] = "Registered application was updated."
      redirect_to registered_applications_path
    else
      flash[:error] = "Registered application was not updated."
      render :edit
    end
  end

  def show
    @reg_app = RegisteredApplication.find(params[:id])
  end
  
  def destroy
    @reg_app = RegisteredApplication.find(params[:id])
    
    if @reg_app.destroy
      flash[:notice] = "Registered application was destroyed."
      redirect_to @reg_app
    else
      flash[:error] = "Registered application was not destroyed."
      redirect_to @reg_app
    end
  end
  
  private
  
    def reg_app_params
      params.require(:registered_application).permit(:name, :url)
    end
end