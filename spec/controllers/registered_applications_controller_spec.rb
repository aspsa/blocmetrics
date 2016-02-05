require 'rails_helper'
include Devise::TestHelpers

RSpec.describe RegisteredApplicationsController, type: :controller do

  before do
    @user = create(:user)
    sign_in @user
    
    @reg_app = RegisteredApplication.create(name: "Google", url: "http://www.google.com")
    @reg_app.user = @user
  end
  
  describe '#index' do
    
    it 'returns HTTP 200 code after invoking #index action' do
      get :index
      expect(response.status).to eq(200)
    end
    
  end

  describe '#new'  do
    
    it 'returns HTTP 200 code after invoking #new action' do
      get :new
      expect(response.status).to eq(200)
    end
    
    context 'Authenticated User' do

      it 'instantiates a registered application' do
        get :new
        app = assigns(:reg_app)
        expect(app).not_to be nil
      end
      
      it 'expects the registered application #id not to be nil' do
        get :new
        expect(@reg_app.id).not_to be nil
      end

      it 'expects the registered application to have a #name' do
        get :new
        expect(@reg_app.name).to eq('Google')
      end
      
      it 'expects the registered application to have a #url' do
        get :new
        expect(@reg_app.url).to eq('http://www.google.com')
      end

    end
    
    context 'User is not authenticated' do

      it 'expects an unauthorized user cannot register an application' do
        get :new
        app = assigns(:reg_app)
        expect(app.user_id).to be nil
      end
      
    end
    
  end
  
  describe '#create' do

    it 'belongs to current user' do
      expect(@reg_app.user).to be @user
    end
    
    it 'redirects_to .../registered_applications/<:id>' do
      expect(response).to redirect_to("/registered_applications/#{assigns(@reg_app)}")
    end
    
  end
  
  describe '#edit' do
    
    
    
  end
  
  describe '#show' do
    
    it 'displays the currently selected registered application information' do
      expect(response).to eq("#{@reg_app.url}/#{@reg_app.id}")
    end
    
  end
  
  describe '#update' do
    
    
    
  end
  
  describe '#destroy' do
    
    
    
  end
  
end