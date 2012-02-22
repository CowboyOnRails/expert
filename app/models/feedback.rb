class Feedback < ActiveRecord::Base
	validates :name, :email, :message, :presence => true
	validates :name, :title, :length => {:maximum => 250}
	validates :email, :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
end
