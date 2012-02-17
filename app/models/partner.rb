class Partner < ActiveRecord::Base
	image_accessor :cover_image

	validates :cover_image, :length => {:maximum => 2.megabytes}

	validates_property :format,    :of => :cover_image, :in => [:jpeg, :jpg, :png, :JPEG, :JPG, :PNG]
	validates_property :mime_type, :of => :cover_image, :in => ['image/jpeg','image/jpg','image/png']
end
