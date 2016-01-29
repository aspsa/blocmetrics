require 'rails_helper'

RSpec.describe User, type: :model do

  context "ActiveModel matchers: #attributes" do

    it "validates the presence of #name" do
      should validate_presence_of(:name)
    end
    
    it "validates the presence of #email" do
      should validate_presence_of(:email)
    end

  end
  
  context "ActiveRecord matchers" do
    
    it "should have many registered applications" do
      should have_many(:registered_applications)
    end
    
  end
  
end