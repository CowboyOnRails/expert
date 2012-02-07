class Newspost < ActiveRecord::Base
	has_one :metaitem, :as => :page
end
