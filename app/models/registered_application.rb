class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :name, :url
  validates_uniqueness_of :url
end
