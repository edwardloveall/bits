class Item < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :title, message: "Please enter a Title"
  validates_presence_of :url, message: "Please enter a URL"
end
