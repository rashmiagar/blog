class Post < ActiveRecord::Base
	attr_accessor :image_file
	mount_uploader :image_file, ImageFileUploader

 	belongs_to :user
end
