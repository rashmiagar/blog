class Post < ActiveRecord::Base
	attr_accessor :image_file

 	belongs_to :user
end
