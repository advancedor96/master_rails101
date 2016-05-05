class Post < ActiveRecord::Base
	validates :content, :presence => { :message => "不能空白" }

	belongs_to :group
end
