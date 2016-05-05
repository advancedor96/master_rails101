class Group < ActiveRecord::Base
	validates :title, :presence => { :message => "不能空白" }
end
