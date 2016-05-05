class Group < ActiveRecord::Base
	validates :title, :presence => { :message => "不能空白" }

	has_many :posts
end
