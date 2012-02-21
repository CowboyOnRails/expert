class Article < ActiveRecord::Base
	has_one :metaitem, :as => :page
	
	has_many :childs, :class_name=>'Article'
	belongs_to :father, :class_name=>'Article', :foreign_key => 'parent_id'

	validates :name, :presence => true, :length => {:maximum => 255}
	validates :addon, :uniqueness => true, :allow_nil => true
    
    image_accessor :cover_image

    validates :cover_image, :length => {:maximum => 2.megabytes}

	validates_property :format,    :of => :cover_image, :in => [:jpeg, :jpg, :png, :JPEG, :JPG, :PNG]
	validates_property :mime_type, :of => :cover_image, :in => ['image/jpeg','image/jpg','image/png']

   def to_param
      "#{id}-#{name}"
   end

end
