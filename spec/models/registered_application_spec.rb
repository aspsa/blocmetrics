require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
    
  context "ActiveModel matchers: #attributes" do

    it "validates the presence of #name" do
      should validate_presence_of(:name)
    end
    
    it "validates the presence of #url" do
      should validate_presence_of(:url)
    end
    
  end

  context "ActiveRecord matchers" do
    
    it "validates the uniqueness of #url" do
      should validate_uniqueness_of(:url)
    end
    
    it { should belong_to(:user) }

  end
  
end