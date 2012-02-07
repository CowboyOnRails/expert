class Article < ActiveRecord::Base
	has_one :metaitem, :as => :page
	
	has_many :childs, :class_name=>'Article'
	belongs_to :father, :class_name=>'Article', :foreign_key => 'parent_id'

	validates :name, :presence => true, :length => {:maximum => 255}

end
